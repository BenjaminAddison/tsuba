package tonecentral.views.main
{
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import jp.co.site4d.ns.develop;
   import mx.events.EffectEvent;
   import spark.effects.Move;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.EnvSetting;
   import tonecentral.common.define.Mode;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class SideAreaContainerLogic extends ToneCentralViewLogic
   {
      
      private var logoOffImg:Class = SideAreaContainerLogic_logoOffImg;
      
      private var logoOnImg:Class = SideAreaContainerLogic_logoOnImg;
      
      private var view:SideAreaContainer;
      
      private var _mode:Mode = Mode.EDITOR;
      
      private var delayTimer:Timer;
      
      private var delayTimer2:Timer;
      
      private var mediator:ToneCentralMediator;
      
      private var appMng:ApplicationManager;
      
      public function SideAreaContainerLogic()
      {
         super();
      }
      
      public function get mode() : Mode
      {
         return this._mode;
      }
      
      public function set mode(param1:Mode) : void
      {
         this._mode = param1;
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = SideAreaContainer(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.view.sideArea.height = this.view.sideAreaGroup.height - 62;
         this.view.tcSlideArea.y = this.view.sideAreaGroup.height - 62;
         this.view.tcSlideArea.height = this.view.sideAreaGroup.height;
         this.view.tcSlideArea.addEventListener(ToneCentralEvents.TONE_CENTRAL_CLICK,this.toneCentralClickHandler,false,0,true);
         this.view.tcButton.addEventListener(MouseEvent.CLICK,this.tcButtonClickHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.MODE_CHANGE,this.editorModeChangeHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.SELECT,this.sideAreaSelectHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.SHOW_INFO,this.showInfoHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.HIDE_INFO,this.hideInfoHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.DRAG_START,this.patchDragStartHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.DRAG_COMPLETE,this.patchDragCompleteHandler,false,0,true);
         this.delayTimer = new Timer(100);
         this.delayTimer.addEventListener(TimerEvent.TIMER,this.modeEndDelayTimerHandler,false,0,true);
         this.delayTimer2 = new Timer(100);
         this.delayTimer2.addEventListener(TimerEvent.TIMER,this.closeTCDelayTimerHandler,false,0,true);
         this.appMng = ApplicationManager.getInstance();
         this.appMng.addEventListener(ToneCentralEvents.CHANGE_DEMO,this.changeDemoHandler,false,0,true);
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.CONNECTED,this.deviceConnectedHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.deviceDisconnectedHandler,false,0,true);
         if(EnvSetting.ns == develop)
         {
            this.view.devBG.visible = true;
            this.view.devLabel.visible = true;
         }
      }
      
      private function changeDemoHandler(param1:ToneCentralEvents) : void
      {
         this.view.devBG.visible = true;
         this.view.devBGColor.color = 9495807;
         this.view.disconnectedLabel.visible = true;
         this.view.devLabel.visible = false;
      }
      
      private function patchDragStartHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_START));
      }
      
      private function patchDragCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_COMPLETE));
      }
      
      public function loadTags() : void
      {
         this.view.tcSlideArea.loadTags();
      }
      
      private function deviceConnectedHandler(param1:ToneCentralEvents) : void
      {
         this.view.logo.source = this.logoOnImg;
         this.view.devBG.visible = false;
         this.view.devBGColor.color = 94399;
         this.view.disconnectedLabel.visible = false;
         if(EnvSetting.ns == develop)
         {
            this.view.devBG.visible = true;
            this.view.devLabel.visible = true;
         }
      }
      
      private function deviceDisconnectedHandler(param1:ToneCentralEvents) : void
      {
         this.view.logo.source = this.logoOffImg;
         this.view.devBG.visible = true;
         this.view.devBGColor.color = 9495807;
         this.view.disconnectedLabel.visible = true;
         this.view.devLabel.visible = false;
      }
      
      private function tcButtonClickHandler(param1:MouseEvent) : void
      {
         this.view.tcSlideArea.y = this.view.tcButton.y;
         this.view.tcButton.visible = false;
         this.view.tcSlideArea.visible = true;
         this.view.tcSlideArea.tagReset();
         this.moveTcSideArea();
      }
      
      private function showInfoHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SHOW_INFO));
      }
      
      private function hideInfoHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.HIDE_INFO));
      }
      
      private function sideAreaSelectHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function editorModeChangeHandler(param1:ToneCentralEvents) : void
      {
         this.closeTcSideArea();
      }
      
      private function toneCentralClickHandler(param1:ToneCentralEvents) : void
      {
         this.moveTcSideArea();
         this.view.sideArea.selectedEditorModeGroup();
      }
      
      private function closeTcSideArea() : void
      {
         var _loc1_:Move = null;
         if(this._mode == Mode.TONE_CENTRAL)
         {
            _loc1_ = new Move();
            _loc1_.target = this.view.tcSlideArea;
            this.view.tcSlideArea.setStyle("top","");
            this.view.tcSlideArea.setStyle("bottom","");
            _loc1_.yBy = this.view.sideAreaGroup.height - 62 - 80;
            _loc1_.addEventListener(EffectEvent.EFFECT_END,this.closeTCMoveEndHandler,false,0,true);
            _loc1_.play();
         }
         else
         {
            this._mode = this.mediator.selectedMode;
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.MODE_CHANGE));
         }
      }
      
      private function closeTCMoveEndHandler(param1:EffectEvent) : void
      {
         this.delayTimer2.start();
      }
      
      private function closeTCDelayTimerHandler(param1:TimerEvent) : void
      {
         this.delayTimer2.reset();
         this.view.tcButton.visible = true;
         this.view.tcSlideArea.visible = false;
         this._mode = this.mediator.selectedMode;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.MODE_CHANGE));
      }
      
      private function moveTcSideArea() : void
      {
         var _loc1_:Move = new Move();
         _loc1_.target = this.view.tcSlideArea;
         this.view.tcSlideArea.setStyle("top","");
         this.view.tcSlideArea.setStyle("bottom","");
         this.view.tcSlideArea.height = this.view.sideAreaGroup.height;
         if(this._mode == Mode.TONE_CENTRAL)
         {
            _loc1_.yBy = this.view.sideAreaGroup.height - 62 - 80;
         }
         else
         {
            _loc1_.yBy = (this.view.sideAreaGroup.height - 62) * -1 + 80;
         }
         _loc1_.addEventListener(EffectEvent.EFFECT_END,this.modeChangeMoveEndHandler,false,0,true);
         _loc1_.play();
      }
      
      private function modeChangeMoveEndHandler(param1:EffectEvent) : void
      {
         this.delayTimer.start();
      }
      
      private function modeEndDelayTimerHandler(param1:TimerEvent) : void
      {
         this.delayTimer.reset();
         if(this._mode == Mode.TONE_CENTRAL)
         {
            this._mode = this.mediator.selectedMode;
            this.view.tcButton.visible = true;
            this.view.tcSlideArea.visible = false;
         }
         else
         {
            this._mode = Mode.TONE_CENTRAL;
            this.view.tcSlideArea.setStyle("top",80);
            this.view.tcSlideArea.setStyle("bottom",0);
            this.view.sideArea.resetEditorModeGroup();
         }
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.MODE_CHANGE));
      }
      
      public function patchCopy() : Vector.<PatchData>
      {
         return this.view.sideArea.patchCopy();
      }
      
      public function patchPaste(param1:Vector.<PatchData>) : void
      {
         this.view.sideArea.patchPaste(param1);
      }
   }
}

