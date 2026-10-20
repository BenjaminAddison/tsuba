package tonecentral.common.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.events.ToneCentralEvents;
   
   public class SoundCloudLoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      private var _data:Object;
      
      public function SoundCloudLoader(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function load(param1:String) : void
      {
         this.loader = new URLLoader();
         var _loc2_:URLRequest = new URLRequest(URLDefinition.SOUND_CLOUD_API);
         var _loc3_:URLVariables = new URLVariables();
         _loc3_.url = param1;
         _loc3_.client_id = URLDefinition.SOUND_CLOUD_CLIENT_ID;
         _loc2_.data = _loc3_;
         this.loader.addEventListener(Event.COMPLETE,this.loadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.loadFaultHandler,false,0,true);
         this.loader.load(_loc2_);
      }
      
      private function loadCompleteHandler(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            this._data = JSON.parse(this.loader.data);
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE));
         }
         catch(e:Error)
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
         }
      }
      
      private function loadFaultHandler(param1:IOErrorEvent) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
   }
}

