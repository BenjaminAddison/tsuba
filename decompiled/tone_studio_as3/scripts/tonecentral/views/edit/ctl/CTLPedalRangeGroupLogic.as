package tonecentral.views.edit.ctl
{
   import flash.display.Graphics;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.UIComponent;
   import tonecentral.common.define.CTLDefinitionGT;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.CTLManager;
   import tonecentral.common.util.CTLParameterUtil;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.events.EditorEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class CTLPedalRangeGroupLogic extends ViewLogic
   {
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var view:CTLPedalRangeGroup;
      
      private var ctlMng:CTLManager;
      
      private var styleChangingTimer:Timer = new Timer(200);
      
      private var delayTimer:Timer = new Timer(50);
      
      public var ctlParameterComponentDic:Object;
      
      private var delayUpdateParameterTarget:CTLCtlParameterComponent;
      
      private var _delayUpdateEffect:String;
      
      public function CTLPedalRangeGroupLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = CTLPedalRangeGroup(param1);
         this.mediator = ToneCentralMediator.getInstance();
         this.addressMap = AddressMap.getInstance();
         this.ctlMng = new CTLManager();
         this.ctlParameterComponentDic = new Object();
         this.mediator.addEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.viewStatusChangeHandler,false,0,true);
         this.addListner();
      }
      
      private function viewStatusChangeHandler(param1:ViewStatusEvent) : void
      {
         if(this.mediator.currentViewStatus == ToneCentralDefinition.CTL_LIST && this.mediator.selectedMode == Mode.EDITOR && this.mediator.contentsAreaMode != Mode.TONE_CENTRAL)
         {
            this.addListner();
         }
         else
         {
            this.removeListner();
         }
      }
      
      private function addListner() : void
      {
         this.ctlMng.addEventListener(EditorEvent.CTL_ASSIGN_PARAMS_CHANGE,this.paramUpdateHandler,false,0,true);
         this.ctlMng.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.paramPatchChangedHandler,false,0,true);
      }
      
      private function paramPatchChangedHandler(param1:ToneCentralEvents) : void
      {
         this.updateView();
      }
      
      private function removeListner() : void
      {
         this.ctlMng.removeEventListener(EditorEvent.CTL_ASSIGN_PARAMS_CHANGE,this.paramUpdateHandler);
         this.ctlMng.removeEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.paramPatchChangedHandler);
      }
      
      private function paramUpdateHandler(param1:EditorEvent) : void
      {
         var _loc4_:CTLCtlParameterComponent = null;
         var _loc6_:Timer = null;
         var _loc2_:String = param1.data.address;
         var _loc3_:Number = Number(param1.data.value);
         var _loc5_:int = 0;
         while(_loc5_ < this.view.ctlParameterVGroup.numElements)
         {
            _loc4_ = this.view.ctlParameterVGroup.getElementAt(_loc5_) as CTLCtlParameterComponent;
            if(_loc4_.getAddress() == _loc2_)
            {
               _loc4_.paramUpdateHandler(_loc3_);
            }
            if(_loc4_.getAssignParamAddress() == _loc2_)
            {
               this._delayUpdateEffect = _loc4_.data.effect;
               _loc6_ = new Timer(200,1);
               _loc6_.addEventListener(TimerEvent.TIMER,this.delayUpdateParameter,false,0,true);
               _loc6_.start();
            }
            _loc5_++;
         }
      }
      
      private function delayUpdateParameter(param1:TimerEvent) : void
      {
         this.updateByTarget(this._delayUpdateEffect);
      }
      
      public function init(param1:String) : void
      {
         this.ctlMng.ctlName = param1;
         this.view.ctlName.text = this.ctlMng.ctlName;
         this.setProvider();
         this.createParameter();
      }
      
      private function setProvider() : void
      {
      }
      
      private function createParameter() : void
      {
         var _loc1_:CTLCtlParameterComponent = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < CTLDefinitionGT.CTL_PARAMETER_LIST.length)
         {
            _loc3_ = CTLDefinitionGT.CTL_PARAMETER_LIST[_loc2_].effect;
            _loc4_ = CTLParameterUtil.getAssignParamName(this.ctlMng.ctlName,_loc3_);
            _loc5_ = this.ctlMng.getTmpData(_loc4_);
            _loc6_ = CTLParameterUtil.getCtlTargetParam(_loc3_,_loc5_);
            _loc6_.effect = _loc3_;
            _loc7_ = this.createItemData(_loc6_,_loc4_);
            _loc1_ = new CTLCtlParameterComponent(this.view.width,30,this.view.width,30,27);
            if(_loc3_ == "REVERB")
            {
               _loc1_.addHeight(15);
            }
            else if(_loc2_ % 5 == 2)
            {
               _loc1_.addHeight(10);
            }
            _loc1_.setdata(_loc7_,false);
            _loc1_.setEffectType(_loc6_.id);
            this.view.ctlParameterVGroup.addElement(_loc1_);
            this.ctlParameterComponentDic[_loc3_] = _loc1_;
            _loc2_++;
         }
      }
      
      private function updateByTarget(param1:String) : void
      {
         var _loc2_:CTLCtlParameterComponent = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < CTLDefinitionGT.CTL_PARAMETER_LIST.length)
         {
            _loc4_ = CTLDefinitionGT.CTL_PARAMETER_LIST[_loc3_].effect;
            if(_loc4_ == param1)
            {
               _loc5_ = CTLParameterUtil.getAssignParamName(this.ctlMng.ctlName,_loc4_);
               _loc6_ = this.ctlMng.getTmpData(_loc5_);
               _loc7_ = CTLParameterUtil.getCtlTargetParam(_loc4_,_loc6_);
               _loc7_.effect = _loc4_;
               _loc8_ = this.createItemData(_loc7_,_loc5_);
               _loc2_ = this.ctlParameterComponentDic[_loc7_.effect];
               _loc2_.updateData(_loc8_,_loc7_.id);
            }
            _loc3_++;
         }
      }
      
      private function updateParameter() : void
      {
         var _loc1_:CTLCtlParameterComponent = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < CTLDefinitionGT.CTL_PARAMETER_LIST.length)
         {
            _loc3_ = CTLDefinitionGT.CTL_PARAMETER_LIST[_loc2_].effect;
            _loc4_ = CTLParameterUtil.getAssignParamName(this.ctlMng.ctlName,_loc3_);
            _loc5_ = this.ctlMng.getTmpData(_loc4_);
            _loc6_ = CTLParameterUtil.getCtlTargetParam(_loc3_,_loc5_);
            _loc6_.effect = _loc3_;
            _loc7_ = this.createItemData(_loc6_,_loc4_);
            _loc1_ = this.ctlParameterComponentDic[_loc6_.effect];
            _loc1_.updateData(_loc7_,_loc6_.id);
            _loc2_++;
         }
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.delayTimer.stop();
         this.updateParameter();
      }
      
      private function drawBgi(param1:UIComponent, param2:String) : void
      {
         var _loc3_:Graphics = param1.graphics;
         _loc3_.clear();
         if(!param1.enabled || param1.width == 0)
         {
            return;
         }
         if(param2 == "changing")
         {
            _loc3_.lineStyle(1,16729413);
            _loc3_.beginFill(16729413,0.3);
         }
         else
         {
            _loc3_.lineStyle(1,9495807);
         }
         _loc3_.drawRoundRect(0.5,0.5,param1.width - 1,param1.height - 1,6,6);
         _loc3_.endFill();
      }
      
      public function updateView() : void
      {
         this.ctlMng.getCTLData();
         this.setProvider();
         this.updateParameter();
      }
      
      private function createItemData(param1:Object, param2:String) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         _loc4_ = CTLParameterUtil.getCTLParamName(this.ctlMng.ctlName,param1.effect);
         _loc5_ = "temp_" + _loc4_;
         _loc3_ = {};
         _loc3_.name = _loc4_;
         _loc3_.effect = param1.effect;
         var _loc7_:String = "temp_" + param2;
         _loc3_.max = param1.max;
         _loc3_.min = param1.min;
         _loc3_.step = param1.step;
         _loc3_.minDef = _loc3_.min;
         _loc3_.maxDef = _loc3_.max;
         _loc3_.address = this.addressMap[_loc5_].address;
         _loc3_.assignParamAddress = this.addressMap[_loc7_].address;
         _loc6_ = ParameterUtil.getDoubleByteData(_loc3_.address,this.ctlMng.getTmpData(_loc4_)) * int(_loc3_.step);
         _loc3_.value = _loc6_;
         return _loc3_;
      }
   }
}

