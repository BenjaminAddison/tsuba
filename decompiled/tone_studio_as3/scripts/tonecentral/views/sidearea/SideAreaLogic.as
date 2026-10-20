package tonecentral.views.sidearea
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import jp.co.site4d.ns.develop;
   import mx.collections.ArrayCollection;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.ObjectUtil;
   import spark.events.IndexChangeEvent;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.EnvSetting;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.manager.LogManager;
   import tonecentral.common.manager.TCLiveSetManager;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.CompletePopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.TemporaryParams;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class SideAreaLogic extends ToneCentralViewLogic implements IEventDispatcher
   {
      
      private var view:SideArea;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var _patch_u_list:Object;
      
      private var _patch_p_list:Object;
      
      private var temporaryPrams:TemporaryParams;
      
      private var copyPatches:Vector.<PatchData>;
      
      private var copyIndex:int;
      
      private var pasteIndex:int;
      
      private var pasteStartIndex:int;
      
      private var pasteCounter:int = 0;
      
      private var isShowInfo:Boolean = false;
      
      private var logManager:LogManager;
      
      private var liveSetManager:TCLiveSetManager;
      
      private var patchMapWriteCounter:int;
      
      private var patchWriteTimer:Timer;
      
      private var isPatchMapLoaded:Boolean;
      
      private var isMoved:Boolean;
      
      private var dropIndex:int;
      
      private var dropedPatchIDList:Array;
      
      private var isPatchlistClick:Boolean;
      
      private var _512660250patchlist:ArrayCollection;
      
      private var dragScrollTimer:Timer = new Timer(100);
      
      private var dropDataList:Vector.<Object>;
      
      private var newNameParams:TemporaryParams;
      
      private var newNameIndex:int;
      
      private var isShowPopup:Boolean = false;
      
      private var isApply:Boolean;
      
      private var appMng:ApplicationManager;
      
      private var prevPatchList:Array;
      
      private var listScrollPosition:Number = 0;
      
      private var isShiftKey:Boolean;
      
      private var isCtrlKey:Boolean;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function SideAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = SideArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.appMng = ApplicationManager.getInstance();
         this.logManager = LogManager.getInstance();
         this.liveSetManager = TCLiveSetManager.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex = SystemExclusive.getInstance();
         this.addressMap = AddressMap.getInstance();
         this.mediator.sysex.addEventListener(ToneCentralEvents.GET_PATCH_DATA,this.getPatchDataHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.CONNECTED,this.deviceConnectedHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.deviceDisconnectedHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.PATCH_WRITE_DATASET,this.patchWriteHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.changeCurrentPatchHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.changeCurrentPatchHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_START,this.setTemporaryStartHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.setTemporaryEndHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_STOP,this.setTemporaryStopHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangedHandler,false,0,true);
         this.view.patchlistdata.addEventListener(IndexChangeEvent.CHANGE,this.listItemChangeHandler,false,0,true);
         this.view.libraryPatchList.addEventListener(IndexChangeEvent.CHANGE,this.libraryListItemChangeHandler,false,0,true);
         this.view.libraryPatchList.addEventListener(ToneCentralEvents.DROP,this.patchItemDropHandler,false,0,true);
         this.view.libraryPatchList.addEventListener(DragEvent.DRAG_COMPLETE,this.patchDragComplereHandler,false,0,true);
         this.view.libraryPatchList.addEventListener(DragEvent.DRAG_START,this.patchDragStartHandler,false,0,true);
         this.view.libraryPatchList.addEventListener(DragEvent.DRAG_ENTER,this.patchDragEnterHandler,false,0,true);
         this.view.libraryPatchList.addEventListener(MouseEvent.RIGHT_CLICK,this.rightClickHandler,false,0,true);
         this.view.addEventListener(KeyboardEvent.KEY_DOWN,this.keydownHandler,false,0,true);
         this.view.addEventListener(KeyboardEvent.KEY_UP,this.keyupHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.SELECT,this.areaSelectHandler,false,0,true);
         this.view.editorModeGroup.selectedValue = "editor";
         this.view.editorModeGroup.addEventListener(Event.CHANGE,this.editorModeChangeHandler,false,0,true);
         this.view.infoTitleArea.addEventListener(MouseEvent.CLICK,this.infoTitleClickHandler,false,0,true);
         this.drawDragScrollArea();
      }
      
      private function keydownHandler(param1:KeyboardEvent) : void
      {
         this.isShiftKey = param1.shiftKey;
         this.isCtrlKey = param1.ctrlKey;
      }
      
      private function keyupHandler(param1:KeyboardEvent) : void
      {
         this.isShiftKey = param1.shiftKey;
         this.isCtrlKey = param1.ctrlKey;
      }
      
      private function areaSelectHandler(param1:ToneCentralEvents) : void
      {
         if(param1.data != this.view)
         {
            this.resetSelected();
         }
      }
      
      private function rightClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:TemporaryParams = null;
         var _loc3_:File = null;
         var _loc4_:FileStream = null;
         if(EnvSetting.ns == develop)
         {
            _loc2_ = SystemExclusive.getInstance().params.temporaryParams;
            _loc3_ = File.applicationStorageDirectory.resolvePath("debug/" + _loc2_.patchname + "_temp.txt");
            _loc4_ = new FileStream();
            _loc4_.open(_loc3_,FileMode.WRITE);
            _loc4_.writeUTFBytes(ObjectUtil.toString(_loc2_));
            _loc4_.close();
         }
      }
      
      private function setTemporaryStartHandler(param1:ToneCentralEvents) : void
      {
         this.view.editButton.enabled = false;
         this.view.libraryButton.enabled = false;
         if(this.mediator.selectedArea == ToneCentralDefinition.SIDE_AREA)
         {
            this.mediator.showLoading();
         }
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler);
      }
      
      private function setTemporaryEndHandler(param1:ToneCentralEvents) : void
      {
         this.view.editButton.enabled = true;
         this.view.libraryButton.enabled = true;
         this.mediator.isPatchLoading = false;
         this.mediator.hideLoading();
      }
      
      private function setTemporaryStopHandler(param1:ToneCentralEvents) : void
      {
         this.view.editButton.enabled = true;
         this.view.libraryButton.enabled = true;
         this.mediator.isPatchLoading = false;
         this.mediator.hideLoading();
      }
      
      private function patchWriteHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.getCurrentPatchData,false,0,true);
      }
      
      private function changeCurrentPatchHandler(param1:ToneCentralEvents) : void
      {
         this.view.editButton.enabled = true;
         this.view.libraryButton.enabled = true;
         if(!this.isPatchlistClick)
         {
            this.view.callLater(this.setPatchlistScrollPosition);
         }
         this.view.patchlistdata.selectedIndex = this.mediator.sysex.selectedListIndex;
         this.view.libraryPatchList.selectedIndex = this.mediator.sysex.selectedListIndex;
         if(this.mediator.sysex.selectedListIndex >= 0 && this.mediator.connected)
         {
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
         }
      }
      
      private function patchDragEnterHandler(param1:DragEvent) : void
      {
         this.showDragScrollArea();
      }
      
      private function deviceConnectedHandler(param1:ToneCentralEvents) : void
      {
         this.view.patchlistdata.enabled = true;
         this.view.patchlistdata.mouseEnabled = true;
         this.view.libraryPatchList.enabled = true;
         this.view.libraryPatchList.mouseEnabled = true;
         this.view.patchlistdata.visible = true;
         this.view.libraryPatchList.visible = true;
         this.view.listSeperator.visible = true;
         if(this.mediator.selectedMode == Mode.EDITOR)
         {
            this.view.patchlistdata.enabled = true;
            this.view.patchlistdata.mouseEnabled = true;
            this.view.patchlistdata.visible = true;
            this.view.libraryPatchList.enabled = false;
            this.view.libraryPatchList.mouseEnabled = false;
            this.view.libraryPatchList.visible = false;
            this.view.listSeperator.visible = false;
         }
         else if(this.mediator.selectedMode == Mode.LIBRARY)
         {
            this.view.libraryPatchList.enabled = true;
            this.view.libraryPatchList.mouseEnabled = true;
            this.view.libraryPatchList.visible = true;
            this.view.patchlistdata.enabled = false;
            this.view.patchlistdata.mouseEnabled = false;
            this.view.patchlistdata.visible = false;
            this.view.listSeperator.visible = true;
         }
      }
      
      private function deviceDisconnectedHandler(param1:ToneCentralEvents) : void
      {
      }
      
      private function patchDragStartHandler(param1:DragEvent) : void
      {
         this.showDragScrollArea();
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_START));
         this.appMng.dragStart();
      }
      
      private function patchDragComplereHandler(param1:DragEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc9_:Boolean = false;
         this.listScrollPosition = this.view.libraryPatchList.scroller.verticalScrollBar.value;
         if(this.isMoved)
         {
            _loc3_ = false;
            while(_loc2_ < 5)
            {
               if(this.patchlist[this.patchlist.length - 1 - _loc2_].patchNo != "PANEL")
               {
                  this.patchlist.removeItemAt(this.patchlist.length - 1 - _loc2_);
                  this.patchlist.refresh();
                  this.view.libraryPatchList.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
                  _loc3_ = true;
               }
               else
               {
                  _loc2_++;
               }
            }
            if(!_loc3_)
            {
               _loc4_ = false;
               _loc2_ = 0;
               _loc5_ = 0;
               while(_loc2_ < this.patchlist.length)
               {
                  _loc4_ = false;
                  _loc5_ = 0;
                  while(_loc5_ < this.dropedPatchIDList.length)
                  {
                     _loc7_ = this.dropedPatchIDList[_loc5_];
                     if(this.patchlist[_loc2_].id == _loc7_.id && !_loc7_.removed)
                     {
                        _loc8_ = getQualifiedClassName(this.patchlist[_loc2_]);
                        if(_loc8_.indexOf("PatchData") != -1)
                        {
                           this.patchlist.removeItemAt(_loc2_);
                           _loc4_ = true;
                           this.dropedPatchIDList[_loc5_]["removed"] = true;
                           break;
                        }
                     }
                     _loc5_++;
                  }
                  if(!_loc4_)
                  {
                     _loc2_++;
                  }
                  _loc6_++;
               }
               _loc9_ = false;
               this.dropIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
               _loc2_ = 0;
               while(_loc2_ < this.patchlist.length)
               {
                  _loc8_ = getQualifiedClassName(this.patchlist[_loc2_]);
                  if(_loc8_.indexOf("PatchData") == -1)
                  {
                     if(!_loc9_)
                     {
                        this.dropIndex = _loc2_;
                        _loc9_ = true;
                     }
                     this.patchlist[_loc2_] = PatchData.restore(this.patchlist[_loc2_]);
                     this.patchlist[_loc2_].params = null;
                  }
                  _loc5_ = 0;
                  while(_loc5_ < this.dropedPatchIDList.length)
                  {
                     _loc7_ = this.dropedPatchIDList[_loc5_];
                     if(this.patchlist[_loc2_].id == _loc7_.id)
                     {
                        this.patchlist[_loc2_].patchID = _loc7_.patchID;
                        break;
                     }
                     _loc5_++;
                  }
                  _loc2_++;
               }
               this.patchlist.refresh();
               this.view.patchlistdata.selectedIndex = this.view.libraryPatchList.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
               this.view.callLater(this.setPatchlistScrollPosition);
            }
            else
            {
               this.view.patchlistdata.selectedIndex = this.view.libraryPatchList.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
               this.mediator.hideLoading();
               this.view.callLater(this.setPatchlistScrollPosition);
            }
            this.isMoved = false;
         }
         else
         {
            this.appMng.dragComplete(ToneCentralDefinition.SIDE_AREA);
            this.view.callLater(this.setPatchlistScrollPosition);
         }
         this.hideDragScrollArea();
         this.view.captureImage.visible = false;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_COMPLETE));
         this.view.callLater(this.setPatchlistScrollPosition);
      }
      
      private function patchChangedHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
      }
      
      private function patchItemDropHandler(param1:ToneCentralEvents) : void
      {
         var _loc4_:int = 0;
         var _loc5_:PatchData = null;
         var _loc6_:int = 0;
         this.mediator.showLoading();
         this.pasteStartIndex = param1.data.index;
         this.pasteIndex = param1.data.index;
         this.pasteCounter = 0;
         var _loc2_:Vector.<Object> = param1.data.data;
         this.copyPatches = new Vector.<PatchData>();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc3_] as PatchData;
            if(_loc5_)
            {
               this.copyPatches.push(_loc5_.clone());
            }
            _loc3_++;
         }
         if(ToneCentralMediator.getInstance().ampModel == 0)
         {
            _loc4_ = 5;
         }
         else
         {
            _loc4_ = 9;
         }
         if(this.pasteIndex + this.copyPatches.length > _loc4_)
         {
            _loc6_ = _loc4_ - this.pasteIndex;
            this.mediator.overCount = _loc2_[_loc6_]["orderNumber"];
         }
         this.pasteDropItem();
      }
      
      private function pasteDropItem() : void
      {
         if(this.copyPatches.length > 0)
         {
            this.doPaste();
         }
         else
         {
            this.mediator.hideLoading();
         }
      }
      
      private function getPatchDataHandler(param1:ToneCentralEvents) : void
      {
         if(this.view.patchlistdata.selectedIndex < 0)
         {
            this.view.patchlistdata.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
            this.view.libraryPatchList.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
         }
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.getCurrentPatchData);
         this.setNewPatchName(param1.data as TemporaryParams,this.view.patchlistdata.selectedIndex);
      }
      
      private function getCurrentPatchData(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.getCurrentPatchData);
         this.setNewPatchName(this.mediator.sysex.params.temporaryParams,this.mediator.sysex.params.temporaryParams.currentPatchNo);
      }
      
      private function setNewPatchName(param1:TemporaryParams, param2:int) : void
      {
         if(param2 > 400)
         {
            return;
         }
         this.newNameParams = param1;
         this.newNameIndex = param2;
         this.view.patchlistdata.selectedIndex = this.newNameIndex;
         this.view.libraryPatchList.selectedIndex = this.newNameIndex;
         var _loc3_:int = this.view.patchlistdata.selectedIndex;
         if(this.patchlist)
         {
            this.patchlist[_loc3_].name = this.newNameParams.patchname;
            this.patchlist[_loc3_].params = this.newNameParams;
            this.patchlist.itemUpdated(this.patchlist[_loc3_]);
         }
         if(!this.isPatchlistClick)
         {
            this.view.callLater(this.setPatchlistScrollPosition);
         }
         this.isPatchlistClick = false;
      }
      
      public function setEditorPatchList() : void
      {
         this.setListData();
         this.view.callLater(this.setPatchlistScrollPosition);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_LIST_RECEIVED,this.patchListReceiveHandler,false,0,true);
         this.view.patchlistdata.visible = true;
         this.view.listSeperator.visible = false;
         this.view.patchlistdata.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
         this.listItemChangeHandler(null);
      }
      
      private function patchListReceiveHandler(param1:Event) : void
      {
         this.setListData();
      }
      
      private function setListData() : void
      {
         this.listScrollPosition = this.view.patchlistdata.scroller.verticalScrollBar.value;
         this.patchlist = this.mediator.sysex.params.patchlistParams;
         this.view.patchlistdata.dataProvider = this.patchlist;
         this.view.libraryPatchList.dataProvider = this.patchlist;
         this.view.patchlistdata.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
         this.view.libraryPatchList.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
         this.view.patchlistdata.setFocus();
         this.view.callLater(this.setPatchlistScrollPosition);
      }
      
      private function setPatchlistScrollPosition() : void
      {
         if(this.view.patchlistdata.selectedIndex != -1)
         {
            this.view.patchlistdata.scroller.verticalScrollBar.value = this.listScrollPosition;
            this.view.libraryPatchList.scroller.verticalScrollBar.value = this.listScrollPosition;
         }
      }
      
      public function infoLoadComplete(param1:int) : void
      {
         if(param1 > 0)
         {
            this.view.infoCountLabel.text = param1.toString();
            this.view.infoCountLabel.visible = true;
            this.view.infoTitleArea.visible = true;
            this.drawInfoTitleArea();
            this.view.newsLable.styleName = "infoTitleLabel";
            this.view.newsIcon.alpha = 1;
         }
         else
         {
            this.view.newsLable.styleName = "infoTitleLabelCountZERO";
            this.view.newsIcon.alpha = 0.5;
            this.view.infoCountLabel.visible = false;
            this.view.infoTitleArea.visible = false;
         }
      }
      
      private function infoTitleClickHandler(param1:MouseEvent) : void
      {
         if(this.isShowInfo)
         {
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.HIDE_INFO));
            this.isShowInfo = false;
         }
         else
         {
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SHOW_INFO));
            this.isShowInfo = true;
         }
      }
      
      private function drawInfoTitleArea() : void
      {
         var _loc1_:Graphics = this.view.infoTitleArea.graphics;
         _loc1_.lineStyle();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.width,30);
         _loc1_.endFill();
         _loc1_.beginFill(15938863);
         _loc1_.lineStyle(1,16777215);
         _loc1_.drawRoundRect(this.view.width - 45,8.5,35,15,15,15);
         _loc1_.endFill();
      }
      
      private function editorModeChangeHandler(param1:Event) : void
      {
         if(this.view.editorModeGroup.selectedValue == "editor")
         {
            this.mediator.selectedMode = Mode.EDITOR;
            this.view.patchlistdata.enabled = true;
            this.view.patchlistdata.mouseEnabled = true;
            this.view.patchlistdata.visible = true;
            this.view.libraryPatchList.visible = false;
            this.view.listSeperator.visible = false;
            this.view.patchlistdata.includeInLayout = true;
            this.view.libraryPatchList.includeInLayout = false;
            this.view.patchlistdata.scroller.verticalScrollBar.value = this.view.libraryPatchList.scroller.verticalScrollBar.value;
            if(this.mediator.connected)
            {
               this.view.patchlistdata.setFocus();
               this.view.patchlistdata.selectedIndex = this.mediator.sysex.params.temporaryParams.currentPatchNo;
            }
         }
         else
         {
            this.mediator.selectedMode = Mode.LIBRARY;
            this.view.patchlistdata.visible = false;
            this.view.libraryPatchList.visible = true;
            this.view.listSeperator.visible = true;
            this.view.patchlistdata.includeInLayout = false;
            this.view.libraryPatchList.includeInLayout = true;
            this.view.libraryPatchList.enabled = true;
            this.view.libraryPatchList.scroller.verticalScrollBar.value = this.view.patchlistdata.scroller.verticalScrollBar.value;
            this.view.libraryPatchList.setFocus();
         }
         this.mediator.sysex.temporaryAllUpdate = false;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.MODE_CHANGE));
      }
      
      private function displayPatchList(param1:ToneCentralEvents) : void
      {
         var _loc2_:int = this.mediator.sysex.params.temporaryParams.currentPatchNo;
         if(_loc2_ > -1)
         {
            this.patchlist.itemUpdated(this.patchlist[_loc2_]);
            if(this.mediator.selectedMode == Mode.EDITOR || this.mediator.selectedArea == ToneCentralDefinition.SIDE_AREA)
            {
               this.view.patchlistdata.selectedIndex = _loc2_;
               this.view.libraryPatchList.selectedIndex = _loc2_;
               this.mediator.selectedPatchIndex = _loc2_;
               this.view.callLater(this.setPatchlistScrollPosition);
            }
         }
         this.temporaryPrams = param1.data as TemporaryParams;
      }
      
      private function listItemChangeHandler(param1:IndexChangeEvent) : void
      {
         this.isPatchlistClick = true;
         var _loc2_:int = this.view.patchlistdata.selectedIndex;
         if(this.mediator.sysex.params.temporaryParams.currentPatchNo != _loc2_)
         {
            if(this.mediator.connected)
            {
               this.mediator.selectedPatchIndex = _loc2_;
               this.mediator.sysex.getSelectedPatchListParamsFunc(_loc2_);
            }
            else
            {
               this.mediator.sysex.params.temporaryParams = this.view.patchlistdata.selectedItem.params;
               this.mediator.sysex.selectedListIndex = _loc2_;
               this.mediator.sysex.params.temporaryParams.currentPatchNo = _loc2_;
               this.view.libraryPatchList.selectedIndex = this.view.patchlistdata.selectedIndex;
               this.mediator.sysex.dispatchPatchChange();
            }
         }
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function libraryListItemChangeHandler(param1:IndexChangeEvent) : void
      {
         var _loc3_:String = null;
         this.isPatchlistClick = true;
         if(this.view.libraryPatchList.selectedIndices.length > 1 && (this.isShiftKey || this.isCtrlKey))
         {
            return;
         }
         var _loc2_:int = this.view.libraryPatchList.selectedIndex;
         if(this.mediator.sysex.params.temporaryParams.currentPatchNo != _loc2_)
         {
            if(this.mediator.connected)
            {
               this.mediator.selectedPatchIndex = _loc2_;
               this.mediator.sysex.getSelectedPatchListParamsFunc(_loc2_);
            }
            else
            {
               this.mediator.sysex.params.temporaryParams = this.view.libraryPatchList.selectedItem.params;
               this.mediator.sysex.selectedListIndex = _loc2_;
               this.mediator.sysex.params.temporaryParams.currentPatchNo = _loc2_;
               this.view.patchlistdata.selectedIndex = this.view.libraryPatchList.selectedIndex;
               this.mediator.sysex.dispatchPatchChange();
            }
         }
         else if(this.view.libraryPatchList.selectedItem.params)
         {
            if(this.mediator.connected)
            {
               this.mediator.sysex.setTemporaryParams(this.view.libraryPatchList.selectedItem.params);
            }
            else
            {
               this.mediator.isPatchLoading = true;
               this.mediator.sysex.params.temporaryParams.currentPatchNo = _loc2_;
               this.mediator.sysex.params.temporaryParams = this.view.libraryPatchList.selectedItem.params;
               this.mediator.sysex.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY));
               this.view.patchlistdata.selectedIndex = this.view.libraryPatchList.selectedIndex;
            }
         }
         else
         {
            _loc3_ = this.addressMap.getPatchAddress(String(this.view.libraryPatchList.selectedItem.patchNo));
            this.mediator.sysex.addEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.patchParamLoadedHandler,false,0,true);
            this.mediator.sysex.getPatchParamsFunc(_loc3_);
         }
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function patchParamLoadedHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:PatchData = null;
         this.mediator.isPatchLoading = true;
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.patchParamLoadedHandler);
         if(!this.view.libraryPatchList.selectedItem)
         {
            this.mediator.sysex.setTemporaryParams(this.mediator.sysex.loadedParams);
            return;
         }
         if(this.view.libraryPatchList.selectedItem is PatchData)
         {
            _loc2_ = PatchData(this.view.libraryPatchList.selectedItem);
         }
         else
         {
            _loc2_ = PatchData.restore(this.view.libraryPatchList.selectedItem);
         }
         _loc2_.params = this.mediator.sysex.loadedParams;
         this.mediator.sysex.setTemporaryParams(this.view.libraryPatchList.selectedItem.params);
      }
      
      public function patchCopy() : Vector.<PatchData>
      {
         var _loc1_:Vector.<PatchData> = new Vector.<PatchData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.view.libraryPatchList.selectedIndices.length)
         {
            _loc1_.push(this.patchlist[this.view.libraryPatchList.selectedIndices[_loc2_]]);
            _loc2_++;
         }
         _loc1_.reverse();
         return _loc1_;
      }
      
      public function patchPaste(param1:Vector.<PatchData>) : void
      {
         if(!param1 || this.isShowPopup || this.mediator.isShowLoading)
         {
            return;
         }
         this.pasteCounter = 0;
         this.pasteIndex = this.view.libraryPatchList.selectedIndex;
         this.pasteStartIndex = this.pasteIndex;
         this.copyPatches = param1;
         if(this.copyPatches.length > 0)
         {
            this.mediator.showLoading();
            this.doPaste();
         }
      }
      
      public function applyLiveset(param1:Vector.<PatchData>) : void
      {
         this.pasteCounter = 0;
         this.pasteIndex = 1;
         this.pasteStartIndex = this.pasteIndex;
         this.copyPatches = param1;
         if(this.copyPatches.length > 0)
         {
            this.isApply = true;
            this.mediator.showLoading();
            this.doPaste();
         }
      }
      
      private function doPaste() : void
      {
         var _loc1_:String = null;
         _loc1_ = "10," + ToneCentralUtil.convertHexaDecimal(String(this.pasteIndex),2) + ",00,00";
         var _loc2_:PatchData = this.copyPatches[this.pasteCounter];
         _loc2_.setPatchParamName();
         if(_loc2_.tcPatch)
         {
            this.logManager.logPatchUse(_loc2_.logPatchName);
         }
         _loc2_.patchNo = this.patchlist[this.pasteIndex].patchNo;
         _loc2_.patchID = this.patchlist[this.pasteIndex].patchID;
         _loc2_.logPatchName = null;
         _loc2_.tcPatch = false;
         this.patchlist[this.pasteIndex] = _loc2_;
         this.patchlist.itemUpdated(this.patchlist[this.pasteIndex]);
         this.mediator.sysex.setPatchParams(_loc2_.params,_loc1_);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_PATCH_PARAMS_END,this.setPatchPramsEndHandler,false,0,true);
         ++this.pasteCounter;
         ++this.pasteIndex;
      }
      
      private function setPatchPramsEndHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:int = 0;
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_PATCH_PARAMS_END,this.setPatchPramsEndHandler);
         if(this.copyPatches.length == this.pasteCounter || this.pasteCounter == ParameterDefinitionGT.MAX_PATCH_NUMBER)
         {
            _loc2_ = this.mediator.sysex.params.temporaryParams.currentPatchNo;
            if(this.copyPatches.length > _loc2_ || this.copyPatches.length == 1 && this.pasteIndex - 1 == _loc2_ && this.pasteIndex - 2 < ParameterDefinitionGT.MAX_PATCH_NUMBER)
            {
               this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.pastePatchSetTemporaryEndHandler,false,0,true);
               if(this.patchlist[_loc2_].params)
               {
                  this.mediator.sysex.setTemporaryParams(this.patchlist[_loc2_].params);
               }
               else
               {
                  if(this.isApply)
                  {
                     this.applyEnd();
                  }
                  this.mediator.hideLoading();
               }
            }
            else
            {
               if(this.isApply)
               {
                  this.applyEnd();
               }
               this.mediator.hideLoading();
            }
         }
         else if(this.copyPatches.length > 0 && this.pasteIndex <= ParameterDefinitionGT.MAX_PATCH_NUMBER)
         {
            this.doPaste();
         }
         else
         {
            this.mediator.hideLoading();
         }
      }
      
      private function pastePatchSetTemporaryEndHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.pastePatchSetTemporaryEndHandler);
         this.applyEnd();
         this.mediator.hideLoading();
      }
      
      private function applyEnd() : void
      {
         if(this.isApply)
         {
            this.isApply = false;
            this.isShowPopup = true;
            this.mediator.hideLoading();
            CompletePopup.showCompleteDialog("dialog.applyLiveset.complete.header","dialog.applyLiveset.complete.msg");
            Context.dialogMng.addEventListener(ToneCentralEvents.CLOSE_POPUP,this.closePasteCompletePopupHandler,false,0,true);
         }
      }
      
      private function pasteEndTimerHandler(param1:TimerEvent) : void
      {
         this.view.libraryPatchList.selectedIndex = this.pasteStartIndex;
         this.libraryListItemChangeHandler(null);
      }
      
      private function closePasteCompletePopupHandler(param1:ToneCentralEvents) : void
      {
         Context.dialogMng.removeEventListener(ToneCentralEvents.CLOSE_POPUP,this.closePasteCompletePopupHandler);
         this.isShowPopup = false;
      }
      
      public function infoHide() : void
      {
         this.isShowInfo = false;
      }
      
      public function resetSelected() : void
      {
         this.view.patchlistdata.selectedIndex = -1;
         this.view.libraryPatchList.selectedIndex = -1;
      }
      
      private function showDragScrollArea() : void
      {
         if(this.view.libraryPatchList.scroller.verticalScrollBar.value > 0)
         {
            this.view.dragScrollAreaTop.visible = true;
         }
         if(this.view.libraryPatchList.scroller.verticalScrollBar.value < this.view.libraryPatchList.scroller.verticalScrollBar.maximum)
         {
            this.view.dragScrollAreaBottom.visible = true;
         }
         this.view.dragScrollAreaTop.addEventListener(DragEvent.DRAG_ENTER,this.dragScrollAreaTopDragEnterHandler,false,0,true);
         this.view.dragScrollAreaTop.addEventListener(DragEvent.DRAG_EXIT,this.dragScrollAreaTopDragExitHandler,false,0,true);
         this.view.dragScrollAreaBottom.addEventListener(DragEvent.DRAG_ENTER,this.dragScrollAreaBottomDragEnterHandler,false,0,true);
         this.view.dragScrollAreaBottom.addEventListener(DragEvent.DRAG_EXIT,this.dragScrollAreaBottomDragExitHandler,false,0,true);
      }
      
      private function hideDragScrollArea() : void
      {
         this.view.dragScrollAreaBottom.removeEventListener(DragEvent.DRAG_ENTER,this.dragScrollAreaBottomDragEnterHandler);
         this.view.dragScrollAreaBottom.removeEventListener(DragEvent.DRAG_EXIT,this.dragScrollAreaBottomDragExitHandler);
         this.view.dragScrollAreaTop.removeEventListener(DragEvent.DRAG_ENTER,this.dragScrollAreaTopDragEnterHandler);
         this.view.dragScrollAreaTop.removeEventListener(DragEvent.DRAG_EXIT,this.dragScrollAreaTopDragExitHandler);
         this.view.dragScrollAreaBottom.visible = false;
         this.view.dragScrollAreaTop.visible = false;
      }
      
      private function dragScrollAreaBottomDragExitHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollBottomHandler);
         this.dragScrollTimer.reset();
      }
      
      private function dragScrollAreaBottomDragEnterHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.addEventListener(TimerEvent.TIMER,this.dragScrollBottomHandler,false,0,true);
         this.dragScrollTimer.start();
      }
      
      private function dragScrollBottomHandler(param1:TimerEvent) : void
      {
         this.view.libraryPatchList.scroller.verticalScrollBar.value += 40;
         this.view.dragScrollAreaTop.visible = true;
         if(this.view.libraryPatchList.scroller.verticalScrollBar.value >= this.view.libraryPatchList.scroller.verticalScrollBar.maximum)
         {
            this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollBottomHandler);
            this.dragScrollTimer.reset();
            this.view.dragScrollAreaBottom.visible = false;
         }
      }
      
      private function dragScrollAreaTopDragExitHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollTopHandler);
         this.dragScrollTimer.reset();
      }
      
      private function dragScrollAreaTopDragEnterHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.addEventListener(TimerEvent.TIMER,this.dragScrollTopHandler,false,0,true);
         this.dragScrollTimer.start();
      }
      
      private function dragScrollTopHandler(param1:TimerEvent) : void
      {
         this.view.libraryPatchList.scroller.verticalScrollBar.value -= 40;
         this.view.dragScrollAreaBottom.visible = true;
         if(this.view.libraryPatchList.scroller.verticalScrollBar.value <= 0)
         {
            this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollTopHandler);
            this.dragScrollTimer.reset();
            this.view.dragScrollAreaTop.visible = false;
         }
      }
      
      private function drawDragScrollArea() : void
      {
         var _loc1_:Graphics = this.view.dragScrollAreaTop.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.dragScrollAreaTop.width,this.view.dragScrollAreaTop.height);
         _loc1_.endFill();
         _loc1_ = this.view.dragScrollAreaBottom.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.dragScrollAreaBottom.width,this.view.dragScrollAreaBottom.height);
         _loc1_.endFill();
      }
      
      public function contentsAreaDragComplete() : void
      {
         this.hideDragScrollArea();
      }
      
      [Bindable(event="propertyChange")]
      private function get patchlist() : ArrayCollection
      {
         return this._512660250patchlist;
      }
      
      private function set patchlist(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._512660250patchlist;
         if(_loc2_ !== param1)
         {
            this._512660250patchlist = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"patchlist",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}

