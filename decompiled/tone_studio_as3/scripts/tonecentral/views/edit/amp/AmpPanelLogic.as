package tonecentral.views.edit.amp
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.manager.SystemManager;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.edit.AbstractKnob;
   import tonecentral.components.edit.AmpKnob;
   import tonecentral.components.edit.ParameterComponent;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.SystemParams;
   
   public class AmpPanelLogic extends ViewLogic
   {
      
      private var view:AmpPanel;
      
      private var knobArray:Array;
      
      private var valueLabelArray:Array;
      
      private var systemMng:SystemManager;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var targetKnob:AbstractKnob;
      
      private var _knobDragging:Boolean;
      
      private var selectKnobIndex:Number;
      
      private var knobOffset:int = 0;
      
      public function AmpPanelLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as AmpPanel;
      }
      
      override protected function onCreationComplete() : void
      {
         this.addressMap = AddressMap.getInstance();
         this.addressMap.addEventListener(ToneCentralEvents.ADDRESS_MAP_COMPLETE,this.addressMapComplete,false,0,true);
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         this.systemMng = SystemManager.getInstance();
         this.systemMng.addEventListener(SystemEvent.AMP_CHANGE,this.ampChangeHandler,false,0,true);
         this.view.swFx1.addEventListener(ToneCentralEvents.CHANGE_EFFECT,this.fx1ChangeHandler,false,0,true);
         this.view.swFx2.addEventListener(ToneCentralEvents.CHANGE_EFFECT,this.fx2ChangeHandler,false,0,true);
         this.view.swFx3.addEventListener(ToneCentralEvents.CHANGE_EFFECT,this.fx3ChangeHandler,false,0,true);
         this.view.ampTypeGroup.addEventListener(Event.CHANGE,this.ampTypeChangeHandler,false,0,true);
      }
      
      private function ampTypeChangeHandler(param1:Event) : void
      {
         this.valueLabelArray[0].paramVal = this.view.ampTypeGroup.selectedValue;
      }
      
      private function addressMapComplete(param1:Event) : void
      {
         this.createKnob();
         this.setKnobPrams();
      }
      
      private function fx1ChangeHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:String = "00";
         this.mediator.sysex.setDataFunc(this.addressMap.command_sw_fx1.address,_loc2_);
      }
      
      private function fx2ChangeHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:String = "00";
         this.mediator.sysex.setDataFunc(this.addressMap.command_sw_fx2.address,_loc2_);
      }
      
      private function fx3ChangeHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:String = "00";
         this.mediator.sysex.setDataFunc(this.addressMap.command_sw_fx3.address,_loc2_);
      }
      
      private function createKnob() : void
      {
         this.knobArray = [];
         this.valueLabelArray = [];
         this.knobOffset = 5;
         var _loc1_:int = 0;
         while(_loc1_ < ParameterDefinitionGT.AMP_PARAMS_LIST.length)
         {
            this.createKnobs(ParameterDefinitionGT.AMP_PARAMS_LIST[_loc1_],0,_loc1_);
            _loc1_++;
         }
         this.knobArray[0].maxAngle = 120;
         this.knobArray[0].offsetAngle = -90;
         this.valueLabelArray[0].visible = false;
      }
      
      private function createKnobs(param1:Object, param2:Number, param3:int) : AmpKnob
      {
         if(param3 != 0 && param3 % 3 == 0)
         {
            this.knobOffset += 10;
         }
         else if(param3 == 1)
         {
            this.knobOffset -= 5;
         }
         var _loc4_:Object = {};
         _loc4_.id = param1.id;
         _loc4_.name = param1.name;
         _loc4_.max = param1.max;
         _loc4_.min = param1.min;
         _loc4_.step = param1.step;
         _loc4_.val = param2;
         var _loc5_:AmpKnob = new AmpKnob();
         _loc5_.y = 100;
         _loc5_.x = 73 * param3 + this.knobOffset;
         _loc5_.setData(_loc4_);
         _loc5_.adjustHarmonistCodeLabel(param1);
         _loc5_.index = param3;
         _loc5_.addEventListener(MouseEvent.MOUSE_DOWN,this.knobClickHandler,false,0,true);
         _loc5_.addEventListener(ToneCentralEvents.WHEEL_START,this.knobWheelStartHandler,false,0,true);
         this.view.knobContainer.addElement(_loc5_);
         this.knobArray.push(_loc5_);
         if(param3 == 0 || param3 == 6 || param3 == 7 || param3 == 8)
         {
            _loc5_.showMemori = false;
         }
         if(param3 == 0)
         {
            _loc5_.dragRate = 0.2;
         }
         param1.address = this.addressMap[param1.id].address;
         var _loc6_:ParameterComponent = new ParameterComponent(75,25,62,25,30);
         _loc6_.setdata(param1,ParameterDefinitionGT.DROPDOWN_LIST,{});
         _loc6_.isSystemSetting = true;
         _loc6_.textBoxBgi.visible = false;
         _loc6_.updateDropDownList(param1.id);
         _loc6_.y = 80;
         _loc6_.x = 73 * param3 - 3 + this.knobOffset;
         this.view.knobContainer.addElement(_loc6_);
         this.valueLabelArray.push(_loc6_);
         return _loc5_;
      }
      
      private function knobWheelStartHandler(param1:ToneCentralEvents) : void
      {
         this.setTargetKnob(param1.currentTarget as AbstractKnob);
      }
      
      private function knobClickHandler(param1:MouseEvent) : void
      {
         this._knobDragging = true;
         this.setTargetKnob(param1.currentTarget as AbstractKnob);
      }
      
      private function setTargetKnob(param1:AbstractKnob) : void
      {
         if(!param1.knobEnabled)
         {
            return;
         }
         if(this.targetKnob)
         {
            this.targetKnob.removeEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler);
         }
         this.targetKnob = AbstractKnob(param1);
         this.targetKnob.addEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler,false,0,true);
         this.selectKnobIndex = this.targetKnob.index;
         this.resetKnobSelect();
         this.targetKnob.selected = true;
      }
      
      private function resetKnobSelect() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.knobArray.length)
         {
            this.knobArray[_loc1_].selected = false;
            _loc1_++;
         }
      }
      
      private function knobDragHandler(param1:ToneCentralEvents) : void
      {
         this.view.stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,false,0,true);
         var _loc2_:int = int(param1.data);
         var _loc3_:int = this.targetKnob.data.val + _loc2_;
         if(_loc3_ < this.targetKnob.data.min)
         {
            _loc3_ = int(this.targetKnob.data.min);
         }
         if(_loc3_ > this.targetKnob.data.max)
         {
            _loc3_ = int(this.targetKnob.data.max);
         }
         this.targetKnob.data.val = _loc3_;
         var _loc4_:String = ParameterDefinitionGT.AMP_PARAMS_LIST[this.selectKnobIndex]["id"];
         var _loc5_:String = this.addressMap[_loc4_].address;
         var _loc6_:String = ToneCentralUtil.convertHexaDecimal(_loc3_.toString(),2);
         this.mediator.sysex.setDataFunc(_loc5_,_loc6_);
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         this._knobDragging = false;
         if(this.view.stage)
         {
            this.view.stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         }
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.setSwParams();
         this.setKnobPrams();
         this.view.visible = true;
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.setSwParams();
         this.setKnobPrams();
      }
      
      private function ampChangeHandler(param1:SystemEvent) : void
      {
         this.setSwParams();
         this.setKnobPrams();
      }
      
      private function setSwParams() : void
      {
         var _loc1_:SystemParams = this.mediator.sysex.params.system;
         this.view.swFx1.data = _loc1_.sys_led_state_fx1;
         this.view.swFx2.data = _loc1_.sys_led_state_fx2;
         this.view.swFx3.data = _loc1_.sys_led_state_fx3;
      }
      
      private function setKnobPrams() : void
      {
         var _loc2_:Object = null;
         var _loc1_:SystemParams = this.mediator.sysex.params.system;
         var _loc3_:int = 0;
         while(_loc3_ < ParameterDefinitionGT.AMP_PARAMS_LIST.length)
         {
            _loc2_ = {};
            _loc2_.min = ParameterDefinitionGT.AMP_PARAMS_LIST[_loc3_]["min"];
            _loc2_.max = ParameterDefinitionGT.AMP_PARAMS_LIST[_loc3_]["max"];
            _loc2_.val = _loc1_[ParameterDefinitionGT.AMP_PARAMS_LIST[_loc3_]["id"]];
            this.knobArray[_loc3_].knobRotation(_loc2_);
            if(_loc3_ == 0)
            {
               this.view.ampTypeGroup.selectedValue = _loc2_.val;
            }
            this.valueLabelArray[_loc3_].updateFromMe80 = true;
            this.valueLabelArray[_loc3_].paramVal = _loc2_.val;
            this.valueLabelArray[_loc3_].updateFromMe80 = false;
            _loc3_++;
         }
      }
      
      private function getAmpType(param1:int) : String
      {
         return ParameterDefinitionGT.AMP_TYPE_LIST[param1];
      }
      
      private function getFx1Fx2Value(param1:int) : String
      {
         if(param1 == 0 || param1 == 52)
         {
            return "OFF";
         }
         if(param1 > 52)
         {
            return (param1 - 53).toString();
         }
         return (param1 - 1).toString();
      }
      
      private function getFx3Value(param1:int) : String
      {
         if(param1 == 0)
         {
            return "OFF";
         }
         return (param1 - 1).toString();
      }
   }
}

