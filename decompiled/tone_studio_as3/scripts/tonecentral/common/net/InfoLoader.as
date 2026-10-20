package tonecentral.common.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class InfoLoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      private var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      public function InfoLoader(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function load() : void
      {
         this.loader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest(URLDefinition.UPDATE_URL_KATANA100_212);
         this.loader.addEventListener(Event.COMPLETE,this.updateXMLKatana100_212LoadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.updateXMLLoadErrorHandler,false,0,true);
         this.loader.load(_loc1_);
      }
      
      private function updateXMLKatana100_212LoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:XML = XML(this.loader.data);
         this.mediator.updateXmlKatana100_212 = _loc2_;
         var _loc3_:URLRequest = new URLRequest(URLDefinition.UPDATE_URL_KATANA100);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatana100_212LoadCompleteHandler);
         this.loader.addEventListener(Event.COMPLETE,this.updateXMLKatana100LoadCompleteHandler,false,0,true);
         this.loader.load(_loc3_);
      }
      
      private function updateXMLKatana100LoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:XML = XML(this.loader.data);
         this.mediator.updateXmlKatana100 = _loc2_;
         var _loc3_:URLRequest = new URLRequest(URLDefinition.UPDATE_URL_KATANA50);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatana100LoadCompleteHandler);
         this.loader.addEventListener(Event.COMPLETE,this.updateXMLKatana50LoadCompleteHandler,false,0,true);
         this.loader.load(_loc3_);
      }
      
      private function updateXMLKatana50LoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:XML = XML(this.loader.data);
         this.mediator.updateXmlKatana50 = _loc2_;
         var _loc3_:URLRequest = new URLRequest(URLDefinition.UPDATE_URL_KATANA_HEAD);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatana50LoadCompleteHandler);
         this.loader.addEventListener(Event.COMPLETE,this.updateXMLKatanaHeadLoadCompleteHandler,false,0,true);
         this.loader.load(_loc3_);
      }
      
      private function updateXMLKatanaHeadLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:XML = XML(this.loader.data);
         this.mediator.updateXmlKatanaHead = _loc2_;
         var _loc3_:URLRequest = new URLRequest(URLDefinition.UPDATE_URL_KATANA_ARTIST);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatanaHeadLoadCompleteHandler);
         this.loader.addEventListener(Event.COMPLETE,this.updateXMLKatanaArtistLoadCompleteHandler,false,0,true);
         this.loader.load(_loc3_);
      }
      
      private function updateXMLKatanaArtistLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:XML = XML(this.loader.data);
         this.mediator.updateXmlKatanaArtist = _loc2_;
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatanaArtistLoadCompleteHandler);
         this.loader.removeEventListener(IOErrorEvent.IO_ERROR,this.updateXMLLoadErrorHandler);
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE);
         dispatchEvent(_loc3_);
      }
      
      private function updateXMLLoadErrorHandler(param1:IOErrorEvent) : void
      {
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatana100_212LoadCompleteHandler);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatana100LoadCompleteHandler);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatana50LoadCompleteHandler);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatanaHeadLoadCompleteHandler);
         this.loader.removeEventListener(Event.COMPLETE,this.updateXMLKatanaArtistLoadCompleteHandler);
         this.loader.removeEventListener(IOErrorEvent.IO_ERROR,this.updateXMLLoadErrorHandler);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
   }
}

