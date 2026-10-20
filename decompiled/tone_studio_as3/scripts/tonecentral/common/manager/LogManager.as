package tonecentral.common.manager
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.formatters.DateFormatter;
   import spark.formatters.DateTimeFormatter;
   import tonecentral.common.log.command.ErrorLogCommand;
   import tonecentral.common.log.command.LivesetAddCommand;
   import tonecentral.common.log.command.LivesetLogCommand;
   import tonecentral.common.log.command.PatchUseLogCommnad;
   import tonecentral.common.log.command.SoundCloudLogCommand;
   import tonecentral.common.log.command.StatusLogCommand;
   import tonecentral.common.log.command.UpdateLogCommand;
   import tonecentral.common.log.command.UserCommand;
   import tonecentral.common.log.command.YouTubeLogCommand;
   import tonecentral.common.log.data.ErrorLogData;
   import tonecentral.common.log.data.LivesetAddData;
   import tonecentral.common.log.data.LivesetLogData;
   import tonecentral.common.log.data.PatchUseLogData;
   import tonecentral.common.log.data.SoundCloudLogData;
   import tonecentral.common.log.data.StatusLogData;
   import tonecentral.common.log.data.UpdateLogData;
   import tonecentral.common.log.data.UserData;
   import tonecentral.common.log.data.YouTubeLogData;
   import tonecentral.common.log.model.ErrorLogModel;
   import tonecentral.common.log.model.LivesetAddLogModel;
   import tonecentral.common.log.model.PatchUseLogModel;
   import tonecentral.common.log.model.StatusLogModel;
   import tonecentral.common.log.model.UpdateLogModel;
   import tonecentral.common.log.model.UserModel;
   import tonecentral.common.net.NetworkManager;
   import tonecentral.common.storage.LiveSetStorageManager;
   import tonecentral.common.util.GUIDCreator;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class LogManager extends EventDispatcher
   {
      
      private static var instance:LogManager;
      
      private static const LAST_VERSION:String = "lastVersion";
      
      private var guidCreater:GUIDCreator;
      
      private var mediator:ToneCentralMediator;
      
      private var _guid:String;
      
      private var commands:Array = [];
      
      private var userData:UserData;
      
      private var updateLogData:UpdateLogData;
      
      private var patchUseLogData:PatchUseLogData;
      
      private var statusLogData:StatusLogData;
      
      private var livesetAddData:LivesetAddData;
      
      private var livesetLogData:LivesetLogData;
      
      private var soundCloudLogData:SoundCloudLogData;
      
      private var youTubeLogData:YouTubeLogData;
      
      private var liveSetStorageMng:LiveSetStorageManager;
      
      private var postLocalTimer:Timer = new Timer(5 * 60 * 1000);
      
      private var prevErrorLogTime:Date;
      
      private var postCounter:int = 0;
      
      private var logFile:File;
      
      private var stream:FileStream;
      
      public var logEnabled:Boolean = false;
      
      public function LogManager(param1:Blocker, param2:IEventDispatcher = null)
      {
         super(param2);
         this.liveSetStorageMng = LiveSetStorageManager.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.guidCreater = new GUIDCreator();
         this.getGUID();
         this.postLocalTimer.addEventListener(TimerEvent.TIMER,this.postLocalTimerHandler,false,0,true);
         this.postLocalTimer.start();
         this.logFile = File.applicationStorageDirectory.resolvePath("log/log.txt");
         if(this.logFile.exists)
         {
            this.logFile.deleteFile();
         }
         this.stream = new FileStream();
         this.stream.open(this.logFile,FileMode.APPEND);
         var _loc3_:DateFormatter = new DateFormatter();
         _loc3_.formatString = "YYYY/MM/DD HH:NN:SS\n";
         this.writeLog(_loc3_.format(new Date()));
      }
      
      public static function getInstance() : LogManager
      {
         if(!instance)
         {
            instance = new LogManager(new Blocker());
         }
         return instance;
      }
      
      private function postLocalTimerHandler(param1:TimerEvent) : void
      {
         if(this.postLocalTimer.delay == 5 * 60 * 1000)
         {
            this.postLocalTimer.delay = 60 * 60 * 1000;
         }
         this.postAllLocalLog();
      }
      
      private function getLastVersion() : String
      {
         var _loc1_:String = null;
         if(SharedObjectUtil.get(LAST_VERSION))
         {
            _loc1_ = String(SharedObjectUtil.get(LAST_VERSION));
         }
         else
         {
            SharedObjectUtil.set(LAST_VERSION,ToneCentralUtil.getThisVersion());
         }
         return _loc1_;
      }
      
      public function get guid() : String
      {
         return this._guid;
      }
      
      public function setGUID() : void
      {
         if(!this._guid)
         {
            this.guidCreater.genarateGUID();
            this.getGUID();
         }
      }
      
      private function getGUID() : void
      {
         if(this.guidCreater.getGUID())
         {
            this._guid = String(this.guidCreater.getGUID());
         }
      }
      
      public function logUser() : void
      {
         var _loc2_:String = null;
         var _loc1_:String = ToneCentralUtil.getThisVersion();
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc2_ = "KATANA-50";
               break;
            case 1:
               _loc2_ = "KATANA-100";
               break;
            case 2:
               _loc2_ = "KATANA-100/212";
               break;
            case 3:
               _loc2_ = "KATANA-HEAD";
               break;
            case 4:
               _loc2_ = "KATANA-Artist";
         }
         this.userData = new UserData(this._guid,"",_loc2_,"BOSS TONE STUDIO for KATANA",_loc1_,"",Capabilities.os,String(Capabilities.screenResolutionX),String(Capabilities.screenResolutionY),Capabilities.version,this.mediator.conf.confLanguage,Capabilities.language);
         this.postUser(this.userData);
      }
      
      private function postUser(param1:UserData) : void
      {
         this.userData = param1;
         var _loc2_:UserCommand = new UserCommand();
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LOAD_FAULT,this.postUserFaultHandler,false,0,true);
         _loc2_.parameters = this.userData;
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function postUserFaultHandler(param1:ToneCentralEvents) : void
      {
         this.saveLocalUser(this.userData);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      private function postCompleteHandler(param1:ToneCentralEvents) : void
      {
         --this.postCounter;
         if(this.postCounter == 0)
         {
            this.commands = [];
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE));
         }
      }
      
      public function logError(param1:String, param2:String) : void
      {
         if(Boolean(this.prevErrorLogTime) && this.prevErrorLogTime.getTime() > new Date().getTime() - 1000)
         {
            return;
         }
         this.prevErrorLogTime = new Date();
         var _loc3_:ErrorLogData = new ErrorLogData(this._guid,param1,param2);
         this.saveLocalErrorLog(_loc3_);
      }
      
      private function postErrorLog(param1:ErrorLogData) : void
      {
         var _loc2_:ErrorLogCommand = new ErrorLogCommand();
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LOAD_FAULT,this.errorLogPostFaultHandler,false,0,true);
         _loc2_.parameters = param1;
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function errorLogPostFaultHandler(param1:ToneCentralEvents) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      public function postInvoke() : void
      {
         var _loc1_:StatusLogData = new StatusLogData(this._guid,this.getNowString(),"0");
         this.postStatusLog(_loc1_);
      }
      
      public function postQuit() : void
      {
         var _loc1_:StatusLogData = new StatusLogData(this._guid,this.getNowString(),"1");
         this.postAllLocalLog();
         this.postStatusLog(_loc1_);
      }
      
      public function postStatusLog(param1:StatusLogData) : void
      {
         this.statusLogData = param1;
         var _loc2_:StatusLogCommand = new StatusLogCommand();
         _loc2_.parameters = this.statusLogData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LOAD_FAULT,this.statusLogPostFaultHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function statusLogPostFaultHandler(param1:ToneCentralEvents) : void
      {
         this.saveLocalStatusLog(this.statusLogData);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      public function logUpdate() : void
      {
         var _loc1_:String = this.getLastVersion();
         var _loc2_:String = ToneCentralUtil.getThisVersion();
         if(!_loc1_ || _loc1_ < _loc2_)
         {
            this.updateLogData = new UpdateLogData(this._guid,_loc2_);
            this.postUpdateLog(this.updateLogData);
            SharedObjectUtil.set(LAST_VERSION,ToneCentralUtil.getThisVersion());
         }
      }
      
      private function postUpdateLog(param1:UpdateLogData) : void
      {
         this.updateLogData = param1;
         var _loc2_:UpdateLogCommand = new UpdateLogCommand();
         _loc2_.parameters = this.updateLogData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LOAD_FAULT,this.updateLogPostFaultHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function updateLogPostFaultHandler(param1:ToneCentralEvents) : void
      {
         this.saveLocalUpdateLog(this.updateLogData);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      public function logPatchUse(param1:String) : void
      {
         var _loc2_:PatchUseLogData = new PatchUseLogData(this._guid,param1);
         this.postPatchUseLog(_loc2_);
      }
      
      private function postPatchUseLog(param1:PatchUseLogData) : void
      {
         this.patchUseLogData = param1;
         var _loc2_:PatchUseLogCommnad = new PatchUseLogCommnad();
         _loc2_.parameters = this.patchUseLogData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LOAD_FAULT,this.patchUsePostFaultHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function patchUsePostFaultHandler(param1:ToneCentralEvents) : void
      {
         this.saveLocalPatchUseLog(this.patchUseLogData);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      public function logLivesetAdd(param1:String) : void
      {
         var _loc2_:LivesetAddData = new LivesetAddData(this._guid,param1);
         this.postLivesetAddLog(_loc2_);
      }
      
      private function postLivesetAddLog(param1:LivesetAddData) : void
      {
         this.livesetAddData = param1;
         var _loc2_:LivesetAddCommand = new LivesetAddCommand();
         _loc2_.parameters = this.livesetAddData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.addEventListener(ToneCentralEvents.LOAD_FAULT,this.patchLivesetAddFaultHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function patchLivesetAddFaultHandler(param1:ToneCentralEvents) : void
      {
         this.saveLocalLivesetAddLog(this.livesetAddData);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      public function logLiveset(param1:String) : void
      {
         var _loc2_:LivesetLogData = new LivesetLogData(this._guid,param1);
         this.postLivesetLog(_loc2_);
      }
      
      private function postLivesetLog(param1:LivesetLogData) : void
      {
         this.livesetLogData = param1;
         var _loc2_:LivesetLogCommand = new LivesetLogCommand();
         _loc2_.parameters = this.livesetLogData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      public function logSoundCloud(param1:String) : void
      {
         var _loc2_:SoundCloudLogData = new SoundCloudLogData(this._guid,param1);
         this.postSoundCloudLog(_loc2_);
      }
      
      private function postSoundCloudLog(param1:SoundCloudLogData) : void
      {
         this.soundCloudLogData = param1;
         var _loc2_:SoundCloudLogCommand = new SoundCloudLogCommand();
         _loc2_.parameters = this.soundCloudLogData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      public function logYouTube(param1:String) : void
      {
         var _loc2_:YouTubeLogData = new YouTubeLogData(this._guid,param1);
         this.postYouTubeLog(_loc2_);
      }
      
      private function postYouTubeLog(param1:YouTubeLogData) : void
      {
         this.youTubeLogData = param1;
         var _loc2_:YouTubeLogCommand = new YouTubeLogCommand();
         _loc2_.parameters = this.youTubeLogData;
         _loc2_.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.postCompleteHandler,false,0,true);
         _loc2_.post();
         this.commands.push(_loc2_);
      }
      
      private function getNowString() : String
      {
         var _loc1_:Date = new Date();
         var _loc2_:DateTimeFormatter = new DateTimeFormatter();
         _loc2_.dateTimePattern = "yyyy/MM/dd HH:mm:ss";
         return _loc2_.format(_loc1_);
      }
      
      private function saveLocalUser(param1:UserData) : void
      {
         var _loc2_:UserData = param1;
         var _loc3_:UserModel = new UserModel();
         _loc3_.insert(_loc2_.getInsertData());
      }
      
      private function saveLocalErrorLog(param1:ErrorLogData) : void
      {
         var _loc2_:ErrorLogData = param1;
         var _loc3_:ErrorLogModel = new ErrorLogModel();
         _loc3_.insert(_loc2_.getInsertData());
      }
      
      private function saveLocalStatusLog(param1:StatusLogData) : void
      {
         var _loc2_:StatusLogModel = new StatusLogModel();
         _loc2_.insert(param1.getInsertData());
      }
      
      private function saveLocalUpdateLog(param1:UpdateLogData) : void
      {
         var _loc2_:UpdateLogData = param1;
         var _loc3_:UpdateLogModel = new UpdateLogModel();
         _loc3_.insert(_loc2_.getInsertData());
      }
      
      private function saveLocalPatchUseLog(param1:PatchUseLogData) : void
      {
         var _loc2_:PatchUseLogData = param1;
         var _loc3_:PatchUseLogModel = new PatchUseLogModel();
         _loc3_.insert(_loc2_.getInsertData());
      }
      
      private function saveLocalLivesetAddLog(param1:LivesetAddData) : void
      {
         var _loc2_:LivesetAddData = param1;
         var _loc3_:LivesetAddLogModel = new LivesetAddLogModel();
         _loc3_.insert(_loc2_.getInsertData());
      }
      
      private function postAllLocalLog() : void
      {
         if(NetworkManager.getInstance().available)
         {
            this.commands = [];
            this.postCounter = 0;
            this.postAllLocalUser();
            this.postAllLocalStatusLog();
            this.postAllLocalUpdateLog();
            this.postAllLocalErrorLog();
            this.postAllLocalPatchUseLog();
            this.postAllLocalLivesetAddLog();
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE));
         }
      }
      
      private function postAllLocalUser() : void
      {
         var _loc3_:UserData = null;
         var _loc4_:Object = null;
         var _loc1_:UserModel = new UserModel();
         var _loc2_:Array = _loc1_.find("","id ASC");
         for each(_loc4_ in _loc2_)
         {
            ++this.postCounter;
            _loc3_ = new UserData(_loc4_.guid,_loc4_.remote_addr,_loc4_.product,_loc4_.app_name,_loc4_.app_version,_loc4_.app_revision,_loc4_.os,_loc4_.resolution_x,_loc4_.resolution_y,_loc4_.runtime,_loc4_.app_language,_loc4_.os_language);
            this.postUser(_loc3_);
         }
         _loc1_.del();
      }
      
      private function postAllLocalErrorLog() : void
      {
         var _loc3_:ErrorLogData = null;
         var _loc4_:Object = null;
         var _loc1_:ErrorLogModel = new ErrorLogModel();
         var _loc2_:Array = _loc1_.find("","id DESC","10");
         if(_loc2_)
         {
            _loc2_ = _loc2_.reverse();
            for each(_loc4_ in _loc2_)
            {
               ++this.postCounter;
               _loc3_ = new ErrorLogData(_loc4_.guid,_loc4_.error_type,_loc4_.error_log);
               this.postErrorLog(_loc3_);
               _loc1_.del({"id":_loc4_.id});
            }
         }
      }
      
      private function postAllLocalStatusLog() : void
      {
         var _loc3_:StatusLogData = null;
         var _loc4_:Object = null;
         var _loc1_:StatusLogModel = new StatusLogModel();
         var _loc2_:Array = _loc1_.find("","id ASC");
         for each(_loc4_ in _loc2_)
         {
            ++this.postCounter;
            _loc3_ = new StatusLogData(_loc4_.guid,_loc4_.status_date,_loc4_.status_flag);
            this.postStatusLog(_loc3_);
         }
         _loc1_.del();
      }
      
      private function postAllLocalUpdateLog() : void
      {
         var _loc3_:UpdateLogData = null;
         var _loc4_:Object = null;
         var _loc1_:UpdateLogModel = new UpdateLogModel();
         var _loc2_:Array = _loc1_.find("","id ASC");
         for each(_loc4_ in _loc2_)
         {
            ++this.postCounter;
            _loc3_ = new UpdateLogData(_loc4_.guid,_loc4_.update_version);
            this.postUpdateLog(_loc3_);
         }
         _loc1_.del();
      }
      
      private function postAllLocalPatchUseLog() : void
      {
         var _loc3_:PatchUseLogData = null;
         var _loc4_:Object = null;
         var _loc1_:PatchUseLogModel = new PatchUseLogModel();
         var _loc2_:Array = _loc1_.find("","id ASC");
         for each(_loc4_ in _loc2_)
         {
            ++this.postCounter;
            _loc3_ = new PatchUseLogData(_loc4_.guid,_loc4_.patch_name);
            this.postPatchUseLog(_loc3_);
         }
         _loc1_.del();
      }
      
      private function postAllLocalLivesetAddLog() : void
      {
         var _loc3_:LivesetAddData = null;
         var _loc4_:Object = null;
         var _loc1_:LivesetAddLogModel = new LivesetAddLogModel();
         var _loc2_:Array = _loc1_.find("","id ASC");
         for each(_loc4_ in _loc2_)
         {
            ++this.postCounter;
            _loc3_ = new LivesetAddData(_loc4_.guid,_loc4_.liveset_name);
            this.postLivesetAddLog(_loc3_);
         }
         _loc1_.del();
      }
      
      public function writeLog(param1:String) : void
      {
         if(!this.logEnabled)
         {
            return;
         }
         try
         {
            this.stream.writeUTFBytes(param1 + "\n");
         }
         catch(e:Error)
         {
         }
      }
      
      public function closeDebugLog() : void
      {
         this.stream.close();
      }
   }
}

class Blocker
{
   
   public function Blocker()
   {
      super();
   }
}
