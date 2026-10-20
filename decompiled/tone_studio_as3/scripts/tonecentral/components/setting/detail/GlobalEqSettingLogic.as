package tonecentral.components.setting.detail
{
   import flash.events.MouseEvent;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class GlobalEqSettingLogic extends AbstractSettingDetailLogic
   {
      
      private var view:GlobalEqSetting;
      
      public function GlobalEqSettingLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = GlobalEqSetting(param1);
      }
      
      override protected function init() : void
      {
         var _loc1_:ToneCentralMediator = ToneCentralMediator.getInstance();
         settingName = _loc1_.sysex.params.system.global_eq_setting_type ? SystemSettingDefinitionGT.GLOBAL_EQ_GEQ_SETTING : SystemSettingDefinitionGT.GLOBAL_EQ_SETTING;
         super.init();
         this.view.parameterVGroup.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandler,false,0,true);
         systemMng.addEventListener(SystemEvent.GLOBAL_EQ_CHANGE,paramChangeHandler,false,0,true);
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         param1.delta *= 80;
      }
      
      override protected function createParameter() : void
      {
         var _loc1_:SettingParameterComponent = null;
         var _loc2_:Object = null;
         var _loc6_:Object = null;
         var _loc3_:ToneCentralMediator = ToneCentralMediator.getInstance();
         settingName = _loc3_.sysex.params.system.global_eq_setting_type ? SystemSettingDefinitionGT.GLOBAL_EQ_GEQ_SETTING : SystemSettingDefinitionGT.GLOBAL_EQ_SETTING;
         var _loc4_:Array = SystemSettingDefinitionGT.getList(settingName);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc6_ = createItemData(_loc2_);
            _loc1_ = createSettingParameterComponent(_loc6_,_loc2_);
            this.view.parameterVGroup.addElement(_loc1_);
            _loc5_++;
         }
      }
      
      override protected function paramUpdate(param1:String, param2:int) : void
      {
         var _loc3_:SettingParameterComponent = null;
         if(param1 == "00,00,04,3F")
         {
            mediator.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SETTING_EQTYPE_COMPLETED));
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.view.parameterVGroup.numElements)
         {
            _loc3_ = this.view.parameterVGroup.getElementAt(_loc4_) as SettingParameterComponent;
            if(_loc3_.getAddress() == param1)
            {
               _loc3_.paramUpdateHandler(param2);
            }
            _loc4_++;
         }
      }
   }
}

