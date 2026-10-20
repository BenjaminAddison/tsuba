package tonecentral.common.define
{
   public class ToneCentralDefinition
   {
      
      public static const DEVICE_NAME:String = "GT";
      
      public static const EXPORT_REVISION:String = "1.0.0";
      
      public static const LANG_TYPE:Array = ["en_US","ja_JP"];
      
      public static const DEVICE_DATA:String = "device_data";
      
      public static const REC_FILE_DATA:String = "rec_file_data";
      
      public static const PLAY_FILE_DATA:String = "play_file_data";
      
      public static const CONF_LANGUAGE:String = "conf_language";
      
      public static const MANUAL_VERSION_KATANA50:String = "manual_version_katana50";
      
      public static const MANUAL_VERSION_KATANA100:String = "manual_version_katana100";
      
      public static const MANUAL_VERSION_KATANA100_212:String = "manual_version_katana100_212";
      
      public static const MANUAL_VERSION_KATANA_HEAD:String = "manual_version_katana_head";
      
      public static const MANUAL_VERSION_KATANA_ARTIST:String = "manual_version_katana_artist";
      
      public static const SELECTED_EFFECT:String = "selected_effect";
      
      public static const DETAILS:String = "details";
      
      public static const LIST:String = "list";
      
      public static const CTL_LIST:String = "ctl_list";
      
      public static const EDIT_TYPE_PARAMETER:String = "PARAMETER";
      
      public static const EDIT_TYPE_EFECT_ON_OFF:String = "EFFECT ON / OFF";
      
      public static const NO_REPEAT:String = "noRepeat";
      
      public static const AB_REPEAT:String = "abRepeat";
      
      public static const ONE_REPEAT:String = "oneRepeat";
      
      public static const ONE_STRATE:String = "oneStrate";
      
      public static const ALL_REPEAT:String = "allRepeat";
      
      public static const SIDE_AREA:String = "sideArea";
      
      public static const CONTENTS_AREA:String = "contentsArea";
      
      public static const GENRE_ALL:String = "all";
      
      public static const GENRE_PICKUP:String = "pickup";
      
      public static const MEMORY_MODE:String = "MEMORY MODE";
      
      public static const MANUAL_MODE:String = "MANUAL MODE";
      
      public static const MOMENTARY_LABEL:String = "MOMENTARY";
      
      public static const MOMENTARY_VALUE:String = "memontary";
      
      public static const TOGGLE_LABEL:String = "TOGGLE";
      
      public static const TOGGLE_VALUE:String = "toggle";
      
      public static const LIVESET_UPDATE:String = "livesetUpdate";
      
      public static const TUNING_TYPE_LIST:Array = ["REGULAR","DROP D"];
      
      public static const TUNING_OUTPUT_LIST:Array = ["MUTE","BYPASS","THRU"];
      
      public static const PRIMARY:String = "primary";
      
      public static const SECONDARY:String = "secondary";
      
      public static const CHA_TO_B:String = "chAtoA";
      
      public static const CHB_TO_A:String = "chBtoA";
      
      public static const SWITCH_CHAB:String = "switchAB";
      
      public static const SWITCH_CHAIN_AB:String = "switchChainAB";
      
      public static const CHAB_TYPE_LIST:Array = [{
         "label":"PREAMP&SP CH.A ⇒ B",
         "value":"0"
      },{
         "label":"PREAMP&SP CH.B ⇒ A",
         "value":"1"
      },{
         "label":"PREAMP&SP CH.A ⇔ B",
         "value":"2"
      },{
         "label":"CHAIN CH.A ⇔ B",
         "value":"3"
      }];
      
      public static const HEALTH_CHECK_TIME:Number = 1000;
      
      public function ToneCentralDefinition()
      {
         super();
      }
   }
}

