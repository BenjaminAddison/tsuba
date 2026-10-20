package tonecentral.views.library
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import mx.collections.ArrayCollection;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.managers.DragManager;
   import mx.utils.ObjectUtil;
   import spark.events.IndexChangeEvent;
   import spark.events.PopUpEvent;
   import spark.layouts.supportClasses.DropLocation;
   import tonecentral.common.data.LibraryDataSet;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.Definition;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.storage.LiveSetStorageManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.CompletePopup;
   import tonecentral.components.popup.DeletePopup;
   import tonecentral.components.popup.PatchUpdatePopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.KeyboardMediator;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.TemporaryParams;
   
   public class LiveSetLibraryListLogic extends ToneCentralViewLogic implements IEventDispatcher
   {
      
      private var view:LiveSetLibraryList;
      
      private var appMng:ApplicationManager;
      
      private var keyboardMed:KeyboardMediator = KeyboardMediator.getInstance();
      
      private var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      private var _editMode:Boolean;
      
      private var _data:LibraryDataSet;
      
      private var _selected:Boolean = false;
      
      private var liveSetStorageMng:LiveSetStorageManager;
      
      private var insertIndex:int;
      
      private var msg:PatchEditMessage;
      
      private var addressMap:AddressMap;
      
      public var isDroped:Boolean;
      
      public var isDragStart:Boolean;
      
      private var isMoved:Boolean;
      
      private var dropIndex:int;
      
      private var dropedPatchIDList:Array;
      
      private var editMode:Boolean;
      
      private var loadingDelayTimer:Timer = new Timer(300);
      
      private var selectedIndices:Vector.<int>;
      
      private var updateSelectedIndices:Vector.<int>;
      
      private var dropData:Vector.<Object>;
      
      private var MAX_PATCH_NUMBER:int = 400;
      
      private var isOverflow:Boolean;
      
      private var overCount:String = "";
      
      private var itemClickSelectCount:uint;
      
      private var prevSelectedItemId:String = "";
      
      private var prevDropLength:int;
      
      private var moveDraggingList:Vector.<Object>;
      
      private var _1345164648listData:ArrayCollection;
      
      private var dragScrollTimer:Timer = new Timer(100);
      
      private var loadCount:int;
      
      private var isDropPatchLoading:Boolean = false;
      
      private var isUpdatePopup:Boolean = false;
      
      private var isSideDrag:Boolean = false;
      
      private var isTempSending:Boolean;
      
      private var isDropSelf:Boolean;
      
      private var prevSelectedIndex:int;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function LiveSetLibraryListLogic()
      {
         super();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected == param1)
         {
            return;
         }
         this._selected = param1;
         this.view.patchList.selected = this._selected;
         if(this._selected)
         {
            this.view.bgColor.color = 218985;
         }
         else
         {
            this.view.bgColor.color = 4276545;
         }
         this.view.liveSetItem.selected = this._selected;
         if(this._selected)
         {
            this.view.patchList.setFocus();
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
         }
      }
      
      public function get data() : LibraryDataSet
      {
         return this._data;
      }
      
      public function set data(param1:LibraryDataSet) : void
      {
         this._data = param1;
         this.setContents();
      }
      
      public function get selectedItems() : Vector.<Object>
      {
         return this.view.patchList.selectedItems;
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LiveSetLibraryList(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.appMng = ApplicationManager.getInstance();
         this.liveSetStorageMng = LiveSetStorageManager.getInstance();
         this.addressMap = AddressMap.getInstance();
         this.addListener();
         this.setContents();
         this.drawLoading();
         this.drawDragScrollArea();
      }
      
      public function setSelect() : void
      {
         if(this.view.patchList.selectedIndex == -1 && !this.selectedIndices)
         {
            this.view.patchList.selectedIndex = 0;
            this.listItemClickHandler(null);
         }
         this.selected = true;
         this.view.patchList.setFocus();
      }
      
      public function addListener() : void
      {
         this.appMng.addEventListener(ToneCentralEvents.DRAG_START,this.sideDragStartHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.DRAG_COMPLETE,this.dragCompleteHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.UPDATE_CANCEL,this.patchUpdateCancelHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.UPDATE_OK,this.patchUpdateOKHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.LIVESET_DRAG_START,this.livesetDragStartHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.LIVESET_DRAG_END,this.livesetDragEndHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.OVERFLOW_OK,this.overflowOKHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.SELECT,this.areaSelectHandler,false,0,true);
         this.view.liveSetItem.addEventListener(ToneCentralEvents.SELECTED_LIVE_SET,this.selectedLiveSetHandler,false,0,true);
         this.view.liveSetItem.addEventListener(ToneCentralEvents.EDIT_END,this.liveSetItemEditEndHandler,false,0,true);
         this.view.patchList.addEventListener(ToneCentralEvents.LIST_ITEM_CLICK,this.listItemClickHandler,false,0,true);
         this.view.patchList.addEventListener(DragEvent.DRAG_START,this.patchDragStartHandler,false,0,true);
         this.view.patchList.addEventListener(DragEvent.DRAG_DROP,this.patchDropHandler,false,0,true);
         this.view.patchList.addEventListener(DragEvent.DRAG_COMPLETE,this.patchDragCompleteHandler,false,0,true);
         this.view.patchList.addEventListener(DragEvent.DRAG_ENTER,this.patchDragEnterhandler,false,0,true);
         this.view.patchList.addEventListener(ToneCentralEvents.EDIT_START,this.patchEditStartHandler,false,0,true);
         this.view.patchList.addEventListener(ToneCentralEvents.EDIT_END,this.patchEditEndHandler,false,0,true);
         this.view.patchList.addEventListener(ToneCentralEvents.DELETE,this.clickDeleteHandler,false,0,true);
         this.view.patchList.addEventListener(ToneCentralEvents.ITEM_DRAG_DROP,this.patchItemDropHandler,false,0,true);
         this.view.patchList.addEventListener(ToneCentralEvents.ITEM_DRAG_EXIT,this.itemDragExitHandler,false,0,true);
         this.view.patchList.addEventListener(MouseEvent.CLICK,this.patchListClickHandler,false,0,true);
         this.view.patchList.addEventListener(MouseEvent.MOUSE_DOWN,this.patchListMouseDownHandler,false,0,true);
         this.view.patchList.addEventListener(MouseEvent.MOUSE_UP,this.patchListMouseUpHandler,false,0,true);
         this.view.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,false,0,true);
         this.view.patchList.addEventListener(IndexChangeEvent.CHANGE,this.patchListIndexChangeHandler,false,0,true);
         this.view.addEventListener(ResizeEvent.RESIZE,this.resizeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_START,this.setTemporaryStartHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.setTemporaryEndHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_STOP,this.setTemporaryStopHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.LIB_LOADING_MOUSE_UP,this.libLoadingMouseUpHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.view.addEventListener(DragEvent.DRAG_ENTER,this.dragEnterHandler,false,0,true);
         this.view.addEventListener(DragEvent.DRAG_OVER,this.dragOverHandler,false,0,true);
         this.view.addEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler,false,0,true);
         this.view.addEventListener(DragEvent.DRAG_DROP,this.dragDropHandler,false,0,true);
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.prevSelectedIndex = -1;
      }
      
      private function patchListMouseUpHandler(param1:MouseEvent) : void
      {
         this.mediator.isPatchListMouseDown = false;
      }
      
      private function patchListMouseDownHandler(param1:MouseEvent) : void
      {
         this.mediator.isPatchListMouseDown = true;
      }
      
      private function libLoadingMouseUpHandler(param1:ToneCentralEvents) : void
      {
         this.setTemporaryPatch();
      }
      
      private function areaSelectHandler(param1:ToneCentralEvents) : void
      {
         if(param1.data != this.view)
         {
            this.resetSelected();
         }
      }
      
      private function patchListIndexChangeHandler(param1:IndexChangeEvent) : void
      {
         if(this.itemClickSelectCount > 1 && this.view.patchList.selectedIndices.length == 1)
         {
            this.setTemporaryPatch();
         }
      }
      
      private function sideDragStartHandler(param1:ToneCentralEvents) : void
      {
         this.isSideDrag = true;
      }
      
      private function overflowOKHandler(param1:ToneCentralEvents) : void
      {
         this.setPrevSelectedIndices();
      }
      
      private function patchItemDropHandler(param1:ToneCentralEvents) : void
      {
         var _loc3_:PatchUpdatePopup = null;
         if(this.isDragStart)
         {
            this.isDropSelf = true;
         }
         this.dropIndex = param1.data.index;
         this.dropData = param1.data.data;
         var _loc2_:int = 0;
         while(_loc2_ < this.dropData.length)
         {
            this.dropData[_loc2_] = ObjectUtil.clone(this.dropData[_loc2_]);
            _loc2_++;
         }
         if(!this.checkSamePatchUpdate())
         {
            if(!Context.dialogMng.dontAskPatchUpdate)
            {
               this.isUpdatePopup = true;
               _loc3_ = new PatchUpdatePopup();
               _loc3_.setHeaderText("dialog.patch.updateHeader");
               _loc3_.setMsgText("dialog.patch.updateMsg");
               _loc3_.popup(Context.dialogMng.parent,true);
               Context.dialogMng.currentPopup = _loc3_;
               _loc3_.addEventListener(ToneCentralEvents.OK,this.updatePatchHandler,false,0,true);
               _loc3_.addEventListener(ToneCentralEvents.CANCEL,this.updatePatchCancelHandler,false,0,true);
            }
            else
            {
               this.updatePatchHandler(null);
            }
         }
         else
         {
            this.view.callLater(this.setPrevSelectedIndices);
         }
      }
      
      private function itemDragExitHandler(param1:ToneCentralEvents) : void
      {
         this.view.dragShatter.visible = true;
         var _loc2_:Timer = new Timer(10,1);
         _loc2_.addEventListener(TimerEvent.TIMER,this.dragEnterTimerHandler,false,0,true);
         _loc2_.start();
      }
      
      private function dragEnterTimerHandler(param1:TimerEvent) : void
      {
         this.view.dragShatter.visible = false;
      }
      
      private function patchUpdateCancelHandler(param1:ToneCentralEvents) : void
      {
         this.setPrevSelectedIndices();
         this.moveDraggingList = null;
         this.isDragStart = false;
         this.isDropSelf = false;
      }
      
      private function setPrevSelectedIndices() : void
      {
         if(this.selectedIndices)
         {
            this.view.patchList.selectedIndices = this.selectedIndices;
            this.view.patchList.selectedIndex = this.selectedIndices[this.selectedIndices.length - 1];
            this.setTemporaryPatch();
            this.selectedIndices = null;
            this.setSelect();
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.UPDATE_CANCEL));
         }
         else
         {
            this.resetSelected();
         }
      }
      
      private function setSelectedIndices() : void
      {
         if(this.updateSelectedIndices)
         {
            this.view.patchList.selectedIndices = this.updateSelectedIndices;
            this.view.patchList.selectedIndex = this.updateSelectedIndices[this.updateSelectedIndices.length - 1];
         }
         else if(this.selectedIndices)
         {
            this.view.patchList.selectedIndices = this.selectedIndices;
            this.view.patchList.selectedIndex = this.selectedIndices[this.selectedIndices.length - 1];
         }
         this.updateSelectedIndices = null;
         this.selectedIndices = null;
      }
      
      private function patchUpdateOKHandler(param1:ToneCentralEvents) : void
      {
         if(this.moveDraggingList)
         {
            this.removeMovedPatch(this.moveDraggingList);
            this.moveDraggingList = null;
         }
         this.view.callLater(this.setSelectedIndices);
         this.isDragStart = false;
         this.isDropSelf = false;
      }
      
      private function updatePatchHandler(param1:ToneCentralEvents) : void
      {
         var _loc3_:int = 0;
         var _loc4_:PatchData = null;
         var _loc7_:int = 0;
         var _loc8_:Timer = null;
         if(Boolean(param1) && Boolean(param1.data))
         {
            Context.dialogMng.dontAskPatchUpdate = param1.data.dontask;
         }
         var _loc2_:Vector.<int> = new Vector.<int>();
         var _loc5_:Boolean = false;
         this.overCount = "";
         this.mediator.overCount = "";
         this.isOverflow = false;
         var _loc6_:int = this.MAX_PATCH_NUMBER;
         if(this.listData.length > this.MAX_PATCH_NUMBER)
         {
            _loc6_ = this.listData.length;
         }
         if(this.dropIndex + this.dropData.length > _loc6_)
         {
            _loc7_ = _loc6_ - this.dropIndex;
            this.overCount = this.dropData[_loc7_]["orderNumber"];
            if(this.overCount == "0")
            {
               this.overCount = this.dropData[_loc7_]["patchNo"];
            }
            this.mediator.overCount = this.overCount;
         }
         _loc3_ = 0;
         while(_loc3_ < this.dropData.length)
         {
            if(this.listData.length <= this.dropIndex + _loc3_)
            {
               if(this.listData.length < _loc6_)
               {
                  _loc4_ = PatchData.restore(this.dropData[_loc3_]);
                  _loc4_.setNewID();
                  this.listData.addItem(_loc4_);
                  _loc5_ = true;
               }
            }
            else if(this.listData[this.dropIndex + _loc3_].id != this.dropData[_loc3_].id)
            {
               this.listData[this.dropIndex + _loc3_].name = this.dropData[_loc3_].name;
               this.listData[this.dropIndex + _loc3_].note = this.dropData[_loc3_].note;
               this.listData[this.dropIndex + _loc3_].params = TemporaryParams.restore(this.dropData[_loc3_].params);
               this.listData[this.dropIndex + _loc3_].orderNumber = this.dropIndex + _loc3_ + 1;
               this.listData[this.dropIndex + _loc3_].logPatchName = this.dropData[_loc3_].logPatchName;
               this.listData[this.dropIndex + _loc3_].tcPatch = this.dropData[_loc3_].tcPatch;
               this.listData.itemUpdated(this.listData[this.dropIndex + _loc3_]);
            }
            _loc2_.push(this.dropIndex + _loc3_);
            _loc3_++;
         }
         if(_loc5_)
         {
            this.resetPatchOrderNumber();
         }
         this.dropedPatchIDList = [];
         _loc3_ = 0;
         while(_loc3_ < this.dropData.length)
         {
            _loc4_ = PatchData.restore(this.dropData[_loc3_]);
            this.dropedPatchIDList.push({
               "index":this.dropIndex + _loc3_,
               "id":_loc4_.id,
               "no":_loc4_.patchNo
            });
            _loc3_++;
         }
         if(this.overCount != "0" && this.overCount != "")
         {
            _loc8_ = new Timer(100,1);
            _loc8_.addEventListener(TimerEvent.TIMER,this.overflowDialogDelayTimerHandler,false,0,true);
            _loc8_.start();
         }
         this.view.patchList.selectedIndices = _loc2_;
         if(this.isSideDrag)
         {
            this.startLoadDropPatchData(ToneCentralDefinition.SIDE_AREA);
            this.isSideDrag = false;
         }
         else
         {
            this.saveDropData();
         }
         this.selected = true;
         this.mediator.selectedArea = ToneCentralDefinition.CONTENTS_AREA;
         this.appMng.areaSelect(this.view);
         this.appMng.updateOK();
         this.isUpdatePopup = false;
         this.view.callLater(this.view.patchList.setFocus);
      }
      
      private function checkSamePatchUpdate() : Boolean
      {
         var _loc1_:Boolean = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.dropData.length)
         {
            if(this.listData[this.dropIndex + _loc2_].id != this.dropData[_loc2_].id)
            {
               _loc1_ = false;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function updatePatchCancelHandler(param1:ToneCentralEvents) : void
      {
         this.appMng.updateCancel();
         this.isUpdatePopup = false;
      }
      
      private function overflowDialogDelayTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:String = this.overCount;
         if(parseInt(this.overCount) < 10)
         {
            _loc2_ = "0" + this.overCount;
         }
         CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.overflowMsg",_loc2_);
      }
      
      private function overflowOkCallBack() : void
      {
         this.appMng.overflowOK();
      }
      
      private function resetPatchOrderNumber() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.listData.length)
         {
            this.listData[_loc1_].orderNumber = _loc1_ + 1;
            this.listData.itemUpdated(this.listData[_loc1_]);
            _loc1_++;
         }
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:DeletePopup = null;
         if(Boolean(this.editMode) || Boolean(Context.dialogMng.currentPopup) || this.mediator.contentsAreaMode == Mode.EDITOR)
         {
            return;
         }
         if(this._selected)
         {
            if(param1.keyCode == Keyboard.UP)
            {
               if(this.view.patchList.selectedIndex >= 0)
               {
                  this.listItemClickHandler(null);
               }
            }
            else if(param1.keyCode == Keyboard.DOWN)
            {
               if(this.view.patchList.selectedIndex <= this.view.patchList.dataProvider.length - 1)
               {
                  this.listItemClickHandler(null);
               }
            }
         }
         if(param1.keyCode == Keyboard.DELETE || param1.keyCode == Keyboard.BACKSPACE)
         {
            if(this.view.patchList.selectedIndices.length == 0)
            {
               return;
            }
            _loc2_ = new DeletePopup();
            _loc2_.setHeaderText("dialog.patch.deleteHeader");
            if(this.view.patchList.selectedIndices.length == 1)
            {
               _loc2_.setMsgText("dialog.patch.deleteMsg");
            }
            else
            {
               _loc2_.setMsgText("dialog.patch.deleteMultiMsg",this.view.patchList.selectedIndices.length);
            }
            _loc2_.popup(Context.dialogMng.parent,true);
            Context.dialogMng.currentPopup = _loc2_;
            _loc2_.addEventListener(ToneCentralEvents.DELETE,this.deletePatches,false,0,true);
            _loc2_.addEventListener(PopUpEvent.CLOSE,this.deletePopupCloseHandler,false,0,true);
         }
      }
      
      private function deletePopupCloseHandler(param1:PopUpEvent) : void
      {
         if(this._selected)
         {
            this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
         }
      }
      
      private function setPatchlistScrollPosition(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(this.view.patchList.selectedIndex != -1)
         {
            if(this.mediator.hideMemo)
            {
               if(param1)
               {
                  _loc2_ = -30;
               }
               else
               {
                  _loc2_ = 30;
               }
            }
            else if(param1)
            {
               _loc2_ = -76;
            }
            else
            {
               _loc2_ = 76;
            }
            this.view.patchList.scroller.verticalScrollBar.value += _loc2_;
         }
      }
      
      private function deletePatches(param1:ToneCentralEvents) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < this.view.patchList.selectedItems.length)
         {
            _loc2_.push(PatchData(this.view.patchList.selectedItems[_loc3_]).id);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.listData.length)
         {
            _loc4_ = false;
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               if(this.listData[_loc3_].id == _loc2_[_loc5_])
               {
                  this.listData.removeItemAt(_loc3_);
                  _loc4_ = true;
                  break;
               }
               _loc5_++;
            }
            if(!_loc4_)
            {
               _loc3_++;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < this.listData.length)
         {
            this.listData[_loc3_].orderNumber = _loc3_ + 1;
            this.listData.itemUpdated(this.listData[_loc3_]);
            _loc3_++;
         }
         this.setData();
      }
      
      public function removeListener() : void
      {
         this.view.liveSetItem.removeEventListener(ToneCentralEvents.SELECTED_LIVE_SET,this.selectedLiveSetHandler);
         this.view.liveSetItem.removeEventListener(ToneCentralEvents.EDIT_END,this.liveSetItemEditEndHandler);
         this.view.patchList.removeEventListener(ToneCentralEvents.LIST_ITEM_CLICK,this.listItemClickHandler);
         this.view.patchList.removeEventListener(ToneCentralEvents.DRAG_START,this.patchDragStartHandler);
         this.view.patchList.removeEventListener(DragEvent.DRAG_DROP,this.patchDropHandler);
         this.view.patchList.removeEventListener(DragEvent.DRAG_COMPLETE,this.patchDragCompleteHandler);
         this.view.patchList.removeEventListener(DragEvent.DRAG_ENTER,this.patchDragEnterhandler);
         this.view.patchList.removeEventListener(ToneCentralEvents.EDIT_START,this.patchEditStartHandler);
         this.view.patchList.removeEventListener(ToneCentralEvents.EDIT_END,this.patchEditEndHandler);
         this.view.patchList.removeEventListener(ToneCentralEvents.DELETE,this.clickDeleteHandler);
         this.view.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler);
         this.view.removeEventListener(ResizeEvent.RESIZE,this.resizeHandler);
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_TEMPORARY_START,this.setTemporaryStartHandler);
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.setTemporaryEndHandler);
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_TEMPORARY_STOP,this.setTemporaryStopHandler);
      }
      
      private function resizeHandler(param1:ResizeEvent) : void
      {
         this.drawLoading();
      }
      
      private function drawLoading() : void
      {
         this.view.dragShatter.graphics.clear();
         this.view.dragShatter.graphics.beginFill(0,0.01);
         this.view.dragShatter.graphics.drawRect(0,0,this.view.width,this.view.height);
         this.view.dragShatter.graphics.endFill();
      }
      
      private function patchListClickHandler(param1:MouseEvent) : void
      {
         this.listItemClickHandler(null);
      }
      
      private function selectedLiveSetHandler(param1:ToneCentralEvents) : void
      {
         if(this.view.patchList.selectedIndex == -1)
         {
            this.view.patchList.selectedIndex = 0;
         }
         this.listItemClickHandler(null);
      }
      
      private function patchDragStartHandler(param1:DragEvent) : void
      {
         this.isDragStart = true;
         this.selectedIndices = this.view.patchList.selectedIndices;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_START));
         this.showDragScrollArea();
         this.mediator.resetPatchTooltip();
      }
      
      private function showDragScrollArea() : void
      {
         if(this.view.patchList.scroller.verticalScrollBar.value > 0)
         {
            this.view.dragScrollAreaTop.visible = true;
         }
         if(this.view.patchList.scroller.verticalScrollBar.value < this.view.patchList.scroller.verticalScrollBar.maximum)
         {
            this.view.dragScrollAreaBottom.visible = true;
         }
         this.view.dragScrollAreaTop.addEventListener(DragEvent.DRAG_ENTER,this.dragScrollAreaTopDragEnterHandler,false,0,true);
         this.view.dragScrollAreaTop.addEventListener(DragEvent.DRAG_EXIT,this.dragScrollAreaTopDragExitHandler,false,0,true);
         this.view.dragScrollAreaBottom.addEventListener(DragEvent.DRAG_ENTER,this.dragScrollAreaBottomDragEnterHandler,false,0,true);
         this.view.dragScrollAreaBottom.addEventListener(DragEvent.DRAG_EXIT,this.dragScrollAreaBottomDragExitHandler,false,0,true);
      }
      
      private function patchDragEnterhandler(param1:DragEvent) : void
      {
         this.showDragScrollArea();
      }
      
      private function dragCompleteHandler(param1:ToneCentralEvents) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         if(!this.isUpdatePopup)
         {
            this.isSideDrag = false;
            this.isDragStart = false;
            this.isDropSelf = false;
         }
         if(!this.isDroped)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc5_:Boolean = false;
         if(this.listData.length > this.MAX_PATCH_NUMBER && !this.isMoved && Boolean(this.dropedPatchIDList))
         {
            _loc6_ = this.dropedPatchIDList.length - (this.listData.length - this.MAX_PATCH_NUMBER);
            if(_loc6_ < 0)
            {
               _loc6_ = 0;
            }
            while(_loc2_ < this.listData.length)
            {
               _loc5_ = false;
               _loc3_ = _loc6_;
               while(_loc3_ < this.dropedPatchIDList.length)
               {
                  _loc7_ = this.dropedPatchIDList[_loc3_];
                  if(this.listData[_loc2_].id == _loc7_.id)
                  {
                     this.listData.removeItemAt(_loc2_);
                     _loc5_ = true;
                     break;
                  }
                  _loc3_++;
               }
               if(!_loc5_)
               {
                  _loc2_++;
               }
               _loc4_++;
            }
            if(!this.isOverflow)
            {
               _loc8_ = this.overCount;
               if(parseInt(this.overCount) < 10)
               {
                  _loc8_ = "0" + this.overCount;
               }
               CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.overflowMsg",_loc8_);
            }
            this.dropedPatchIDList = this.dropedPatchIDList.slice(0,_loc6_);
         }
         this.resetPatchOrderNumber();
         this.startLoadDropPatchData(param1.data.toString());
         this.setTemporaryPatch();
         this.isMoved = false;
      }
      
      private function checkOverlapIDs() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.listData.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.dropedPatchIDList.length)
            {
               if(this.listData[_loc1_].id == this.dropedPatchIDList[_loc2_].id)
               {
                  this.listData[_loc1_] = PatchData.restore(this.listData[_loc1_]);
                  this.listData[_loc1_].setNewID();
                  break;
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      private function startLoadDropPatchData(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.listData.length)
         {
            if(!(this.listData[_loc2_] is PatchData))
            {
               this.listData[_loc2_] = PatchData.restore(this.listData[_loc2_]);
               PatchData(this.listData[_loc2_]).setNewID();
            }
            _loc2_++;
         }
         if(this.dropedPatchIDList)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listData.length)
            {
               _loc3_ = 0;
               while(_loc3_ < this.dropedPatchIDList.length)
               {
                  if(this.dropedPatchIDList[_loc3_].id == this.listData[_loc2_].id)
                  {
                     this.listData[_loc2_] = PatchData.restore(this.listData[_loc2_]);
                     PatchData(this.listData[_loc2_]).setNewID();
                     PatchData(this.listData[_loc2_]).patchNo = (_loc2_ + 1).toString();
                     break;
                  }
                  _loc3_++;
               }
               _loc2_++;
            }
         }
         if(param1 == ToneCentralDefinition.SIDE_AREA && this.mediator.connected)
         {
            this.mediator.showLoading();
            this.loadCount = 0;
            this.isDropPatchLoading = true;
            this.view.captureImage.visible = false;
            this.hideDragScrollArea();
            this.loadDropPatchData();
         }
         else
         {
            this.view.captureImage.visible = false;
            this.mediator.hideLoading();
            this.saveDropData();
         }
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
         this.view.patchList.scroller.verticalScrollBar.value += 40;
         this.view.dragScrollAreaTop.visible = true;
         if(this.view.patchList.scroller.verticalScrollBar.value >= this.view.patchList.scroller.verticalScrollBar.maximum)
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
         this.view.patchList.scroller.verticalScrollBar.value -= 40;
         this.view.dragScrollAreaBottom.visible = true;
         if(this.view.patchList.scroller.verticalScrollBar.value <= 0)
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
      
      private function clickDeleteHandler(param1:Event) : void
      {
         this.editMode = false;
         var _loc2_:DeletePopup = new DeletePopup();
         _loc2_.setHeaderText("dialog.patch.deleteHeader");
         _loc2_.setMsgText("dialog.patch.deleteMsg");
         _loc2_.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = _loc2_;
         _loc2_.addEventListener(ToneCentralEvents.DELETE,this.deletePatchHandler,false,0,true);
      }
      
      private function deletePatchHandler(param1:ToneCentralEvents) : void
      {
         this.listData.removeItemAt(this.view.patchList.selectedIndex);
         var _loc2_:int = 0;
         while(_loc2_ < this.listData.length)
         {
            this.listData[_loc2_].orderNumber = _loc2_ + 1;
            this.listData.itemUpdated(this.listData[_loc2_]);
            _loc2_++;
         }
         this.setData();
         this.view.patchList.dragEnabled = true;
      }
      
      private function liveSetItemEditEndHandler(param1:ToneCentralEvents) : void
      {
         this.setData();
      }
      
      private function patchEditEndHandler(param1:ToneCentralEvents) : void
      {
         this.editMode = false;
         if(param1.data)
         {
            this.setData();
         }
         this.view.patchList.dragEnabled = true;
      }
      
      private function patchEditStartHandler(param1:Event) : void
      {
         this.editMode = true;
         this.view.patchList.dragEnabled = false;
      }
      
      private function patchDragCompleteHandler(param1:DragEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Vector.<Object> = null;
         var _loc12_:int = 0;
         this.moveDraggingList = null;
         if(!this.isUpdatePopup)
         {
            this.isDragStart = false;
            this.isDropSelf = false;
         }
         this.mediator.setPatchTooltip();
         if(!this.isDroped && param1.action != DragManager.NONE)
         {
            this.view.patchList.selectedIndex = -1;
         }
         var _loc5_:int = 0;
         if(this.isMoved)
         {
            if(this.mediator.isWindows && !param1.ctrlKey || !this.mediator.isWindows && !param1.altKey)
            {
               while(_loc2_ < this.listData.length)
               {
                  _loc4_ = false;
                  _loc3_ = 0;
                  while(_loc3_ < this.dropedPatchIDList.length)
                  {
                     _loc6_ = this.dropedPatchIDList[_loc3_];
                     if(_loc5_ != _loc6_.index && this.listData[_loc2_].id == _loc6_.id)
                     {
                        this.listData.removeItemAt(_loc2_);
                        _loc4_ = true;
                        break;
                     }
                     _loc3_++;
                  }
                  if(!_loc4_)
                  {
                     _loc2_++;
                  }
                  _loc5_++;
               }
            }
            else
            {
               _loc7_ = this.MAX_PATCH_NUMBER;
               if(this.prevDropLength > this.MAX_PATCH_NUMBER)
               {
                  if(this.listData.length > this.MAX_PATCH_NUMBER)
                  {
                     _loc7_ = this.listData.length;
                  }
               }
               if(this.listData.length > _loc7_)
               {
                  _loc8_ = this.listData.length - _loc7_;
                  _loc9_ = this.dropIndex + this.dropedPatchIDList.length - _loc8_;
                  _loc2_ = 0;
                  while(_loc2_ < _loc8_)
                  {
                     if(_loc9_ < this.listData.length)
                     {
                        this.listData.removeItemAt(_loc9_);
                     }
                     else
                     {
                        this.listData.removeItemAt(_loc7_);
                     }
                     _loc2_++;
                  }
                  _loc10_ = this.overCount;
                  if(parseInt(this.overCount) < 10)
                  {
                     _loc10_ = "0" + this.overCount;
                  }
                  CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.overflowMsg",_loc10_);
               }
            }
            _loc2_ = 0;
            while(_loc2_ < this.listData.length)
            {
               if(this.listData[_loc2_].id == _loc6_)
               {
                  this.dropIndex = _loc2_;
                  break;
               }
               _loc2_++;
            }
            _loc6_ = null;
            this.checkOverlapIDs();
            this.resetPatchOrderNumber();
         }
         else
         {
            _loc11_ = param1.dragSource.dataForFormat(param1.dragSource.formats[0]) as Vector.<Object>;
            if(Boolean(!this.isDragStart && param1.altKey && _loc11_ && _loc11_.length > 0) && Boolean(param1.action != DragManager.NONE) && !this.mediator.isOverflow)
            {
               if(this.appMng.isItemDrop)
               {
                  this.moveDraggingList = _loc11_;
               }
               else
               {
                  this.removeMovedPatch(_loc11_);
               }
            }
            else if(this.mediator.isWindows && param1.altKey || !this.mediator.isWindows && param1.ctrlKey)
            {
               if(this.dropIndex > _loc11_[0].orderNumber - 1 + _loc11_.length - 1)
               {
                  this.moveDraggingList = _loc11_;
                  if(this.isDropSelf)
                  {
                     this.updateSelectedIndices = new Vector.<int>();
                     _loc2_ = 0;
                     while(_loc2_ < _loc11_.length)
                     {
                        this.updateSelectedIndices.push(this.dropIndex + _loc2_ - _loc11_.length);
                        _loc2_++;
                     }
                  }
               }
               else if(this.dropIndex + _loc11_.length - 1 < _loc11_[0].orderNumber - 1)
               {
                  this.moveDraggingList = _loc11_;
                  if(this.isDropSelf)
                  {
                     this.updateSelectedIndices = new Vector.<int>();
                     _loc2_ = 0;
                     while(_loc2_ < _loc11_.length)
                     {
                        this.updateSelectedIndices.push(this.dropIndex + _loc2_);
                        _loc2_++;
                     }
                  }
               }
               else
               {
                  _loc12_ = this.dropIndex - (_loc11_[0].orderNumber - 1);
                  this.moveDraggingList = new Vector.<Object>();
                  if(_loc12_ > 0)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < _loc12_)
                     {
                        this.moveDraggingList.push(_loc11_[_loc2_]);
                        _loc2_++;
                     }
                     if(this.isDropSelf)
                     {
                        this.updateSelectedIndices = new Vector.<int>();
                        _loc2_ = 0;
                        while(_loc2_ < _loc11_.length)
                        {
                           this.updateSelectedIndices.push(this.dropIndex + _loc2_ - _loc12_);
                           _loc2_++;
                        }
                     }
                  }
                  else if(_loc12_ < 0)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < _loc12_ * -1)
                     {
                        this.moveDraggingList.push(_loc11_[_loc11_.length - 1 - _loc2_]);
                        _loc2_++;
                     }
                     if(this.isDropSelf)
                     {
                        this.updateSelectedIndices = new Vector.<int>();
                        _loc2_ = 0;
                        while(_loc2_ < _loc11_.length)
                        {
                           this.updateSelectedIndices.push(this.dropIndex + _loc2_);
                           _loc2_++;
                        }
                     }
                  }
               }
            }
            else if(this.isDropSelf)
            {
               this.updateSelectedIndices = new Vector.<int>();
               _loc2_ = 0;
               while(_loc2_ < _loc11_.length)
               {
                  this.updateSelectedIndices.push(this.dropIndex + _loc2_);
                  _loc2_++;
               }
            }
         }
         this.mediator.isOverflow = false;
         this.appMng.isItemDrop = false;
         this.mediator.overCount = "";
         this.appMng.dragComplete(ToneCentralDefinition.CONTENTS_AREA);
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_COMPLETE));
      }
      
      private function removeMovedPatch(param1:Vector.<Object>) : void
      {
         var _loc5_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc2_ < this.listData.length)
         {
            _loc5_ = this.listData[_loc2_];
            if(_loc5_.patchNo == this.mediator.overCount || _loc5_.orderNumber == this.mediator.overCount)
            {
               break;
            }
            _loc3_ = false;
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               if(_loc5_.id == param1[_loc4_].id)
               {
                  this.listData.removeItemAt(_loc2_);
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
            if(!_loc3_)
            {
               _loc2_++;
            }
         }
         this.resetPatchOrderNumber();
         this.saveDropData();
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
      
      private function loadDropPatchData() : void
      {
         var _loc1_:String = null;
         if(this.mediator.isPatchLoading)
         {
            this.mediator.sysex.addEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.willPatchListLoadHandler,false,0,true);
         }
         else if(this.dropedPatchIDList)
         {
            this.mediator.isPatchLoading = true;
            _loc1_ = this.addressMap.getPatchAddress(this.dropedPatchIDList[this.loadCount].no);
            this.mediator.sysex.addEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.dropPatchParamLoadedHandler,false,0,true);
            this.mediator.sysex.getPatchParamsFunc(_loc1_);
         }
      }
      
      private function willPatchListLoadHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.willPatchListLoadHandler);
         this.mediator.isPatchLoading = false;
         this.startLoadDropPatchData(ToneCentralDefinition.SIDE_AREA);
      }
      
      private function dropPatchParamLoadedHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:PatchData = null;
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.dropPatchParamLoadedHandler);
         this.mediator.isPatchLoading = false;
         if(this.dropedPatchIDList[this.loadCount].index < this.listData.length)
         {
            if(this.listData[this.dropedPatchIDList[this.loadCount].index] is PatchData)
            {
               _loc2_ = PatchData(this.listData[this.dropedPatchIDList[this.loadCount].index]);
            }
            else
            {
               _loc2_ = PatchData.restore(this.listData[this.dropedPatchIDList[this.loadCount].index]);
               this.listData[this.dropedPatchIDList[this.loadCount].index] = _loc2_;
            }
            _loc2_.params = this.mediator.sysex.loadedParams;
            _loc2_.orderNumber = this.dropedPatchIDList[this.loadCount].index + 1;
            this.listData.itemUpdated(this.listData[this.dropedPatchIDList[this.loadCount].index]);
            ++this.loadCount;
            if(this.dropedPatchIDList.length > this.loadCount && this.dropedPatchIDList[this.loadCount].index < 400)
            {
               this.loadDropPatchData();
            }
            else
            {
               this.saveDropData();
               this.dropedPatchIDList = null;
               this.isDropPatchLoading = false;
               this.mediator.isPatchLoading = false;
               this.mediator.hideLoading();
            }
         }
         else
         {
            this.dropedPatchIDList = null;
            this.isDropPatchLoading = false;
            this.saveDropData();
            this.mediator.hideLoading();
         }
      }
      
      private function patchDropHandler(param1:DragEvent) : void
      {
         var _loc3_:int = 0;
         var _loc7_:PatchData = null;
         var _loc2_:Vector.<Object> = param1.dragSource.dataForFormat(param1.dragSource.formats[0]) as Vector.<Object>;
         this.isOverflow = false;
         if(!this.isDragStart)
         {
            if(this.listData.length >= this.MAX_PATCH_NUMBER)
            {
               CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.maxPatchesMsg","",this.overflowOkCallBack);
               param1.preventDefault();
               this.view.patchList.layout.hideDropIndicator();
               this.isOverflow = true;
               this.mediator.isOverflow = true;
            }
            else if(this.listData.length + _loc2_.length > this.MAX_PATCH_NUMBER)
            {
               this.overCount = "";
               _loc3_ = this.MAX_PATCH_NUMBER - this.listData.length;
               this.overCount = _loc2_[_loc3_]["orderNumber"];
               if(this.overCount == "0")
               {
                  this.overCount = _loc2_[_loc3_]["patchNo"];
               }
               this.mediator.overCount = this.overCount;
            }
         }
         else if(this.mediator.isWindows && param1.ctrlKey || !this.mediator.isWindows && param1.altKey)
         {
            if(this.listData.length >= this.MAX_PATCH_NUMBER)
            {
               CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.maxPatchesMsg","",this.overflowDialogOkHandler);
               param1.preventDefault();
               this.view.patchList.layout.hideDropIndicator();
               this.isOverflow = true;
               this.mediator.isOverflow = true;
            }
            else if(this.listData.length + _loc2_.length > this.MAX_PATCH_NUMBER)
            {
               this.overCount = "";
               _loc3_ = this.MAX_PATCH_NUMBER - this.listData.length;
               this.overCount = _loc2_[_loc3_]["orderNumber"];
               if(this.overCount == "0")
               {
                  this.overCount = _loc2_[_loc3_]["patchNo"];
               }
               this.mediator.overCount = this.overCount;
            }
         }
         this.selected = true;
         this.isDroped = true;
         var _loc4_:BitmapData = new BitmapData(this.view.width,this.view.height);
         _loc4_.draw(this.view);
         this.view.captureImage.source = _loc4_;
         this.view.captureImage.visible = true;
         var _loc5_:DropLocation = this.view.patchList.layout.calculateDropLocation(param1);
         this.dropIndex = _loc5_.dropIndex;
         if(this.isDragStart)
         {
            this.isMoved = true;
         }
         this.dropedPatchIDList = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc7_ = PatchData.restore(_loc2_[_loc6_]);
            this.dropedPatchIDList.push({
               "index":this.dropIndex + _loc6_,
               "id":_loc7_.id,
               "no":_loc7_.patchNo
            });
            _loc6_++;
         }
         this.isDragStart = false;
         this.isDropSelf = false;
         this.view.patchList.setFocus();
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function overflowDialogOkHandler() : void
      {
         this.appMng.overflowOK();
      }
      
      public function saveDropData() : void
      {
         if(!this.isOverflow)
         {
            this.isDroped = false;
            this.setData();
         }
      }
      
      private function listItemClickHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:PatchData = null;
         this.itemClickSelectCount = this.view.patchList.selectedIndices.length;
         if(this.itemClickSelectCount == 0 && this.view.patchList.selectedIndex != -1)
         {
            this.itemClickSelectCount = 1;
         }
         if(Boolean(param1) && Boolean(param1.data))
         {
            _loc2_ = PatchData(param1.data);
         }
         else if(!param1)
         {
            _loc2_ = this.view.patchList.selectedItem;
         }
         if(Boolean(_loc2_) && this.itemClickSelectCount == 1)
         {
            if(this.listData.length > 0 && this.prevSelectedItemId != _loc2_.id)
            {
               _loc2_ = this.view.patchList.selectedItem as PatchData;
               if(_loc2_)
               {
                  _loc2_.setPatchParamName();
                  if(!param1 || !param1.key)
                  {
                     this.setTemporaryPatch();
                  }
               }
            }
         }
         this.selected = true;
         this.selectedIndices = null;
      }
      
      private function setContents() : void
      {
         if(!this.view.liveSetItem)
         {
            return;
         }
         this.view.liveSetItem.data = this._data.liveSetData;
         this.createItem();
      }
      
      private function createItem() : void
      {
         this.createPatchItems(this.data.patchList);
      }
      
      private function createPatchItems(param1:Vector.<PatchData>) : void
      {
         this.listData = new ArrayCollection();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            param1[_loc2_].orderNumber = _loc2_ + 1;
            this.listData.addItem(param1[_loc2_]);
            _loc2_++;
         }
         this.view.patchList.dataProvider = this.listData;
      }
      
      public function resetSelected() : void
      {
         this.prevSelectedIndex = this.view.patchList.selectedIndex;
         this.selected = false;
         this.view.patchList.selectedIndex = -1;
         this.prevSelectedItemId = "";
         if(!this.isDragStart)
         {
            this.selectedIndices = null;
         }
      }
      
      private function setData() : void
      {
         var _loc2_:PatchData = null;
         this._data.liveSetData = this.view.liveSetItem.data;
         this._data.patchList = new Vector.<PatchData>();
         var _loc1_:int = 0;
         while(_loc1_ < this.listData.length)
         {
            _loc2_ = PatchData.restore(this.listData[_loc1_]);
            _loc2_.liveSetId = this.data.liveSetData.id;
            this._data.patchList.push(_loc2_);
            _loc1_++;
         }
         this.liveSetStorageMng.save(this._data);
      }
      
      private function setTemporaryPatch() : void
      {
         var _loc1_:PatchData = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         if(this.isDropPatchLoading)
         {
            return;
         }
         if(this.view.patchList.selectedItem == undefined)
         {
            return;
         }
         if(this.view.patchList.selectedItem is PatchData)
         {
            _loc1_ = PatchData(this.view.patchList.selectedItem);
         }
         else
         {
            _loc1_ = PatchData.restore(this.view.patchList.selectedItem);
         }
         if(Boolean(_loc1_) && Boolean(_loc1_.params))
         {
            _loc4_ = this.mediator.sysex.temporaryDecimalPatchSize;
            _loc5_ = false;
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               _loc2_ = _loc1_.params.getExData(_loc4_[_loc6_].address,_loc4_[_loc6_].size);
               _loc3_ = this.mediator.sysex.params.temporaryParams.getExData(_loc4_[_loc6_].address,_loc4_[_loc6_].size);
               if(_loc2_ != _loc3_)
               {
                  _loc5_ = true;
               }
               _loc6_++;
            }
            if(_loc5_)
            {
               if(this.mediator.connected)
               {
                  this.isTempSending = this.mediator.sysex.isTempSending;
                  this.mediator.sysex.setTemporaryParams(_loc1_.params);
               }
               else
               {
                  this.mediator.sysex.params.temporaryParams = TemporaryParams.restore(_loc1_.params);
                  this.mediator.sysex.dispatchPatchChange();
               }
               this.prevSelectedItemId = _loc1_.id;
            }
         }
      }
      
      private function setTemporaryStartHandler(param1:ToneCentralEvents) : void
      {
         this.showLoading();
      }
      
      private function setTemporaryEndHandler(param1:ToneCentralEvents) : void
      {
         if(this.isTempSending)
         {
            this.setTemporaryPatch();
         }
         else
         {
            if(this.selected)
            {
               this.mediator.sysex.getTemporaryPatchParamsFunc();
               this.mediator.showLoading();
            }
            this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         }
         this.isTempSending = false;
      }
      
      private function setTemporaryHandler(param1:Event) : void
      {
         this.mediator.sysex.removeEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler);
         this.mediator.hideLoading();
      }
      
      private function setTemporaryStopHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
      }
      
      public function copy() : Vector.<PatchData>
      {
         if(this.editMode)
         {
            return null;
         }
         var _loc1_:Vector.<PatchData> = new Vector.<PatchData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.view.patchList.selectedIndices.length)
         {
            _loc1_.push(this.listData[this.view.patchList.selectedIndices[_loc2_]]);
            _loc2_++;
         }
         _loc1_.reverse();
         return _loc1_;
      }
      
      public function copyAllPatches() : Vector.<PatchData>
      {
         var _loc1_:Vector.<PatchData> = new Vector.<PatchData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.listData.length)
         {
            _loc1_.push(this.listData[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function paste(param1:Vector.<PatchData>, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:PatchData = null;
         var _loc8_:String = null;
         if(this.editMode)
         {
            return;
         }
         if(this.listData.length >= this.MAX_PATCH_NUMBER)
         {
            CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.maxPatchesMsg");
            return;
         }
         this.dropIndex = this.view.patchList.selectedIndex + 1;
         this.dropedPatchIDList = [];
         var _loc4_:Boolean = false;
         var _loc5_:int = this.MAX_PATCH_NUMBER;
         if(this.listData.length > this.MAX_PATCH_NUMBER)
         {
            _loc5_ = this.listData.length;
         }
         if(this.listData.length + param1.length > this.MAX_PATCH_NUMBER)
         {
            _loc6_ = this.MAX_PATCH_NUMBER - this.listData.length;
            this.overCount = param1[_loc6_]["orderNumber"];
            if(this.overCount == "0")
            {
               this.overCount = param1[_loc6_]["patchNo"];
            }
            this.mediator.overCount = this.overCount;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc7_ = param1[_loc3_];
            if(this.listData.length >= _loc5_)
            {
               _loc8_ = this.overCount;
               if(parseInt(this.overCount) < 10)
               {
                  _loc8_ = "0" + this.overCount;
               }
               CompletePopup.showCompleteDialog("dialog.patch.overflowHeader","dialog.patch.overflowMsg",_loc8_);
               this.mediator.hideLoading();
               break;
            }
            this.listData.addItemAt(_loc7_.clone(),this.dropIndex + _loc3_);
            this.resetPatchOrderNumber();
            this.dropedPatchIDList.push({
               "index":this.dropIndex + _loc3_,
               "id":_loc7_.id,
               "no":_loc7_.patchNo
            });
            _loc4_ = true;
            _loc3_++;
         }
         if(_loc4_ && param2 == ToneCentralDefinition.SIDE_AREA)
         {
            if(this.view.patchList.selectedIndex == -1)
            {
               this.view.patchList.selectedIndex = this.dropIndex;
            }
            this.startLoadDropPatchData(ToneCentralDefinition.SIDE_AREA);
         }
         else
         {
            this.saveDropData();
         }
      }
      
      private function shortCutPasteDelayHandler(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.currentTarget as Timer;
         _loc2_.reset();
         _loc2_.removeEventListener(TimerEvent.TIMER,this.shortCutPasteDelayHandler);
         this.setData();
         this.mediator.hideLoading();
      }
      
      public function dragComplete() : void
      {
         this.hideDragScrollArea();
      }
      
      private function showLoading() : void
      {
         this.loadingDelayTimer.addEventListener(TimerEvent.TIMER,this.delayShowLoadingHandler,false,0,true);
         this.loadingDelayTimer.start();
      }
      
      private function delayShowLoadingHandler(param1:TimerEvent) : void
      {
         this.loadingDelayTimer.reset();
         this.mediator.showLoading();
         var _loc2_:Timer = new Timer(3000,1);
         _loc2_.addEventListener(TimerEvent.TIMER,this.timeoutTimerTimeoutHandler,false,0,true);
         _loc2_.start();
      }
      
      private function timeoutTimerTimeoutHandler(param1:TimerEvent) : void
      {
         this.mediator.hideLoading();
      }
      
      private function livesetDragEndHandler(param1:ToneCentralEvents) : void
      {
         this.view.dragShatter.visible = false;
      }
      
      private function livesetDragStartHandler(param1:ToneCentralEvents) : void
      {
         this.view.dragShatter.visible = true;
      }
      
      protected function dragOverHandler(param1:DragEvent) : void
      {
         var _loc2_:Array = param1.dragSource.formats;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] == "liveset")
            {
               this.view.dropLine.visible = true;
               if(0 < param1.localX && param1.localX < 110)
               {
                  this.view.dropLine.x = 1.5;
               }
               else if(111 < param1.localX && param1.localX < 221)
               {
                  this.view.dropLine.x = this.view.width - 1.5;
               }
               else
               {
                  this.view.dropLine.visible = false;
               }
            }
            _loc3_++;
         }
      }
      
      private function dragEnterHandler(param1:DragEvent) : void
      {
         this.prevDropLength = this.view.patchList.dataProvider.length;
         var _loc2_:Array = param1.dragSource.formats;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] == "liveset")
            {
               DragManager.acceptDragDrop(this.view);
               DragManager.showFeedback(DragManager.MOVE);
               this.view.dropLine.visible = true;
               if(0 < param1.localX && param1.localX < 110)
               {
                  this.view.dropLine.x = 1.5;
               }
               else if(111 < param1.localX && param1.localX < 221)
               {
                  this.view.dropLine.x = this.view.width - 1.5;
               }
               else
               {
                  this.view.dropLine.visible = false;
               }
               break;
            }
            _loc3_++;
         }
      }
      
      private function dragExitHandler(param1:DragEvent) : void
      {
         this.view.dropLine.visible = false;
      }
      
      private function dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:Object = param1.dragSource.dataForFormat("liveset");
         this.appMng.livesetDragEnd();
         this.view.dropLine.visible = false;
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LIVESET_DROP);
         _loc3_.data = _loc2_;
         if(this.view.dropLine.x == 1.5)
         {
            _loc3_.dropPos = Definition.DRAG_POS_LEFT;
         }
         else
         {
            _loc3_.dropPos = Definition.DRAG_POS_RIGHT;
         }
         this.view.dispatchEvent(_loc3_);
      }
      
      public function setPrevSelected() : void
      {
         this.view.patchList.selectedIndex = this.prevSelectedIndex;
      }
      
      [Bindable(event="propertyChange")]
      private function get listData() : ArrayCollection
      {
         return this._1345164648listData;
      }
      
      private function set listData(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1345164648listData;
         if(_loc2_ !== param1)
         {
            this._1345164648listData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listData",_loc2_,param1));
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

