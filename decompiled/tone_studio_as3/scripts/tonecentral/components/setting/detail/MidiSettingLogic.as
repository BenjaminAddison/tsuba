package tonecentral.components.setting.detail
{
   import flash.events.MouseEvent;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.events.SystemEvent;
   
   public class MidiSettingLogic extends AbstractSettingDetailLogic
   {
      
      private var view:MidiSetting;
      
      public function MidiSettingLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = MidiSetting(param1);
      }
      
      override protected function init() : void
      {
         settingName = SystemSettingDefinitionGT.MIDI_SETTING;
         super.init();
         systemMng.addEventListener(SystemEvent.MIDI_SETTING_CHANGE,paramChangeHandler,false,0,true);
         this.view.parameterVGroup.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandler,false,0,true);
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         param1.delta *= 80;
      }
      
      override protected function createParameter() : void
      {
         var _loc1_:SettingParameterComponent = null;
         var _loc2_:Object = null;
         var _loc5_:Object = null;
         var _loc3_:Array = SystemSettingDefinitionGT.getList(settingName);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            _loc5_ = createItemData(_loc2_);
            _loc1_ = createSettingParameterComponent(_loc5_,_loc2_);
            this.view.parameterVGroup.addElement(_loc1_);
            _loc4_++;
         }
      }
      
      override protected function paramUpdate(param1:String, param2:int) : void
      {
         var _loc3_:SettingParameterComponent = null;
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

