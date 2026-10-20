package tonecentral.views.edit.ctl
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.UIComponent;
   import spark.events.IndexChangeEvent;
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
   
   public class CTLPedalGroupLogic extends ViewLogic
   {
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var view:CTLPedalGroup;
      
      private var ctlMng:CTLManager;
      
      private var styleChangingTimer:Timer = new Timer(200);
      
      private var delayTimer:Timer = new Timer(50);
      
      public var ctlParameterComponentDic:Object;
      
      public function CTLPedalGroupLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = CTLPedalGroup(param1);
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
         this.view.pedalFuncDDL.addEventListener(IndexChangeEvent.CHANGE,this.pedalFuncChangeHandler,false,0,true);
         this.ctlMng.addEventListener(EditorEvent.CTL_PEDAL_FUNC_CHANGE,this.pedalFuncUpdateHandler,false,0,true);
         this.ctlMng.addEventListener(EditorEvent.CTL_ASSIGN_PARAMS_CHANGE,this.paramUpdateHandler,false,0,true);
         this.styleChangingTimer.addEventListener(TimerEvent.TIMER,this.styleChangingTimerHandler,false,0,true);
         this.ctlMng.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.paramPatchChangedHandler,false,0,true);
         this.ctlMng.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
      }
      
      private function paramPatchChangedHandler(param1:ToneCentralEvents) : void
      {
         this.updateView();
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.updateView();
      }
      
      private function removeListner() : void
      {
         this.view.pedalFuncDDL.removeEventListener(IndexChangeEvent.CHANGE,this.pedalFuncChangeHandler);
         this.ctlMng.removeEventListener(EditorEvent.CTL_PEDAL_FUNC_CHANGE,this.pedalFuncUpdateHandler);
         this.ctlMng.removeEventListener(EditorEvent.CTL_ASSIGN_PARAMS_CHANGE,this.paramUpdateHandler);
         this.styleChangingTimer.removeEventListener(TimerEvent.TIMER,this.styleChangingTimerHandler);
         this.ctlMng.removeEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.paramPatchChangedHandler);
      }
      
      private function pedalFuncChangeHandler(param1:Event) : void
      {
         this.ctlMng.pedalFuncIndex = this.view.pedalFuncDDL.selectedIndex;
      }
      
      private function pedalFuncUpdateHandler(param1:Event) : void
      {
         this.changePedalFuncDDLStyle();
         this.view.pedalFuncDDL.selectedIndex = this.ctlMng.pedalFuncIndex;
         this.updateParameter();
      }
      
      private function changePedalFuncDDLStyle() : void
      {
         this.styleChangingTimer.reset();
         this.styleChangingTimer.start();
         this.view.pedalFuncDDL.styleName = "redBorderDropDown";
         this.drawBgi(this.view.textBoxBgiPedalFunc,"changing");
      }
      
      private function styleChangingTimerHandler(param1:TimerEvent) : void
      {
         this.styleChangingTimer.stop();
         this.view.pedalFuncDDL.styleName = "blueBorderDropDown";
         this.drawBgi(this.view.textBoxBgiPedalFunc,"normal");
      }
      
      private function paramUpdateHandler(param1:EditorEvent) : void
      {
         var _loc4_:CTLCtlParameterComponent = null;
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
            _loc5_++;
         }
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
         this.view.pedalFuncDDL.dataProvider = this.ctlMng.pedalFuncList;
         this.view.pedalFuncDDL.selectedIndex = this.ctlMng.pedalFuncIndex;
      }
      
      private function createParameter() : void
      {
         var _loc1_:CTLCtlParameterComponent = null;
         var _loc2_:Object = null;
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < CTLDefinitionGT.CTL_PARAMETER_LIST.length)
         {
            _loc2_ = CTLDefinitionGT.CTL_PARAMETER_LIST[_loc3_];
            _loc4_ = this.createItemData(_loc2_);
            _loc1_ = new CTLCtlParameterComponent(this.view.width,30,this.view.width,30,27);
            if(_loc2_.effect == "REVERB")
            {
               _loc1_.addHeight(15);
            }
            else if(_loc3_ % 5 == 2)
            {
               _loc1_.addHeight(10);
            }
            _loc1_.setdata(_loc4_,true);
            _loc1_.setEffectType(_loc4_.name);
            this.view.ctlParameterVGroup.addElement(_loc1_);
            this.ctlParameterComponentDic[_loc2_.effect] = _loc1_;
            _loc3_++;
         }
      }
      
      private function updateParameter() : void
      {
         var _loc1_:CTLCtlParameterComponent = null;
         var _loc2_:Object = null;
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < CTLDefinitionGT.CTL_PARAMETER_LIST.length)
         {
            _loc2_ = CTLDefinitionGT.CTL_PARAMETER_LIST[_loc3_];
            _loc4_ = this.createItemData(_loc2_);
            _loc1_ = this.ctlParameterComponentDic[_loc2_.effect];
            _loc1_.updateData(_loc4_,_loc4_.name);
            _loc3_++;
         }
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
      
      private function createItemData(param1:Object) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         _loc3_ = CTLParameterUtil.getCTLParamName(this.ctlMng.ctlName,param1.effect);
         _loc4_ = "temp_" + _loc3_;
         _loc2_ = {};
         _loc2_.name = _loc3_;
         _loc2_.effect = param1.effect;
         var _loc6_:String = "temp_" + param1.assignParamName;
         _loc2_.max = param1.max;
         _loc2_.min = param1.min;
         _loc2_.step = param1.step;
         _loc2_.address = this.addressMap[_loc4_].address;
         _loc5_ = ParameterUtil.getDoubleByteData(_loc2_.address,this.ctlMng.getTmpData(_loc3_)) * int(_loc2_.step);
         _loc2_.value = _loc5_;
         return _loc2_;
      }
   }
}

