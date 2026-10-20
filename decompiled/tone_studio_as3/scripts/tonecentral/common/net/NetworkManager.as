package tonecentral.common.net
{
   import air.net.URLMonitor;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.StatusEvent;
   import flash.net.URLRequest;
   import tonecentral.events.ToneCentralEvents;
   
   public class NetworkManager extends EventDispatcher
   {
      
      private static var instance:NetworkManager;
      
      private var monitor:URLMonitor;
      
      private var lastStatus:Boolean = true;
      
      public function NetworkManager(param1:Blocker, param2:IEventDispatcher = null)
      {
         super(param2);
      }
      
      public static function getInstance() : NetworkManager
      {
         if(instance == null)
         {
            instance = new NetworkManager(new Blocker());
         }
         return instance;
      }
      
      public function monitorStart(param1:String) : void
      {
         this.monitor = new URLMonitor(new URLRequest(param1));
         this.monitor.addEventListener(StatusEvent.STATUS,this.announceStatus,false,0,true);
         this.monitor.available = true;
         this.lastStatus = this.monitor.available;
         this.monitor.start();
      }
      
      private function announceStatus(param1:StatusEvent) : void
      {
         if(this.lastStatus == this.monitor.available)
         {
            return;
         }
         this.lastStatus = this.monitor.available;
         this.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.NET_STATUS_CHANGE));
      }
      
      public function get available() : Boolean
      {
         return this.monitor.available;
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
