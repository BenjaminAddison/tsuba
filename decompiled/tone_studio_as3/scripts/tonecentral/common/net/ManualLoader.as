package tonecentral.common.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.filesystem.File;
   import flash.net.URLLoader;
   import jp.co.site4d.events.NetEvent;
   import jp.co.site4d.net.FileDownloader;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ManualLoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      private var mediator:ToneCentralMediator;
      
      private var downloader:FileDownloader = new FileDownloader();
      
      public function ManualLoader(param1:IEventDispatcher = null)
      {
         super(param1);
         this.mediator = ToneCentralMediator.getInstance();
      }
      
      public function load() : void
      {
         var _loc1_:XML = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc1_ = this.mediator.updateXmlKatana50;
               break;
            case 1:
               _loc1_ = this.mediator.updateXmlKatana100;
               break;
            case 2:
               _loc1_ = this.mediator.updateXmlKatana100_212;
               break;
            case 3:
               _loc1_ = this.mediator.updateXmlKatanaHead;
               break;
            case 4:
               _loc1_ = this.mediator.updateXmlKatanaArtist;
         }
         this.downloader.addEventListener(NetEvent.COMPLETE,this.manualLoadCompleteHandler,false,0,true);
         this.downloader.addEventListener(NetEvent.IO_ERROR,this.manualLoadErrorHandler,false,0,true);
         this.downloader.addEventListener(NetEvent.SECURITY_ERROR,this.manualLoadErrorHandler,false,0,true);
         if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[1])
         {
            _loc2_ = String(_loc1_.manual.url_jp);
            _loc3_ = String(_loc1_.manual.filename_jp);
         }
         else
         {
            _loc2_ = String(_loc1_.manual.url_en);
            _loc3_ = String(_loc1_.manual.filename_en);
         }
         var _loc4_:String = _loc2_;
         this.downloader.download(_loc4_,File.applicationStorageDirectory.nativePath + "/" + _loc3_);
      }
      
      private function manualLoadCompleteHandler(param1:NetEvent) : void
      {
         this.downloader.removeEventListener(NetEvent.COMPLETE,this.manualLoadCompleteHandler);
         this.downloader.removeEventListener(NetEvent.IO_ERROR,this.manualLoadErrorHandler);
         this.downloader.removeEventListener(NetEvent.SECURITY_ERROR,this.manualLoadErrorHandler);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.MANUAL_LOAD_COMPLETE));
      }
      
      private function manualLoadErrorHandler(param1:Event) : void
      {
         this.downloader.removeEventListener(NetEvent.COMPLETE,this.manualLoadCompleteHandler);
         this.downloader.removeEventListener(NetEvent.IO_ERROR,this.manualLoadErrorHandler);
         this.downloader.removeEventListener(NetEvent.SECURITY_ERROR,this.manualLoadErrorHandler);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.MANUAL_LOAD_FAULT));
      }
   }
}

