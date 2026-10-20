package tonecentral.views.edit.playmenu
{
   import flash.events.MouseEvent;
   import spark.events.PopUpEvent;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.Play;
   import tonecentral.components.popup.Setting;
   import tonecentral.components.popup.ToneCentralPopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class PlayMenuLogic extends ToneCentralViewLogic
   {
      
      private var view:PlayMenu;
      
      private var _mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var select:String = "";
      
      private var openFlag:Boolean = false;
      
      private var currentPopUp:ToneCentralPopup;
      
      private var currentSelectMode:String;
      
      private var player:Play;
      
      public function PlayMenuLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = PlayMenu(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this._mediator = ToneCentralMediator.getInstance();
         this._mediator.sysex.addEventListener(ToneCentralEvents.RUNNING_MODE,this.runningModeChangeHandler,false,0,true);
         this.view.play.addEventListener(MouseEvent.CLICK,this.playMenuClickHandler,false,0,true);
         this.view.setting.addEventListener(MouseEvent.CLICK,this.playMenuClickHandler,false,0,true);
         Context.dialogMng.addEventListener(ToneCentralEvents.SYSTEM_CLOSE,this.systemCloseHandler,false,0,true);
         this.addressMap = AddressMap.getInstance();
         this.player = new Play();
      }
      
      private function systemCloseHandler(param1:ToneCentralEvents) : void
      {
         this.view.setting.selected = false;
         this.select = null;
         this.currentPopUp = null;
      }
      
      private function runningModeChangeHandler(param1:ToneCentralEvents) : void
      {
         if(!this._mediator.connected)
         {
            return;
         }
         var _loc2_:String = ToneCentralMediator.getInstance().runningMode;
         if(_loc2_ == "0")
         {
            if(this.currentPopUp)
            {
               this.currentPopUp.close();
               this.currentPopUp = null;
            }
         }
      }
      
      private function playMenuClickHandler(param1:MouseEvent) : void
      {
         if(this.select == param1.currentTarget.id as String)
         {
            param1.currentTarget.selected = true;
            if(Boolean(this.currentPopUp) && this.currentPopUp.openFlag)
            {
               return;
            }
         }
         this.select = param1.currentTarget.id as String;
         this.openPlayPanel();
      }
      
      private function openPlayPanel() : void
      {
         var _loc1_:Setting = null;
         switch(this.select)
         {
            case "play":
               this.player.popup(Context.dialogMng.parent,true);
               Context.dialogMng.currentPopup = this.player;
               this.currentPopUp = this.player;
               break;
            case "setting":
               _loc1_ = new Setting();
               _loc1_.popup(Context.dialogMng.parent,true);
               Context.dialogMng.currentPopup = _loc1_;
               this.currentPopUp = _loc1_;
         }
         this.currentPopUp.addEventListener(PopUpEvent.CLOSE,this.stayChange,false,0,true);
         this.currentPopUp.addEventListener(ToneCentralEvents.CANCEL,this.popupCancelHandler,false,0,true);
      }
      
      private function popupCancelHandler(param1:ToneCentralEvents) : void
      {
         this.stayChange(null);
         this.currentPopUp = null;
         this.select = null;
      }
      
      private function stayChange(param1:PopUpEvent) : void
      {
         if(!this.currentPopUp)
         {
            return;
         }
         this.currentPopUp.openFlag = false;
         switch(this.select)
         {
            case "play":
               if(!this.player.isPlaying)
               {
                  this.view.play.selected = false;
               }
               break;
            case "setting":
               this.view.setting.selected = false;
         }
         this.currentPopUp = null;
         this.select = null;
      }
   }
}

