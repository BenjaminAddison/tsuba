package tonecentral.views.edit.ctl
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.events.ResizeEvent;
   import tonecentral.common.define.CTLDefinitionGT;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.util.CTLParameterUtil;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class CTLListLogic extends ViewLogic
   {
      
      private static var GAP:int = 10;
      
      private var view:CTLList;
      
      private var mediator:ToneCentralMediator;
      
      private var createCount:int;
      
      private var ctlList:Array;
      
      private var ctlParameterGroupDic:Object = new Object();
      
      private var isInit:Boolean = true;
      
      public function CTLListLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = CTLList(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.viewStatusChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         this.view.ctlList.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandler,false,0,true);
         this.view.scroller.horizontalScrollBar.addEventListener(Event.CHANGE,this.changeHorizontalScrollBarHandler,false,0,true);
         this.view.addEventListener(ResizeEvent.RESIZE,this.resizeHandler,false,0,true);
         this.view.addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler,false,0,true);
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.view.callLater(this.updateView);
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         this.view.callLater(this.updateView);
      }
      
      private function resizeHandler(param1:ResizeEvent) : void
      {
         this.view.callLater(this.changeHorizontalScrollBar);
      }
      
      private function changeHorizontalScrollBarHandler(param1:Event) : void
      {
         this.changeHorizontalScrollBar();
      }
      
      private function changeHorizontalScrollBar() : void
      {
         this.view.ctlTitleArea.x = this.view.scroller.viewport.horizontalScrollPosition * -1;
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         param1.delta *= 80;
      }
      
      public function changeMode() : void
      {
         this.viewStatusChangeHandler(null);
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.updateView();
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.updateView();
      }
      
      private function viewStatusChangeHandler(param1:ViewStatusEvent) : void
      {
         if(this.mediator.currentViewStatus == ToneCentralDefinition.CTL_LIST && this.mediator.selectedMode == Mode.EDITOR && this.mediator.contentsAreaMode != Mode.TONE_CENTRAL)
         {
            if(this.isInit)
            {
               this.createView();
               this.isInit = false;
            }
            else
            {
               this.updateView();
            }
            this.addListner();
         }
         else
         {
            this.removeListner();
         }
      }
      
      private function addListner() : void
      {
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
      }
      
      private function removeListner() : void
      {
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler);
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler);
      }
      
      private function createView() : void
      {
         this.mediator.showLoading();
         if(ToneCentralMediator.getInstance().ampModel == 0)
         {
            this.ctlList = CTLDefinitionGT.CTL_NAME_50.filter(CTLParameterUtil.deviseFilter);
         }
         else
         {
            this.ctlList = CTLDefinitionGT.CTL_NAME.filter(CTLParameterUtil.deviseFilter);
         }
         this.createCount = 0;
         this.view.addEventListener(Event.ENTER_FRAME,this.createCtlGroupHandler,false,0,true);
      }
      
      private function createCtlGroupHandler(param1:Event) : void
      {
         var _loc2_:CTLAbstractGroup = null;
         var _loc3_:CTLTitle = null;
         var _loc4_:String = null;
         if(this.createCount == this.ctlList.length)
         {
            this.createCount = 0;
            this.view.removeEventListener(Event.ENTER_FRAME,this.createCtlGroupHandler);
            this.mediator.hideLoading();
         }
         else
         {
            switch(this.ctlList[this.createCount].name)
            {
               case CTLDefinitionGT.KNOB:
                  _loc2_ = new CTLKnobGroup();
                  _loc2_.x = 0;
                  break;
               case CTLDefinitionGT.EXP_PEDAL:
                  _loc2_ = new CTLPedalGroup();
                  _loc2_.x = 120;
                  break;
               case CTLDefinitionGT.EXP_PEDAL_MIN:
                  _loc2_ = new CTLPedalRangeGroup();
                  _loc2_.x = 225;
                  break;
               case CTLDefinitionGT.EXP_PEDAL_MAX:
                  _loc2_ = new CTLPedalRangeGroup();
                  _loc2_.x = 330;
                  break;
               case CTLDefinitionGT.GAFC_EXP1:
                  _loc2_ = new CTLPedalGroup();
                  _loc2_.x = 450;
                  break;
               case CTLDefinitionGT.GAFC_EXP1_MIN:
                  _loc2_ = new CTLPedalRangeGroup();
                  _loc2_.x = 555;
                  break;
               case CTLDefinitionGT.GAFC_EXP1_MAX:
                  _loc2_ = new CTLPedalRangeGroup();
                  _loc2_.x = 660;
                  break;
               case CTLDefinitionGT.GAFC_EXP2:
                  _loc2_ = new CTLPedalGroup();
                  _loc2_.x = 780;
                  break;
               case CTLDefinitionGT.GAFC_EXP2_MIN:
                  _loc2_ = new CTLPedalRangeGroup();
                  _loc2_.x = 885;
                  break;
               case CTLDefinitionGT.GAFC_EXP2_MAX:
                  _loc2_ = new CTLPedalRangeGroup();
                  _loc2_.x = 990;
            }
            _loc2_.init(this.ctlList[this.createCount].name);
            this.ctlParameterGroupDic[this.ctlList[this.createCount].name] = _loc2_;
            this.view.ctlList.addElement(_loc2_);
            _loc3_ = new CTLTitle();
            _loc4_ = "";
            switch(this.ctlList[this.createCount].name)
            {
               case CTLDefinitionGT.KNOB:
                  _loc4_ = "KNOBS";
                  _loc3_.init(_loc4_);
                  _loc3_.width = _loc2_.width;
                  _loc3_.x = _loc2_.x;
                  this.view.ctlTitleArea.addElement(_loc3_);
                  break;
               case CTLDefinitionGT.EXP_PEDAL:
                  _loc3_.init(this.ctlList[this.createCount].name);
                  _loc3_.width = _loc2_.width;
                  _loc3_.x = _loc2_.x;
                  this.view.ctlTitleArea.addElement(_loc3_);
                  break;
               case CTLDefinitionGT.GAFC_EXP1:
                  _loc4_ = "GA-FC EXP1 (VOLUME)";
                  _loc3_.init(_loc4_);
                  _loc3_.width = _loc2_.width + 50;
                  _loc3_.x = _loc2_.x;
                  this.view.ctlTitleArea.addElement(_loc3_);
                  break;
               case CTLDefinitionGT.GAFC_EXP2:
                  _loc4_ = "GA-FC EXP2 (FX)";
                  _loc3_.init(_loc4_);
                  _loc3_.width = _loc2_.width + 20;
                  _loc3_.x = _loc2_.x;
                  this.view.ctlTitleArea.addElement(_loc3_);
                  break;
               case CTLDefinitionGT.EXP_PEDAL_MIN:
               case CTLDefinitionGT.GAFC_EXP1_MIN:
               case CTLDefinitionGT.GAFC_EXP2_MIN:
                  _loc4_ = "MIN";
                  _loc3_.init(_loc4_);
                  _loc3_.width = _loc2_.width;
                  _loc3_.x = _loc2_.x + 20;
                  this.view.ctlTitleArea.addElement(_loc3_);
                  break;
               case CTLDefinitionGT.EXP_PEDAL_MAX:
               case CTLDefinitionGT.GAFC_EXP1_MAX:
               case CTLDefinitionGT.GAFC_EXP2_MAX:
                  _loc4_ = "MAX";
                  _loc3_.init(_loc4_);
                  _loc3_.width = _loc2_.width;
                  _loc3_.x = _loc2_.x + 20;
                  this.view.ctlTitleArea.addElement(_loc3_);
                  break;
               default:
                  _loc4_ = "";
            }
            ++this.createCount;
         }
      }
      
      private function updateView() : void
      {
         var _loc1_:CTLAbstractGroup = null;
         for each(_loc1_ in this.ctlParameterGroupDic)
         {
            _loc1_.updateView();
         }
      }
   }
}

