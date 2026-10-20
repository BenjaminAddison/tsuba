package tonecentral.events
{
   import flash.events.Event;
   
   public class SystemEvent extends Event
   {
      
      public static const LCD_CHANGE:String = "lcdChange";
      
      public static const TUNER_CHANGE:String = "tunerChange";
      
      public static const METRONOME_CHANGE:String = "metronomeChange";
      
      public static const PREFERENCE_CHANGE:String = "preferenceChange";
      
      public static const USB_CHANGE:String = "usbChange";
      
      public static const PLAY_OPTION_CHANGE:String = "playChange";
      
      public static const AUTO_OFF_CHANGE:String = "autoOffChange";
      
      public static const OUTPUT_SELECT_CHANGE:String = "outputSelectChange";
      
      public static const INPUT_CHANGE:String = "inputChange";
      
      public static const GLOBAL_CHANGE:String = "globalChange";
      
      public static const TOTAL_CHANGE:String = "totalChange";
      
      public static const MIC_CHANGE:String = "micChange";
      
      public static const INPUT_SELECT_CHANGE:String = "inputSelectChange";
      
      public static const PHRASE_LOOP_CHANGE:String = "phraseLoopChange";
      
      public static const SYSTEM1_CHANGE:String = "system1Change";
      
      public static const SYSTEM2_CHANGE:String = "system2Change";
      
      public static const SYSTEM3_CHANGE:String = "system3Change";
      
      public static const KNOB_SETTING_CHANGE:String = "knobChange";
      
      public static const CTL_EXP_CHANGE:String = "ctlExpChange";
      
      public static const GTR_TO_MIDI_CHANGE:String = "gtrToMidiChange";
      
      public static const FAVORITE_CHANGE:String = "favoriteChange";
      
      public static const PRM_SYS_PATCH_EXT_CHANGE:String = "prmSysPatchExtChange";
      
      public static const POLY_TUNER_CHANGE:String = "PolyTunerChange";
      
      public static const PROGRAM_MAP_CHANGE:String = "programMapChange";
      
      public static const MIDI_SETTING_CHANGE:String = "midiSettingChange";
      
      public static const AMP_CHANGE:String = "ampChange";
      
      public static const LINOUT_CABINET_CHANGE:String = "lineoutCabinetChange";
      
      public static const GLOBAL_EQ_CHANGE:String = "globalEqChange";
      
      public var data:Object;
      
      public function SystemEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

