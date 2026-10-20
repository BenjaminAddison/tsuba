package tonecentral
{
   import com.adobe.utils.LocaleUtil;
   import flash.desktop.NativeApplication;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.events.UncaughtErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.collections.ArrayCollection;
   import mx.events.FlexEvent;
   import mx.managers.ToolTipManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import tonecentral.common.data.Config;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.manager.LogManager;
   import tonecentral.common.manager.TCLiveSetManager;
   import tonecentral.common.net.NetworkManager;
   import tonecentral.common.net.PresetArtworkLoader;
   import tonecentral.common.net.URLDefinitionLoader;
   import tonecentral.components.popup.ConnectPortSelectPopup;
   import tonecentral.components.popup.HighCommunicationLevelPopup;
   import tonecentral.components.popup.LowCommunicationLevelPopup;
   import tonecentral.components.popup.NotConnectedDevicePopup;
   import tonecentral.components.popup.SelectDevicePopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.KeyboardMediator;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.QuickSettingParams;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class ToneCentralLogic extends ViewLogic
   {
      
      private var view:BOSS_TONE_STUDIO_for_KATANA;
      
      private var _sysex:SystemExclusive;
      
      private var appMng:ApplicationManager;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var keyboardMed:KeyboardMediator;
      
      private var startingProcessCompleted:Boolean = false;
      
      private var keyboradMed:KeyboardMediator;
      
      private var copyPatches:Vector.<PatchData>;
      
      private var resourceMng:IResourceManager;
      
      private var config:Config;
      
      private var logManager:LogManager;
      
      private var liveSetManager:TCLiveSetManager;
      
      private var urlDefLoader:URLDefinitionLoader;
      
      private var presetArtworkLoader:PresetArtworkLoader;
      
      private var netMng:NetworkManager;
      
      private var notConnectedDevicePopup:NotConnectedDevicePopup;
      
      private var healthCheckTimer:Timer;
      
      private var disconnectHealthCheckTimer:Timer;
      
      private var systemRequestCount:int = 0;
      
      private var midiRequestCount:int = 0;
      
      private var isLoadedInfo:Boolean;
      
      private var timeoutTimer:Timer = new Timer(3000);
      
      private var retryCount:int = 0;
      
      private var selectDeviceData:Object;
      
      private var deviceList:Array;
      
      private var copyFrom:String;
      
      private var connectTimeOutTimer:Timer;
      
      private var getSetupTimeoutTimer:Timer;
      
      public function ToneCentralLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = BOSS_TONE_STUDIO_for_KATANA(param1);
      }
      
      override protected function onInitialized() : void
      {
         Context.init();
         Context.dialogMng.parent = this.view;
         this.view.addEventListener(FlexEvent.APPLICATION_COMPLETE,this.onAppComp,false,0,true);
      }
      
      private function onAppComp(param1:FlexEvent) : void
      {
         this.view.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.uncaughtErrorHandler,false,0,true);
         this.netMng = NetworkManager.getInstance();
         this.netMng.monitorStart(URLDefinition.DEFINITION_URL#1);
         this.appMng = ApplicationManager.getInstance();
         this.appMng.addEventListener(ToneCentralEvents.DEVICE_PORT_SELECTED,this.devicePortSelectedHandler,false,0,true);
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.appWindowHeight = this.view.height;
         this.mediator.isWindows = Capabilities.os.toLowerCase().indexOf("windows") != -1;
         this.logManager = LogManager.getInstance();
         if(!this.logManager.guid)
         {
            this.mediator.isInitInstall = true;
         }
         this.logManager.setGUID();
         this.liveSetManager = TCLiveSetManager.getInstance();
         this.liveSetManager.restoreAllLiveSet();
         this.config = new Config();
         this.mediator.conf = this.config;
         this.addressMap = AddressMap.getInstance();
         this.keyboardMed = KeyboardMediator.getInstance();
         this.iniResource();
         NativeApplication.nativeApplication.addEventListener(Event.EXITING,this.exitingHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.ERROR_EXIT,this.errorExitHandler,false,0,true);
         this._sysex = SystemExclusive.getInstance();
         this.mediator.sysex = this._sysex;
         this.view.sideArea.addEventListener(ToneCentralEvents.MODE_CHANGE,this.modeChangeHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.SELECT,this.sideAreaSelectHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.SHOW_INFO,this.showInfoHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.HIDE_INFO,this.hideInfoHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.DRAG_START,this.sideAreaPatchDragStartHandler,false,0,true);
         this.view.sideArea.addEventListener(ToneCentralEvents.DRAG_COMPLETE,this.sideAreaPatchDragCompleteHandler,false,0,true);
         this.view.contentsArea.addEventListener(ToneCentralEvents.SELECT,this.contentsAreaSelectHandler,false,0,true);
         this.view.contentsArea.addEventListener(ToneCentralEvents.UNSELECT,this.contentsAreaUnselectHandler,false,0,true);
         this.view.contentsArea.addEventListener(ToneCentralEvents.DEVICE_SETTING,this.contentsAreaDeviceSettingHandler,false,0,true);
         this.view.contentsArea.addEventListener(ToneCentralEvents.APPLY_LIVESET,this.applyLivesetHandler,false,0,true);
         this.view.contentsArea.addEventListener(ToneCentralEvents.DRAG_COMPLETE,this.contentsAreaDragCompleteHandler,false,0,true);
         this.view.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,false,0,true);
         this.view.infoArea.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.infoLoadCompleteHandler,false,0,true);
         this.view.infoArea.addEventListener(ToneCentralEvents.HIDE_INFO,this.clickOutsideHideInfoHandler,false,0,true);
         this.view.addEventListener(Event.RESIZE,this.windowResize,false,0,true);
         this.urlDefLoader = new URLDefinitionLoader();
         this.urlDefLoader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.urlDefLoadCompleteHandler,false,0,true);
         this.urlDefLoader.load();
         this.mediator.addEventListener(ToneCentralEvents.SHOW_LOADING,this.showLoadingHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.HIDE_LOADING,this.hideLoadingHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.SHOW_ADD_LIVESET_MSG,this.showAddLivesetMsgHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.HIDE_ADD_LIVESET_MSG,this.hideAddLivesetMsgHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.CHANGE_CURRENT_PATCH,this.patchChangedHandler,false,0,true);
         this.healthCheckTimer = new Timer(ToneCentralDefinition.HEALTH_CHECK_TIME);
         this.healthCheckTimer.addEventListener(TimerEvent.TIMER,this.healthCheck,false,0,true);
         this.view.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.keyFocusChangeHandler,false,0,true);
         this.disconnectHealthCheckTimer = new Timer(ToneCentralDefinition.HEALTH_CHECK_TIME);
         this.disconnectHealthCheckTimer.addEventListener(TimerEvent.TIMER,this.disconnectHealthCheck,false,0,true);
         this.connectTimeOutTimer = new Timer(5000);
         this.connectTimeOutTimer.addEventListener(TimerEvent.TIMER,this.connectTimeoutTimerHandler,false,0,true);
         this.getSetupTimeoutTimer = new Timer(5000);
         this.getSetupTimeoutTimer.addEventListener(TimerEvent.TIMER,this.getSetupTimeoutTimerHandler,false,0,true);
         ToolTipManager.showDelay = 0;
         var _loc2_:int = Capabilities.screenResolutionX / 2 - this.view.width / 2;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:int = Capabilities.screenResolutionY / 2 - this.view.height / 2;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         this.view.nativeWindow.x = _loc2_;
         this.view.nativeWindow.y = _loc3_;
      }
      
      private function keyFocusChangeHandler(param1:FocusEvent) : void
      {
         if(!ToneCentralMediator.getInstance().connected)
         {
            param1.preventDefault();
         }
      }
      
      private function contentsAreaDragCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.view.sideArea.contentsAreaDragComplete();
      }
      
      private function sideAreaPatchDragStartHandler(param1:ToneCentralEvents) : void
      {
         this.view.contentsArea.sidePatchDragStart();
      }
      
      private function applyLivesetHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:Vector.<PatchData> = param1.data as Vector.<PatchData>;
         this.view.sideArea.applyLiveset(_loc2_);
      }
      
      private function sideAreaPatchDragCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.view.contentsArea.sidePatchDragComplete();
      }
      
      private function uncaughtErrorHandler(param1:UncaughtErrorEvent) : void
      {
         var _loc2_:String = null;
         if(param1.error is Error)
         {
            _loc2_ = Error(param1.error).message;
         }
         else if(param1.error is ErrorEvent)
         {
            _loc2_ = ErrorEvent(param1.error).text;
         }
         else
         {
            _loc2_ = param1.error.toString();
         }
         this.logManager.logError("uncaughtError",_loc2_);
         param1.preventDefault();
      }
      
      public function windowResize(param1:Event) : void
      {
         if(!this.mediator)
         {
            return;
         }
         this.mediator.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.WINDOW_RESIZE));
      }
      
      public function updateDisplayList(param1:Number, param2:Number) : void
      {
         this.setAppWindowHeight();
      }
      
      private function setAppWindowHeight() : void
      {
         if(this.mediator)
         {
            this.mediator.appWindowHeight = this.view.height;
         }
      }
      
      private function iniResource() : void
      {
         var _loc2_:Array = null;
         var _loc1_:String = SharedObjectUtil.get(ToneCentralDefinition.CONF_LANGUAGE) as String;
         if(_loc1_)
         {
            _loc2_ = [_loc1_];
         }
         else
         {
            _loc2_ = Capabilities.languages;
         }
         var _loc3_:Array = LocaleUtil.sortLanguagesByPreference(ToneCentralDefinition.LANG_TYPE,_loc2_,ToneCentralDefinition.LANG_TYPE[0]);
         ResourceManager.getInstance().localeChain = _loc3_;
         this.mediator.conf.confLanguage = _loc3_[0];
      }
      
      private function urlDefLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.createPresetArtwork();
         this.keyboradMed = KeyboardMediator.getInstance();
         this.keyboradMed.addEventListener(ToneCentralEvents.COPY,this.copyHandler,false,0,true);
         this.keyboradMed.addEventListener(ToneCentralEvents.PASTE,this.pasteHandler,false,0,true);
         this.logData();
         this.getAddressMap();
         this.view.sideArea.loadTags();
         this.selectDeviceList();
         this.removeEditMenu();
      }
      
      private function createPresetArtwork() : void
      {
         this.presetArtworkLoader = new PresetArtworkLoader();
         this.presetArtworkLoader.load();
      }
      
      private function getAddressMap() : void
      {
         var _loc1_:String = URLDefinition.ADDRESS_MAP + URLDefinition.ADDRESS_MAP_FILE_NAME;
         var _loc2_:File = new File(_loc1_);
         var _loc3_:FileStream = new FileStream();
         _loc3_.open(_loc2_,FileMode.READ);
         var _loc4_:String = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
         _loc3_.close();
         this.addressMap.addressObj = JSON.parse(_loc4_);
      }
      
      private function removeEditMenu() : void
      {
         var _loc1_:NativeMenu = null;
         var _loc2_:int = 0;
         var _loc3_:NativeMenuItem = null;
         if(NativeApplication.supportsMenu)
         {
            _loc1_ = this.view.nativeApplication.menu;
            _loc2_ = 0;
            while(_loc2_ < _loc1_.items.length)
            {
               _loc3_ = _loc1_.items[_loc2_];
               if(_loc3_.label == "編集")
               {
                  _loc1_.removeItem(_loc3_);
               }
               _loc2_++;
            }
         }
      }
      
      private function logUserData() : void
      {
         this.logManager.logUser();
      }
      
      private function logData() : void
      {
         this.logManager.logUser();
         this.logManager.postInvoke();
         this.logManager.logUpdate();
      }
      
      private function selectDeviceList() : void
      {
         var deviceData:Object = null;
         var path:String = null;
         var file:File = null;
         try
         {
            this.deviceList = this._sysex.createDeviceList();
            deviceData = this.getSavedDeviceData(this.deviceList);
            if(deviceData)
            {
               if(this._sysex.setDeviceData(deviceData))
               {
                  SharedObjectUtil.set(ToneCentralDefinition.DEVICE_DATA,deviceData);
                  this.resetPrevDeviceData();
                  this.connect();
               }
               else
               {
                  this.openDeviceListPopup();
                  this.loadInfo();
               }
            }
            else
            {
               this.openDeviceListPopup();
               this.loadInfo();
            }
         }
         catch(e:Error)
         {
            if(Capabilities.os.substring(0,3) == "Mac")
            {
               path = File.userDirectory.nativePath + "/Library/Preferences/BOSS-TONE-STUDIO-for-KATANA/Local Store/#SharedObjectts/BOSS_TONE_STUDIO_for_KATGT.swf/device_data.sol";
            }
            else if(Capabilities.os.substring(0,3) == "Win")
            {
               path = File.userDirectory.nativePath + "/Application DataMacromediaFlash Player#SharedObjects/BOSS_TONE_STUDIO_for_KATANA.swf/device_data.sol";
            }
            file = new File(path);
            if(Boolean(file) && Boolean(file.exists))
            {
               file.deleteFile();
            }
            openDeviceListPopup();
         }
         this.mediator.addEventListener(ToneCentralEvents.DEVICE_LIST_SELECTED,this.selectedDevice,false,0,true);
      }
      
      private function getSavedDeviceData(param1:Array) : Object
      {
         var _loc2_:Object = SharedObjectUtil.get(ToneCentralDefinition.DEVICE_DATA);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc2_.deviceName == param1[_loc3_].deviceName)
            {
               return param1[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function openDeviceListPopup() : void
      {
         var _loc1_:SelectDevicePopup = null;
         this.deviceList = this._sysex.createDeviceList();
         if(!this.checkTragetDevice())
         {
            if(!this.notConnectedDevicePopup)
            {
               this.notConnectedDevicePopup = new NotConnectedDevicePopup();
               this.notConnectedDevicePopup.addEventListener(ToneCentralEvents.OK,this.notConnectedDevicePopupOKHandler,false,0,true);
               this.notConnectedDevicePopup.addEventListener(ToneCentralEvents.CANCEL,this.notConnectedDevicePopupCancelHandler,false,0,true);
               Context.dialogMng.show(this.notConnectedDevicePopup,true);
            }
         }
         else
         {
            if(this.notConnectedDevicePopup)
            {
               this.notConnectedDevicePopup.close();
               this.notConnectedDevicePopup = null;
            }
            _loc1_ = new SelectDevicePopup(this.deviceList);
            _loc1_.addEventListener(ToneCentralEvents.CANCEL,this.selectDevicePopUpCancelHandler,false,0,true);
            Context.dialogMng.show(_loc1_,true);
            this.mediator.showSelectDevice();
         }
      }
      
      private function checkTragetDevice() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.deviceList.length)
         {
            if(this.deviceList[_loc1_].deviceName.indexOf("KATANA") != -1)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function openConnectPortSelectPopup() : void
      {
         var _loc1_:ConnectPortSelectPopup = new ConnectPortSelectPopup();
         _loc1_.addEventListener(ToneCentralEvents.DEVICE_PORT_SELECTED,this.devicePortSelectedHandler,false,0,true);
         _loc1_.addEventListener(ToneCentralEvents.CANCEL,this.devicePortSelectCancelHandler,false,0,true);
         _loc1_.addEventListener(ToneCentralEvents.DEVICE_PORT_REFRESH,this.devicePortRefreshHandler,false,0,true);
         Context.dialogMng.show(_loc1_,true);
      }
      
      private function devicePortRefreshHandler(param1:Event) : void
      {
         this.openConnectPortSelectPopup();
      }
      
      private function devicePortSelectedHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.setEditorComunicationModeFunc(false);
         this.selectDeviceData = param1.data;
         var _loc2_:Timer = new Timer(1000,1);
         _loc2_.addEventListener(TimerEvent.TIMER,this.devicePortSelectedDelayHandler,false,0,true);
         _loc2_.start();
      }
      
      private function devicePortSelectedDelayHandler(param1:TimerEvent) : void
      {
         if(this.mediator.sysex.setDeviceData(this.selectDeviceData))
         {
            SharedObjectUtil.set(ToneCentralDefinition.DEVICE_DATA,this.selectDeviceData);
            this.resetPrevDeviceData();
            this.connect();
         }
         else
         {
            this.openConnectPortSelectPopup();
            this.hideLoading();
         }
      }
      
      private function devicePortSelectCancelHandler(param1:ToneCentralEvents) : void
      {
         this.changeDisconnectMode();
      }
      
      private function contentsAreaDeviceSettingHandler(param1:ToneCentralEvents) : void
      {
         this.openDeviceListPopup();
         this.healthCheckTimer.reset();
      }
      
      private function selectDevicePopUpCancelHandler(param1:ToneCentralEvents) : void
      {
         this.deviceList = this.mediator.sysex.createDeviceList();
         this.changeDisconnectMode();
      }
      
      private function notConnectedDevicePopupCancelHandler(param1:ToneCentralEvents) : void
      {
         this.notConnectedDevicePopup = null;
         this.changeDisconnectMode();
      }
      
      private function loadIncludePresetPatch() : void
      {
         var _loc8_:PatchData = null;
         var _loc1_:File = File.applicationDirectory.resolvePath("_assets/data/katana_preset_patches.tsl");
         var _loc2_:FileStream = new FileStream();
         _loc2_.open(_loc1_,FileMode.READ);
         var _loc3_:Object = JSON.parse(_loc2_.readUTFBytes(_loc2_.bytesAvailable));
         var _loc4_:Array = _loc3_.patchList;
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc8_ = PatchData.restore(_loc4_[_loc6_]);
            if(_loc6_ + 1 < 10)
            {
               if(_loc6_ == 0)
               {
                  _loc8_.patchNo = "PANEL";
               }
               else if(_loc6_ <= 4)
               {
                  _loc8_.patchNo = "A: CH" + _loc6_;
               }
               else
               {
                  _loc8_.patchNo = "B: CH" + (_loc6_ - 4);
               }
            }
            else
            {
               _loc8_.patchNo = (_loc6_ + 1).toString();
            }
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         this._sysex.params.patchlistParams = new ArrayCollection(_loc5_);
         this.view.sideArea.setEditorPatchList();
         this._sysex.params.temporaryParams = PatchData(_loc5_[0]).params;
         var _loc7_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY);
         this.mediator.sysex.dispatchEvent(_loc7_);
      }
      
      private function notConnectedDevicePopupOKHandler(param1:ToneCentralEvents) : void
      {
         this.openDeviceListPopup();
      }
      
      private function selectedDevice(param1:ToneCentralEvents) : void
      {
         if(Boolean(param1.data) && this._sysex.setDeviceData(param1.data))
         {
            SharedObjectUtil.set(ToneCentralDefinition.DEVICE_DATA,param1.data);
            this.resetPrevDeviceData();
            this.connect();
         }
         else
         {
            this.openConnectPortSelectPopup();
            this.hideLoading();
         }
      }
      
      private function resetPrevDeviceData() : void
      {
         this._sysex.params.patchlistParams = new ArrayCollection();
         this._sysex.params.quickSettingParams = new Vector.<QuickSettingParams>();
         this._sysex.addEventListener(ToneCentralEvents.PARAM_TEMPORARY_PATCH_RECEIVED,this.initTemporaryPatchReceivedHandler);
      }
      
      private function connect() : void
      {
         this._sysex.addEventListener(ToneCentralEvents.RECOGNIZED,this.recognizedHandler,false,0,true);
         this._sysex.addEventListener(ToneCentralEvents.CONNECT_FAULT,this.connectFaultHandler,false,0,true);
         this._sysex.connect();
         this.connectTimeOutTimer.start();
         this._sysex.addEventListener(ToneCentralEvents.RETRY_ERROR,this.retryErrorHandler,false,0,true);
         this.mediator.isInitLoading = true;
         this.mediator.isInited = false;
         this.showLoading();
      }
      
      private function retryErrorHandler(param1:ToneCentralEvents) : void
      {
         this._sysex.removeEventListener(ToneCentralEvents.RETRY_ERROR,this.retryErrorHandler);
         this.mediator.isInitLoading = false;
         this.hideLoading();
         this.changeDisconnectMode();
      }
      
      private function recognizedHandler(param1:ToneCentralEvents) : void
      {
         this.connectTimeOutTimer.reset();
         this._sysex.removeEventListener(ToneCentralEvents.RECOGNIZED,this.recognizedHandler);
         this._sysex.removeEventListener(ToneCentralEvents.CONNECT_FAULT,this.connectFaultHandler);
         this._sysex.addEventListener(ToneCentralEvents.EDITOR_COMUNICATION_LEVEL_RECEIVED,this.editorComunicationLevelReceivedHandler,false,0,true);
         this._sysex.getEditorComunicationLevelFunc();
      }
      
      private function connectFaultHandler(param1:ToneCentralEvents) : void
      {
         this.connectTimeOutTimer.reset();
         this._sysex.removeEventListener(ToneCentralEvents.RECOGNIZED,this.recognizedHandler);
         this._sysex.removeEventListener(ToneCentralEvents.CONNECT_FAULT,this.connectFaultHandler);
         this.openConnectPortSelectPopup();
         this.hideLoading();
      }
      
      private function connectTimeoutTimerHandler(param1:TimerEvent) : void
      {
         this.connectTimeOutTimer.reset();
         this.openConnectPortSelectPopup();
         this.hideLoading();
      }
      
      private function getSetupTimeoutTimerHandler(param1:TimerEvent) : void
      {
         this.getSetupTimeoutTimer.reset();
         this.openConnectPortSelectPopup();
         this.hideLoading();
      }
      
      private function editorComunicationLevelReceivedHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:LowCommunicationLevelPopup = null;
         var _loc3_:Timer = null;
         var _loc4_:HighCommunicationLevelPopup = null;
         this._sysex.removeEventListener(ToneCentralEvents.EDITOR_COMUNICATION_LEVEL_RECEIVED,this.editorComunicationLevelReceivedHandler);
         this._sysex.setEditorComunicationModeFunc(true);
         switch(this.mediator.sysex.params.editorComunicationLevel)
         {
            case "00":
            case "01":
            case "02":
            case "03":
            case "04":
               _loc2_ = new LowCommunicationLevelPopup();
               _loc2_.popup(this.view);
               _loc2_.addEventListener(ToneCentralEvents.CANCEL,this.lowCommunicationLevelCancelHandler,false,0,true);
               this.hideLoading();
               break;
            case "05":
               _loc3_ = new Timer(100,1);
               _loc3_.addEventListener(TimerEvent.TIMER,this.editorComunicationModeSetDelayHandler,false,0,true);
               _loc3_.start();
               break;
            default:
               _loc4_ = new HighCommunicationLevelPopup();
               _loc4_.popup(this.view);
               _loc4_.addEventListener(ToneCentralEvents.CANCEL,this.highCommunicationLevelCancelHandler,false,0,true);
               this.hideLoading();
         }
      }
      
      private function highCommunicationLevelCancelHandler(param1:ToneCentralEvents) : void
      {
         this.changeDisconnectMode();
      }
      
      private function lowCommunicationLevelCancelHandler(param1:ToneCentralEvents) : void
      {
         this.changeDisconnectMode();
      }
      
      private function editorComunicationModeSetDelayHandler(param1:TimerEvent) : void
      {
         this._sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_LIST_RECEIVED,this.patchListReceivedHandler,false,0,true);
         this._sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_LIST_FAULT,this.patchListFaultHandler,false,0,true);
         this._sysex.listIndex = 0;
         this._sysex.getPatchListNamesFunc();
      }
      
      private function patchListFaultHandler(param1:ToneCentralEvents) : void
      {
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_LIST_RECEIVED,this.patchListReceivedHandler);
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_LIST_FAULT,this.patchListFaultHandler);
         this.hideLoading();
      }
      
      private function patchListReceivedHandler(param1:ToneCentralEvents) : void
      {
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_LIST_RECEIVED,this.patchListReceivedHandler);
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_PATCH_LIST_FAULT,this.patchListFaultHandler);
         this.retryCount = 0;
         this._sysex.addEventListener(ToneCentralEvents.PARAM_SYSTEM_RECEIVED,this.initSystemReceivedHandler,false,0,true);
         this._sysex.getSystemParamsFunc(this.systemRequestCount);
      }
      
      private function initSystemReceivedHandler(param1:ToneCentralEvents) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.systemLoadTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.systemRequestCount;
         if(this.systemRequestCount < this.mediator.sysex.systemDecimalPatchSize.length)
         {
            this._sysex.getSystemParamsFunc(this.systemRequestCount);
            this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.systemLoadTimeoutHandler,false,0,true);
            this.timeoutTimer.start();
            return;
         }
         this.systemRequestCount = 0;
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_SYSTEM_RECEIVED,this.initSystemReceivedHandler);
         if(this.mediator.sysex.params.system.global_eq_setting_type)
         {
            this.mediator.sysex.setDataFunc("00,00,04,3F","00");
            this.mediator.sysex.setDataFunc("00,00,04,3F","01");
         }
         this._sysex.addEventListener(ToneCentralEvents.PARAM_SYSTEM_RECEIVED,this.systemReceivedHandler,false,0,true);
         this.retryCount = 0;
         this._sysex.addEventListener(ToneCentralEvents.PARAM_TEMPORARY_PATCH_RECEIVED,this.initTemporaryPatchReceivedHandler,false,0,true);
         this._sysex.getTemporaryPatchParamsFunc();
      }
      
      private function systemLoadTimeoutHandler(param1:TimerEvent) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.systemLoadTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.retryCount;
         if(this.retryCount < 6)
         {
            this._sysex.getSystemParamsFunc(this.systemRequestCount);
            this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.systemLoadTimeoutHandler,false,0,true);
            this.timeoutTimer.start();
         }
         else
         {
            this._sysex.showAppErrorDialog();
         }
      }
      
      private function initTemporaryPatchReceivedHandler(param1:ToneCentralEvents) : void
      {
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_TEMPORARY_PATCH_RECEIVED,this.initTemporaryPatchReceivedHandler);
         this._sysex.addEventListener(ToneCentralEvents.PARAM_SETUP_RECEIVED,this.setupReceivedHandler,false,0,true);
         this._sysex.getSetupParamsFunc();
         this.getSetupTimeoutTimer.start();
      }
      
      private function setupReceivedHandler(param1:ToneCentralEvents) : void
      {
         this.getSetupTimeoutTimer.reset();
         this.retryCount = 0;
         this._sysex.removeEventListener(ToneCentralEvents.PARAM_SETUP_RECEIVED,this.setupReceivedHandler);
         this.startingProcessCompleteHandler();
      }
      
      private function startingProcessCompleteHandler() : void
      {
         this.hideLoading();
         var _loc1_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY);
         this.mediator.sysex.dispatchEvent(_loc1_);
         this.startingProcessCompleted = true;
         this.mediator.connected = true;
         this.mediator.isInitLoading = false;
         this.isLoadedInfo = false;
         this.loadInfo();
         this.healthChaeckIni();
         this.view.sideArea.setEditorPatchList();
         this.mediator.isInited = true;
         this.mediator.addEventListener(ToneCentralEvents.SETTING_DEVICE_SELECTED,this.changeDevice,false,0,true);
         this._sysex.removeEventListener(ToneCentralEvents.RETRY_ERROR,this.retryErrorHandler);
         this.mediator.sysex.getRunningMode();
         this.mediator.sysex.getManualMode();
      }
      
      private function loadInfo() : void
      {
         if(!this.isLoadedInfo)
         {
            this.view.infoArea.loadData();
            this.isLoadedInfo = true;
         }
      }
      
      private function healthChaeckIni() : void
      {
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.disconnectErrorHandler,false,0,true);
         this.healthCheckTimer.start();
      }
      
      private function disconnectErrorHandler(param1:ToneCentralEvents) : void
      {
         this.healthCheckTimer.reset();
         this.openDeviceListPopup();
      }
      
      private function changeDisconnectMode() : void
      {
         this.isLoadedInfo = false;
         this.disconnectHealthCheckTimer.start();
         this.mediator.connected = false;
         this.appMng.changeDemoMode();
         this.loadIncludePresetPatch();
         this.mediator.isInited = true;
         this.loadInfo();
         this.mediator.addEventListener(ToneCentralEvents.SETTING_DEVICE_SELECTED,this.changeDevice,false,0,true);
      }
      
      private function connectedHandler(param1:ToneCentralEvents) : void
      {
         this.disconnectHealthCheckTimer.reset();
      }
      
      private function disconnectHealthCheck(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         if(this.deviceList)
         {
            _loc2_ = int(this.deviceList.length);
         }
         this.deviceList = this.mediator.sysex.createDeviceList();
         if(this.deviceList.length > 0 && this.deviceList.length > _loc2_)
         {
            this.openDeviceListPopup();
            this.disconnectHealthCheckTimer.reset();
         }
      }
      
      private function healthCheck(param1:TimerEvent) : void
      {
         this.deviceCheck();
      }
      
      private function deviceCheck() : void
      {
         this.currentDeviceAlived();
      }
      
      private function checkCurrentDevice(param1:Object) : void
      {
         var prevConnectStatus:Boolean = false;
         var deviceData:Object = param1;
         try
         {
            if(deviceData)
            {
               prevConnectStatus = this.mediator.connected;
               if(!prevConnectStatus)
               {
                  this._sysex.createDeviceList();
                  if(this._sysex.setDeviceData(deviceData))
                  {
                     this.resetPrevDeviceData();
                     this.connect();
                  }
               }
            }
            else
            {
               this.mediator.connected = false;
               this.hideLoading();
            }
         }
         catch(e:Error)
         {
            mediator.connected = false;
            hideLoading();
         }
      }
      
      private function currentDeviceAlived() : void
      {
         var _loc2_:Object = null;
         var _loc5_:int = 0;
         var _loc1_:Boolean = false;
         var _loc3_:Array = this._sysex.createDeviceList(false);
         var _loc4_:Object = SharedObjectUtil.get(ToneCentralDefinition.DEVICE_DATA);
         if(_loc4_)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(Boolean(_loc3_[_loc5_] && _loc3_[_loc5_].midiInName == _loc4_.midiInName && _loc3_[_loc5_].midiOutName == _loc4_.midiOutName) && Boolean(_loc3_[_loc5_].audioInName == _loc4_.audioInName) && _loc3_[_loc5_].audioOutName == _loc4_.audioOutName)
               {
                  _loc2_ = _loc3_[_loc5_];
                  _loc1_ = true;
                  break;
               }
               _loc5_++;
            }
         }
         this.checkCurrentDevice(_loc2_);
      }
      
      private function systemReceivedHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SETTING_SYSTEM_LOADED));
      }
      
      private function patchChangedHandler(param1:ToneCentralEvents) : void
      {
      }
      
      private function changeDevice(param1:ToneCentralEvents) : void
      {
         this.startingProcessCompleted = false;
         this.mediator.sysex.listIndex = 0;
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DEVICE_LIST_SELECTED);
         _loc2_.data = param1.data;
         this.mediator.dispatchEvent(_loc2_);
      }
      
      private function modeChangeHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.contentsAreaMode = this.view.sideArea.mode;
         this.view.contentsArea.mode = this.view.sideArea.mode;
      }
      
      private function sideAreaSelectHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.selectedArea = ToneCentralDefinition.SIDE_AREA;
         this.view.contentsArea.resetSelected();
      }
      
      private function showInfoHandler(param1:ToneCentralEvents) : void
      {
         this.view.infoArea.visible = true;
      }
      
      private function hideInfoHandler(param1:ToneCentralEvents) : void
      {
         this.view.infoArea.visible = false;
      }
      
      private function clickOutsideHideInfoHandler(param1:ToneCentralEvents) : void
      {
         this.view.sideArea.infoHide();
      }
      
      private function infoLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.view.sideArea.infoLoadComplete(this.view.infoArea.infoCount);
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY);
         this.mediator.sysex.dispatchEvent(_loc2_);
      }
      
      private function contentsAreaUnselectHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.selectedArea = ToneCentralDefinition.SIDE_AREA;
      }
      
      private function contentsAreaSelectHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.selectedArea = ToneCentralDefinition.CONTENTS_AREA;
         this.view.sideArea.resetSelected();
      }
      
      private function pasteHandler(param1:ToneCentralEvents) : void
      {
         if(this.mediator.selectedArea == ToneCentralDefinition.CONTENTS_AREA)
         {
            this.view.contentsArea.patchPaste(this.copyPatches,this.copyFrom);
         }
         else if(this.copyFrom == ToneCentralDefinition.CONTENTS_AREA)
         {
            this.view.sideArea.patchPaste(this.copyPatches);
         }
      }
      
      private function copyHandler(param1:ToneCentralEvents) : void
      {
         if(this.mediator.selectedArea == ToneCentralDefinition.CONTENTS_AREA)
         {
            this.copyFrom = ToneCentralDefinition.CONTENTS_AREA;
            this.copyPatches = this.view.contentsArea.patchCopy();
         }
         else
         {
            this.copyFrom = ToneCentralDefinition.SIDE_AREA;
            this.copyPatches = this.view.sideArea.patchCopy();
         }
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         this.keyboardMed.onKeyDown(param1);
      }
      
      private function errorExitHandler(param1:ToneCentralEvents) : void
      {
         this.doExit();
      }
      
      private function exitingHandler(param1:Event) : void
      {
         param1.preventDefault();
         this.doExit();
      }
      
      private function doExit() : void
      {
         this._sysex.PLAYER_pauseSound();
         this._sysex.PLAYER_closeSound();
         this._sysex.commandSetUsbDirectMon("01");
         this._sysex.setEditorComunicationModeFunc(false);
         this.healthCheckTimer.reset();
         var _loc1_:Timer = new Timer(10000);
         _loc1_.addEventListener(TimerEvent.TIMER,this.exitTimerHandler,false,0,true);
         _loc1_.start();
         this.logManager.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.quitLogCompleteHandler,false,0,true);
         this.logManager.addEventListener(ToneCentralEvents.LOAD_FAULT,this.quitLogCompleteHandler,false,0,true);
         this.logManager.postQuit();
      }
      
      private function exitTimerHandler(param1:TimerEvent) : void
      {
         this._sysex.dispose();
         this.view.exit();
      }
      
      private function quitLogCompleteHandler(param1:ToneCentralEvents) : void
      {
         this._sysex.dispose();
         this.view.exit();
      }
      
      private function showLoadingHandler(param1:ToneCentralEvents) : void
      {
         this.showLoading();
      }
      
      private function showLoading() : void
      {
         this.view.loading.visible = true;
      }
      
      private function hideLoadingHandler(param1:ToneCentralEvents) : void
      {
         this.hideLoading();
      }
      
      private function hideLoading() : void
      {
         this.view.loading.visible = false;
      }
      
      private function showAddLivesetMsgHandler(param1:ToneCentralEvents) : void
      {
         this.view.addLivesetMsgArea.showMsg();
      }
      
      private function hideAddLivesetMsgHandler(param1:ToneCentralEvents) : void
      {
         this.view.addLivesetMsgArea.hideMsg();
      }
   }
}

