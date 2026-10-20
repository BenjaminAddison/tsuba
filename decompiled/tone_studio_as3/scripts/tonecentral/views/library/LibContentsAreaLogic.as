package tonecentral.views.library
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.FileFilter;
   import flash.utils.Timer;
   import flash.utils.unescapeMultiByte;
   import mx.effects.Sequence;
   import mx.events.DragEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.resources.ResourceManager;
   import spark.effects.Fade;
   import spark.effects.Resize;
   import tonecentral.common.data.LibraryDataSet;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.Definition;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.manager.TCLiveSetManager;
   import tonecentral.common.storage.LiveSetStorageManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.CompletePopup;
   import tonecentral.components.popup.ConfirmPopup;
   import tonecentral.components.popup.DeletePopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.TemporaryParams;
   
   public class LibContentsAreaLogic extends ToneCentralViewLogic
   {
      
      private var view:LibContentsArea;
      
      private var currentList:LiveSetLibraryList;
      
      private var liveSetListArray:Vector.<LiveSetLibraryList>;
      
      private var editMode:Boolean = false;
      
      private var liveSetStorageMng:LiveSetStorageManager;
      
      private var liveSetManager:TCLiveSetManager;
      
      private var prevFilePath:String;
      
      private var mediator:ToneCentralMediator;
      
      private var restoreCounter:int = 0;
      
      private var iniRestoreTimer:Timer = new Timer(300);
      
      private var saveLiveSet:Array;
      
      private var dragScrollTimer:Timer = new Timer(100);
      
      private var backupLoadAddress:String;
      
      private var backupLibData:LibraryDataSet;
      
      private var timeoutTimer:Timer = new Timer(3000);
      
      private var retryCount:int = 0;
      
      private var memoChangeCount:int;
      
      private var appMng:ApplicationManager;
      
      private var deletedIndex:int = 0;
      
      public function LibContentsAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LibContentsArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.liveSetManager = TCLiveSetManager.getInstance();
         this.liveSetManager.restoreAllLiveSet();
         this.appMng = ApplicationManager.getInstance();
         this.appMng.addEventListener(ToneCentralEvents.LIVESET_DRAG_START,this.livesetDragStartHandler,false,0,true);
         this.appMng.addEventListener(ToneCentralEvents.LIVESET_DRAG_END,this.livesetDragEndHandler,false,0,true);
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.CONNECTED,this.connectedHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.disConnectedHandler,false,0,true);
         this.liveSetListArray = new Vector.<LiveSetLibraryList>();
         this.view.newButton.addEventListener(MouseEvent.CLICK,this.newButtonClickHandler,false,0,true);
         this.view.exportButton.addEventListener(MouseEvent.CLICK,this.exportButtonClickHandler,false,0,true);
         this.view.importButton.addEventListener(MouseEvent.CLICK,this.importButtonClickHandler,false,0,true);
         this.view.backupButton.addEventListener(MouseEvent.CLICK,this.backupButtonClickHandler,false,0,true);
         this.view.hideMemo.addEventListener(MouseEvent.CLICK,this.hideMemoChangeHandler,false,0,true);
         this.view.applyLivesetButton.addEventListener(MouseEvent.CLICK,this.applyLivesetButtonClickHandler,false,0,true);
         this.view.newButton.addEventListener(FocusEvent.FOCUS_IN,this.buttonFocusInHandler,false,0,true);
         this.view.exportButton.addEventListener(FocusEvent.FOCUS_IN,this.buttonFocusInHandler,false,0,true);
         this.view.importButton.addEventListener(FocusEvent.FOCUS_IN,this.buttonFocusInHandler,false,0,true);
         this.view.backupButton.addEventListener(FocusEvent.FOCUS_IN,this.buttonFocusInHandler,false,0,true);
         this.view.applyLivesetButton.addEventListener(FocusEvent.FOCUS_IN,this.buttonFocusInHandler,false,0,true);
         this.liveSetStorageMng = LiveSetStorageManager.getInstance();
         this.saveLiveSet = this.liveSetStorageMng.find();
         this.mediator.showLoading();
         this.iniRestoreTimer.addEventListener(TimerEvent.TIMER,this.initRestoreTimerHandler,false,0,true);
         this.iniRestoreTimer.start();
         this.changeEnableButton();
         if(this.mediator.isInitInstall)
         {
            this.createNewLiveSet();
         }
         this.mediator.addEventListener(ToneCentralEvents.CHANGE_VISIBLE_MEMO,this.changeVisibleMemoHandler,false,0,true);
      }
      
      private function buttonFocusInHandler(param1:FocusEvent) : void
      {
         this.view.setFocus();
      }
      
      private function livesetDragStartHandler(param1:ToneCentralEvents) : void
      {
         this.showDragScrollArea();
      }
      
      private function livesetDragEndHandler(param1:ToneCentralEvents) : void
      {
         this.hideDragScrollArea();
      }
      
      private function changeVisibleMemoHandler(param1:ToneCentralEvents) : void
      {
         this.memoChangeCount = 0;
         this.view.addEventListener(Event.ENTER_FRAME,this.changeVisibleMemo,false,0,true);
      }
      
      private function changeVisibleMemo(param1:Event) : void
      {
         if(this.memoChangeCount == this.view.liveSetListContainer.numElements)
         {
            this.memoChangeCount = 0;
            this.view.removeEventListener(Event.ENTER_FRAME,this.changeVisibleMemo);
         }
         else
         {
            LiveSetLibraryList(this.view.liveSetListContainer.getElementAt(this.memoChangeCount)).patchList.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_VISIBLE_MEMO));
            ++this.memoChangeCount;
         }
      }
      
      private function hideMemoChangeHandler(param1:MouseEvent) : void
      {
         this.mediator.hideMemo = this.view.hideMemo.selected;
         if(this.mediator.hideMemo)
         {
            this.view.hideMemo.label = "Show Memo";
         }
         else
         {
            this.view.hideMemo.label = "Hide Memo";
         }
      }
      
      private function connectedHandler(param1:ToneCentralEvents) : void
      {
         this.changeEnableButton();
      }
      
      private function disConnectedHandler(param1:ToneCentralEvents) : void
      {
         this.changeEnableButton();
      }
      
      private function changeEnableButton() : void
      {
         if(this.mediator.connected)
         {
            this.view.backupButton.enabled = true;
            if(this.currentList)
            {
               this.view.applyLivesetButton.enabled = true;
               this.view.exportButton.enabled = true;
            }
            else
            {
               this.view.applyLivesetButton.enabled = false;
               this.view.exportButton.enabled = false;
            }
         }
         else
         {
            this.view.backupButton.enabled = false;
            this.view.applyLivesetButton.enabled = false;
            if(this.currentList)
            {
               this.view.exportButton.enabled = true;
            }
            else
            {
               this.view.exportButton.enabled = false;
            }
         }
      }
      
      override protected function onShow() : void
      {
         if(ToneCentralMediator.getInstance().selectedArea == ToneCentralDefinition.SIDE_AREA)
         {
            this.resetSelected();
         }
         this.liveSetManager.restoreAllLiveSet();
         var _loc1_:Array = this.liveSetStorageMng.find();
         this.restoreLiveSet(_loc1_);
      }
      
      private function initRestoreTimerHandler(param1:TimerEvent) : void
      {
         this.iniRestoreTimer.reset();
         this.createInitList();
      }
      
      private function createInitList() : void
      {
         if(this.saveLiveSet.length == this.restoreCounter)
         {
            this.mediator.hideLoading();
            return;
         }
         var _loc1_:LiveSetLibraryList = this.createList(this.saveLiveSet[this.restoreCounter]);
         _loc1_.addEventListener(FlexEvent.CREATION_COMPLETE,this.listCreationCompleteHandler,false,0,true);
         ++this.restoreCounter;
      }
      
      private function listCreationCompleteHandler(param1:FlexEvent) : void
      {
         this.createInitList();
      }
      
      private function restoreLiveSet(param1:Array) : void
      {
         var _loc3_:LibraryDataSet = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = LibraryDataSet(param1[_loc2_]);
            _loc4_ = false;
            _loc5_ = 0;
            while(_loc5_ < this.liveSetListArray.length)
            {
               if(_loc3_.liveSetData.id == this.liveSetListArray[_loc5_].data.liveSetData.id)
               {
                  _loc4_ = true;
                  break;
               }
               _loc5_++;
            }
            if(!_loc4_)
            {
               this.createList(param1[_loc2_]);
            }
            _loc2_++;
         }
      }
      
      public function resetSelected() : void
      {
         if(this.currentList)
         {
            this.currentList.resetSelected();
            this.currentList = null;
            this.changeEnableButton();
         }
      }
      
      private function importButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:File = null;
         if(this.prevFilePath)
         {
            _loc2_ = new File(this.prevFilePath);
         }
         else
         {
            _loc2_ = File.desktopDirectory;
         }
         _loc2_.browseForOpen(ResourceManager.getInstance().getString("resource","dialog.import.complete.header"),[new FileFilter("TSL","*.tsl")]);
         _loc2_.addEventListener(Event.SELECT,this.liveSetSelectCompleteHandler,false,0,true);
      }
      
      private function liveSetSelectCompleteHandler(param1:Event) : void
      {
         var _loc2_:File = param1.currentTarget as File;
         this.importLivset(_loc2_);
      }
      
      private function importLivset(param1:File, param2:Boolean = true) : void
      {
         var stream:FileStream;
         var dataString:String;
         var liveSetObj:Object = null;
         var fileName:String = null;
         var importData:LibraryDataSet = null;
         var file:File = param1;
         var showComplete:Boolean = param2;
         if(!file.exists)
         {
            return;
         }
         this.setPrevFilePath(file);
         stream = new FileStream();
         stream.open(file,FileMode.READ);
         dataString = stream.readUTFBytes(stream.bytesAvailable);
         stream.close();
         try
         {
            liveSetObj = JSON.parse(dataString);
         }
         catch(err:Error)
         {
            CompletePopup.showCompleteDialog("dialog.import.complete.header","dialog.import.failure.msg");
            return;
         }
         if(liveSetObj.device == ToneCentralDefinition.DEVICE_NAME)
         {
            fileName = file.name.split(".")[0];
            if(!this.checkHalfChar(fileName))
            {
               liveSetObj.liveSetData.name = fileName;
            }
            importData = LibraryDataSet.importData(liveSetObj);
            importData.setNewId();
            importData.liveSetData.orderNumber = 0;
            this.createList(importData);
            if(showComplete)
            {
               CompletePopup.showCompleteDialog("dialog.import.complete.header","dialog.import.complete.msg");
            }
         }
         else if(showComplete)
         {
            CompletePopup.showCompleteDialog("dialog.import.complete.header","dialog.import.failure.msg");
         }
      }
      
      private function checkHalfChar(param1:String) : Boolean
      {
         return this.checkCode(param1,0,127) && this.checkCode(param1,65377,65439) ? true : false;
      }
      
      private function checkCode(param1:String, param2:int, param3:int) : Boolean
      {
         var _loc6_:int = 0;
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = param1.substr(_loc5_,1).charCodeAt(0);
            if(_loc6_ < param2 || _loc6_ > param3)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      private function exportButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:File = null;
         if(!this.currentList)
         {
            return;
         }
         if(this.prevFilePath)
         {
            _loc2_ = new File(this.prevFilePath + this.getCurrentLiveSetName());
         }
         else
         {
            _loc2_ = new File(File.desktopDirectory.url + "/" + this.getCurrentLiveSetName());
         }
         var _loc3_:Boolean = false;
         if(this.mediator.isWindows)
         {
            if(_loc2_.nativePath.length >= 260)
            {
               _loc3_ = true;
            }
         }
         else if(_loc2_.name.length > 255)
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            CompletePopup.showCompleteDialog("dialog.export.complete.header","dialog.export.nameover.msg");
            return;
         }
         _loc2_.addEventListener(Event.SELECT,this.saveFileSelectHandler,false,0,true);
         _loc2_.browseForSave(ResourceManager.getInstance().getString("resource","dialog.export.complete.header"));
      }
      
      private function getCurrentLiveSetName() : String
      {
         var _loc1_:String = this.currentList.data.liveSetData.name.replace("/","_").replace("\\","_");
         return escape(_loc1_) + ".tsl";
      }
      
      private function setPrevFilePath(param1:File) : void
      {
         this.prevFilePath = unescapeMultiByte(param1.url).replace(unescape(param1.name),"");
      }
      
      private function saveFileSelectHandler(param1:Event) : void
      {
         var _loc2_:File = param1.currentTarget as File;
         this.setPrevFilePath(_loc2_);
         var _loc3_:RegExp = /.*\.tsl$/;
         if(_loc2_.name.search(_loc3_) == -1)
         {
            _loc2_.url += ".tsl";
         }
         var _loc4_:String = JSON.stringify(this.currentList.data);
         _loc4_ = _loc4_.replace(" | ","");
         var _loc5_:FileStream = new FileStream();
         _loc5_.open(_loc2_,FileMode.WRITE);
         _loc5_.writeUTFBytes(_loc4_);
         _loc5_.close();
         CompletePopup.showCompleteDialog("dialog.export.complete.header","dialog.export.complete.msg");
      }
      
      public function patchCopy() : Vector.<PatchData>
      {
         var _loc1_:Vector.<PatchData> = null;
         if(this.currentList)
         {
            _loc1_ = this.currentList.copy();
         }
         return _loc1_;
      }
      
      public function patchPaste(param1:Vector.<PatchData>, param2:String) : void
      {
         if(Boolean(this.currentList) && Boolean(param1))
         {
            this.currentList.paste(param1,param2);
         }
      }
      
      private function newButtonClickHandler(param1:MouseEvent) : void
      {
         this.createNewLiveSet();
         CompletePopup.showCompleteDialog("dialog.createLiveset.complete.header","dialog.createLiveset.complete.msg");
         this.view.liveSetListScrollerGroup.horizontalScrollPosition = 0;
      }
      
      private function createNewLiveSet() : void
      {
         var _loc1_:LibraryDataSet = new LibraryDataSet();
         this.createList(_loc1_);
      }
      
      private function createList(param1:LibraryDataSet) : LiveSetLibraryList
      {
         if(param1.liveSetData.orderNumber == 0)
         {
            param1.liveSetData.orderNumber = this.view.liveSetListContainer.numElements + 1;
         }
         var _loc2_:LiveSetLibraryList = new LiveSetLibraryList();
         _loc2_.data = param1;
         this.view.liveSetListContainer.addElementAt(_loc2_,0);
         this.liveSetListArray.push(_loc2_);
         _loc2_.addEventListener(ToneCentralEvents.SELECT,this.listSelectHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.UNSELECT,this.listUnSelectHandler,false,0,true);
         _loc2_.liveSetItem.addEventListener(ToneCentralEvents.DELETE,this.clickDeleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.DRAG_COMPLETE,this.listDragCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.DRAG_START,this.listDragStartHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LIVESET_DROP,this.livesetDropHandler,false,0,true);
         var _loc3_:Object = this.liveSetStorageMng.findById(param1.liveSetData.id);
         if(!_loc3_)
         {
            this.liveSetStorageMng.save(param1);
         }
         return _loc2_;
      }
      
      private function livesetDropHandler(param1:ToneCentralEvents) : void
      {
         var _loc3_:LiveSetLibraryList = null;
         var _loc5_:int = 0;
         var _loc2_:LiveSetLibraryList = param1.currentTarget as LiveSetLibraryList;
         var _loc4_:Object = param1.data;
         _loc5_ = 0;
         while(_loc5_ < this.liveSetListArray.length)
         {
            if(this.liveSetListArray[_loc5_].data.liveSetData.id == _loc4_.value.id)
            {
               _loc3_ = this.liveSetListArray[_loc5_];
               break;
            }
            _loc5_++;
         }
         var _loc6_:int = this.view.liveSetListContainer.getElementIndex(_loc2_);
         if(_loc2_.logic.data.liveSetData.orderNumber == _loc3_.logic.data.liveSetData.orderNumber)
         {
            return;
         }
         if(_loc2_.logic.data.liveSetData.orderNumber > _loc3_.logic.data.liveSetData.orderNumber)
         {
            if(param1.dropPos == Definition.DRAG_POS_RIGHT)
            {
               _loc6_ += 1;
            }
         }
         else if(param1.dropPos == Definition.DRAG_POS_LEFT)
         {
            _loc6_--;
         }
         this.view.liveSetListContainer.setElementIndex(_loc3_,_loc6_);
         this.resetLivesetOrderNumber();
      }
      
      private function resetLivesetOrderNumber() : void
      {
         var _loc3_:LibraryDataSet = null;
         this.liveSetListArray = new Vector.<LiveSetLibraryList>();
         var _loc1_:int = this.view.liveSetListContainer.numElements;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.liveSetListArray.push(this.view.liveSetListContainer.getElementAt(_loc2_));
            _loc3_ = this.liveSetListArray[_loc2_].data;
            _loc3_.liveSetData.orderNumber = _loc1_ - _loc2_;
            this.liveSetStorageMng.saveListsetOrder(_loc3_);
            _loc2_++;
         }
      }
      
      private function listDragStartHandler(param1:ToneCentralEvents) : void
      {
         this.showDragScrollArea();
         var _loc2_:int = 0;
         while(_loc2_ < this.liveSetListArray.length)
         {
            if(this.liveSetListArray[_loc2_] != param1.currentTarget)
            {
               this.liveSetListArray[_loc2_].resetSelected();
            }
            else
            {
               this.liveSetListArray[_loc2_].setSelect();
            }
            _loc2_++;
         }
      }
      
      private function showDragScrollArea() : void
      {
         this.view.dragScrollAreaRight.visible = true;
         var _loc1_:Graphics = this.view.dragScrollAreaRight.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.dragScrollAreaRight.width,this.view.dragScrollAreaRight.height);
         _loc1_.endFill();
         _loc1_ = this.view.dragScrollAreaLeft.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.dragScrollAreaLeft.width,this.view.dragScrollAreaLeft.height);
         _loc1_.endFill();
         this.view.dragScrollAreaRight.addEventListener(DragEvent.DRAG_ENTER,this.dragScrollRightDragEnterHandler,false,0,true);
         this.view.dragScrollAreaRight.addEventListener(DragEvent.DRAG_EXIT,this.dragScrollRightDragExitHandler,false,0,true);
         this.view.dragScrollAreaLeft.addEventListener(DragEvent.DRAG_ENTER,this.dragScrollLeftDragEnterHandler,false,0,true);
         this.view.dragScrollAreaLeft.addEventListener(DragEvent.DRAG_EXIT,this.dragScrollLeftDragExitHandler,false,0,true);
         if(this.view.liveSetListScroller.horizontalScrollBar.value > 0)
         {
            this.view.dragScrollAreaLeft.visible = true;
         }
      }
      
      private function dragScrollLeftDragExitHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollLeftHandler);
         this.dragScrollTimer.reset();
      }
      
      private function dragScrollLeftDragEnterHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.addEventListener(TimerEvent.TIMER,this.dragScrollLeftHandler,false,0,true);
         this.dragScrollTimer.start();
      }
      
      private function dragScrollLeftHandler(param1:TimerEvent) : void
      {
         this.view.liveSetListScroller.horizontalScrollBar.value -= 40;
         this.view.dragScrollAreaRight.visible = true;
         if(this.view.liveSetListScroller.horizontalScrollBar.value <= 0)
         {
            this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollLeftHandler);
            this.dragScrollTimer.reset();
            this.view.dragScrollAreaLeft.visible = false;
         }
      }
      
      private function dragScrollRightDragExitHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollRightHandler);
         this.dragScrollTimer.reset();
      }
      
      private function dragScrollRightDragEnterHandler(param1:DragEvent) : void
      {
         this.dragScrollTimer.addEventListener(TimerEvent.TIMER,this.dragScrollRightHandler,false,0,true);
         this.dragScrollTimer.start();
      }
      
      private function dragScrollRightHandler(param1:TimerEvent) : void
      {
         this.view.liveSetListScroller.horizontalScrollBar.value += 40;
         this.view.dragScrollAreaLeft.visible = true;
         if(this.view.liveSetListScroller.horizontalScrollBar.maximum <= this.view.liveSetListScroller.horizontalScrollBar.value)
         {
            this.dragScrollTimer.removeEventListener(TimerEvent.TIMER,this.dragScrollRightHandler);
            this.dragScrollTimer.reset();
            this.view.dragScrollAreaRight.visible = false;
         }
      }
      
      private function listDragCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.sidePatchDragComplete();
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DRAG_COMPLETE));
      }
      
      private function hideDragScrollArea() : void
      {
         this.view.dragScrollAreaRight.removeEventListener(DragEvent.DRAG_ENTER,this.dragScrollRightDragEnterHandler);
         this.view.dragScrollAreaRight.removeEventListener(DragEvent.DRAG_EXIT,this.dragScrollRightDragExitHandler);
         this.view.dragScrollAreaLeft.removeEventListener(DragEvent.DRAG_ENTER,this.dragScrollRightDragEnterHandler);
         this.view.dragScrollAreaLeft.removeEventListener(DragEvent.DRAG_EXIT,this.dragScrollRightDragExitHandler);
         this.view.dragScrollAreaLeft.visible = false;
         this.view.dragScrollAreaRight.visible = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.liveSetListArray.length)
         {
            this.liveSetListArray[_loc1_].dragComplete();
            _loc1_++;
         }
      }
      
      public function sidePatchDragStart() : void
      {
         this.showDragScrollArea();
      }
      
      public function sidePatchDragComplete() : void
      {
         var _loc1_:Timer = new Timer(50);
         _loc1_.addEventListener(TimerEvent.TIMER,this.sidePatchDragCompleteDelayHandler,false,0,true);
         _loc1_.start();
      }
      
      private function sidePatchDragCompleteDelayHandler(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.currentTarget as Timer;
         _loc2_.removeEventListener(TimerEvent.TIMER,this.sidePatchDragCompleteDelayHandler);
         _loc2_.reset();
         this.hideDragScrollArea();
      }
      
      private function clickDeleteHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:DeletePopup = new DeletePopup();
         _loc2_.setHeaderText("dialog.liveset.deleteHeader");
         _loc2_.setMsgText("dialog.liveset.deleteMsg");
         _loc2_.popup(Context.dialogMng.parent,true);
         _loc2_.target = param1.currentTarget.parent as LiveSetLibraryList;
         Context.dialogMng.currentPopup = _loc2_;
         _loc2_.addEventListener(ToneCentralEvents.DELETE,this.deleteListHandler,false,0,true);
      }
      
      private function deleteListHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:LiveSetLibraryList = param1.currentTarget.target as LiveSetLibraryList;
         _loc2_.liveSetItem.removeEventListener(ToneCentralEvents.DELETE,this.clickDeleteHandler);
         this.deletedIndex = this.view.liveSetListContainer.getChildIndex(_loc2_);
         var _loc3_:Sequence = new Sequence(_loc2_);
         var _loc4_:Fade = new Fade();
         _loc4_.alphaTo = 0;
         _loc4_.duration = 300;
         _loc3_.addChild(_loc4_);
         var _loc5_:Resize = new Resize();
         _loc5_.widthTo = 0;
         _loc5_.duration = 300;
         _loc3_.addChild(_loc5_);
         _loc3_.addEventListener(EffectEvent.EFFECT_END,this.listDeleteEndHandler,false,0,true);
         _loc3_.play();
      }
      
      private function listDeleteEndHandler(param1:EffectEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:LiveSetLibraryList = param1.effectInstance.target as LiveSetLibraryList;
         _loc2_.removeListener();
         this.view.liveSetListContainer.removeElement(_loc2_);
         if(this.currentList == _loc2_)
         {
            if(this.view.liveSetListContainer.numElements > 0)
            {
               _loc4_ = this.deletedIndex - 1;
               if(_loc4_ < 0)
               {
                  _loc4_ = 0;
               }
               this.currentList = this.view.liveSetListContainer.getElementAt(_loc4_) as LiveSetLibraryList;
               this.currentList.setSelect();
            }
            else
            {
               this.currentList = null;
               this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.UNSELECT));
            }
            this.changeEnableButton();
         }
         var _loc3_:int = this.liveSetListArray.indexOf(_loc2_);
         this.liveSetListArray.splice(_loc3_,1);
         this.liveSetStorageMng.del(_loc2_.data);
         this.resetLivesetOrderNumber();
      }
      
      private function listUnSelectHandler(param1:ToneCentralEvents) : void
      {
         if(this.currentList)
         {
            this.currentList.resetSelected();
            this.currentList = null;
            this.changeEnableButton();
         }
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.UNSELECT));
      }
      
      private function listSelectHandler(param1:ToneCentralEvents) : void
      {
         this.currentList = param1.currentTarget as LiveSetLibraryList;
         var _loc2_:int = 0;
         while(_loc2_ < this.liveSetListArray.length)
         {
            if(this.liveSetListArray[_loc2_] != this.currentList)
            {
               this.liveSetListArray[_loc2_].resetSelected();
            }
            _loc2_++;
         }
         this.changeEnableButton();
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function backupButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ConfirmPopup = new ConfirmPopup();
         _loc2_.setHeaderText("dialog.patch.backupHeader");
         _loc2_.setMsgText("dialog.patch.backupMsg");
         _loc2_.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = _loc2_;
         _loc2_.addEventListener(ToneCentralEvents.OK,this.backupOKHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.disconnectedHandler,false,0,true);
      }
      
      private function disconnectedHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.removeEventListener(ToneCentralEvents.DISCONNECTED,this.disconnectedHandler);
         var _loc2_:ConfirmPopup = Context.dialogMng.currentPopup as ConfirmPopup;
         if(_loc2_)
         {
            _loc2_.close();
            this.mediator.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DISCONNECT_ERROR));
         }
      }
      
      private function backupOKHandler(param1:Event) : void
      {
         this.backupLoadAddress = "10,01,00,00";
         this.backupLibData = new LibraryDataSet();
         this.backupLibData.liveSetData.name = "KATANA";
         this.retryCount = 0;
         this.mediator.showLoading();
         this.mediator.isBackupLoading = true;
         this.mediator.sysex.listIndex = 0;
         this.loadBackupPatches();
      }
      
      private function loadBackupPatches() : void
      {
         this.mediator.sysex.addEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.patchListReceivedHandler,false,0,true);
         this.mediator.sysex.getPatchParamsFunc(this.backupLoadAddress);
         this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.backupLoadTimeoutHandler,false,0,true);
         this.timeoutTimer.start();
      }
      
      private function backupLoadTimeoutHandler(param1:TimerEvent) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.backupLoadTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.retryCount;
         if(this.retryCount < 6)
         {
            this.loadBackupPatches();
            this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.backupLoadTimeoutHandler,false,0,true);
            this.timeoutTimer.start();
         }
         else
         {
            this.mediator.sysex.showAppErrorDialog();
         }
      }
      
      private function patchListReceivedHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.removeEventListener(ToneCentralEvents.PATCH_PARAM_LOADED,this.patchListReceivedHandler);
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.backupLoadTimeoutHandler);
         this.timeoutTimer.reset();
         var _loc2_:TemporaryParams = this.mediator.sysex.loadedParams;
         var _loc3_:PatchData = new PatchData();
         _loc3_.name = _loc2_.patchname;
         _loc3_.params = _loc2_;
         _loc3_.liveSetId = this.backupLibData.liveSetData.id;
         this.backupLibData.patchList.push(_loc3_);
         ++this.mediator.sysex.listIndex;
         if(this.mediator.sysex.listIndex < ParameterDefinitionGT.MAX_PATCH_NUMBER)
         {
            this.backupLoadAddress = this.mediator.sysex.getIncrementAddress(["10","01","00","00"]);
            this.loadBackupPatches();
         }
         else
         {
            this.createList(this.backupLibData);
            this.mediator.isBackupLoading = false;
            this.mediator.hideLoading();
            CompletePopup.showCompleteDialog("dialog.backup.complete.header","dialog.backup.complete.msg");
         }
      }
      
      public function copyAllPatches() : Vector.<PatchData>
      {
         if(this.currentList)
         {
            return this.currentList.copyAllPatches();
         }
         return new Vector.<PatchData>();
      }
      
      private function applyLivesetButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ConfirmPopup = new ConfirmPopup();
         _loc2_.setHeaderText("dialog.patch.applyLivesetHeader");
         _loc2_.setMsgText("dialog.patch.applyLivesetMsg");
         _loc2_.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = _loc2_;
         _loc2_.addEventListener(ToneCentralEvents.OK,this.applyLivesetOKHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.disconnectedHandler,false,0,true);
      }
      
      private function applyLivesetOKHandler(param1:ToneCentralEvents) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.APPLY_LIVESET));
      }
      
      public function setPrevSelected() : void
      {
         if(!this.liveSetListArray)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.liveSetListArray.length)
         {
            this.liveSetListArray[_loc1_].setPrevSelected();
            _loc1_++;
         }
      }
   }
}

