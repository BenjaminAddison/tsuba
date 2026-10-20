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
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.TCLiveSetManager;
   import tonecentral.events.ToneCentralEvents;
   
   public class LiveSetLoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      private var loadList:Array;
      
      private var count:int;
      
      private var livesetUpdateData:Object;
      
      public function LiveSetLoader(param1:IEventDispatcher = null)
      {
         super(param1);
         this.loader = new URLLoader();
         this.loader.addEventListener(Event.COMPLETE,this.loadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.loadFaultHandler,false,0,true);
      }
      
      private function getLocalLivesetFile(param1:String) : File
      {
         var _loc2_:Array = param1.split("/");
         var _loc3_:String = _loc2_[_loc2_.length - 1];
         return File.applicationStorageDirectory.resolvePath("livesets/" + _loc3_);
      }
      
      private function loadCompleteHandler(param1:Event) : void
      {
         var _loc2_:File = this.getLocalLivesetFile(this.loadList[this.count].url);
         var _loc3_:String = this.loader.data;
         var _loc4_:FileStream = new FileStream();
         _loc4_.open(_loc2_,FileMode.WRITE);
         _loc4_.writeUTFBytes(_loc3_);
         _loc4_.close();
         var _loc5_:Object = this.loadList[this.count];
         this.livesetUpdateData[_loc5_.name] = _loc5_.date;
         this.next();
      }
      
      private function loadFaultHandler(param1:IOErrorEvent) : void
      {
         this.next();
      }
      
      public function load(param1:Array) : void
      {
         this.livesetUpdateData = SharedObjectUtil.get(ToneCentralDefinition.LIVESET_UPDATE);
         if(!this.livesetUpdateData)
         {
            this.livesetUpdateData = {};
         }
         this.count = 0;
         this.loadList = param1;
         this.loadNext();
      }
      
      private function loadNext() : void
      {
         var _loc1_:URLRequest = new URLRequest();
         var _loc2_:Object = this.loadList[this.count];
         var _loc3_:File = this.getLocalLivesetFile(this.loadList[this.count].url);
         if(this.livesetUpdateData[_loc2_.name] != _loc2_.date || !_loc3_.exists)
         {
            _loc1_.url = this.loadList[this.count].url;
            this.loader.load(_loc1_);
         }
         else
         {
            this.next();
         }
      }
      
      private function next() : void
      {
         var _loc1_:TCLiveSetManager = null;
         ++this.count;
         if(this.loadList.length == this.count)
         {
            _loc1_ = TCLiveSetManager.getInstance();
            _loc1_.restoreAllLiveSet();
            SharedObjectUtil.set(ToneCentralDefinition.LIVESET_UPDATE,this.livesetUpdateData);
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE));
         }
         else
         {
            this.loadNext();
         }
      }
   }
}

