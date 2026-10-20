package tonecentral.components.popup
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.net.FileFilter;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.collections.ArrayCollection;
   import mx.resources.ResourceManager;
   import spark.components.Label;
   import spark.events.GridItemEditorEvent;
   import spark.formatters.DateTimeFormatter;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.chain.CustomNumericStepper;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class Play extends AbstractPlay
   {
      
      private var musicDir:String;
      
      private var playFlag:Boolean = false;
      
      private var selectedIndex:int;
      
      private var fileDeleteFlag:Boolean = false;
      
      private var playInitOK:Boolean = false;
      
      private var curRecordFormatIsWav:Boolean = true;
      
      private const FILE_EXTENSIONE_WAV:String = ".wav";
      
      private const FILE_EXTENSIONE_AAC:String = ".m4a";
      
      private var timer:Timer;
      
      private var importButton:ImageLabelButton;
      
      private var speedLabel:Label;
      
      private var pitchLabel:Label;
      
      private var speedStepper:CustomNumericStepper;
      
      private var pitchStepper:CustomNumericStepper;
      
      private var prevFilePath:String;
      
      private var addSongName:String;
      
      public function Play(param1:String = "")
      {
         super(param1);
         mediator = ToneCentralMediator.getInstance();
         fileRoot = URLDefinition.PLAY_FILE_PATH_ROOT;
         commandUsbInOutMode = "play";
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(430,512);
      }
      
      override protected function addRepeatTypeButton() : void
      {
         createNoRepeatButton();
         createOneRepeatButton();
         createAllRepeatButton();
         oneRepeatButton.x = 95;
         allRepeatButton.x = 175;
      }
      
      override protected function addButton() : void
      {
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.x = 15;
         closeButton.bottom = 23;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CLOSE";
         closeButton.setFocus();
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
      }
      
      override protected function createButton() : void
      {
         super.createButton();
         this.importButton = new ImageLabelButton();
         this.importButton.label = "IMPORT";
         this.importButton.styleName = ResourceManager.getInstance().getString("resource","dialog.importButton.style");
         this.importButton.x = 7;
         this.importButton.y = 115;
         this.importButton.height = 30;
         this.importButton.width = 90;
         this.importButton.addEventListener(MouseEvent.CLICK,this.importButtonClickHandler,false,0,true);
         container.addElement(this.importButton);
         this.speedStepper = new CustomNumericStepper(74,25,30);
         this.speedStepper.x = 72;
         this.speedStepper.y = 165;
         this.speedStepper.value = (mediator.sysex.PLAYER_soundSpeed() * 100).toString();
         this.speedStepper.minimum = 75;
         this.speedStepper.maximum = 125;
         this.speedStepper.decimal = true;
         this.speedStepper.stepSize = 5;
         this.speedStepper.precision = 0;
         this.speedStepper.addEventListener(Event.CHANGE,this.speedStepperChangeHandler,false,0,true);
         container.addElement(this.speedStepper);
         this.pitchStepper = new CustomNumericStepper(74,25,30);
         this.pitchStepper.x = 202;
         this.pitchStepper.y = 165;
         this.pitchStepper.value = mediator.sysex.PLAYER_soundPitch().toString();
         this.pitchStepper.maximum = 600;
         this.pitchStepper.minimum = -600;
         this.pitchStepper.stepSize = 100;
         this.pitchStepper.addEventListener(Event.CHANGE,this.pitchStepperChangeHandler,false,0,true);
         container.addElement(this.pitchStepper);
         this.speedLabel = new Label();
         this.speedLabel.text = "SPEED(%)";
         this.speedLabel.x = 10;
         this.speedLabel.y = 172;
         this.speedLabel.styleName = "volumeLabel";
         container.addElement(this.speedLabel);
         this.pitchLabel = new Label();
         this.pitchLabel.text = "PITCH";
         this.pitchLabel.x = 160;
         this.pitchLabel.y = 172;
         this.pitchLabel.styleName = "volumeLabel";
         container.addElement(this.pitchLabel);
      }
      
      private function speedStepperChangeHandler(param1:Event) : void
      {
         mediator.sysex.PLAYER_setSoundSpeed(Number(this.speedStepper.value) / 100);
      }
      
      private function pitchStepperChangeHandler(param1:Event) : void
      {
         mediator.sysex.PLAYER_setSoundPitch(int(this.pitchStepper.value));
      }
      
      private function importButtonClickHandler(param1:MouseEvent) : void
      {
         this.musicFileSelect();
      }
      
      private function formatSpeed(param1:Number) : String
      {
         var _loc2_:Number = Math.round(param1 * 100 / 5) * 5 / 100;
         var _loc3_:String = _loc2_.toString();
         if(_loc3_ == "1")
         {
            _loc3_ += ".00";
         }
         else if(_loc3_.length == 3)
         {
            _loc3_ += "0";
         }
         return _loc3_;
      }
      
      override protected function loadFileList() : void
      {
         songCollection = SharedObjectUtil.get(ToneCentralDefinition.PLAY_FILE_DATA) as ArrayCollection;
         if(!songCollection)
         {
            songCollection = new ArrayCollection();
         }
         songsDataGrid.addEventListener(ToneCentralEvents.DELETE,songDeleteHandler,false,0,true);
         songsDataGrid.dataProvider = songCollection;
      }
      
      private function musicFileSelect() : void
      {
         var _loc1_:FileFilter = null;
         var _loc2_:File = null;
         if(Capabilities.os.substring(0,3) == "Mac")
         {
            this.musicDir = File.userDirectory.nativePath + "/Music/";
            _loc1_ = new FileFilter(" ","*.wav;*.mp3;*.m4a");
         }
         else if(Capabilities.os.substring(0,3) == "Win")
         {
            this.musicDir = File.userDirectory.nativePath + "/My Music/";
            _loc1_ = new FileFilter(" ","*.wav");
         }
         if(this.prevFilePath)
         {
            _loc2_ = new File(this.prevFilePath);
         }
         else
         {
            _loc2_ = new File(this.musicDir);
         }
         _loc2_.addEventListener(Event.SELECT,this.addMusicFile,false,0,true);
         _loc2_.browseForOpen(ResourceManager.getInstance().getString("resource","dialog.player.header"),[_loc1_]);
      }
      
      private function addMusicFile(param1:Event) : void
      {
         var _loc2_:File = param1.currentTarget as File;
         this.prevFilePath = _loc2_.url.replace(encodeURI(_loc2_.name),"");
         if(!_loc2_ || Boolean(_loc2_.isDirectory))
         {
            return;
         }
         var _loc3_:File = File.applicationStorageDirectory.resolvePath(URLDefinition.PLAY_FILE_PATH_ROOT);
         if(!_loc3_.exists)
         {
            _loc3_.createDirectory();
         }
         var _loc4_:DateTimeFormatter = new DateTimeFormatter();
         _loc4_.dateTimePattern = "yyyyMMdd_HHmmss";
         this.addSongName = _loc2_.name;
         currentSongFileName = _loc4_.format(new Date()) + "." + _loc2_.extension;
         _loc3_ = _loc3_.resolvePath(currentSongFileName);
         fileCopy(_loc2_.nativePath,_loc3_.nativePath);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
      }
      
      private function addSongList() : void
      {
         var _loc1_:Object = {};
         _loc1_.no = songCollection.length + 1;
         _loc1_.name = this.addSongName.substring(0,this.addSongName.lastIndexOf("."));
         _loc1_.fileName = currentSongFileName;
         this.addSongName = "";
         setPlaySong(currentSongFileName);
         var _loc2_:Number = Number(mediator.sysex.PLAYER_totalTime());
         _loc2_ = Math.ceil(_loc2_);
         _loc1_.sec = _loc2_;
         var _loc3_:String = ToneCentralUtil.timeFormat(_loc2_);
         _loc1_.time = _loc3_;
         slider.maximum = Number(mediator.sysex.PLAYER_totalTime());
         slider.maxTime = Number(mediator.sysex.PLAYER_totalTime());
         slider.playTime = 0;
         songCollection.addItem(_loc1_);
         songsDataGrid.selectedIndex = songCollection.length - 1;
         songTitleLabel.text = songsDataGrid.selectedItem.name;
         this.save();
         playButton.enabled = true;
         stopButton.enabled = true;
         nextButton.enabled = true;
         prevButton.enabled = true;
         repeatButton.enabled = true;
      }
      
      override protected function save() : void
      {
         SharedObjectUtil.set(ToneCentralDefinition.PLAY_FILE_DATA,songCollection);
      }
      
      override protected function songNameChanged(param1:GridItemEditorEvent) : void
      {
         songTitleLabel.text = songsDataGrid.selectedItem.name;
         this.save();
      }
      
      override protected function fileCopyComplete(param1:Event) : void
      {
         fileOld.removeEventListener(Event.COMPLETE,this.fileCopyComplete);
         if(this.fileDeleteFlag)
         {
            this.fileDeleteFlag = false;
            fileOld.deleteFile();
         }
         else
         {
            this.addSongList();
         }
         this.save();
      }
   }
}

