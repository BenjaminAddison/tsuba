package tonecentral.components.popup
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.utils.Timer;
   import mx.collections.ArrayCollection;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RadioButtonGroup;
   import spark.events.GridItemEditorEvent;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.components.ImageButton;
   import tonecentral.components.ImageLabelRadioButton;
   import tonecentral.components.chain.CustomNumericStepper;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class AbstractPlay extends ToneCentralPopup
   {
      
      private static const FILE_EXTENSIONE_WAV:String = ".wav";
      
      private static const FILE_EXTENSIONE_AAC:String = ".m4a";
      
      private var bgRepeatImg:Class = AbstractPlay_bgRepeatImg;
      
      protected var _651291027songCollection:ArrayCollection;
      
      private var pauseFlag:Boolean = false;
      
      private var dragPauseFlag:Boolean = false;
      
      private var _isPlaying:Boolean = false;
      
      protected var songPath:String;
      
      protected var currentSongFileName:String;
      
      private var openUrlOk:Boolean;
      
      private var curRecordFormatIsWav:Boolean = true;
      
      protected var commandUsbInOutMode:String;
      
      protected var fileOld:File;
      
      private var fileNew:File;
      
      protected var songTitleLabel:Label;
      
      protected var playButton:ImageButton;
      
      protected var repeatButton:ImageButton;
      
      protected var stopButton:ImageButton;
      
      protected var prevButton:ImageButton;
      
      protected var nextButton:ImageButton;
      
      private var bgSlider:UIComponent;
      
      protected var slider:PlayerSlider;
      
      protected var songsDataGrid:RecDataGrid;
      
      private var repeatTypeGroup:RadioButtonGroup;
      
      private var volumeLabel:Label;
      
      private var volumeStepper:CustomNumericStepper;
      
      private var repeatPopup:Group;
      
      private var bgRepeatPopup:BitmapImage;
      
      protected var abRepeatButton:ImageLabelRadioButton;
      
      protected var noRepeatButton:ImageLabelRadioButton;
      
      protected var allRepeatButton:ImageLabelRadioButton;
      
      protected var oneRepeatButton:ImageLabelRadioButton;
      
      protected var oneStrateButton:ImageLabelRadioButton;
      
      private var playEndTimer:Timer;
      
      protected var fileRoot:String;
      
      private var deleteItem:Object;
      
      public function AbstractPlay(param1:String = "")
      {
         super(param1);
         mediator = ToneCentralMediator.getInstance();
         this.playEndTimer = new Timer(600);
         mediator.addEventListener(ToneCentralEvents.SHOW_SELECT_DEVICE,this.showSelectDeviceHandler,false,0,true);
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      protected function getExtension() : String
      {
         if(this.curRecordFormatIsWav)
         {
            return FILE_EXTENSIONE_WAV;
         }
         return FILE_EXTENSIONE_AAC;
      }
      
      override protected function drawBackground() : void
      {
         super.drawBackground();
         if(!backgoundLayer)
         {
            return;
         }
         var _loc1_:Graphics = backgoundLayer.graphics;
         _loc1_.lineStyle(1,0);
         _loc1_.moveTo(2,160);
         _loc1_.lineTo(dialogWidth - 2,160);
      }
      
      override protected function addOther() : void
      {
         this.createSlider();
         this.createButton();
         this.createList();
         this.createTitleLabel();
         this.createRepeatPopup();
         this.addRepeatTypeButton();
         this.loadFileList();
      }
      
      protected function addRepeatTypeButton() : void
      {
      }
      
      protected function createSlider() : void
      {
         this.bgSlider = new UIComponent();
         this.bgSlider.x = 7;
         this.bgSlider.y = 37;
         container.addElement(this.bgSlider);
         this.slider = new PlayerSlider();
         this.slider.y = 50;
         this.slider.addEventListener(ToneCentralEvents.START_DRAG,this.sliderStartDragHandler,false,0,true);
         this.slider.addEventListener(ToneCentralEvents.STOP_DRAG,this.sliderStopDragHandler,false,0,true);
         container.addElement(this.slider);
         this.drawBgSlider();
      }
      
      private function sliderStopDragHandler(param1:ToneCentralEvents) : void
      {
         mediator.sysex.PLAYER_setCurrentTime(int(this.slider.value));
         if(this.dragPauseFlag)
         {
            this.playStart();
            this.dragPauseFlag = false;
         }
      }
      
      private function sliderStartDragHandler(param1:ToneCentralEvents) : void
      {
         if(!this.pauseFlag && this._isPlaying)
         {
            this.playPause();
            this.dragPauseFlag = true;
         }
      }
      
      private function drawBgSlider() : void
      {
         var _loc1_:Graphics = this.bgSlider.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,1907997);
         _loc1_.beginFill(4737096);
         _loc1_.drawRoundRect(0,0,414,57,10,10);
         _loc1_.endFill();
      }
      
      protected function createButton() : void
      {
         this.stopButton = new ImageButton();
         this.stopButton.styleName = "stopButton";
         this.stopButton.horizontalCenter = 0;
         this.stopButton.y = 105;
         this.stopButton.visible = false;
         this.stopButton.enabled = false;
         this.stopButton.addEventListener(MouseEvent.CLICK,this.stopButtonClickHandler,false,0,true);
         container.addElement(this.stopButton);
         this.playButton = new ImageButton();
         this.playButton.styleName = "playButton";
         this.playButton.horizontalCenter = 0;
         this.playButton.y = 105;
         this.playButton.enabled = false;
         this.playButton.addEventListener(MouseEvent.CLICK,this.playButtonClickHandler,false,0,true);
         container.addElement(this.playButton);
         this.prevButton = new ImageButton();
         this.prevButton.styleName = "prevButton";
         this.prevButton.horizontalCenter = -52;
         this.prevButton.y = 110;
         this.prevButton.enabled = false;
         this.prevButton.addEventListener(MouseEvent.CLICK,this.prevButtonClickHandler,false,0,true);
         container.addElement(this.prevButton);
         this.nextButton = new ImageButton();
         this.nextButton.styleName = "nextButton";
         this.nextButton.horizontalCenter = 52;
         this.nextButton.y = 110;
         this.nextButton.enabled = false;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.nextButtonClickHandler,false,0,true);
         container.addElement(this.nextButton);
         this.repeatButton = new ImageButton();
         this.repeatButton.styleName = "noRepeatButton";
         this.repeatButton.right = 20;
         this.repeatButton.y = 110;
         this.repeatButton.addEventListener(MouseEvent.CLICK,this.repeatButtonClickHandler,false,0,true);
         container.addElement(this.repeatButton);
         this.volumeLabel = new Label();
         this.volumeLabel.text = "VOLUME";
         this.volumeLabel.x = 292;
         this.volumeLabel.y = 172;
         this.volumeLabel.styleName = "volumeLabel";
         container.addElement(this.volumeLabel);
         var _loc1_:int = Math.round(mediator.sysex.PLAYER_soundVolume() * 100);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         this.volumeStepper = new CustomNumericStepper(74,25,30);
         this.volumeStepper.x = 345;
         this.volumeStepper.y = 165;
         this.volumeStepper.value = _loc1_.toString();
         this.volumeStepper.minimum = 0;
         this.volumeStepper.maximum = 100;
         this.volumeStepper.stepSize = 1;
         this.volumeStepper.addEventListener(Event.CHANGE,this.volumeStepperChangeHandler,false,0,true);
         container.addElement(this.volumeStepper);
      }
      
      private function volumeStepperChangeHandler(param1:Event) : void
      {
         mediator.sysex.PLAYER_setSoundVolume(int(this.volumeStepper.value) / 100);
      }
      
      private function createTitleLabel() : void
      {
         this.songTitleLabel = new Label();
         this.songTitleLabel.width = dialogWidth - 30;
         this.songTitleLabel.styleName = "recordingTitle";
         this.songTitleLabel.x = 10;
         this.songTitleLabel.y = 15;
         this.songTitleLabel.maxDisplayedLines = 1;
         container.addElement(this.songTitleLabel);
      }
      
      private function createRepeatPopup() : void
      {
         this.repeatPopup = new Group();
         this.repeatPopup.horizontalCenter = 0;
         this.repeatPopup.y = 145;
         this.repeatPopup.visible = false;
         container.addElement(this.repeatPopup);
         this.bgRepeatPopup = new BitmapImage();
         this.bgRepeatPopup.source = this.bgRepeatImg;
         this.repeatPopup.addElement(this.bgRepeatPopup);
         this.repeatTypeGroup = new RadioButtonGroup();
         this.repeatTypeGroup.addEventListener(Event.CHANGE,this.repeatTypeChangeHandler,false,0,true);
      }
      
      protected function createNoRepeatButton() : void
      {
         this.noRepeatButton = new ImageLabelRadioButton();
         this.noRepeatButton.styleName = "noRepeatRadio";
         this.noRepeatButton.group = this.repeatTypeGroup;
         this.noRepeatButton.x = 15;
         this.noRepeatButton.y = 15;
         this.noRepeatButton.value = ToneCentralDefinition.NO_REPEAT;
         this.noRepeatButton.selected = true;
         this.repeatPopup.addElement(this.noRepeatButton);
      }
      
      protected function createABRepeatButton() : void
      {
         this.abRepeatButton = new ImageLabelRadioButton();
         this.abRepeatButton.styleName = "abRepeatRadio";
         this.abRepeatButton.group = this.repeatTypeGroup;
         this.abRepeatButton.x = 95;
         this.abRepeatButton.y = 15;
         this.abRepeatButton.value = ToneCentralDefinition.AB_REPEAT;
         this.repeatPopup.addElement(this.abRepeatButton);
      }
      
      protected function createOneRepeatButton() : void
      {
         this.oneRepeatButton = new ImageLabelRadioButton();
         this.oneRepeatButton.styleName = "oneRepeatRadio";
         this.oneRepeatButton.group = this.repeatTypeGroup;
         this.oneRepeatButton.x = 175;
         this.oneRepeatButton.y = 15;
         this.oneRepeatButton.value = ToneCentralDefinition.ONE_REPEAT;
         this.repeatPopup.addElement(this.oneRepeatButton);
      }
      
      protected function createOneStrateButton() : void
      {
         this.oneStrateButton = new ImageLabelRadioButton();
         this.oneStrateButton.styleName = "strateRepeatRadio";
         this.oneStrateButton.group = this.repeatTypeGroup;
         this.oneStrateButton.x = 255;
         this.oneStrateButton.y = 15;
         this.oneStrateButton.value = ToneCentralDefinition.ONE_STRATE;
         this.repeatPopup.addElement(this.oneStrateButton);
      }
      
      protected function createAllRepeatButton() : void
      {
         this.allRepeatButton = new ImageLabelRadioButton();
         this.allRepeatButton.styleName = "allRepeatRadio";
         this.allRepeatButton.group = this.repeatTypeGroup;
         this.allRepeatButton.x = 335;
         this.allRepeatButton.y = 15;
         this.allRepeatButton.value = ToneCentralDefinition.ALL_REPEAT;
         this.repeatPopup.addElement(this.allRepeatButton);
      }
      
      private function createList() : void
      {
         this.songsDataGrid = new RecDataGrid();
         this.songsDataGrid.width = container.width - 8;
         this.songsDataGrid.height = 244;
         this.songsDataGrid.x = 4;
         this.songsDataGrid.y = 195;
         this.songsDataGrid.addEventListener(Event.CHANGE,this.songSelect,false,0,true);
         this.songsDataGrid.songs.addEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_SAVE,this.songNameChanged,false,0,true);
         container.addElement(this.songsDataGrid);
      }
      
      protected function songNameChanged(param1:GridItemEditorEvent) : void
      {
      }
      
      private function repeatButtonClickHandler(param1:MouseEvent) : void
      {
         this.repeatPopup.visible = !this.repeatPopup.visible;
      }
      
      private function repeatTypeChangeHandler(param1:Event) : void
      {
         this.stopButtonClickHandler(null);
         switch(this.repeatTypeGroup.selectedValue)
         {
            case ToneCentralDefinition.NO_REPEAT:
               this.repeatButton.styleName = "noRepeatButton";
               mediator.sysex.PLAYER_setRepeatMode(false);
               break;
            case ToneCentralDefinition.AB_REPEAT:
               this.repeatButton.styleName = "abRepeatButton";
               mediator.sysex.PLAYER_setRepeatMode(true);
               this.slider.valueA = 0;
               this.slider.valueB = this.getRecordingTime();
               break;
            case ToneCentralDefinition.ONE_REPEAT:
               this.repeatButton.styleName = "oneRepeatButton";
               mediator.sysex.PLAYER_setRepeatMode(true);
               break;
            case ToneCentralDefinition.ALL_REPEAT:
               this.repeatButton.styleName = "allRepeatButton";
               mediator.sysex.PLAYER_setRepeatMode(false);
               break;
            case ToneCentralDefinition.ONE_STRATE:
               this.repeatButton.styleName = "strateRepeatButton";
               mediator.sysex.PLAYER_setRepeatMode(false);
         }
         this.slider.repeatMode = String(this.repeatTypeGroup.selectedValue);
      }
      
      protected function loadFileList() : void
      {
      }
      
      private function playButtonClickHandler(param1:MouseEvent) : void
      {
         this.playStart();
         this.playButton.visible = false;
         this.stopButton.visible = true;
      }
      
      protected function playStart() : void
      {
         mediator.sysex.addEventListener(ToneCentralEvents.PLAY_END,this.playEnd,false,0,true);
         mediator.sysex.PLAYER_playSound();
         this.pauseFlag = false;
         this._isPlaying = true;
         addEventListener(Event.ENTER_FRAME,this.getCurrentPlayTime,false,0,true);
      }
      
      public function stop() : void
      {
         if(this._isPlaying)
         {
            mediator.sysex.PLAYER_pauseSound();
            if(this.playButton)
            {
               this.playButton.visible = true;
            }
            if(this.stopButton)
            {
               this.stopButton.visible = false;
            }
            this.pauseFlag = true;
            this._isPlaying = false;
         }
      }
      
      private function stopButtonClickHandler(param1:MouseEvent) : void
      {
         this.playPause();
         this.playButton.visible = true;
         this.stopButton.visible = false;
         this.pauseFlag = true;
         this._isPlaying = false;
      }
      
      private function playEnd(param1:ToneCentralEvents) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.getCurrentPlayTime);
         this.slider.value = this.slider.maximum;
         mediator.sysex.removeEventListener(ToneCentralEvents.PLAY_END,this.playEnd);
         this.playEndTimer.addEventListener(TimerEvent.TIMER,this.playEndTimerHandler,false,0,true);
         this.playEndTimer.start();
      }
      
      private function playEndTimerHandler(param1:TimerEvent) : void
      {
         this.playEndTimer.removeEventListener(TimerEvent.TIMER,this.playEndTimerHandler);
         this.playEndTimer.reset();
         if(this.repeatTypeGroup.selectedValue == ToneCentralDefinition.NO_REPEAT)
         {
            this.playStop();
            this.playButton.visible = true;
            this.stopButton.visible = false;
         }
         else if(this.repeatTypeGroup.selectedValue == ToneCentralDefinition.ONE_STRATE)
         {
            this.setNextSong();
            this.playButton.visible = true;
            this.stopButton.visible = false;
         }
         else if(this.repeatTypeGroup.selectedValue == ToneCentralDefinition.ALL_REPEAT)
         {
            this.setNextSong();
            this.playStart();
            this.playButton.visible = false;
            this.stopButton.visible = true;
         }
         else
         {
            this.playButton.visible = true;
            this.stopButton.visible = false;
         }
      }
      
      private function getCurrentPlayTime(param1:Event) : void
      {
         var _loc2_:Number = mediator.sysex.PLAYER_currentTime();
         this.slider.value = _loc2_;
      }
      
      protected function playPause() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.getCurrentPlayTime);
         mediator.sysex.PLAYER_pauseSound();
      }
      
      protected function playStop() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.getCurrentPlayTime);
         mediator.sysex.PLAYER_stopSound();
         mediator.sysex.PLAYER_setCurrentTime(0);
         if(this.slider)
         {
            this.slider.value = 0;
         }
         if(this.playButton)
         {
            this.playButton.visible = true;
         }
         if(this.stopButton)
         {
            this.stopButton.visible = false;
         }
         this.pauseFlag = false;
         this._isPlaying = false;
      }
      
      private function nextButtonClickHandler(param1:MouseEvent) : void
      {
         this.setNextSong();
      }
      
      private function setNextSong() : void
      {
         var _loc1_:int = this.songsDataGrid.selectedIndex;
         if(this.songCollection.length - 1 > _loc1_)
         {
            this.songsDataGrid.selectedIndex = _loc1_ + 1;
            this.songSelect(null);
         }
         else if(this.repeatTypeGroup.selectedValue == ToneCentralDefinition.ALL_REPEAT)
         {
            this.songsDataGrid.selectedIndex = 0;
            this.songSelect(null);
         }
      }
      
      private function prevButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = mediator.sysex.PLAYER_currentTime();
         var _loc3_:int = this.songsDataGrid.selectedIndex;
         if(_loc2_ == 0)
         {
            if(_loc3_ > 0)
            {
               this.songsDataGrid.selectedIndex = _loc3_ - 1;
               this.songSelect(null);
            }
            else if(this.repeatTypeGroup.selectedValue == ToneCentralDefinition.ALL_REPEAT && _loc3_ == 0)
            {
               this.songsDataGrid.selectedIndex = this.songCollection.length - 1;
               this.songSelect(null);
            }
         }
         else
         {
            this.playStop();
         }
      }
      
      private function songSelect(param1:Event) : void
      {
         var _loc2_:Object = null;
         if(this.songsDataGrid.selectedItem)
         {
            removeEventListener(Event.ENTER_FRAME,this.getCurrentPlayTime);
            _loc2_ = this.songsDataGrid.selectedItem;
            this.currentSongFileName = _loc2_.fileName;
            this.setPlaySong(this.currentSongFileName);
            this.slider.maxTime = _loc2_.sec;
            this.slider.playTime = 0;
            this.songTitleLabel.text = _loc2_.name;
            this.playButton.enabled = true;
            this.stopButton.enabled = true;
            this.nextButton.enabled = true;
            this.prevButton.enabled = true;
            this.playButton.visible = true;
            this.stopButton.visible = false;
         }
      }
      
      protected function setPlaySong(param1:String) : void
      {
         var _loc2_:File = File.applicationStorageDirectory.resolvePath(this.fileRoot + "/" + param1);
         this.songPath = _loc2_.nativePath;
         this.openUrlOk = mediator.sysex.PLAYER_openSoundWithURL(this.songPath);
         this.slider.maxTime = mediator.sysex.PLAYER_totalTime();
         this.slider.maximum = mediator.sysex.PLAYER_totalTime();
         this.slider.value = 0;
         this._isPlaying = false;
         this.pauseFlag = false;
         this.dragPauseFlag = false;
         if(this.repeatTypeGroup.selectedValue == ToneCentralDefinition.ONE_REPEAT || this.repeatTypeGroup.selectedValue == ToneCentralDefinition.AB_REPEAT)
         {
            mediator.sysex.PLAYER_setRepeatMode(true);
         }
         else
         {
            mediator.sysex.PLAYER_setRepeatMode(false);
         }
      }
      
      protected function getRecordingTime() : Number
      {
         var _loc1_:Number = Number(mediator.sysex.RECORDER_currentRecordingTime());
         return Math.ceil(_loc1_);
      }
      
      protected function fileCopy(param1:String, param2:String) : void
      {
         this.fileOld = new File(param1);
         this.fileNew = new File(param2);
         this.fileOld.addEventListener(Event.COMPLETE,this.fileCopyComplete,false,0,true);
         this.fileOld.addEventListener(IOErrorEvent.IO_ERROR,this.fileCopyFailed,false,0,true);
         this.fileOld.copyToAsync(this.fileNew,true);
      }
      
      private function fileCopyFailed(param1:IOErrorEvent) : void
      {
      }
      
      protected function fileCopyComplete(param1:Event) : void
      {
         this.songCollection[this.songsDataGrid.selectedIndex].fileName = this.fileNew.name;
         this.fileOld.removeEventListener(Event.COMPLETE,this.fileCopyComplete);
         this.fileOld.deleteFile();
         this.save();
      }
      
      protected function songDeleteHandler(param1:ToneCentralEvents) : void
      {
         if(this._isPlaying)
         {
            return;
         }
         this.deleteItem = param1.data;
         var _loc2_:DeletePopup = new DeletePopup();
         _loc2_.setHeaderText("dialog.file.deleteHeader");
         _loc2_.setMsgText("dialog.file.deleteMsg");
         _loc2_.popup(Context.dialogMng.parent,true);
         _loc2_.addEventListener(ToneCentralEvents.DELETE,this.deletePatchHandler,false,0,true);
      }
      
      protected function deletePatchHandler(param1:Event) : void
      {
         this.playButton.enabled = false;
         this.stopButton.enabled = false;
         this.prevButton.enabled = false;
         this.nextButton.enabled = false;
         this.playButton.visible = true;
         this.stopButton.visible = false;
         mediator.sysex.PLAYER_closeSound();
         this.songsDataGrid.removeItemAt(this.songsDataGrid.selectedIndex);
         var _loc2_:File = File.applicationStorageDirectory.resolvePath(this.fileRoot + "/" + this.deleteItem.fileName);
         if(_loc2_.exists)
         {
            _loc2_.deleteFile();
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.songCollection.length)
         {
            this.songCollection[_loc3_].no = _loc3_ + 1;
            _loc3_++;
         }
         this.save();
      }
      
      protected function save() : void
      {
      }
      
      override protected function addHandler(param1:Event) : void
      {
         if(Boolean(this.songsDataGrid) && Boolean(this.songsDataGrid.selectedIndex != -1) && !this._isPlaying)
         {
            this.songSelect(null);
         }
      }
      
      override public function close() : void
      {
         super.close();
         if(!this._isPlaying)
         {
            this.playButton.enabled = false;
            this.prevButton.enabled = false;
            this.nextButton.enabled = false;
            this.stopButton.enabled = false;
            this.songTitleLabel.text = "";
            this.slider.reset();
            mediator.sysex.PLAYER_closeSound();
         }
      }
      
      private function showSelectDeviceHandler(param1:ToneCentralEvents) : void
      {
         this.playStop();
         mediator.sysex.PLAYER_closeSound();
      }
      
      [Bindable(event="propertyChange")]
      protected function get songCollection() : ArrayCollection
      {
         return this._651291027songCollection;
      }
      
      protected function set songCollection(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._651291027songCollection;
         if(_loc2_ !== param1)
         {
            this._651291027songCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"songCollection",_loc2_,param1));
            }
         }
      }
   }
}

