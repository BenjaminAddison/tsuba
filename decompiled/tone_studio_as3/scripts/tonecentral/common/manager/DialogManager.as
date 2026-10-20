package tonecentral.common.manager
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import jp.co.site4d.view.popup.PopupContainer;
   import mx.managers.PopUpManager;
   import spark.components.Group;
   import spark.events.PopUpEvent;
   import tonecentral.components.popup.Play;
   import tonecentral.components.popup.Setting;
   import tonecentral.components.popup.ToneCentralPopup;
   import tonecentral.components.popup.Tuner;
   import tonecentral.events.ToneCentralEvents;
   
   public class DialogManager extends EventDispatcher
   {
      
      private var _currentPopup:Group;
      
      public var parent:BOSS_TONE_STUDIO_for_KATANA;
      
      private var _dontAskPatchUpdate:Boolean;
      
      public function DialogManager(param1:IEventDispatcher = null)
      {
         super(param1);
         this.init();
      }
      
      private function init() : void
      {
         this._dontAskPatchUpdate = SharedObjectUtil.get("dontAskPatchUpdate");
      }
      
      public function get currentPopup() : Group
      {
         return this._currentPopup;
      }
      
      public function set currentPopup(param1:Group) : void
      {
         this._currentPopup = param1;
         this._currentPopup.addEventListener(PopUpEvent.CLOSE,this.popupCloseHandler,false,0,true);
      }
      
      public function get dontAskPatchUpdate() : Boolean
      {
         return this._dontAskPatchUpdate;
      }
      
      public function set dontAskPatchUpdate(param1:Boolean) : void
      {
         this._dontAskPatchUpdate = param1;
         SharedObjectUtil.set("dontAskPatchUpdate",param1);
      }
      
      public function show(param1:ToneCentralPopup, param2:Boolean) : void
      {
         if(this._currentPopup)
         {
            this.hide();
         }
         param1.popup(this.parent,param2);
         this._currentPopup = param1;
         this._currentPopup.addEventListener(PopUpEvent.CLOSE,this.popupCloseHandler,false,0,true);
      }
      
      private function popupCloseHandler(param1:Event) : void
      {
         this._currentPopup = null;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CLOSE_POPUP));
      }
      
      public function hide() : void
      {
         if(!this._currentPopup)
         {
            return;
         }
         if(this._currentPopup is Play || this._currentPopup is Tuner || this._currentPopup is Setting)
         {
            if(this._currentPopup is Play)
            {
               Play(this._currentPopup).stop();
            }
            PopupContainer(this._currentPopup).close();
         }
         PopUpManager.removePopUp(this.currentPopup);
         this._currentPopup = null;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CLOSE_POPUP));
      }
      
      public function resize() : void
      {
         if(!this.currentPopup)
         {
            return;
         }
         PopUpManager.centerPopUp(this.currentPopup);
      }
   }
}

