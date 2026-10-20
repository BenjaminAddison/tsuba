package tonecentral.views.main
{
   import mx.events.StateChangeEvent;
   import tonecentral.common.define.Mode;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ContentsAreaContainerLogic extends ToneCentralViewLogic
   {
      
      private var view:ContentsAreaContainer;
      
      private var _mode:Mode;
      
      private var mediator:ToneCentralMediator;
      
      public function ContentsAreaContainerLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = ContentsAreaContainer(param1);
      }
      
      public function set mode(param1:Mode) : void
      {
         this._mode = param1;
         this.view.currentState = this._mode.mode;
         if(this.view.libContentsArea)
         {
            if(this._mode == Mode.LIBRARY)
            {
               this.view.libContentsArea.setPrevSelected();
            }
            else
            {
               this.view.libContentsArea.resetSelected();
            }
         }
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.CONNECTED,this.deviceConnectedHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.deviceDisconnectedHandler,false,0,true);
         this.view.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.stateChangeHandler,false,0,true);
      }
      
      private function notConnectedModalDeviceSettingHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DEVICE_SETTING));
      }
      
      private function stateChangeHandler(param1:StateChangeEvent) : void
      {
         if(this.view.currentState == "library")
         {
            this.view.libContentsArea.addEventListener(ToneCentralEvents.SELECT,this.libContentsAreaSelectedHandler,false,0,true);
            this.view.libContentsArea.addEventListener(ToneCentralEvents.UNSELECT,this.libContentsAreaUnselectedHandler,false,0,true);
            this.view.libContentsArea.addEventListener(ToneCentralEvents.APPLY_LIVESET,this.applyLivesetHandler,false,0,true);
            this.view.libContentsArea.addEventListener(ToneCentralEvents.DRAG_COMPLETE,this.libContentsAreaDragCompleteHandler,false,0,true);
         }
      }
      
      private function libContentsAreaDragCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_COMPLETE));
      }
      
      private function applyLivesetHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.APPLY_LIVESET);
         _loc2_.data = this.view.libContentsArea.copyAllPatches();
         this.view.dispatchEvent(_loc2_);
      }
      
      private function libContentsAreaUnselectedHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.UNSELECT));
      }
      
      private function libContentsAreaSelectedHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      public function sidePatchDragComplete() : void
      {
         this.view.libContentsArea.sidePatchDragComlete();
      }
      
      public function sidePatchDragStart() : void
      {
         this.view.libContentsArea.sidePatchDragStart();
      }
      
      private function deviceDisconnectedHandler(param1:ToneCentralEvents) : void
      {
      }
      
      private function deviceConnectedHandler(param1:ToneCentralEvents) : void
      {
      }
   }
}

