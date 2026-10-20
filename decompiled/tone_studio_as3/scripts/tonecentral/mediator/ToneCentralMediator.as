package tonecentral.mediator
{
   import flash.events.EventDispatcher;
   import tonecentral.common.data.Config;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class ToneCentralMediator extends EventDispatcher
   {
      
      private static var instance:ToneCentralMediator;
      
      private var _sysex:SystemExclusive;
      
      private var _currentViewStatus:String = "details";
      
      private var _selectedEffectChainData:Object;
      
      private var _conf:Config;
      
      private var _updateXmlKatana100_212:XML;
      
      private var _updateXmlKatana100:XML;
      
      private var _updateXmlKatana50:XML;
      
      private var _updateXmlKatanaHead:XML;
      
      private var _updateXmlKatanaArtist:XML;
      
      private var _manualUpdateKatana100_212:Boolean;
      
      private var _manualUpdateKatana100:Boolean;
      
      private var _manualUpdateKatana50:Boolean;
      
      private var _manualUpdateKatanaHead:Boolean;
      
      private var _manualUpdateKatanaArtist:Boolean;
      
      private var _selectedPatchIndex:int;
      
      private var _connected:Boolean = false;
      
      private var _contentsAreaMode:Mode = Mode.EDITOR;
      
      public var selectedArea:String = "sideArea";
      
      public var selectedMode:Mode = Mode.EDITOR;
      
      public var isInitInstall:Boolean = false;
      
      public var data:Object;
      
      public var appWindowHeight:Number;
      
      public var isInited:Boolean = false;
      
      public var isBackupLoading:Boolean = false;
      
      public var isInitLoading:Boolean = false;
      
      public var isWindows:Boolean = false;
      
      public var isOverflow:Boolean = false;
      
      public var overCount:String = "";
      
      private var _ampModel:int = 1;
      
      private var _runningMode:String;
      
      private var _hideMemo:Boolean = true;
      
      public var isShowLoading:Boolean = false;
      
      public var isPatchLoading:Boolean = false;
      
      public var isPatchListMouseDown:Boolean = false;
      
      public function ToneCentralMediator(param1:Blocker)
      {
         super();
         if(!param1)
         {
            throw new Error("use getInstance.");
         }
      }
      
      public static function getInstance() : ToneCentralMediator
      {
         if(!instance)
         {
            instance = new ToneCentralMediator(new Blocker());
         }
         return instance;
      }
      
      public function get manualUpdateKatanaHead() : Boolean
      {
         return this._manualUpdateKatanaHead;
      }
      
      public function set manualUpdateKatanaHead(param1:Boolean) : void
      {
         this._manualUpdateKatanaHead = param1;
      }
      
      public function get manualUpdateKatana50() : Boolean
      {
         return this._manualUpdateKatana50;
      }
      
      public function set manualUpdateKatana50(param1:Boolean) : void
      {
         this._manualUpdateKatana50 = param1;
      }
      
      public function get manualUpdateKatana100() : Boolean
      {
         return this._manualUpdateKatana100;
      }
      
      public function set manualUpdateKatana100(param1:Boolean) : void
      {
         this._manualUpdateKatana100 = param1;
      }
      
      public function get manualUpdateKatana100_212() : Boolean
      {
         return this._manualUpdateKatana100_212;
      }
      
      public function set manualUpdateKatana100_212(param1:Boolean) : void
      {
         this._manualUpdateKatana100_212 = param1;
      }
      
      public function get manualUpdateKatanaArtist() : Boolean
      {
         return this._manualUpdateKatanaArtist;
      }
      
      public function set manualUpdateKatanaArtist(param1:Boolean) : void
      {
         this._manualUpdateKatanaArtist = param1;
      }
      
      public function get updateXmlKatanaHead() : XML
      {
         return this._updateXmlKatanaHead;
      }
      
      public function set updateXmlKatanaHead(param1:XML) : void
      {
         this._updateXmlKatanaHead = param1;
      }
      
      public function get updateXmlKatana50() : XML
      {
         return this._updateXmlKatana50;
      }
      
      public function set updateXmlKatana50(param1:XML) : void
      {
         this._updateXmlKatana50 = param1;
      }
      
      public function get updateXmlKatana100() : XML
      {
         return this._updateXmlKatana100;
      }
      
      public function set updateXmlKatana100(param1:XML) : void
      {
         this._updateXmlKatana100 = param1;
      }
      
      public function get updateXmlKatana100_212() : XML
      {
         return this._updateXmlKatana100_212;
      }
      
      public function set updateXmlKatana100_212(param1:XML) : void
      {
         this._updateXmlKatana100_212 = param1;
      }
      
      public function get updateXmlKatanaArtist() : XML
      {
         return this._updateXmlKatanaArtist;
      }
      
      public function set updateXmlKatanaArtist(param1:XML) : void
      {
         this._updateXmlKatanaArtist = param1;
      }
      
      public function get ampModel() : int
      {
         return this._ampModel;
      }
      
      public function set ampModel(param1:int) : void
      {
         this._ampModel = param1;
         if(this._ampModel == 0)
         {
            ParameterDefinitionGT.MAX_PATCH_NUMBER = 4;
         }
         else
         {
            ParameterDefinitionGT.MAX_PATCH_NUMBER = 8;
         }
      }
      
      public function get hideMemo() : Boolean
      {
         return this._hideMemo;
      }
      
      public function set hideMemo(param1:Boolean) : void
      {
         this._hideMemo = param1;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_VISIBLE_MEMO));
      }
      
      public function setPatchTooltip() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SET_PATCH_TOOLTIP));
      }
      
      public function resetPatchTooltip() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.RESET_PATCH_TOOLTIP));
      }
      
      public function get runningMode() : String
      {
         return this._runningMode;
      }
      
      public function set runningMode(param1:String) : void
      {
         this._runningMode = param1;
      }
      
      public function get sysex() : SystemExclusive
      {
         return this._sysex;
      }
      
      public function set sysex(param1:SystemExclusive) : void
      {
         this._sysex = param1;
      }
      
      public function get currentViewStatus() : String
      {
         return this._currentViewStatus;
      }
      
      public function set currentViewStatus(param1:String) : void
      {
         this._currentViewStatus = param1;
      }
      
      public function get conf() : Config
      {
         return this._conf;
      }
      
      public function set conf(param1:Config) : void
      {
         this._conf = param1;
      }
      
      public function get selectedPatchIndex() : int
      {
         return this._selectedPatchIndex;
      }
      
      public function set selectedPatchIndex(param1:int) : void
      {
         this._selectedPatchIndex = param1;
      }
      
      public function get connected() : Boolean
      {
         return this._connected;
      }
      
      public function set connected(param1:Boolean) : void
      {
         if(this._connected == param1)
         {
            return;
         }
         this._connected = param1;
         this._sysex.connected = this._connected;
         if(this._connected)
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CONNECTED));
         }
         else
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DISCONNECTED));
         }
      }
      
      public function get contentsAreaMode() : Mode
      {
         return this._contentsAreaMode;
      }
      
      public function set contentsAreaMode(param1:Mode) : void
      {
         this._contentsAreaMode = param1;
      }
      
      public function TCTagChange(param1:Object) : void
      {
         this.data = param1;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.TC_TAG_CHANGE));
      }
      
      public function get selectedEffectChainData() : Object
      {
         return this._selectedEffectChainData;
      }
      
      public function set selectedEffectChainData(param1:Object) : void
      {
         this._selectedEffectChainData = param1;
      }
      
      public function showLoading() : void
      {
         this.isShowLoading = true;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SHOW_LOADING));
      }
      
      public function hideLoading() : void
      {
         if(this.isBackupLoading || this.isInitLoading || this.isPatchLoading)
         {
            return;
         }
         this.isShowLoading = false;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.HIDE_LOADING));
      }
      
      public function showAddLiveSetMsg() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SHOW_ADD_LIVESET_MSG));
      }
      
      public function hideAddLiveSetMsg() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.HIDE_ADD_LIVESET_MSG));
      }
      
      public function effectCategoryChange(param1:String) : void
      {
         var _loc2_:ViewStatusEvent = new ViewStatusEvent(ViewStatusEvent.EFFECT_CATEGORY_CHANGE);
         _loc2_.data = param1;
         dispatchEvent(_loc2_);
      }
      
      public function errorExit() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.ERROR_EXIT));
      }
      
      public function changeEditMode() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_EDIT_MODE));
      }
      
      public function showSelectDevice() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SHOW_SELECT_DEVICE));
      }
      
      public function changeViewState(param1:String) : void
      {
         var _loc2_:ViewStatusEvent = new ViewStatusEvent(ViewStatusEvent.VIEW_STATUS_CHANGE);
         _loc2_.state = param1;
         this.currentViewStatus = param1;
         dispatchEvent(_loc2_);
      }
      
      public function libraryMouseUp() : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LIB_LOADING_MOUSE_UP));
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
