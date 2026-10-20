package tonecentral.common.manager
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import tonecentral.events.ToneCentralEvents;
   
   public class ApplicationManager extends EventDispatcher
   {
      
      private static var instance:ApplicationManager;
      
      public var isItemDrop:Boolean;
      
      private var _isShowLoading:Boolean;
      
      public function ApplicationManager(param1:Blocker, param2:IEventDispatcher = null)
      {
         super(param2);
      }
      
      public static function getInstance() : ApplicationManager
      {
         if(!instance)
         {
            instance = new ApplicationManager(new Blocker());
         }
         return instance;
      }
      
      public function get isShowLoading() : Boolean
      {
         return this._isShowLoading;
      }
      
      public function livesetDragStart() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LIVESET_DRAG_START));
      }
      
      public function livesetDragEnd() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LIVESET_DRAG_END));
      }
      
      public function areaSelect(param1:Object) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.SELECT);
         _loc2_.data = param1;
         dispatchEvent(_loc2_);
      }
      
      public function updateCancel() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.UPDATE_CANCEL));
      }
      
      public function updateOK() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.UPDATE_OK));
      }
      
      public function changeDemoMode() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_DEMO));
      }
      
      public function dragStart() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_START));
      }
      
      public function dragComplete(param1:String) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DRAG_COMPLETE);
         _loc2_.data = param1;
         dispatchEvent(_loc2_);
      }
      
      public function overflowOK() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.OVERFLOW_OK));
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
