package tonecentral.systemexclusive
{
   import com.roland.rwc.Rwc;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.events.TimerEvent;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import mx.collections.ArrayCollection;
   import mx.utils.ObjectUtil;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.LogManager;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.DelayTimer;
   import tonecentral.components.popup.AppErrorPopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.QuickSettingParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class SystemExclusive extends EventDispatcher
   {
      
      private static var instance:SystemExclusive;
      
      private static const SYSTEM_TOTAL_SIZE:Number = 10;
      
      private static const ONE_PATCH_SIZE:Number = 71;
      
      private static const ONE_PATCH_NAME_SIZE:Number = 15;
      
      private var _id:String;
      
      private var extension:Rwc;
      
      private var _params:SysExParams;
      
      private var _connected:Boolean;
      
      private var dictArray:Array = [];
      
      private var midiInputDictArray:Array = [];
      
      private var midiOutputDictArray:Array = [];
      
      private var audioInputDictArray:Array = [];
      
      private var audioOutputDictArray:Array = [];
      
      private var midiInputSelectKey:String = "";
      
      private var midiOutputSelectKey:String = "";
      
      private var audioInputSelectKey:String = "";
      
      private var audioOutputSelectKey:String = "";
      
      private var paramName:String;
      
      private var _address:String;
      
      private var _size:String;
      
      private var _param:String;
      
      private var _response:String;
      
      private var _command:String;
      
      private var addressMap:AddressMap;
      
      private var _listIndex:int = 0;
      
      private var _patchIDMap:Array = [];
      
      private var deviceName:String;
      
      private var _patchChangeFlag:Boolean;
      
      private var _patchClearFlag:Boolean;
      
      private var patchAddressList:Array = [];
      
      private var patchRequestCount:uint = 0;
      
      private var patchMapRequestCount:uint = 0;
      
      private var quickSettingRequestCount:int = -1;
      
      private var quickSettingPatchCount:int = 0;
      
      private var _loadedParams:TemporaryParams;
      
      private var setTemporaryTimer:Timer = new Timer(30);
      
      private var setParam:TemporaryParams;
      
      private var updateTemporaryCallbacks:Array = [];
      
      private var updateSystemCallbacks:Array = [];
      
      private var requestAddressList:Array = [];
      
      public var temporaryDecimalPatchSize:Array;
      
      public var systemDecimalPatchSize:Array;
      
      private var patchMapAddress:Array;
      
      private var patchMapDataList:Array;
      
      private var quickSettingAddress:Array;
      
      public var quickSettingPatchAddress:Array;
      
      private var getTemporaryPatchSize:Array;
      
      private var paramArray:Array;
      
      private var deviceArray:Array;
      
      private var deviceData:Object;
      
      private var gtDeviceName:String;
      
      private var logMng:LogManager;
      
      public var selectedListIndex:int;
      
      public var debug:String;
      
      private var _temporaryAllUpdate:Boolean = false;
      
      private var temporaryRequestCount:int;
      
      private var systemRequestCount:int;
      
      private var changeDelayTimer:Timer = new Timer(100);
      
      private var _selectedDeviceData:Object;
      
      private var selectedPort:String = "primary";
      
      private var quickSettingPatchTo:int;
      
      private var _isQuickSettingLoading:Boolean = false;
      
      private var tmpUserPatchlistParams:Array;
      
      private var timeoutTimer:Timer = new Timer(3000);
      
      private var retryCount:int = 0;
      
      private var retryError:Boolean = false;
      
      public var writeStop:Boolean;
      
      private var isWriteStoped:Boolean;
      
      private var isWriteStepedGetPatchParam:Boolean;
      
      private var _isTempSending:Boolean;
      
      private var offLineParam:String;
      
      private var offLineAddress:String;
      
      private var patchChangeRetryTimer:Timer = new Timer(500);
      
      private var isGetTemporary:Boolean;
      
      private var isPatchWrite:Boolean;
      
      private var sortPatchMapTimeoutTimer:Timer = new Timer(1000);
      
      private var isPatchNameLoading:Boolean;
      
      private var isLoadingPatchWrite:Boolean;
      
      public function SystemExclusive(param1:Blocker)
      {
         super();
         if(!param1)
         {
            throw new Error("use getInstance.");
         }
         this.init();
      }
      
      public static function getInstance() : SystemExclusive
      {
         if(!instance)
         {
            instance = new SystemExclusive(new Blocker());
         }
         return instance;
      }
      
      public function get isTempSending() : Boolean
      {
         return this._isTempSending;
      }
      
      public function get selectedDeviceData() : Object
      {
         return this._selectedDeviceData;
      }
      
      public function set selectedDeviceData(param1:Object) : void
      {
         this._selectedDeviceData = param1;
      }
      
      public function get isQuickSettingLoading() : Boolean
      {
         return this._isQuickSettingLoading;
      }
      
      public function get loadedParams() : TemporaryParams
      {
         return this._loadedParams;
      }
      
      public function get patchChangeFlag() : Boolean
      {
         return this._patchChangeFlag;
      }
      
      public function get patchIDMap() : Array
      {
         return this._patchIDMap;
      }
      
      private function init() : void
      {
         this.connected = false;
         this.params = new SysExParams();
         this.extension = new Rwc();
         this.extension.addEventListener(StatusEvent.STATUS,this.onStatusEvent);
         this.addressMap = AddressMap.getInstance();
         this.blockParameterSetting();
         this.logMng = LogManager.getInstance();
         this.sortPatchMapTimeoutTimer.addEventListener(TimerEvent.TIMER,this.sortPatchMapTimeoutHandler,false,0,true);
      }
      
      private function _exchangePatchNuumber(param1:Boolean, param2:Number) : Number
      {
         var _loc3_:Number = param2;
         if(param1)
         {
            switch(param2)
            {
               default:
               case 0:
                  _loc3_ = 0;
                  break;
               case 1:
                  _loc3_ = 1;
                  break;
               case 2:
                  _loc3_ = 2;
                  break;
               case 3:
                  _loc3_ = 5;
                  break;
               case 4:
                  _loc3_ = 6;
            }
         }
         else
         {
            switch(param2)
            {
               default:
               case 0:
                  _loc3_ = 0;
                  break;
               case 1:
                  _loc3_ = 1;
                  break;
               case 2:
                  _loc3_ = 2;
                  break;
               case 5:
                  _loc3_ = 3;
                  break;
               case 6:
                  _loc3_ = 4;
            }
         }
         return _loc3_;
      }
      
      private function _exchangePatchNumberByAddressAndData(param1:Boolean, param2:String, param3:String) : Object
      {
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc4_:Object = new Object();
         _loc4_["changed"] = false;
         if(Boolean(param2) && Boolean(param3))
         {
            _loc5_ = param2.split(",");
            _loc6_ = param3.split(",");
            _loc7_ = param2;
            _loc8_ = param3;
            _loc9_ = parseInt("0x" + _loc5_[0],16);
            if(_loc9_ == 16)
            {
               _loc10_ = parseInt("0x" + _loc5_[1],16);
               _loc11_ = this._exchangePatchNuumber(param1,_loc10_);
               if(_loc10_ != _loc11_)
               {
                  _loc7_ = ToneCentralUtil.zeroPadding(_loc5_[0],2) + "," + ToneCentralUtil.zeroPadding(_loc11_.toString(16),2) + "," + ToneCentralUtil.zeroPadding(_loc5_[2],2) + "," + ToneCentralUtil.zeroPadding(_loc5_[3],2);
                  _loc4_["changed"] = true;
               }
            }
            else if(_loc5_[0] == "00" || _loc5_[0] == "7F")
            {
               if(_loc6_.length == 2 && _loc6_[0] == "00")
               {
                  if(param2 == "00,01,00,00" || param2 == "7F,00,01,04")
                  {
                     _loc12_ = parseInt("0x" + _loc6_[1],16);
                     _loc13_ = this._exchangePatchNuumber(param1,_loc12_);
                     if(_loc12_ != _loc13_)
                     {
                        _loc8_ = "00," + ToneCentralUtil.zeroPadding(_loc13_.toString(16),2);
                     }
                     _loc4_["changed"] = true;
                  }
               }
            }
         }
         _loc4_["address"] = _loc7_;
         _loc4_["data"] = _loc8_;
         return _loc4_;
      }
      
      public function createDeviceList(param1:Boolean = true) : Array
      {
         this.logMng.logEnabled = param1;
         this.logMng.writeLog("===========================\n");
         this.setDeviceDataArray();
         this.logMng.logEnabled = true;
         return this.deviceArray;
      }
      
      public function setDeviceData(param1:Object) : Boolean
      {
         var _loc2_:Boolean = false;
         this.addressMap.model_id = this.addressMap.addressObj.id.model_id_gt001;
         ParameterDefinitionGT.createParamNoList();
         return this.setDevice(param1);
      }
      
      public function connect() : void
      {
         this.retryError = false;
         this.getDeviceID();
      }
      
      private function deviceIDReceived() : void
      {
         this.getID();
      }
      
      private function blockParameterSetting() : void
      {
         this.systemDecimalPatchSize = [{
            "address":"00,00,00,50",
            "size":8
         },{
            "address":"00,00,04,00",
            "size":75
         },{
            "address":"00,02,00,00",
            "size":48
         }];
         this.temporaryDecimalPatchSize = [{
            "address":"60,00,00,00",
            "size":64
         },{
            "address":"60,00,00,50",
            "size":48
         },{
            "address":"60,00,01,00",
            "size":64
         },{
            "address":"60,00,01,40",
            "size":64
         },{
            "address":"60,00,02,00",
            "size":65
         },{
            "address":"60,00,02,41",
            "size":63
         },{
            "address":"60,00,03,00",
            "size":64
         },{
            "address":"60,00,03,40",
            "size":64
         },{
            "address":"60,00,04,00",
            "size":64
         },{
            "address":"60,00,04,41",
            "size":63
         },{
            "address":"60,00,05,01",
            "size":63
         },{
            "address":"60,00,05,40",
            "size":64
         },{
            "address":"60,00,06,00",
            "size":64
         },{
            "address":"60,00,06,40",
            "size":64
         },{
            "address":"60,00,07,00",
            "size":64
         },{
            "address":"60,00,0A,40",
            "size":12
         },{
            "address":"60,00,10,10",
            "size":118
         },{
            "address":"60,00,11,00",
            "size":29
         },{
            "address":"60,00,12,00",
            "size":81
         },{
            "address":"60,00,13,00",
            "size":109
         },{
            "address":"60,00,14,00",
            "size":109
         },{
            "address":"60,00,15,00",
            "size":109
         }];
         this.getTemporaryPatchSize = [{
            "address":"60,00,00,00",
            "size":2048
         },{
            "address":"60,00,08,00",
            "size":2048
         },{
            "address":"60,00,10,00",
            "size":2048
         }];
         this.patchMapAddress = [{
            "address":"7F,70,00,00",
            "size":64
         },{
            "address":"7F,70,00,64",
            "size":64
         },{
            "address":"7F,70,01,48",
            "size":64
         },{
            "address":"7F,70,02,2C",
            "size":64
         }];
         this.quickSettingPatchAddress = ["30,00","30,01","30,02","30,03","30,04","30,05","30,06","30,07","30,08","30,09","40,00","40,01","40,02","40,03","40,04","40,05","40,06","40,07","40,08","40,09"];
         this.quickSettingAddress = [{
            "address":",00,00",
            "size":64
         },{
            "address":",00,50",
            "size":48
         },{
            "address":",01,00",
            "size":64
         },{
            "address":",01,40",
            "size":64
         },{
            "address":",02,00",
            "size":64
         },{
            "address":",02,41",
            "size":63
         },{
            "address":",03,00",
            "size":64
         },{
            "address":",03,40",
            "size":64
         },{
            "address":",04,00",
            "size":64
         },{
            "address":",04,41",
            "size":63
         },{
            "address":",05,01",
            "size":63
         },{
            "address":",05,40",
            "size":64
         },{
            "address":",06,00",
            "size":64
         },{
            "address":",06,40",
            "size":64
         },{
            "address":",07,00",
            "size":64
         },{
            "address":",07,40",
            "size":64
         },{
            "address":",08,00",
            "size":64
         },{
            "address":",08,50",
            "size":48
         },{
            "address":",09,10",
            "size":48
         },{
            "address":",09,50",
            "size":64
         },{
            "address":",0A,10",
            "size":24
         },{
            "address":",0A,40",
            "size":16
         },{
            "address":",0A,50",
            "size":80
         },{
            "address":",0B,00",
            "size":80
         },{
            "address":",0B,50",
            "size":80
         },{
            "address":",0C,00",
            "size":80
         },{
            "address":",0C,50",
            "size":80
         },{
            "address":",0D,00",
            "size":80
         },{
            "address":",0D,50",
            "size":80
         },{
            "address":",0E,00",
            "size":80
         },{
            "address":",0E,50",
            "size":80
         },{
            "address":",0F,00",
            "size":80
         },{
            "address":",10,10",
            "size":58
         }];
      }
      
      public function getEditorComunicationLevelFunc() : void
      {
         this.getEditorComunicationLevel();
      }
      
      public function getSetupParamsFunc() : void
      {
         this.getSetupParams();
      }
      
      public function getSystemParamsFunc(param1:int) : void
      {
         this.systemRequestCount = param1;
         this.getSystemParams();
      }
      
      public function getTemporaryPatchParamsFunc() : void
      {
         this.isGetTemporary = true;
         this.temporaryRequestCount = 0;
         this.getTemporaryPatchParams();
      }
      
      public function getQuickSettingParamsFunc(param1:int, param2:int, param3:int) : void
      {
         this._isQuickSettingLoading = true;
         this.params.quickSettingParams.push(new QuickSettingParams());
         this.quickSettingRequestCount = param1;
         this.quickSettingPatchCount = param2;
         this.quickSettingPatchTo = param3;
         this.getQuickSettingParams();
      }
      
      private function createGetPatchAddresList(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         this.patchAddressList = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.getTemporaryPatchSize.length)
         {
            _loc3_ = String(this.getTemporaryPatchSize[_loc2_].address).split(",");
            _loc4_ = param1.split(",");
            param1 = _loc4_[0] + "," + _loc4_[1] + "," + _loc3_[2] + "," + _loc3_[3];
            param1 = param1.toUpperCase();
            this.patchAddressList.push({
               "address":param1,
               "size":this.getTemporaryPatchSize[_loc2_].size
            });
            _loc2_++;
         }
      }
      
      private function createSetPatchAddresList(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         this.patchAddressList = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.temporaryDecimalPatchSize.length)
         {
            _loc3_ = String(this.temporaryDecimalPatchSize[_loc2_].address).split(",");
            _loc4_ = param1.split(",");
            param1 = _loc4_[0] + "," + _loc4_[1] + "," + _loc3_[2] + "," + _loc3_[3];
            param1 = param1.toUpperCase();
            this.patchAddressList.push({
               "address":param1,
               "size":this.temporaryDecimalPatchSize[_loc2_].size
            });
            _loc2_++;
         }
      }
      
      public function getPatchParamsFunc(param1:String) : void
      {
         this.retryCount = 0;
         this.patchRequestCount = 0;
         this.createGetPatchAddresList(param1);
         this._loadedParams = new TemporaryParams();
         this.getPatchParams();
      }
      
      public function getPatchListNamesFunc() : void
      {
         this.params.patchlistParams = new ArrayCollection();
         this.retryCount = 0;
         this.getPatchListNames();
      }
      
      private function getUserPatchListNamesFunc() : void
      {
         this.isPatchNameLoading = true;
         ToneCentralMediator.getInstance().showLoading();
         this.listIndex = 0;
         this.tmpUserPatchlistParams = [];
         this.retryCount = 0;
         this.getUserPatchListNames();
      }
      
      public function getSelectedPatchListParamsFunc(param1:int) : void
      {
         this.listIndex = param1;
         this.patchChange();
      }
      
      public function setEditorComunicationModeFunc(param1:Boolean) : void
      {
         this.setEditorComunicationnMode(param1);
      }
      
      public function requestDataFunc(param1:String, param2:String, param3:String = "") : void
      {
         this.address = param1;
         this.size = "00,00,00," + ToneCentralUtil.convertHexaDecimal(param2,2);
         if(Boolean(param3) && param3 != "")
         {
            this.requestAddressList.push({
               "address":param1,
               "name":param3
            });
         }
         this.request(param3);
      }
      
      public function setDataFunc(param1:String, param2:String, param3:String = "") : void
      {
         var _loc4_:Timer = null;
         this.address = param1;
         this.param = param2;
         if(this.connected)
         {
            this.setData(param3);
         }
         else
         {
            this.offLineAddress = param1;
            this.offLineParam = this.createSysExAddress(1,param1,param2);
            _loc4_ = new Timer(50,1);
            _loc4_.addEventListener(TimerEvent.TIMER,this.responceDelayHandler,false,0,true);
            _loc4_.start();
         }
      }
      
      private function responceDelayHandler(param1:TimerEvent) : void
      {
         this.paramArray = this.offLineParam.split(",");
         var _loc2_:ToneCentralEvents = this.setResponceData(this.offLineAddress);
         if(_loc2_)
         {
            dispatchEvent(_loc2_);
         }
      }
      
      private function request(param1:String) : void
      {
         if(param1 != "")
         {
            this.paramName = param1;
         }
         var _loc2_:String = this.getCheckSum(this._address + "," + this._size);
         var _loc3_:String = "F0,41," + ToneCentralUtil.zeroPadding(this.params.deviceID,2) + "," + this.addressMap.model_id + ",11,";
         var _loc4_:String = this.extension.DEVICE_midiOutput(_loc3_ + this._address + "," + this._size + "," + _loc2_ + ",F7");
      }
      
      private function setData(param1:String = "") : void
      {
         this.paramName = param1;
         var _loc2_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.address,this.param));
      }
      
      public function commandWriteFunc(param1:String) : void
      {
         var _loc2_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.addressMap.command_patch_write.address,param1));
      }
      
      public function patchCopy(param1:int, param2:int) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         this.paramName = "patchCopy";
         if(param1 == 127)
         {
            _loc3_ = "7F,7F";
         }
         else
         {
            _loc3_ = "00," + ToneCentralUtil.convertHexaDecimal(param1.toString(),2);
         }
         if(param2 == 127)
         {
            _loc4_ = "7F,7F";
         }
         else
         {
            _loc4_ = "00," + ToneCentralUtil.convertHexaDecimal(param2.toString(),2);
         }
         var _loc5_:String = _loc3_ + "," + _loc4_;
         var _loc6_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.addressMap.command_patch_copy.address,_loc5_));
      }
      
      public function commandSetUsbDirectMon(param1:String) : void
      {
         this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.addressMap.command_usb_direct_mon.address,ToneCentralUtil.convertHexaDecimal(param1,2)));
      }
      
      public function getManualMode() : void
      {
         this.extension.DEVICE_midiOutput(this.createSysExAddress(0,this.addressMap.command_manual_sw.address,this.addressMap.command_manual_sw.size));
      }
      
      private function onStatusEvent(param1:StatusEvent) : void
      {
         var _loc7_:XML = null;
         var _loc8_:Object = null;
         var _loc10_:ToneCentralEvents = null;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:Object = null;
         var _loc18_:TemporaryParams = null;
         var _loc19_:String = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:int = 0;
         var _loc23_:Number = NaN;
         var _loc24_:Array = null;
         var _loc25_:Number = NaN;
         var _loc26_:Array = null;
         var _loc27_:String = null;
         var _loc28_:Array = null;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:Array = null;
         var _loc32_:Array = null;
         var _loc33_:Object = null;
         var _loc34_:Array = null;
         var _loc35_:Array = null;
         var _loc36_:Array = null;
         if(this.retryError)
         {
            return;
         }
         var _loc2_:String = "EventDispatched!!";
         var _loc3_:StatusEvent = param1;
         var _loc4_:String = _loc3_.code.toLocaleLowerCase();
         var _loc5_:String = _loc3_.level;
         var _loc6_:String = _loc3_.type;
         var _loc9_:Boolean = true;
         if(_loc4_ == "native_midi_event")
         {
            _loc9_ = true;
            _loc23_ = 4;
            if(Capabilities.os.substring(0,3) == "Mac")
            {
               _loc24_ = _loc5_.split("</data><data>");
            }
            else if(Capabilities.os.substring(0,3) == "Win")
            {
               _loc24_ = _loc5_.split(" </data>\n<data>");
            }
            _loc25_ = _loc24_.length;
            if(_loc25_ >= 11 + _loc23_ && ToneCentralMediator.getInstance().ampModel == 0)
            {
               _loc28_ = _loc24_.slice(0,4 + _loc23_);
               _loc29_ = _loc24_.slice(4 + _loc23_,4 + _loc23_ + 4).join(",");
               _loc30_ = _loc24_.slice(4 + _loc23_ + 4,_loc25_ - 2).join(",");
               _loc31_ = _loc24_.slice(_loc25_ - 2,_loc25_ - 1);
               _loc32_ = _loc24_.slice(_loc25_ - 1,_loc25_);
               _loc33_ = this._exchangePatchNumberByAddressAndData(false,_loc29_,_loc30_);
               if(_loc33_["changed"])
               {
                  _loc31_[0] = this.getCheckSum(_loc33_["address"] + "," + _loc33_["data"]);
                  _loc34_ = _loc33_["address"].split(",");
                  _loc35_ = _loc33_["data"].split(",");
                  _loc36_ = _loc28_.concat(_loc34_,_loc35_,_loc31_,_loc32_);
                  if(Capabilities.os.substring(0,3) == "Mac")
                  {
                     _loc5_ = _loc36_.join("</data><data>");
                  }
                  else if(Capabilities.os.substring(0,3) == "Win")
                  {
                     _loc5_ = _loc36_.join(" </data>\n<data>");
                  }
               }
            }
            _loc8_ = _loc7_ = new XML(_loc5_);
            this.dictArray.push(_loc5_);
            if(Boolean(_loc7_.data[0]) && Boolean(_loc7_.data[0].toString() != "F0") && _loc7_.data[0].toString() != "f0")
            {
               return;
            }
            this.paramArray = this.convertParamArray(_loc7_);
            _loc13_ = this.getAddress(this.paramArray);
            _loc26_ = _loc13_.split(",");
            _loc27_ = this.checkRequestAddress(_loc13_);
            if(this.paramName == "id" || this.paramName == "deviceID" || this.paramName == "editorComunicationLevel")
            {
               _loc10_ = this.requestResponce(_loc7_,_loc5_,this.paramName);
            }
            else if(_loc27_)
            {
               _loc10_ = this.requestResponce(_loc7_,_loc5_,_loc27_);
            }
            else
            {
               _loc10_ = this.setResponceData(_loc13_);
            }
         }
         else if(_loc4_ == "native_player_event")
         {
            switch(_loc5_)
            {
               case "audioPlayerDidEndSong":
                  _loc10_ = new ToneCentralEvents(ToneCentralEvents.PLAY_END);
            }
         }
         if(_loc10_)
         {
            dispatchEvent(_loc10_);
         }
      }
      
      private function setResponceData(param1:String) : ToneCentralEvents
      {
         var _loc3_:ToneCentralEvents = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:Array = param1.split(",");
         if(this.chekckSysExVal(this.paramArray))
         {
            switch(true)
            {
               case _loc2_.join(",") == this.addressMap.current_patch_no.address:
                  _loc4_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
                  _loc5_ = Math.floor(int(_loc4_[0]) * 128) + int(_loc4_[1]);
                  if(_loc5_ == 400)
                  {
                     this.params.temporaryParams.prevCurrentPatchNo = this.params.temporaryParams.currentPatchNo;
                  }
                  this.params.temporaryParams.currentPatchNo = _loc5_;
                  if(this.params.temporaryParams.currentPatchNo < 400)
                  {
                     this._patchChangeFlag = true;
                     this.writeStop = true;
                     this.isWriteStoped = false;
                     this.selectedListIndex = this.params.temporaryParams.currentPatchNo;
                     this.patchChangeRetryTimer.removeEventListener(TimerEvent.TIMER,this.patchChangeRetryHandler);
                     this.patchChangeRetryTimer.reset();
                     _loc3_ = new ToneCentralEvents(ToneCentralEvents.CHANGE_CURRENT_PATCH);
                  }
                  break;
               case _loc2_.join(",") == this.addressMap.command_patch_clear.address:
                  this._patchClearFlag = true;
                  dispatchEvent(new ToneCentralEvents(ToneCentralEvents.TEMPORARY_CLEAR));
                  break;
               case _loc2_[0] == "00":
                  this.systemDataReceive(param1,this.paramArray);
                  break;
               case _loc2_[0] == "10":
               case _loc2_[0] == "20":
                  this.patchDataReceive(_loc2_);
                  break;
               case _loc2_[0] == "60":
                  this.temporaryDataReceive(_loc2_);
                  break;
               case _loc2_[0] == "7F":
                  this.commandDataReceive(param1,this.paramArray);
            }
         }
         return _loc3_;
      }
      
      private function checkRequestAddress(param1:String) : String
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.requestAddressList.length)
         {
            if(String(this.requestAddressList[_loc2_].address).toUpperCase() == param1.toUpperCase())
            {
               _loc3_ = String(this.requestAddressList[_loc2_].name);
               this.requestAddressList.splice(_loc2_,1);
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      private function requestResponce(param1:XML, param2:String, param3:String) : ToneCentralEvents
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:ToneCentralEvents = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:TemporaryParams = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc11_:String = this.getAddress(this.paramArray);
         var _loc12_:Array = _loc11_.split(",");
         switch(param3)
         {
            case "patchData":
               this.paramArray = this.convertParamArray(param1);
               _loc7_ = parseInt(ONE_PATCH_SIZE.toString(10));
               _loc8_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
               _loc6_ = new ToneCentralEvents(ToneCentralEvents.GET_PATCH_DATA);
               _loc6_.data = _loc10_;
               this.paramName = "";
               break;
            case "deviceID":
               this.paramArray = this.convertParamArray(param1);
               this.params.deviceID = ToneCentralUtil.convertDecimal(this.paramArray[2]);
               this.paramName = "";
               if(this.params.deviceID)
               {
                  this.deviceIDReceived();
               }
               break;
            case "id":
               this.params.id = param1;
               if(this.params.idCheck)
               {
                  this.connected = true;
                  _loc6_ = new ToneCentralEvents(ToneCentralEvents.RECOGNIZED);
                  ParameterDefinitionGT.createParamNoList();
               }
               else
               {
                  this.connected = false;
                  _loc6_ = new ToneCentralEvents(ToneCentralEvents.CONNECT_FAULT);
               }
               this.paramName = "";
               break;
            case "editorComunicationLevel":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  if(this.checkAddress(this.addressMap.command_editor_comunication_level.address,this.paramArray))
                  {
                     this.params.editorComunicationLevel = this.getData(this.paramArray);
                     _loc6_ = new ToneCentralEvents(ToneCentralEvents.EDITOR_COMUNICATION_LEVEL_RECEIVED);
                     this.paramName = "";
                  }
               }
               break;
            case "editorComunicationMode":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  if(this.checkAddress(this.addressMap.command_editor_comunication_mode.address,this.paramArray))
                  {
                     this.params.editorComunicationMode = this.getData(this.paramArray);
                     _loc6_ = new ToneCentralEvents(ToneCentralEvents.EDITOR_COMUNICATION_MODE_RECEIVED);
                  }
               }
               this.paramName = "";
               break;
            case "setup":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  if(this.checkAddress(this.addressMap.addressObj.setup[0].address,this.paramArray))
                  {
                     _loc13_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
                     _loc14_ = Math.floor(int(_loc13_[0]) * 128) + int(_loc13_[1]);
                     this.params.temporaryParams.currentPatchNo = _loc14_;
                     _loc6_ = new ToneCentralEvents(ToneCentralEvents.PARAM_SETUP_RECEIVED);
                  }
               }
               this.paramName = "";
               break;
            case "system":
               this.paramArray = this.convertParamArray(param1);
               this.setLoadedSystemData();
               break;
            case "temporaryPatch":
               this.paramArray = this.convertParamArray(param1);
               this.setLoadedTemporaryData();
               break;
            case "patchParams":
               this.paramArray = this.convertParamArray(param1);
               this.setLoadPatchParamsData(_loc11_);
               break;
            case "patchListNames":
               this.paramArray = this.convertParamArray(param1);
               this.setPatchListNames();
               break;
            case "userPatchListNames":
               this.paramArray = this.convertParamArray(param1);
               this.setUserPatchListNames();
               break;
            case "patchName":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  _loc7_ = parseInt(ONE_PATCH_NAME_SIZE.toString(10));
                  _loc8_ = this.getDatas(this.paramArray);
                  _loc5_ = ToneCentralUtil.convertHexToAscii(_loc8_);
                  _loc6_ = new ToneCentralEvents(ToneCentralEvents.PATCH_NAME_RECEIVED);
                  _loc6_.data = _loc5_;
               }
               this.paramName = "";
               break;
            case "request":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  if(this.checkAddress(this._address,this.paramArray))
                  {
                     this.params.me80data = param2;
                     this.params.value = ToneCentralUtil.convertDecimal(this.getData(this.paramArray));
                     _loc6_ = new ToneCentralEvents(ToneCentralEvents.REQUEST_DATA_RECEIVED);
                  }
               }
               this.paramName = "";
               break;
            case "patchListParams":
               this.paramArray = this.convertParamArray(param1);
               _loc7_ = parseInt(ONE_PATCH_SIZE.toString(10));
               _loc8_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
               _loc6_ = new ToneCentralEvents(ToneCentralEvents.GET_PATCH_DATA);
               _loc6_.data = _loc10_;
               this.paramName = "";
               break;
            case "setData":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  if(this.checkAddress(this._address,this.paramArray))
                  {
                     _loc4_ = ToneCentralUtil.convertDecimal(this.getData(this.paramArray));
                     _loc9_ = {
                        "address":this._address,
                        "value":_loc4_
                     };
                     _loc6_ = new ToneCentralEvents(ToneCentralEvents.DATASET);
                     _loc6_.data = _loc9_;
                  }
               }
               this.paramName = "";
               break;
            case "connectionTestReq":
               this.paramArray = this.convertParamArray(param1);
               if(this.chekckSysExVal(this.paramArray))
               {
                  if(this.checkAddress(this._address,this.paramArray))
                  {
                     _loc4_ = ToneCentralUtil.convertDecimal(this.getData(this.paramArray));
                     _loc6_ = new ToneCentralEvents(ToneCentralEvents.CONNECTION_TEST);
                     _loc6_.data = _loc4_;
                  }
               }
               this.paramName = "";
               break;
            case "requestTempPreAmpData":
               this.temporaryDataReceive(_loc12_);
               _loc6_ = new ToneCentralEvents(ToneCentralEvents.REQUEST_COMPLETE_TEMP_PRE_AMP_DATA);
               this.paramName = "";
               break;
            case "quickSettingParams":
               this.paramArray = this.convertParamArray(param1);
               this.quickSettingDataReceive(_loc11_);
               this.paramName = "";
         }
         return _loc6_;
      }
      
      public function dispatchPatchChange() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_CHANGED));
      }
      
      private function patchDataReceive(param1:Array) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.getPatchParamsTimeoutHandler);
         this.timeoutTimer.reset();
         var _loc2_:int = 12;
         this.loadedParams.updateData(parseInt("0x" + param1[2] + param1[3],16),ToneCentralUtil.convertDecimalArray(this.paramArray.slice(_loc2_,this.paramArray.length - 2)));
         if(param1[2] == "07" && param1[3] == "44" || param1[2] == "0F" && param1[3] == "44")
         {
            ++this.patchRequestCount;
            if(this.patchRequestCount < this.patchAddressList.length)
            {
               this.getPatchParams();
            }
         }
         if(param1[2] == "14" && param1[3] == "00")
         {
            if(this.isWriteStoped)
            {
               this.setTemporaryParams(this._loadedParams);
               this.isWriteStoped = false;
               this.isWriteStepedGetPatchParam = false;
            }
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PATCH_PARAM_LOADED));
         }
      }
      
      private function temporaryDataReceive(param1:Array) : void
      {
         var _loc3_:String = null;
         if(!ToneCentralMediator.getInstance().isInited)
         {
            this.setLoadedTemporaryData();
            return;
         }
         var _loc2_:int = 12;
         this.params.temporaryParams.updateData(parseInt("0x" + param1[2] + param1[3],16),ToneCentralUtil.convertDecimalArray(this.paramArray.slice(_loc2_,this.paramArray.length - 2)));
         if(this._patchChangeFlag)
         {
            if(param1[2] == "07" && param1[3] == "44" || param1[2] == "0F" && param1[3] == "44")
            {
               ++this.temporaryRequestCount;
               if(this.temporaryRequestCount < this.getTemporaryPatchSize.length)
               {
                  this.getTemporaryPatchParams();
               }
            }
            if(param1[2] == "15" && param1[3] == "00")
            {
               this._patchChangeFlag = false;
               this.writeStop = false;
               if(this.isWriteStoped)
               {
                  _loc3_ = this.addressMap.getPatchAddress(ParameterDefinitionGT.PARAM_NO_LIST[this.params.temporaryParams.currentPatchNo]);
                  this.isWriteStepedGetPatchParam = true;
                  this.getPatchParamsFunc(_loc3_);
               }
               if(this.isPatchWrite)
               {
                  this.isPatchWrite = false;
               }
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_CHANGED));
            }
         }
         else if(this._patchClearFlag)
         {
            if(param1[2] == "15" && param1[3] == "00")
            {
               this._patchClearFlag = false;
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_CLEAR));
            }
         }
         else
         {
            if(this.getAddress(this.paramArray) >= this.addressMap.temp_fx_chain_position1.address && this.getAddress(this.paramArray) <= this.addressMap.temp_fx_chain_position20.address)
            {
               if(ToneCentralUtil.convertDecimalArray(this.paramArray.slice(_loc2_,this.paramArray.length - 2)).length > 1)
               {
                  dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_CHAIN_CHANGED));
               }
               else
               {
                  this.changeDelayTimer.reset();
                  this.changeDelayTimer.start();
                  this.changeDelayTimer.addEventListener(TimerEvent.TIMER,this.chainChangeDelayHandler,false,0,true);
               }
            }
            else
            {
               this.receievedTemporaryPatchParam(this.getAddress(this.paramArray),ToneCentralUtil.convertDecimalArray(this.paramArray.slice(_loc2_,this.paramArray.length - 2)));
            }
            if(param1[2] == "07" && param1[3] == "44" || param1[2] == "0F" && param1[3] == "44")
            {
               ++this.temporaryRequestCount;
               if(this.temporaryRequestCount < this.getTemporaryPatchSize.length)
               {
                  this.getTemporaryPatchParams();
               }
            }
            if(param1[2] == "14" && param1[3] == "00")
            {
               if(this.isGetTemporary)
               {
                  this.isGetTemporary = false;
                  this._isTempSending = false;
                  dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY));
               }
               else
               {
                  this.getPatchParams();
               }
            }
         }
      }
      
      private function systemDataReceive(param1:String, param2:Array) : void
      {
         if(!ToneCentralMediator.getInstance().isInited)
         {
            return;
         }
         var _loc3_:int = 12;
         var _loc4_:Array = param1.split(",");
         if(_loc4_[1] == "02")
         {
            this.params.midiParams.updateData(parseInt("0x" + _loc4_[2] + _loc4_[3],16),ToneCentralUtil.convertDecimalArray(param2.slice(_loc3_,param2.length - 2)));
         }
         else
         {
            this.params.system.updateData(parseInt("0x" + _loc4_[2] + _loc4_[3],16),ToneCentralUtil.convertDecimalArray(param2.slice(_loc3_,param2.length - 2)));
         }
         this.receievedSystemParam(this.getAddress(param2),ToneCentralUtil.convertDecimalArray(param2.slice(_loc3_,param2.length - 2)));
      }
      
      private function commandDataReceive(param1:String, param2:Array) : void
      {
         var _loc3_:ToneCentralEvents = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:DelayTimer = null;
         if(!ToneCentralMediator.getInstance().isInited)
         {
            return;
         }
         var _loc6_:Array = param1.split(",");
         if(param1 == this.addressMap.command_patch_write.address || param1 == this.addressMap.command_patch_initialize.address)
         {
            this.receievedPatchWriteParam(param2);
         }
         else if(param1 == this.addressMap.command_running_mode.address)
         {
            _loc4_ = ToneCentralUtil.convertDecimal(this.getData(param2));
            _loc3_ = new ToneCentralEvents(ToneCentralEvents.RUNNING_MODE);
            _loc3_.data = _loc4_;
            ToneCentralMediator.getInstance().runningMode = _loc4_;
            dispatchEvent(_loc3_);
         }
         else if(param1 == this.addressMap.command_tuner_single_mode_pitch.address)
         {
            _loc4_ = ToneCentralUtil.convertDecimal(this.getData(param2));
            _loc7_ = {
               "address":param1,
               "value":[param2[param2.length - 4].toString(),param2[param2.length - 3].toString()]
            };
            _loc3_ = new ToneCentralEvents(ToneCentralEvents.TUNER_PITCH);
            _loc3_.data = _loc7_;
            dispatchEvent(_loc3_);
         }
         else if(param1 == this.addressMap.command_tuner_multi_mode_str_1_pitch.address || param1 == this.addressMap.command_tuner_multi_mode_str_2_pitch.address || param1 == this.addressMap.command_tuner_multi_mode_str_3_pitch.address || param1 == this.addressMap.command_tuner_multi_mode_str_4_pitch.address || param1 == this.addressMap.command_tuner_multi_mode_str_5_pitch.address || param1 == this.addressMap.command_tuner_multi_mode_str_6_pitch.address)
         {
            _loc4_ = ToneCentralUtil.convertDecimal(this.getData(param2));
            _loc7_ = {
               "address":param1,
               "value":[param2[param2.length - 4].toString(),param2[param2.length - 3].toString()]
            };
            _loc3_ = new ToneCentralEvents(ToneCentralEvents.TUNER_MULTI_PITCH);
            _loc3_.data = _loc7_;
            dispatchEvent(_loc3_);
         }
         else if(_loc6_[1] == "70")
         {
            _loc5_ = ToneCentralUtil.convertDecimalArray(this.getDatas(param2));
            _loc8_ = [];
            _loc9_ = 0;
            while(_loc5_.length > _loc9_)
            {
               _loc10_ = int(_loc5_[_loc9_]);
               _loc11_ = int(_loc5_[_loc9_ + 1]);
               _loc8_.push(_loc10_ * 128 + _loc11_);
               _loc9_ += 2;
            }
            this._patchIDMap = this._patchIDMap.concat(_loc8_);
            if(param1 == this.patchMapAddress[1].address)
            {
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.GET_PATCH_MAP));
            }
         }
         else if(_loc6_[1] == "71")
         {
            this.sortPatchMapTimeoutTimer.reset();
            if(this.getData(param2) == "00")
            {
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SORT_PATCH_MAP_SUCCESS));
            }
            else
            {
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SORT_PATCH_MAP_FAULT));
            }
         }
         else if(param1 == "7F,01,00,00")
         {
            _loc12_ = new DelayTimer(1000,1);
            _loc5_ = ToneCentralUtil.convertDecimalArray(this.getDatas(param2));
            _loc12_.data = _loc5_;
            _loc12_.addEventListener(TimerEvent.TIMER,this.quickSettingWriteHandler,false,0,true);
            _loc12_.start();
         }
      }
      
      private function quickSettingWriteHandler(param1:TimerEvent) : void
      {
         this.getQuickSettingParamsFunc(0,param1.target.data[1],param1.target.data[1] + 1);
      }
      
      private function chainChangeDelayHandler(param1:TimerEvent) : void
      {
         this.changeDelayTimer.removeEventListener(TimerEvent.TIMER,this.chainChangeDelayHandler);
         this.changeDelayTimer.reset();
         this.requestDataFunc(this.addressMap.temp_fx_chain_position1.address,"20");
      }
      
      private function setPatchListNames() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:TemporaryParams = null;
         var _loc4_:PatchData = null;
         if(this.chekckSysExVal(this.paramArray))
         {
            this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.patchListNameTimeoutHandler);
            this.timeoutTimer.reset();
            _loc1_ = this.getDatas(this.paramArray);
            _loc2_ = ToneCentralUtil.convertHexToAscii(_loc1_);
            _loc3_ = new TemporaryParams();
            _loc4_ = new PatchData();
            _loc4_.name = _loc2_;
            _loc4_.patchNo = ParameterDefinitionGT.PARAM_NO_LIST[this.listIndex];
            this.params.patchlistParams.addItem(_loc4_);
            if(this.listIndex < ParameterDefinitionGT.MAX_PATCH_NUMBER)
            {
               setTimeout(this.getPatchListNames,30);
            }
            else
            {
               this.paramName = "";
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_LIST_RECEIVED));
            }
            ++this.listIndex;
         }
      }
      
      private function setUserPatchListNames() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:TemporaryParams = null;
         var _loc4_:PatchData = null;
         var _loc5_:Timer = null;
         var _loc6_:Array = null;
         if(this.chekckSysExVal(this.paramArray))
         {
            this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.userPatchListNameTimeoutHandler);
            this.timeoutTimer.reset();
            _loc1_ = this.getDatas(this.paramArray);
            _loc2_ = ToneCentralUtil.convertHexToAscii(_loc1_);
            _loc3_ = new TemporaryParams();
            _loc4_ = new PatchData();
            _loc4_.name = _loc2_;
            _loc4_.patchNo = ParameterDefinitionGT.PARAM_NO_LIST[this.listIndex];
            this.tmpUserPatchlistParams.push(_loc4_);
            ++this.listIndex;
            if(this.listIndex < ParameterDefinitionGT.MAX_PATCH_NUMBER + 1)
            {
               _loc5_ = new Timer(30,1);
               _loc5_.addEventListener(TimerEvent.TIMER,this.getUserPatchListNameDelayHandler,false,0,true);
               _loc5_.start();
            }
            else
            {
               this.isPatchNameLoading = false;
               this.paramName = "";
               _loc6_ = this.params.patchlistParams.toArray();
               _loc6_ = _loc6_.slice(200);
               this.params.patchlistParams = new ArrayCollection(this.tmpUserPatchlistParams.concat(_loc6_));
               ToneCentralMediator.getInstance().hideLoading();
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_LIST_RECEIVED));
               if(this.isLoadingPatchWrite)
               {
                  this.isLoadingPatchWrite = false;
                  this.getUserPatchListNamesFunc();
               }
               else if(this.isPatchWrite)
               {
                  this.getTemporaryPatchParamsFunc();
               }
            }
         }
      }
      
      private function getUserPatchListNameDelayHandler(param1:TimerEvent) : void
      {
         this.getUserPatchListNames();
      }
      
      private function setLoadPatchParamsData(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.getPatchParamsTimeoutHandler);
         this.timeoutTimer.reset();
         if(this.chekckSysExVal(this.paramArray))
         {
            if(this.patchAddressList.length <= this.patchRequestCount)
            {
               return;
            }
            _loc2_ = int(this.patchAddressList[this.patchRequestCount].size);
            _loc3_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
            _loc4_ = this.patchAddressList[this.patchRequestCount].address;
            _loc5_ = _loc4_.split(",");
            _loc6_ = new Array();
            _loc7_ = 0;
            while(_loc7_ < _loc3_.length)
            {
               _loc4_ = (parseInt("0x" + _loc5_[3],16) + parseInt("0x" + ToneCentralUtil.convertHexaDecimal(_loc7_.toString()),16)).toString(16);
               _loc4_ = ToneCentralUtil.zeroPadding(_loc4_,2);
               _loc4_ = _loc5_[2] + _loc4_;
               _loc8_ = {
                  "address":_loc4_,
                  "data":_loc3_[_loc7_]
               };
               _loc6_.push(_loc8_);
               _loc7_++;
            }
            this.loadedParams.setAlldata(_loc6_);
            this.paramName = "";
            if(this.writeStop)
            {
               this.isWriteStoped = true;
               return;
            }
            if(param1 == this.patchAddressList[this.patchAddressList.length - 1].address)
            {
               if(this.isWriteStoped)
               {
                  this.setTemporaryParams(this._loadedParams);
                  this.isWriteStoped = false;
                  this.isWriteStepedGetPatchParam = false;
               }
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PATCH_PARAM_LOADED));
            }
            else
            {
               ++this.patchRequestCount;
               this.getPatchParams();
            }
         }
      }
      
      private function setLoadedTemporaryData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         if(this.chekckSysExVal(this.paramArray))
         {
            _loc1_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
            _loc2_ = this.getAddress(this.paramArray);
            _loc3_ = _loc2_.split(",");
            _loc4_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc1_.length)
            {
               _loc2_ = (parseInt("0x" + _loc3_[3],16) + parseInt("0x" + ToneCentralUtil.convertHexaDecimal(_loc5_.toString()),16)).toString(16);
               _loc2_ = ToneCentralUtil.zeroPadding(_loc2_,2);
               _loc2_ = _loc3_[2] + _loc2_;
               _loc7_ = {
                  "address":_loc2_,
                  "data":_loc1_[_loc5_]
               };
               _loc4_.push(_loc7_);
               _loc5_++;
            }
            _loc6_ = 12;
            this.params.temporaryParams.updateData(parseInt("0x" + _loc3_[2] + _loc3_[3],16),ToneCentralUtil.convertDecimalArray(this.paramArray.slice(_loc6_,this.paramArray.length - 2)));
            this.paramName = "";
            this.writeStop = false;
            if(_loc3_[2] == "07" && _loc3_[3] == "44" || _loc3_[2] == "0F" && _loc3_[3] == "44")
            {
               ++this.temporaryRequestCount;
               if(this.temporaryRequestCount < this.getTemporaryPatchSize.length)
               {
                  this.getTemporaryPatchParams();
               }
            }
            if(_loc3_[2] == "14" && _loc3_[3] == "00")
            {
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_TEMPORARY_PATCH_RECEIVED));
            }
         }
      }
      
      private function setLoadedSystemData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         if(this.chekckSysExVal(this.paramArray))
         {
            _loc1_ = int(this.systemDecimalPatchSize[this.systemRequestCount].size);
            _loc2_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
            _loc3_ = this.systemDecimalPatchSize[this.systemRequestCount].address;
            _loc5_ = _loc3_.split(",");
            _loc6_ = [];
            _loc7_ = 0;
            while(_loc7_ < _loc2_.length)
            {
               _loc4_ = (parseInt("0x" + _loc5_[3],16) + parseInt("0x" + ToneCentralUtil.convertHexaDecimal(_loc7_.toString()),16)).toString(16);
               _loc4_ = ToneCentralUtil.zeroPadding(_loc4_,2);
               _loc4_ = _loc5_[2] + _loc4_;
               _loc8_ = {
                  "address":_loc4_,
                  "data":_loc2_[_loc7_]
               };
               _loc6_.push(_loc8_);
               _loc7_++;
            }
            if(SystemSettingDefinitionGT.MIDI_SETTING_START_ADDRESS <= _loc3_ && _loc3_ <= SystemSettingDefinitionGT.MIDI_SETTING_END_ADDRESS || SystemSettingDefinitionGT.PROGRAM_MAP_START_ADDRESS <= _loc3_ && _loc3_ <= SystemSettingDefinitionGT.PROGRAM_MAP_END_ADDRESS)
            {
               this.params.midiParams.setAlldata(_loc6_,this.temporaryRequestCount,this.temporaryAllUpdate);
            }
            else
            {
               this.params.system.setAlldata(_loc6_,this.temporaryRequestCount,this.temporaryAllUpdate);
            }
            this.paramName = "";
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_SYSTEM_RECEIVED));
         }
      }
      
      private function quickSettingDataReceive(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.quickSettingTimeoutHandler);
         this.timeoutTimer.reset();
         if(this.quickSettingRequestCount != -1)
         {
            if(this.chekckSysExVal(this.paramArray))
            {
               _loc2_ = int(this.quickSettingAddress[this.quickSettingRequestCount].size);
               _loc3_ = ToneCentralUtil.convertDecimalArray(this.getDatas(this.paramArray));
               _loc4_ = this.quickSettingPatchAddress[this.quickSettingPatchCount] + this.quickSettingAddress[this.quickSettingRequestCount].address;
               _loc5_ = _loc4_.split(",");
               _loc6_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc3_.length)
               {
                  _loc4_ = (parseInt("0x" + _loc5_[3],16) + parseInt("0x" + ToneCentralUtil.convertHexaDecimal(_loc7_.toString()),16)).toString(16);
                  _loc4_ = ToneCentralUtil.zeroPadding(_loc4_,2);
                  _loc4_ = _loc5_[2] + _loc4_;
                  _loc8_ = {
                     "address":_loc4_,
                     "data":_loc3_[_loc7_]
                  };
                  _loc6_.push(_loc8_);
                  _loc7_++;
               }
               this.params.quickSettingParams[this.quickSettingPatchCount].setAlldata(_loc6_);
            }
            ++this.quickSettingRequestCount;
            if(this.quickSettingRequestCount == this.quickSettingAddress.length)
            {
               this.params.quickSettingParams[this.quickSettingPatchCount].setQuickSettingName();
               ++this.quickSettingPatchCount;
               if(this.quickSettingPatchCount < this.quickSettingPatchAddress.length && this.quickSettingPatchCount < this.quickSettingPatchTo)
               {
                  this.retryCount = 0;
                  this.quickSettingRequestCount = 0;
                  this.params.quickSettingParams[this.quickSettingPatchCount] = new QuickSettingParams();
                  this.getQuickSettingParams();
               }
               else
               {
                  this._isQuickSettingLoading = false;
                  this.quickSettingRequestCount = -1;
                  dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_QUICK_SETTING_END));
               }
            }
            else
            {
               this.retryCount = 0;
               this.getQuickSettingParams();
            }
         }
      }
      
      public function setTemporaryParams(param1:TemporaryParams) : void
      {
         if(!param1 || this.setTemporaryTimer.running || this._isTempSending)
         {
            return;
         }
         this._isTempSending = true;
         this.temporaryRequestCount = 0;
         this.setParam = param1;
         this.setTemporaryTimer.start();
         this.setTemporaryTimer.addEventListener(TimerEvent.TIMER,this.setTemporaryPramsTimerHandler,false,0,true);
         if(!this.isWriteStoped)
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY_START));
         }
      }
      
      private function setTemporaryPramsTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:Object = this.temporaryDecimalPatchSize[this.temporaryRequestCount];
         var _loc3_:String = this.setParam.getExData(_loc2_.address,_loc2_.size);
         this.setDataFunc(_loc2_.address,_loc3_);
         ++this.temporaryRequestCount;
         if(this.temporaryDecimalPatchSize.length == this.temporaryRequestCount || this.writeStop)
         {
            if(this.writeStop)
            {
               this.isWriteStoped = true;
            }
            this.setTemporaryTimer.reset();
            this.setTemporaryTimer.removeEventListener(TimerEvent.TIMER,this.setTemporaryPramsTimerHandler);
            if(!this.writeStop)
            {
               this._isTempSending = false;
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY_END));
            }
            else
            {
               this._isTempSending = false;
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_TEMPORARY_STOP));
            }
         }
      }
      
      public function setPatchParams(param1:TemporaryParams, param2:String) : void
      {
         if(!param1 || this.setTemporaryTimer.running)
         {
            return;
         }
         this.createSetPatchAddresList(param2);
         this.patchRequestCount = 0;
         this.setParam = param1;
         this.setTemporaryTimer.start();
         this.setTemporaryTimer.addEventListener(TimerEvent.TIMER,this.setPatchPramsTimerHandler,false,0,true);
      }
      
      private function setPatchPramsTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:Object = this.patchAddressList[this.patchRequestCount];
         var _loc3_:String = this.setParam.getExData(_loc2_.address,_loc2_.size);
         this.setDataFunc(_loc2_.address,_loc3_);
         ++this.patchRequestCount;
         if(this.patchAddressList.length == this.patchRequestCount)
         {
            this.setTemporaryTimer.reset();
            this.setTemporaryTimer.removeEventListener(TimerEvent.TIMER,this.setPatchPramsTimerHandler);
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_PATCH_PARAMS_END));
         }
      }
      
      public function setPatchMap(param1:Array) : void
      {
         this.patchMapRequestCount = 0;
         this.patchMapDataList = param1;
         this.setTemporaryTimer.start();
         this.setTemporaryTimer.addEventListener(TimerEvent.TIMER,this.setPatchMapTimerHandler,false,0,true);
      }
      
      private function setPatchMapTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:Object = this.patchMapAddress[this.patchMapRequestCount];
         var _loc3_:String = this.patchMapDataList[this.patchMapRequestCount];
         this.setDataFunc(_loc2_.address,_loc3_);
         ++this.patchMapRequestCount;
         if(this.patchMapAddress.length == this.patchMapRequestCount)
         {
            this.setTemporaryTimer.reset();
            this.setTemporaryTimer.removeEventListener(TimerEvent.TIMER,this.setPatchMapTimerHandler);
            this.setDataFunc(this.addressMap.command_update_patch_map.address,"00");
            this.sortPatchMapTimeoutTimer.start();
         }
      }
      
      private function sortPatchMapTimeoutHandler(param1:TimerEvent) : void
      {
         this.sortPatchMapTimeoutTimer.reset();
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SORT_PATCH_MAP_FAULT));
      }
      
      private function createSysExAddress(param1:int, param2:String, param3:String) : String
      {
         var _loc5_:String = null;
         var _loc8_:Object = null;
         var _loc4_:String = this.addressMap.maker_id + "," + ToneCentralUtil.convertHexaDecimal(this.params.deviceID,2) + "," + this.addressMap.model_id;
         if(!this.connected)
         {
            _loc4_ = "41,00,00,00,00,06";
         }
         if(param1 == 0)
         {
            _loc5_ = this.addressMap.request;
         }
         else if(param1 == 1)
         {
            _loc5_ = this.addressMap.dataset;
         }
         if(ToneCentralMediator.getInstance().ampModel == 0)
         {
            _loc8_ = this._exchangePatchNumberByAddressAndData(true,param2,param3);
            if(_loc8_["changed"])
            {
               param2 = _loc8_["address"];
               param3 = _loc8_["data"];
            }
         }
         var _loc6_:String = this.getCheckSum(param2 + "," + param3);
         return "F0," + _loc4_ + "," + _loc5_ + "," + param2 + "," + param3 + "," + _loc6_ + ",F7";
      }
      
      private function getCheckSum(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:Array = param1.split(",");
         var _loc3_:int = int(_loc2_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ += parseInt("0x" + _loc2_[_loc6_],16);
            _loc6_++;
         }
         var _loc7_:int = 128 - _loc4_ % 128;
         if(_loc7_ == 128)
         {
            _loc7_ = 0;
         }
         _loc5_ = ToneCentralUtil.zeroPadding(_loc7_.toString(16),2);
         return _loc5_.toUpperCase();
      }
      
      private function chekckSysExVal(param1:Array) : Boolean
      {
         if(!this.connected)
         {
            return true;
         }
         if(param1[0] != "F0")
         {
            return false;
         }
         if(param1[1] != "41")
         {
            return false;
         }
         if(param1[2] != ToneCentralUtil.convertHexaDecimal(this.params.deviceID,2))
         {
            return false;
         }
         if(this.addressMap.model_id == this.addressMap.addressObj.id.model_id_gt001)
         {
            if(param1[3] + "," + param1[4] + "," + param1[5] + "," + param1[6] != this.addressMap.model_id)
            {
               return false;
            }
            if(param1[7] != "12")
            {
               return false;
            }
         }
         else if(this.addressMap.model_id == this.addressMap.addressObj.id.model_id_gt100)
         {
            if(param1[3] + "," + param1[4] + "," + param1[5] != this.addressMap.model_id)
            {
               return false;
            }
            if(param1[6] != "12")
            {
               return false;
            }
         }
         if(param1[param1.length - 1] != "F7")
         {
            return false;
         }
         return true;
      }
      
      private function checkAddress(param1:String, param2:Array) : Boolean
      {
         var _loc3_:Array = null;
         if(this.addressMap.model_id == this.addressMap.addressObj.id.model_id_gt001)
         {
            _loc3_ = param2.slice(8,12);
         }
         else if(this.addressMap.model_id == this.addressMap.addressObj.id.model_id_gt100)
         {
            _loc3_ = param2.slice(7,11);
         }
         var _loc4_:String = "";
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < 4)
         {
            _loc4_ += _loc3_[_loc6_];
            _loc6_++;
         }
         if(_loc4_ == param1.split(",").join(""))
         {
            _loc5_ = true;
         }
         return _loc5_;
      }
      
      private function getAddress(param1:Array) : String
      {
         var _loc2_:Array = param1.slice(8,12);
         return _loc2_.join(",");
      }
      
      private function setDevice(param1:Object) : Boolean
      {
         this.selectedDeviceData = param1;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(this.selectedDeviceData.midiInKey)
         {
            _loc2_ = this.selectMidiInputDevice(this.selectedDeviceData.midiInKey);
         }
         if(this.selectedDeviceData.midiOutKey)
         {
            _loc3_ = this.selectMidiOutputDevice(this.selectedDeviceData.midiOutKey);
         }
         if(this.selectedDeviceData.audioInKey)
         {
            _loc4_ = this.selectAudioInputDevice(this.selectedDeviceData.audioInKey);
         }
         if(this.selectedDeviceData.audioOutKey)
         {
            _loc5_ = this.selectAudioOutputDevice(this.selectedDeviceData.audioOutKey);
         }
         _loc6_ = _loc2_ && _loc3_ && _loc4_ && _loc5_;
         if(!_loc6_)
         {
            this.logMng.writeLog(">>>>>> setDevice <<<<<<");
            this.logMng.writeLog(ObjectUtil.toString(this.selectedDeviceData));
         }
         return _loc6_;
      }
      
      private function setDeviceDataArray() : void
      {
         this.deviceArray = [];
         this.serachMidiInputDevice();
         this.getMidiInputDeviceList();
         this.setDeviceName();
         this.setMidiInputSelectKey();
         this.serachMidiOutputDevice();
         this.getMidiOutputDeviceList();
         this.setMidiOutputSelectKey();
         this.serachAudioInputDevice();
         this.getAudioInputDeviceList();
         this.setAudioInputSelectKey();
         this.serachAudioOutputDevice();
         this.getAudioOutputDeviceList();
         this.setAudioOutputSelectKey();
      }
      
      public function searchDevice() : void
      {
         this.serachMidiInputDevice();
         this.serachMidiOutputDevice();
         this.serachAudioInputDevice();
         this.serachAudioOutputDevice();
      }
      
      private function serachMidiInputDevice() : void
      {
         if(this.dictArray)
         {
            this.dictArray = new Array();
         }
         this.extension.DEVICE_searchMidiInputEndpoints();
      }
      
      public function getMidiInputDeviceList() : Array
      {
         var _loc2_:String = null;
         if(this.midiInputDictArray)
         {
            this.midiInputDictArray = new Array();
         }
         var _loc1_:String = this.extension.DEVICE_midiInputEndpoints();
         if(_loc1_ != "")
         {
            this.logMng.writeLog(">>>>> MIDI INPUT <<<<<<\n");
            this.logMng.writeLog(_loc1_ + "\n");
            _loc2_ = "<!--\tRWCSEPARATOR\t-->";
            this.midiInputDictArray = _loc1_.split(_loc2_);
         }
         return this.midiInputDictArray;
      }
      
      private function setDeviceName() : void
      {
         var _loc1_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.midiInputDictArray.length)
         {
            _loc3_ = this.midiInputDictArray[_loc2_];
            _loc1_ = new XML(_loc3_.toString());
            _loc4_ = this.searchSelectDeviceName(_loc1_,"midi");
            if(_loc4_ != "")
            {
               this.deviceData = {};
               this.deviceData.deviceName = _loc4_;
               this.deviceArray.push(this.deviceData);
               if(String(this.deviceData.deviceName).indexOf("KATANA") != -1 && String(this.deviceData.deviceName).indexOf("CTRL") == -1)
               {
                  this.gtDeviceName = this.deviceData.deviceName;
               }
            }
            _loc2_++;
         }
      }
      
      private function setMidiInputSelectKey() : void
      {
         var _loc1_:XML = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.midiInputDictArray.length)
         {
            _loc3_ = this.midiInputDictArray[_loc2_] as Object;
            _loc1_ = new XML(_loc3_.toString());
            _loc4_ = this.searchSelectDeviceName(_loc1_,"midi");
            _loc5_ = this.searchSelectKey(_loc1_,"midi");
            _loc6_ = false;
            _loc7_ = 0;
            while(_loc7_ < this.deviceArray.length)
            {
               if(this.deviceArray[_loc7_].deviceName == _loc4_)
               {
                  if(!this.deviceArray[_loc7_].midiInKey)
                  {
                     _loc6_ = true;
                     break;
                  }
               }
               _loc7_++;
            }
            if(_loc6_)
            {
               this.deviceArray[_loc7_].midiInName = _loc5_.name;
               this.deviceArray[_loc7_].midiInKey = _loc5_.val;
            }
            _loc2_++;
         }
      }
      
      private function serachMidiOutputDevice() : void
      {
         if(this.dictArray)
         {
            this.dictArray = new Array();
         }
         this.extension.DEVICE_searchMidiOutputEndpoints();
      }
      
      public function getMidiOutputDeviceList() : Array
      {
         if(this.midiOutputDictArray)
         {
            this.midiOutputDictArray = new Array();
         }
         var _loc1_:String = this.extension.DEVICE_midiOutputEndpoints();
         this.logMng.writeLog(">>>>> MIDI OUTPUT <<<<<<\n");
         this.logMng.writeLog(_loc1_ + "\n");
         var _loc2_:String = "<!--\tRWCSEPARATOR\t-->";
         this.midiOutputDictArray = _loc1_.split(_loc2_);
         return this.midiOutputDictArray;
      }
      
      private function setMidiOutputSelectKey() : void
      {
         var _loc1_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.deviceArray.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this.midiOutputDictArray.length)
            {
               _loc4_ = this.midiOutputDictArray[_loc3_] as Object;
               _loc1_ = new XML(_loc4_.toString());
               _loc5_ = this.searchSelectDeviceName(_loc1_,"midi");
               _loc6_ = this.searchSelectKey(_loc1_,"midi");
               if(this.deviceArray[_loc2_].deviceName == _loc5_)
               {
                  if(!this.deviceArray[_loc2_].midiOutKey)
                  {
                     this.deviceArray[_loc2_].midiOutName = _loc6_.name;
                     this.deviceArray[_loc2_].midiOutKey = _loc6_.val;
                     break;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      private function selectMidiInputDevice(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         return Boolean(this.extension.DEVICE_selectMidiInputEndpoint(param1));
      }
      
      private function selectMidiOutputDevice(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         return Boolean(this.extension.DEVICE_selectMidiOutputEndpoint(param1));
      }
      
      private function serachAudioInputDevice() : void
      {
         if(this.dictArray)
         {
            this.dictArray = new Array();
         }
         this.extension.DEVICE_searchAudioInputDevice();
      }
      
      public function getAudioInputDeviceList() : Array
      {
         if(this.audioInputDictArray)
         {
            this.audioInputDictArray = new Array();
         }
         var _loc1_:String = this.extension.DEVICE_audioInputDevices();
         this.logMng.writeLog(">>>>> AUDIO INPUT <<<<<<\n");
         this.logMng.writeLog(_loc1_ + "\n");
         var _loc2_:String = "<!--\tRWCSEPARATOR\t-->";
         this.audioInputDictArray = _loc1_.split(_loc2_);
         return this.audioInputDictArray;
      }
      
      private function setAudioInputSelectKey() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.deviceArray.length)
         {
            _loc2_ = this.deviceArray[_loc1_].deviceName;
            if(_loc2_.indexOf("CTRL") != -1)
            {
               _loc2_ = this.gtDeviceName;
            }
            _loc3_ = 0;
            while(_loc3_ < this.audioInputDictArray.length)
            {
               _loc4_ = this.audioInputDictArray[_loc3_] as Object;
               _loc5_ = new XML(_loc4_.toString());
               _loc6_ = this.searchSelectDeviceName(_loc5_,"audio");
               _loc7_ = this.searchSelectKey(_loc5_,"audio");
               if(_loc6_.indexOf(_loc2_) != -1)
               {
                  if(ToneCentralMediator.getInstance().isWindows)
                  {
                     if(_loc6_.indexOf("PRIMARY") != -1)
                     {
                        if(!this.deviceArray[_loc1_].audioInKey)
                        {
                           this.deviceArray[_loc1_].audioInName = _loc7_.name;
                           this.deviceArray[_loc1_].audioInKey = _loc7_.val;
                        }
                     }
                     else if(_loc6_.indexOf("SECONDARY") != -1)
                     {
                        if(!this.deviceArray[_loc1_].secAudioInKey)
                        {
                           this.deviceArray[_loc1_].secAudioInName = _loc7_.name;
                           this.deviceArray[_loc1_].secAudioInKey = _loc7_.val;
                        }
                     }
                  }
                  else if(!this.deviceArray[_loc1_].audioInKey)
                  {
                     this.deviceArray[_loc1_].audioInName = _loc7_.name;
                     this.deviceArray[_loc1_].audioInKey = _loc7_.val;
                     break;
                  }
               }
               _loc3_++;
            }
            _loc1_++;
         }
      }
      
      private function serachAudioOutputDevice() : void
      {
         if(this.dictArray)
         {
            this.dictArray = new Array();
         }
         this.extension.DEVICE_searchAudioOutputDevice();
      }
      
      public function getAudioOutputDeviceList() : Array
      {
         if(this.audioOutputDictArray)
         {
            this.audioOutputDictArray = new Array();
         }
         var _loc1_:String = this.extension.DEVICE_audioOutputDevices();
         this.logMng.writeLog(">>>>> AUDIO OUTPUT <<<<<<\n");
         this.logMng.writeLog(_loc1_ + "\n");
         var _loc2_:String = "<!--\tRWCSEPARATOR\t-->";
         this.audioOutputDictArray = _loc1_.split(_loc2_);
         return this.audioOutputDictArray;
      }
      
      private function setAudioOutputSelectKey() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.deviceArray.length)
         {
            _loc2_ = this.deviceArray[_loc1_].deviceName;
            if(_loc2_.indexOf("CTRL") != -1)
            {
               _loc2_ = this.gtDeviceName;
            }
            _loc3_ = 0;
            while(_loc3_ < this.audioOutputDictArray.length)
            {
               _loc4_ = this.audioOutputDictArray[_loc3_] as Object;
               _loc5_ = new XML(_loc4_.toString());
               _loc6_ = this.searchSelectDeviceName(_loc5_,"audio");
               _loc7_ = this.searchSelectKey(_loc5_,"audio");
               if(_loc6_.indexOf(_loc2_) != -1)
               {
                  if(ToneCentralMediator.getInstance().isWindows)
                  {
                     if(_loc6_.indexOf("PRIMARY") != -1)
                     {
                        if(!this.deviceArray[_loc1_].audioOutKey)
                        {
                           this.deviceArray[_loc1_].audioOutName = _loc7_.name;
                           this.deviceArray[_loc1_].audioOutKey = _loc7_.val;
                        }
                     }
                     else if(_loc6_.indexOf("SECONDARY") != -1)
                     {
                        if(!this.deviceArray[_loc1_].secAudioOutKey)
                        {
                           this.deviceArray[_loc1_].secAudioOutName = _loc7_.name;
                           this.deviceArray[_loc1_].secAudioOutKey = _loc7_.val;
                        }
                     }
                  }
                  else if(!this.deviceArray[_loc1_].audioOutKey)
                  {
                     this.deviceArray[_loc1_].audioOutName = _loc7_.name;
                     this.deviceArray[_loc1_].audioOutKey = _loc7_.val;
                     break;
                  }
               }
               _loc3_++;
            }
            _loc1_++;
         }
      }
      
      private function selectAudioInputDevice(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         return Boolean(this.extension.DEVICE_selectAudioInputDevice(param1));
      }
      
      private function selectAudioOutputDevice(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         return Boolean(this.extension.DEVICE_selectAudioOutputDevice(param1));
      }
      
      private function searchSelectKey(param1:XML, param2:String) : Object
      {
         var _loc7_:String = null;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:Object = {
            "name":"",
            "val":""
         };
         var _loc6_:String = "";
         for each(_loc7_ in param1.dict.children())
         {
            if(param2 == "midi")
            {
               if(_loc4_ == "RWCCoreMidiDeviceEndPointNameKey")
               {
                  _loc6_ = _loc7_;
                  _loc4_ = "";
               }
               else if(_loc4_ == "RWCCoreMidiDeviceEndPointRefKey")
               {
                  _loc3_ = _loc7_;
                  _loc4_ = "";
               }
               if(_loc7_ == "RWCCoreMidiDeviceEndPointRefKey" || _loc7_ == "RWCCoreMidiDeviceEndPointNameKey")
               {
                  _loc4_ = _loc7_;
               }
            }
            else if(param2 == "audio")
            {
               if(_loc4_ == "RWCCoreAudioDeviceNameKey")
               {
                  _loc6_ = _loc7_;
                  _loc4_ = "";
               }
               else if(_loc4_ == "RWCCoreAudioDeviceIdKey")
               {
                  _loc3_ = _loc7_;
                  _loc4_ = "";
               }
               if(_loc7_ == "RWCCoreAudioDeviceIdKey" || _loc7_ == "RWCCoreAudioDeviceNameKey")
               {
                  _loc4_ = _loc7_;
               }
            }
         }
         return {
            "name":_loc6_,
            "val":_loc3_
         };
      }
      
      private function searchSelectDeviceName(param1:XML, param2:String) : String
      {
         var _loc6_:String = null;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:String = "";
         for each(_loc6_ in param1.dict.children())
         {
            if(param2 == "midi")
            {
               if(_loc4_ == "RWCCoreMidiDeviceNameKey")
               {
                  _loc3_ = _loc6_;
                  break;
               }
               if(_loc6_ == "RWCCoreMidiDeviceNameKey")
               {
                  _loc4_ = _loc6_;
               }
            }
            else if(param2 == "audio")
            {
               if(_loc4_ == "RWCCoreAudioDeviceNameKey")
               {
                  _loc3_ = _loc6_;
                  break;
               }
               if(_loc6_ == "RWCCoreAudioDeviceNameKey")
               {
                  _loc4_ = _loc6_;
               }
            }
         }
         return _loc3_;
      }
      
      private function getDeviceID() : void
      {
         this.paramName = "deviceID";
         var _loc1_:String = this.extension.DEVICE_midiOutput(this.addressMap.request_device_id);
      }
      
      public function getID() : void
      {
         this.paramName = "id";
         var _loc1_:String = "F0,7E," + ToneCentralUtil.convertHexaDecimal(this.params.deviceID,2) + ",06,01,F7";
         var _loc2_:String = this.extension.DEVICE_midiOutput(_loc1_);
      }
      
      private function getEditorComunicationLevel() : void
      {
         this.paramName = "editorComunicationLevel";
         var _loc1_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,this.addressMap.command_editor_comunication_level.address,this.addressMap.command_editor_comunication_level.size));
      }
      
      public function getRunningMode() : void
      {
         var _loc1_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,this.addressMap.command_running_mode.address,this.addressMap.command_running_mode.size));
      }
      
      private function setEditorComunicationnMode(param1:Boolean) : void
      {
         var _loc2_:String = null;
         this.paramName = "";
         if(param1)
         {
            _loc2_ = "01";
         }
         else
         {
            _loc2_ = "00";
         }
         var _loc3_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.addressMap.command_editor_comunication_mode.address,_loc2_));
      }
      
      private function getSetupParams() : void
      {
         var _loc1_:String = this.addressMap.current_patch_no.address;
         this.requestAddressList.push({
            "address":_loc1_,
            "name":"setup"
         });
         var _loc2_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,_loc1_,this.addressMap.current_patch_no.size));
      }
      
      private function getSystemParams() : void
      {
         this.address = this.systemDecimalPatchSize[this.systemRequestCount].address;
         this.size = "00,00,00," + ToneCentralUtil.convertHexaDecimal(this.systemDecimalPatchSize[this.systemRequestCount].size,2);
         this.requestAddressList.push({
            "address":this.address,
            "name":"system"
         });
         this.blockParameterRequest();
      }
      
      private function getTemporaryPatchParams() : void
      {
         this.address = this.getTemporaryPatchSize[this.temporaryRequestCount].address;
         var _loc1_:String = ToneCentralUtil.convertHexaDecimal(this.getTemporaryPatchSize[this.temporaryRequestCount].size,4);
         this.size = "00,00," + _loc1_.slice(0,2) + "," + _loc1_.slice(2,4);
         this.blockParameterRequest();
      }
      
      private function getPatchParams() : void
      {
         if(this.patchAddressList.length <= this.patchRequestCount)
         {
            return;
         }
         this.address = this.patchAddressList[this.patchRequestCount].address;
         var _loc1_:String = ToneCentralUtil.convertHexaDecimal(this.patchAddressList[this.patchRequestCount].size,4);
         this.size = "00,00," + _loc1_.slice(0,2) + "," + _loc1_.slice(2,4);
         this.blockParameterRequest();
         this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.getPatchParamsTimeoutHandler,false,0,true);
         this.timeoutTimer.start();
      }
      
      private function getPatchParamsTimeoutHandler(param1:TimerEvent) : void
      {
         if(this.isWriteStepedGetPatchParam)
         {
            this.isWriteStoped = true;
         }
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.getPatchParamsTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.retryCount;
         if(this.retryCount < 6)
         {
            this.blockParameterRequest();
         }
      }
      
      private function getQuickSettingParams() : void
      {
         this.address = this.quickSettingPatchAddress[this.quickSettingPatchCount] + this.quickSettingAddress[this.quickSettingRequestCount].address;
         this.size = "00,00,00," + ToneCentralUtil.convertHexaDecimal(this.quickSettingAddress[this.quickSettingRequestCount].size,2);
         this.requestAddressList.push({
            "address":this.address,
            "name":"quickSettingParams"
         });
         this.blockParameterRequest();
         this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.quickSettingTimeoutHandler,false,0,true);
         this.timeoutTimer.start();
      }
      
      private function quickSettingTimeoutHandler(param1:TimerEvent) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.quickSettingTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.retryCount;
         if(!ToneCentralMediator.getInstance().connected)
         {
            this.retryCount = 0;
            this._isQuickSettingLoading = false;
            this.quickSettingRequestCount = -1;
         }
         else if(this.retryCount < 6)
         {
            this.getQuickSettingParams();
         }
         else
         {
            this.showAppErrorDialog();
         }
      }
      
      private function blockParameterRequest() : void
      {
         var _loc1_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,this.address,this.size));
      }
      
      private function getPatchListNames() : void
      {
         var _loc1_:Array = null;
         _loc1_ = ["10","00","00","00"];
         var _loc2_:String = this.getIncrementAddress(_loc1_);
         var _loc3_:String = "00,00,00," + ToneCentralUtil.convertHexaDecimal("16",2);
         this.requestAddressList.push({
            "address":_loc2_,
            "name":"patchListNames"
         });
         var _loc4_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,_loc2_,_loc3_));
         this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.patchListNameTimeoutHandler,false,0,true);
         this.timeoutTimer.start();
      }
      
      private function patchListNameTimeoutHandler(param1:TimerEvent) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.patchListNameTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.retryCount;
         if(this.retryCount < 6)
         {
            this.getPatchListNames();
         }
         else
         {
            this.showAppErrorDialog();
         }
      }
      
      private function getUserPatchListNames() : void
      {
         var _loc1_:Array = ["10","00","00","00"];
         var _loc2_:String = this.getIncrementAddress(_loc1_);
         var _loc3_:String = "00,00,00," + ToneCentralUtil.convertHexaDecimal("16",2);
         this.requestAddressList.push({
            "address":_loc2_,
            "name":"userPatchListNames"
         });
         var _loc4_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,_loc2_,_loc3_));
         this.timeoutTimer.addEventListener(TimerEvent.TIMER,this.userPatchListNameTimeoutHandler,false,0,true);
         this.timeoutTimer.start();
      }
      
      private function userPatchListNameTimeoutHandler(param1:TimerEvent) : void
      {
         this.timeoutTimer.removeEventListener(TimerEvent.TIMER,this.userPatchListNameTimeoutHandler);
         this.timeoutTimer.reset();
         ++this.retryCount;
         if(this.retryCount < 6)
         {
            this.getUserPatchListNames();
         }
         else
         {
            this.showAppErrorDialog();
         }
      }
      
      public function showAppErrorDialog() : void
      {
         var _loc1_:AppErrorPopup = null;
         this.retryError = true;
         if(!Context.dialogMng.currentPopup)
         {
            _loc1_ = new AppErrorPopup();
            _loc1_.setHeaderText("dialog.appError.header");
            _loc1_.setMsgText("dialog.appError.msg");
            Context.dialogMng.show(_loc1_,true);
         }
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.RETRY_ERROR));
      }
      
      public function getIncrementAddress(param1:Array) : String
      {
         var _loc2_:Number = this.listIndex;
         if(this.listIndex >= 200)
         {
            _loc2_ = this.listIndex - 200;
         }
         var _loc3_:String = ToneCentralUtil.convertHexaDecimal(_loc2_.toString(),2);
         var _loc4_:Number = parseInt("0x" + param1[0] + param1[1],16) + parseInt("0x" + _loc3_,16);
         if(this.listIndex < 200 && _loc4_ > 4223 || this.listIndex >= 200 && _loc4_ > 8319)
         {
            param1[0] = ToneCentralUtil.zeroPadding((parseInt("0x" + param1[0],16) + 1).toString(16),2);
            _loc3_ = ToneCentralUtil.convertHexaDecimal((_loc2_ - 128).toString(),2);
            _loc4_ = parseInt("0x" + param1[0] + param1[1],16) + parseInt("0x" + _loc3_,16);
         }
         var _loc5_:String = ToneCentralUtil.zeroPadding(_loc4_.toString(16),4);
         param1[0] = ToneCentralUtil.zeroPadding(_loc5_.substring(0,2),2);
         param1[1] = ToneCentralUtil.zeroPadding(_loc5_.substring(2),2);
         var _loc6_:String = param1.join(",");
         return _loc6_.toUpperCase();
      }
      
      public function getPatchName(param1:int) : void
      {
         var _loc2_:String = "00,00,00," + ONE_PATCH_NAME_SIZE.toString(16);
         var _loc3_:String = this.addressMap.addressObj.patch_list[param1].address;
         this.requestAddressList.push({
            "address":_loc3_,
            "name":"patchName"
         });
         var _loc4_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,_loc3_,_loc2_));
      }
      
      private function getPatchListParams() : void
      {
         var _loc1_:String = "00,00,00," + ONE_PATCH_SIZE.toString(16);
         var _loc2_:String = this.addressMap.addressObj.patch_list[this.listIndex].address;
         this.requestAddressList.push({
            "address":_loc2_,
            "name":"patchListParams"
         });
         var _loc3_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,_loc2_,_loc1_));
      }
      
      public function getPatchMap(param1:String) : void
      {
         var _loc2_:String = "00,00,00,7F";
         var _loc3_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(0,param1,_loc2_));
      }
      
      private function patchChange() : void
      {
         var _loc1_:String = ToneCentralUtil.convertHexaDecimal(Math.floor(this.listIndex / 128).toString(),2);
         var _loc2_:String = ToneCentralUtil.convertHexaDecimal((this.listIndex % 128).toString(),2);
         var _loc3_:String = this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.addressMap.addressObj.setup[0].address,_loc1_ + "," + _loc2_));
         this.patchChangeRetryTimer.removeEventListener(TimerEvent.TIMER,this.patchChangeRetryHandler);
         this.patchChangeRetryTimer.reset();
         this.patchChangeRetryTimer.addEventListener(TimerEvent.TIMER,this.patchChangeRetryHandler,false,0,true);
         this.patchChangeRetryTimer.start();
      }
      
      private function patchChangeRetryHandler(param1:TimerEvent) : void
      {
         this.patchChangeRetryTimer.removeEventListener(TimerEvent.TIMER,this.patchChangeRetryHandler);
         this.patchChangeRetryTimer.reset();
         this.patchChange();
      }
      
      private function convertParamArray(param1:XML) : Array
      {
         var _loc2_:int = param1.children().length();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(param1.data[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function getData(param1:Array) : String
      {
         return param1[param1.length - 3];
      }
      
      private function getDatas(param1:Array) : Array
      {
         var _loc2_:int = 12;
         var _loc3_:int = param1.length - 2;
         return param1.slice(_loc2_,_loc3_);
      }
      
      private function receievedTemporaryPatchParam(param1:String, param2:Array) : void
      {
         var _loc3_:Object = {
            "address":param1,
            "value":param2
         };
         this.updateTemporaryParams(_loc3_);
      }
      
      public function addUpdateTemporaryCallback(param1:Function) : void
      {
         this.updateTemporaryCallbacks.push(param1);
      }
      
      private function updateTemporaryParams(param1:Object) : void
      {
         var _loc3_:Function = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.updateTemporaryCallbacks.length)
         {
            _loc3_ = this.updateTemporaryCallbacks[_loc2_];
            _loc3_(param1);
            _loc2_++;
         }
      }
      
      private function receievedSystemParam(param1:String, param2:Array) : void
      {
         var _loc3_:Object = {
            "address":param1,
            "value":param2
         };
         this.updateSystemParams(_loc3_);
      }
      
      public function addUpdateSystemCallback(param1:Function) : void
      {
         this.updateSystemCallbacks.push(param1);
      }
      
      private function updateSystemParams(param1:Object) : void
      {
         var _loc3_:Function = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.updateSystemCallbacks.length)
         {
            _loc3_ = this.updateSystemCallbacks[_loc2_];
            _loc3_(param1);
            _loc2_++;
         }
      }
      
      private function receievedPatchWriteParam(param1:Array) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PATCH_WRITE));
         var _loc2_:Timer = new Timer(1000,1);
         _loc2_.addEventListener(TimerEvent.TIMER,this.patchWriteDelayHandler,false,0,true);
         _loc2_.start();
      }
      
      private function patchWriteDelayHandler(param1:TimerEvent) : void
      {
         this.isPatchWrite = true;
         if(!this.isPatchNameLoading)
         {
            this.getUserPatchListNamesFunc();
         }
         else
         {
            this.isLoadingPatchWrite = true;
         }
      }
      
      public function RECORDER_recording(param1:String) : Boolean
      {
         var _loc2_:Boolean = Boolean(this.extension.RECORDER_createRecordingWithURL(param1));
         if(_loc2_)
         {
            this.extension.RECORDER_recording();
         }
         return _loc2_;
      }
      
      public function RECORDER_stopRecording() : void
      {
         this.extension.RECORDER_stopRecording();
      }
      
      public function RECORDER_currentRecordingTime() : String
      {
         var _loc1_:Number = Number(this.extension.RECORDER_currentRecordingTime());
         return _loc1_.toString();
      }
      
      public function PLAYER_openSoundWithURL(param1:String) : Boolean
      {
         return this.extension.PLAYER_openSoundWithURL(param1);
      }
      
      public function PLAYER_playSound() : void
      {
         this.extension.PLAYER_playSound();
      }
      
      public function PLAYER_currentTime() : Number
      {
         return this.extension.PLAYER_currentTime();
      }
      
      public function PLAYER_totalTime() : Number
      {
         return this.extension.PLAYER_totalTime();
      }
      
      public function PLAYER_soundVolume() : Number
      {
         return this.extension.PLAYER_soundVolume();
      }
      
      public function PLAYER_soundPitch() : Number
      {
         return this.extension.PLAYER_soundPitch();
      }
      
      public function PLAYER_soundSpeed() : Number
      {
         return this.extension.PLAYER_soundSpeed();
      }
      
      public function PLAYER_pauseSound() : void
      {
         this.extension.PLAYER_pauseSound();
      }
      
      public function PLAYER_stopSound() : void
      {
         this.extension.PLAYER_stopSound();
      }
      
      public function PLAYER_setCurrentTime(param1:Number) : void
      {
         this.extension.PLAYER_setCurrentTime(param1);
      }
      
      public function PLAYER_playStartTimeStamp() : void
      {
         this.extension.PLAYER_playStartTimeStamp();
      }
      
      public function PLAYER_setRepeatMode(param1:Boolean) : void
      {
         this.extension.PLAYER_setRepeatMode(param1);
      }
      
      public function PLAYER_closeSound() : void
      {
         this.extension.PLAYER_closeSound();
      }
      
      public function PLAYER_setSoundPitch(param1:int) : void
      {
         this.extension.PLAYER_setSoundPitch(param1);
      }
      
      public function PLAYER_setSoundSpeed(param1:Number) : void
      {
         this.extension.PLAYER_setSoundSpeed(param1);
      }
      
      public function PLAYER_setSoundVolume(param1:Number) : void
      {
         this.extension.PLAYER_setSoundVolume(param1);
      }
      
      public function RECORDER_setRecordingVolume(param1:int) : void
      {
         this.extension.RECORDER_setRecordingVolume(param1);
      }
      
      public function PLAYER_setRepeatA(param1:Number) : void
      {
         this.extension.PLAYER_setRepeatA(param1);
      }
      
      public function PLAYER_setRepeatB(param1:Number) : void
      {
         this.extension.PLAYER_setRepeatB(param1);
      }
      
      public function PLAYER_repeatA() : Number
      {
         return this.extension.PLAYER_repeatA();
      }
      
      public function PLAYER_repeatB() : Number
      {
         return this.extension.PLAYER_repeatB();
      }
      
      public function setPrimaryAudioPort() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(this.selectedPort == ToneCentralDefinition.PRIMARY)
         {
            return false;
         }
         if(this.selectedDeviceData.audioInKey)
         {
            _loc2_ = this.selectAudioInputDevice(this.selectedDeviceData.audioInKey);
         }
         if(this.selectedDeviceData.audioOutKey)
         {
            _loc3_ = this.selectAudioOutputDevice(this.selectedDeviceData.audioOutKey);
         }
         var _loc1_:Boolean = _loc2_ && _loc3_;
         if(_loc1_)
         {
            this.selectedPort = ToneCentralDefinition.PRIMARY;
         }
         return _loc1_;
      }
      
      public function setSecondaryAudioPort() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(this.selectedPort == ToneCentralDefinition.SECONDARY)
         {
            return false;
         }
         if(this.selectedDeviceData.secAudioInKey)
         {
            _loc2_ = this.selectAudioInputDevice(this.selectedDeviceData.secAudioInKey);
         }
         if(this.selectedDeviceData.secAudioOutKey)
         {
            _loc3_ = this.selectAudioOutputDevice(this.selectedDeviceData.secAudioOutKey);
         }
         var _loc1_:Boolean = _loc2_ && _loc3_;
         if(_loc1_)
         {
            this.selectedPort = ToneCentralDefinition.SECONDARY;
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
         if(ToneCentralMediator.getInstance().isWindows)
         {
            this.extension.dispose();
         }
      }
      
      public function setSystemSetting(param1:Object) : void
      {
         var _loc2_:String = "";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.knobMode,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.autoOff,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.tunerMute,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.patchChangeMode,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.manualChangeMode,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.usbLevel,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.usbLoopback,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.usbDryRec,2) + ",";
         _loc2_ += ToneCentralUtil.convertHexaDecimal(param1.usbMidiCh,2);
         this.paramName = "system";
         this.commandSetUsbDirectMon(param1.usbDirectMon);
      }
      
      public function get connected() : Boolean
      {
         return this._connected;
      }
      
      public function set connected(param1:Boolean) : void
      {
         this._connected = param1;
         if(!this._connected)
         {
            if(this.paramName == "patchListNames")
            {
               this.params.patchlistParams = new ArrayCollection();
               this.paramName = "";
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_LIST_FAULT));
            }
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get params() : SysExParams
      {
         return this._params;
      }
      
      public function set params(param1:SysExParams) : void
      {
         this._params = param1;
      }
      
      public function get address() : String
      {
         return this._address;
      }
      
      public function set address(param1:String) : void
      {
         this._address = param1;
      }
      
      public function get size() : String
      {
         return this._size;
      }
      
      public function set size(param1:String) : void
      {
         this._size = param1;
      }
      
      public function get param() : String
      {
         return this._param;
      }
      
      public function set param(param1:String) : void
      {
         this._param = param1;
      }
      
      public function get response() : String
      {
         return this._response;
      }
      
      public function set response(param1:String) : void
      {
         this._response = param1;
      }
      
      public function get command() : String
      {
         return this._command;
      }
      
      public function set command(param1:String) : void
      {
         this._command = param1;
      }
      
      public function get listIndex() : int
      {
         return this._listIndex;
      }
      
      public function set listIndex(param1:int) : void
      {
         this._listIndex = param1;
      }
      
      public function get temporaryAllUpdate() : Boolean
      {
         return this._temporaryAllUpdate;
      }
      
      public function set temporaryAllUpdate(param1:Boolean) : void
      {
         this._temporaryAllUpdate = param1;
      }
      
      public function setPreampA(param1:String) : void
      {
         var _loc2_:Array = param1.split(",");
         var _loc3_:Array = String(this.addressMap.temp_preamp_a_on_off.address).split(",");
         param1 = _loc2_[0] + "," + _loc2_[1] + "," + _loc3_[2] + "," + _loc3_[3];
         var _loc4_:String = this.params.temporaryParams.getExData(this.addressMap.temp_preamp_a_on_off.address,32);
         this.setDataFunc(param1,_loc4_);
      }
      
      public function setPreampB(param1:String) : void
      {
         var _loc2_:Array = param1.split(",");
         var _loc3_:Array = String(this.addressMap.temp_preamp_b_on_off.address).split(",");
         param1 = _loc2_[0] + "," + _loc2_[1] + "," + _loc3_[2] + "," + _loc3_[3];
         var _loc4_:String = this.params.temporaryParams.getExData(this.addressMap.temp_preamp_b_on_off.address,32);
         this.setDataFunc(param1,_loc4_);
      }
      
      public function chABWrite(param1:String) : void
      {
         this.extension.DEVICE_midiOutput(this.createSysExAddress(1,this.addressMap.command_ab_utility.address,ToneCentralUtil.convertHexaDecimal(param1,2)));
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
