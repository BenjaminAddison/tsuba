package tonecentral.common.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.events.ToneCentralEvents;
   
   public class URLDefinitionLoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      public function URLDefinitionLoader(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function load() : void
      {
         this.loader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest(URLDefinition.DEFINITION_URL#1);
         this.loader.addEventListener(Event.COMPLETE,this.loadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.loadFaultHandler,false,0,true);
         this.loader.load(_loc1_);
      }
      
      private function loadFaultHandler(param1:IOErrorEvent) : void
      {
         var _loc5_:File = null;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath(URLDefinition.DEFINITION_LOCAL_STORAGE_URL#1);
         if(!_loc2_.exists)
         {
            _loc5_ = File.applicationDirectory.resolvePath(URLDefinition.DEFINITION_LOCAL_URL#1);
            _loc5_.copyTo(_loc2_,true);
         }
         var _loc3_:FileStream = new FileStream();
         _loc3_.open(_loc2_,FileMode.READ);
         var _loc4_:String = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
         _loc3_.close();
         this.setDefinition(_loc4_);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      private function loadCompleteHandler(param1:Event) : void
      {
         var _loc2_:String = this.loader.data;
         var _loc3_:File = File.applicationStorageDirectory.resolvePath(URLDefinition.DEFINITION_LOCAL_STORAGE_URL#1);
         var _loc4_:FileStream = new FileStream();
         _loc4_.open(_loc3_,FileMode.WRITE);
         _loc4_.writeUTFBytes(_loc2_);
         _loc4_.close();
         this.setDefinition(_loc2_);
      }
      
      private function setDefinition(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         if(_loc2_)
         {
            URLDefinition.BTC_DOMAIN = _loc2_.btc.domain;
            URLDefinition.API_DOMAIN = _loc2_.api.domain;
            URLDefinition.API_USER = _loc2_.api.user;
            URLDefinition.API_ERROR_LOGS = _loc2_.api.errorlogs;
            URLDefinition.API_STATUS_LOGS = _loc2_.api.statuslogs;
            URLDefinition.API_UPDATE_LOGS = _loc2_.api.updatelogs;
            URLDefinition.API_PATCHUSE_LOGS = _loc2_.api.patchuselogs;
            URLDefinition.API_LIVESET_ADD_LOGS = _loc2_.api.livesetaddlogs;
            URLDefinition.API_LIVESET_LOGS = _loc2_.api.livesetlogs;
            URLDefinition.API_YOUTUBE_LOGS = _loc2_.api.youtubelogs;
            URLDefinition.API_SOUND_CLOUD_LOGS = _loc2_.api.soundcloudlogs;
            URLDefinition.YOUTUBE_API = _loc2_.external_service.youtube.url;
            URLDefinition.SOUND_CLOUD_API = _loc2_.external_service.soundcloud.domain + _loc2_.external_service.soundcloud.resolve;
            URLDefinition.SOUND_CLOUD_CLIENT_ID = _loc2_.external_service.soundcloud.client_id;
            URLDefinition.DATA_API_URL = _loc2_.btc.domain + _loc2_.btc.dataapi;
            URLDefinition.UPDATE_URL_KATANA50 = _loc2_.btc.domain + _loc2_.btc.update_xml_list["katana50"];
            URLDefinition.UPDATE_URL_KATANA100 = _loc2_.btc.domain + _loc2_.btc.update_xml_list["katana100"];
            URLDefinition.UPDATE_URL_KATANA100_212 = _loc2_.btc.domain + _loc2_.btc.update_xml_list["katana100_212"];
            URLDefinition.UPDATE_URL_KATANA_HEAD = _loc2_.btc.domain + _loc2_.btc.update_xml_list["katana_head"];
            URLDefinition.UPDATE_URL_KATANA_ARTIST = _loc2_.btc.domain + _loc2_.btc.update_xml_list["katana_artist"];
            URLDefinition.PRESET_ARTWORK_URL = _loc2_.btc.domain + _loc2_.btc.preset_artwork;
            URLDefinition.TC_PICKUP_URL = _loc2_.btc.domain + _loc2_.btc.pickup;
            URLDefinition.TC_PROMOTION_URL = _loc2_.btc.domain + _loc2_.btc.promotion;
            URLDefinition.TC_LIVESET_LIST_URL = _loc2_.btc.domain + _loc2_.btc.liveset;
            URLDefinition.TC_PERMALINK_EN = _loc2_.btc.domain + "/liveset/detail/";
            URLDefinition.TC_PERMALINK_JP = _loc2_.btc.domain + "/jp/liveset/detail/";
            URLDefinition.TC_TAGS_URL = _loc2_.btc.domain + _loc2_.btc.tags;
            URLDefinition.LIVESET_DL_URL = _loc2_.btc.domain + _loc2_.btc.liveset_file;
            URLDefinition.FIRM_KATANA_100_212_JP = _loc2_.firmDownload.katana_100_212.jp;
            URLDefinition.FIRM_KATANA_100_212_EN = _loc2_.firmDownload.katana_100_212.en;
            URLDefinition.FIRM_KATANA_100_JP = _loc2_.firmDownload.katana_100.jp;
            URLDefinition.FIRM_KATANA_100_EN = _loc2_.firmDownload.katana_100.en;
            URLDefinition.FIRM_KATANA_50_JP = _loc2_.firmDownload.katana_50.jp;
            URLDefinition.FIRM_KATANA_50_EN = _loc2_.firmDownload.katana_50.en;
            URLDefinition.FIRM_KATANA_HEAD_JP = _loc2_.firmDownload.katana_head.jp;
            URLDefinition.FIRM_KATANA_HEAD_EN = _loc2_.firmDownload.katana_head.en;
            URLDefinition.FIRM_KATANA_ARTIST_JP = _loc2_.firmDownload.katana_artist.jp;
            URLDefinition.FIRM_KATANA_ARTIST_EN = _loc2_.firmDownload.katana_artist.en;
         }
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE));
      }
   }
}

