package tonecentral.common.manager
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.SystemParams;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class SystemManager extends EventDispatcher
   {
      
      private static var instance:SystemManager;
      
      private var mediator:ToneCentralMediator;
      
      public var data:Object;
      
      private var systemParams:SystemParams;
      
      public function SystemManager(param1:Blocker, param2:IEventDispatcher = null)
      {
         super(param2);
         this.init();
      }
      
      public static function getInstance() : SystemManager
      {
         if(!instance)
         {
            instance = new SystemManager(new Blocker());
         }
         return instance;
      }
      
      private function init() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex.addUpdateSystemCallback(this.updateSystemParams);
         this.systemParams = this.mediator.sysex.params.system;
      }
      
      private function updateSystemParams(param1:Object) : void
      {
         var _loc4_:SystemEvent = null;
         var _loc2_:String = param1.address as String;
         var _loc3_:Array = param1.value as Array;
         if(_loc2_ <= "00,00,00,01")
         {
            _loc4_ = new SystemEvent(SystemEvent.LCD_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,18")
         {
            _loc4_ = new SystemEvent(SystemEvent.PLAY_OPTION_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,21")
         {
            _loc4_ = new SystemEvent(SystemEvent.TUNER_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,34")
         {
            _loc4_ = new SystemEvent(SystemEvent.METRONOME_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,47")
         {
            if(_loc2_ == "00,00,00,41")
            {
               this.data = param1;
               SystemExclusive.getInstance().requestDataFunc(AddressMap.getInstance().temp_preamp_a_on_off.address,"80","requestTempPreAmpData");
               this.mediator.sysex.addEventListener(ToneCentralEvents.REQUEST_COMPLETE_TEMP_PRE_AMP_DATA,this.resuestCompleteTempPreAmpData,false,0,true);
            }
            else
            {
               _loc4_ = new SystemEvent(SystemEvent.PREFERENCE_CHANGE);
            }
         }
         else if(_loc2_ <= "00,00,00,57")
         {
            _loc4_ = new SystemEvent(SystemEvent.USB_CHANGE);
         }
         else if(_loc2_ == "00,00,00,60")
         {
            _loc4_ = new SystemEvent(SystemEvent.AUTO_OFF_CHANGE);
         }
         else if(_loc2_ == "00,00,00,70")
         {
            _loc4_ = new SystemEvent(SystemEvent.OUTPUT_SELECT_CHANGE);
         }
         else if(_loc2_ == "00,00,00,71")
         {
            _loc4_ = new SystemEvent(SystemEvent.INPUT_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,76")
         {
            _loc4_ = new SystemEvent(SystemEvent.GLOBAL_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,79")
         {
            _loc4_ = new SystemEvent(SystemEvent.TOTAL_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,7C")
         {
            _loc4_ = new SystemEvent(SystemEvent.MIC_CHANGE);
         }
         else if(_loc2_ <= "00,00,00,7D")
         {
            _loc4_ = new SystemEvent(SystemEvent.INPUT_SELECT_CHANGE);
         }
         else if(_loc2_ <= "00,00,01,04")
         {
            _loc4_ = new SystemEvent(SystemEvent.PHRASE_LOOP_CHANGE);
         }
         else if(_loc2_ <= "00,00,01,4F")
         {
            _loc4_ = new SystemEvent(SystemEvent.SYSTEM1_CHANGE);
         }
         else if(_loc2_ <= "00,00,02,0F")
         {
            _loc4_ = new SystemEvent(SystemEvent.SYSTEM2_CHANGE);
         }
         else if(_loc2_ <= "00,00,02,4F")
         {
            _loc4_ = new SystemEvent(SystemEvent.SYSTEM3_CHANGE);
         }
         else if(_loc2_ <= "00,00,02,5E")
         {
            _loc4_ = new SystemEvent(SystemEvent.KNOB_SETTING_CHANGE);
         }
         else if(_loc2_ <= "00,00,02,75")
         {
            _loc4_ = new SystemEvent(SystemEvent.CTL_EXP_CHANGE);
         }
         else if(_loc2_ <= "00,00,03,05")
         {
            _loc4_ = new SystemEvent(SystemEvent.GTR_TO_MIDI_CHANGE);
         }
         else if(_loc2_ <= "00,00,03,16")
         {
            _loc4_ = new SystemEvent(SystemEvent.FAVORITE_CHANGE);
         }
         else if(_loc2_ <= "00,00,03,24")
         {
            _loc4_ = new SystemEvent(SystemEvent.PLAY_OPTION_CHANGE);
         }
         else if(_loc2_ <= "00,00,03,27")
         {
            _loc4_ = new SystemEvent(SystemEvent.POLY_TUNER_CHANGE);
         }
         else if(_loc2_ <= "00,00,04,29")
         {
            _loc4_ = new SystemEvent(SystemEvent.AMP_CHANGE);
         }
         else if(_loc2_ <= "00,00,04,31")
         {
            _loc4_ = new SystemEvent(SystemEvent.LINOUT_CABINET_CHANGE);
         }
         else if(_loc2_ <= "00,00,04,4A")
         {
            _loc4_ = new SystemEvent(SystemEvent.GLOBAL_EQ_CHANGE);
         }
         else if(SystemSettingDefinitionGT.PROGRAM_MAP_START_ADDRESS <= _loc2_ && _loc2_ <= SystemSettingDefinitionGT.PROGRAM_MAP_END_ADDRESS)
         {
            _loc4_ = new SystemEvent(SystemEvent.PROGRAM_MAP_CHANGE);
         }
         else if(SystemSettingDefinitionGT.MIDI_SETTING_START_ADDRESS <= _loc2_ && _loc2_ <= SystemSettingDefinitionGT.MIDI_SETTING_END_ADDRESS)
         {
            _loc4_ = new SystemEvent(SystemEvent.MIDI_SETTING_CHANGE);
         }
         if(_loc4_)
         {
            _loc4_.data = param1;
            dispatchEvent(_loc4_);
         }
      }
      
      private function resuestCompleteTempPreAmpData(param1:ToneCentralEvents) : void
      {
         var _loc2_:SystemEvent = null;
         this.mediator.sysex.removeEventListener(ToneCentralEvents.REQUEST_COMPLETE_TEMP_PRE_AMP_DATA,this.resuestCompleteTempPreAmpData);
         _loc2_ = new SystemEvent(SystemEvent.PREFERENCE_CHANGE);
         _loc2_.data = this.data;
         dispatchEvent(_loc2_);
      }
      
      public function getTmpOrSysOutputSelectData(param1:String) : int
      {
         if(this.isOutputSelectSystem())
         {
            return this.systemParams[param1];
         }
         return this.mediator.sysex.params.temporaryParams[param1];
      }
      
      public function isOutputSelectSystem() : Boolean
      {
         return this.systemParams.sys_preference_output_select == 1;
      }
   }
}

class Blocker
{
   
   public function Blocker()
   {
      super();
   }
}
