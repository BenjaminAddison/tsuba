package tonecentral.common.define
{
   import flash.filesystem.File;
   
   public class URLDefinition
   {
      
      public static const ADDRESS_MAP:String = File.applicationDirectory.nativePath + "/";
      
      public static const ADDRESS_MAP_FILE_NAME:String = "_assets/data/addressmap_gt.json";
      
      public static const EFFECTER_DATA_FILE:String = "_assets/data/effecterdata.json";
      
      public static const REC_FILE_PATH_ROOT:String = "rec";
      
      public static const PLAY_FILE_PATH_ROOT:String = "play";
      
      develop static const DEFINITION_URL#2707:String = "http://dev-api.roland.com/app/btc/define/katana.json";
      
      release static const DEFINITION_URL#2708:String = "http://api.roland.com/app/btc/define/katana.json";
      
      develop static const DEFINITION_LOCAL_URL#2707:String = "_assets/data/katana-dev.json";
      
      release static const DEFINITION_LOCAL_URL#2708:String = "_assets/data/katana.json";
      
      develop static const DEFINITION_LOCAL_STORAGE_URL#2707:String = "data/katana-dev.json";
      
      release static const DEFINITION_LOCAL_STORAGE_URL#2708:String = "data/katana.json";
      
      public static var BTC_DOMAIN:String = "";
      
      public static var API_DOMAIN:String = "";
      
      public static var API_USER:String = "";
      
      public static var API_ERROR_LOGS:String = "";
      
      public static var API_STATUS_LOGS:String = "";
      
      public static var API_UPDATE_LOGS:String = "";
      
      public static var API_PATCHUSE_LOGS:String = "";
      
      public static var API_LIVESET_ADD_LOGS:String = "";
      
      public static var API_LIVESET_LOGS:String = "";
      
      public static var API_YOUTUBE_LOGS:String = "";
      
      public static var API_SOUND_CLOUD_LOGS:String = "";
      
      public static var YOUTUBE_API:String = "";
      
      public static var SOUND_CLOUD_API:String = "";
      
      public static var SOUND_CLOUD_CLIENT_ID:String = "";
      
      public static var DATA_API_URL:String = "";
      
      public static var UPDATE_URL_KATANA100_212:String = "";
      
      public static var UPDATE_URL_KATANA100:String = "";
      
      public static var UPDATE_URL_KATANA50:String = "";
      
      public static var UPDATE_URL_KATANA_HEAD:String = "";
      
      public static var UPDATE_URL_KATANA_ARTIST:String = "";
      
      public static var LIVESET_DL_URL:String = "";
      
      public static var PRESET_ARTWORK_URL:String = "";
      
      public static var TC_PICKUP_URL:String = "";
      
      public static var TC_PROMOTION_URL:String = "";
      
      public static var TC_LIVESET_LIST_URL:String = "";
      
      public static var TC_PERMALINK_EN:String = "";
      
      public static var TC_PERMALINK_JP:String = "";
      
      public static var TC_TAGS_URL:String = "";
      
      public static var FIRM_KATANA_100_212_JP:String = "";
      
      public static var FIRM_KATANA_100_JP:String = "";
      
      public static var FIRM_KATANA_50_JP:String = "";
      
      public static var FIRM_KATANA_HEAD_JP:String = "";
      
      public static var FIRM_KATANA_ARTIST_JP:String = "";
      
      public static var FIRM_KATANA_100_212_EN:String = "";
      
      public static var FIRM_KATANA_100_EN:String = "";
      
      public static var FIRM_KATANA_50_EN:String = "";
      
      public static var FIRM_KATANA_HEAD_EN:String = "";
      
      public static var FIRM_KATANA_ARTIST_EN:String = "";
      
      public function URLDefinition()
      {
         super();
      }
      
      public static function get DEFINITION_URL#1() : String
      {
         var _loc1_:Namespace = EnvSetting.ns;
         return _loc1_::DEFINITION_URL;
      }
      
      public static function get DEFINITION_LOCAL_URL#1() : String
      {
         var _loc1_:Namespace = EnvSetting.ns;
         return _loc1_::DEFINITION_LOCAL_URL;
      }
      
      public static function get DEFINITION_LOCAL_STORAGE_URL#1() : String
      {
         var _loc1_:Namespace = EnvSetting.ns;
         return _loc1_::DEFINITION_LOCAL_STORAGE_URL;
      }
   }
}

