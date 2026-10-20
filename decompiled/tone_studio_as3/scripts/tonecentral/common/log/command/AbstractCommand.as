package tonecentral.common.log.command
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.HTTPService;
   import tonecentral.events.ToneCentralEvents;
   
   public class AbstractCommand extends EventDispatcher
   {
      
      private var _service:HTTPService = new HTTPService();
      
      private var _parameters:Object;
      
      public function AbstractCommand(param1:IEventDispatcher = null)
      {
         super(param1);
         this._service.addEventListener(ResultEvent.RESULT,this.resultHandler,false,0,true);
         this._service.addEventListener(FaultEvent.FAULT,this.faultHandler,false,0,true);
         this._service.requestTimeout = 15;
         this._service.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
         this._service.url = this.url;
         this._service.method = "POST";
      }
      
      public function set parameters(param1:Object) : void
      {
         this._parameters = param1;
      }
      
      public function post() : void
      {
         this._service.send(this._parameters);
      }
      
      private function resultHandler(param1:ResultEvent) : void
      {
         var _loc2_:Object = JSON.parse(String(param1.result));
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE);
         _loc3_.data = _loc2_;
         dispatchEvent(_loc3_);
      }
      
      private function faultHandler(param1:FaultEvent) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT);
         _loc2_.data = param1.fault.faultString;
         dispatchEvent(_loc2_);
      }
      
      protected function get url() : String
      {
         return "";
      }
   }
}

