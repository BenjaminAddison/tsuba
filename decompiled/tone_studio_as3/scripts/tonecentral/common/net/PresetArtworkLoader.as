package tonecentral.common.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import jp.co.site4d.events.NetEvent;
   import jp.co.site4d.net.FileDownloader;
   import tonecentral.common.define.URLDefinition;
   
   public class PresetArtworkLoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      private var count:int;
      
      private var data:Object;
      
      private var downloader:FileDownloader = new FileDownloader();
      
      public function PresetArtworkLoader()
      {
         super();
      }
      
      public function load() : void
      {
         var _loc3_:File = null;
         var _loc1_:File = File.applicationStorageDirectory.resolvePath("presetArtwork");
         if(!_loc1_.exists)
         {
            _loc3_ = File.applicationDirectory.resolvePath("_assets/presetArtwork");
            _loc3_.copyTo(_loc1_,true);
         }
         this.loader = new URLLoader();
         var _loc2_:URLRequest = new URLRequest(URLDefinition.PRESET_ARTWORK_URL);
         this.loader.addEventListener(Event.COMPLETE,this.loadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.loadFaultHandler,false,0,true);
         this.loader.load(_loc2_);
      }
      
      private function loadCompleteHandler(param1:Event) : void
      {
         this.data = JSON.parse(this.loader.data);
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("presetArtwork");
         try
         {
         }
         catch(error:Error)
         {
         }
         _loc2_.createDirectory();
         this.count = 0;
         this.loadNext();
      }
      
      private function loadFaultHandler(param1:IOErrorEvent) : void
      {
      }
      
      private function loadNext() : void
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         if(this.data.preset_artwork.lenght != this.count)
         {
            this.downloader.addEventListener(NetEvent.COMPLETE,this.imageLoadCompleteHandler,false,0,true);
            this.downloader.addEventListener(NetEvent.IO_ERROR,this.imageLoadErrorHandler,false,0,true);
            this.downloader.addEventListener(NetEvent.SECURITY_ERROR,this.imageLoadErrorHandler,false,0,true);
            _loc1_ = URLDefinition.BTC_DOMAIN + this.data.preset_artwork[this.count];
            _loc2_ = _loc1_.split("/");
            this.downloader.download(_loc1_,File.applicationStorageDirectory.nativePath + "/presetArtwork/" + _loc2_[_loc2_.length - 1]);
            ++this.count;
         }
      }
      
      private function imageLoadCompleteHandler(param1:NetEvent) : void
      {
         this.loadNext();
      }
      
      private function imageLoadErrorHandler(param1:NetEvent) : void
      {
      }
   }
}

