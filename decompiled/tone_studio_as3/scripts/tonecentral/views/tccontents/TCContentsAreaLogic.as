package tonecentral.views.tccontents
{
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.Timer;
   import jp.co.site4d.events.NetEvent;
   import jp.co.site4d.net.FileDownloader;
   import mx.collections.ArrayCollection;
   import spark.events.IndexChangeEvent;
   import tonecentral.common.data.LibraryDataSet;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.data.TCPageData;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.LogManager;
   import tonecentral.common.net.DataAPILoader;
   import tonecentral.common.net.LiveSetLoader;
   import tonecentral.common.net.NetworkManager;
   import tonecentral.common.storage.LiveSetStorageManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class TCContentsAreaLogic extends ToneCentralViewLogic
   {
      
      private var view:TCContentsArea;
      
      private var apiLoader:DataAPILoader;
      
      private var livesetLoader:LiveSetLoader;
      
      private var liveSetStorageMng:LiveSetStorageManager;
      
      private var playListData:Object;
      
      private var pageDataList:Vector.<TCPageData>;
      
      private var liveSetData:LibraryDataSet;
      
      private var addressMap:AddressMap;
      
      private var mediator:ToneCentralMediator;
      
      private var logMng:LogManager;
      
      private var downloadBtnTimer:Timer = new Timer(3000);
      
      private var refreshTimer:Timer = new Timer(2000);
      
      private var downloader:FileDownloader = new FileDownloader();
      
      public function TCContentsAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = TCContentsArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.liveSetStorageMng = LiveSetStorageManager.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.addressMap = AddressMap.getInstance();
         this.view.liveSetList.addEventListener(IndexChangeEvent.CHANGE,this.liveSetChangeHandler,false,0,true);
         this.view.patchList.addEventListener(IndexChangeEvent.CHANGE,this.patchChangeHandler,false,0,true);
         this.view.downloadButton.addEventListener(MouseEvent.CLICK,this.downloadButtonClickHandler,false,0,true);
         this.apiLoader = new DataAPILoader();
         this.apiLoader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.entryLoadCompleteHandler,false,0,true);
         this.apiLoader.addEventListener(ToneCentralEvents.LOAD_FAULT,this.entryLoadFaultHandler,false,0,true);
         this.logMng = LogManager.getInstance();
         this.livesetLoader = new LiveSetLoader();
         this.livesetLoader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.liveSetLoadCompleteHandler,false,0,true);
         this.livesetLoader.addEventListener(ToneCentralEvents.LOAD_FAULT,this.livesetLoadFaultHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.TC_TAG_CHANGE,this.tcTagChangeHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED,this.settingOKHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_START,this.setTemporaryStartHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.setTemporaryEndHandler,false,0,true);
         this.changeDownloadButton();
         this.view.loadFaultModal.refreshBtn.addEventListener(MouseEvent.CLICK,this.onRefresh,false,0,true);
         this.mediator.showLoading();
         this.load();
      }
      
      override protected function onShow() : void
      {
         this.apiLoader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.entryLoadCompleteHandler,false,0,true);
         this.apiLoader.addEventListener(ToneCentralEvents.LOAD_FAULT,this.entryLoadFaultHandler,false,0,true);
         this.mediator.showLoading();
         this.load();
      }
      
      private function setTemporaryStartHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.showLoading();
      }
      
      private function setTemporaryEndHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.getTemporaryPatchParamsFunc();
         this.mediator.hideLoading();
      }
      
      private function load() : void
      {
         var _loc1_:File = File.applicationStorageDirectory.resolvePath("tc/entries.json");
         if(!NetworkManager.getInstance().available && !_loc1_.exists)
         {
            this.mediator.hideLoading();
            this.view.loadFaultModal.visible = true;
         }
         else
         {
            this.view.loadFaultModal.visible = false;
            this.apiLoader.loadEntry();
         }
      }
      
      private function settingOKHandler(param1:ToneCentralEvents) : void
      {
         this.changeDownloadButton();
      }
      
      private function changeDownloadButton() : void
      {
         this.view.downloadButton.width = 120;
      }
      
      private function patchChangeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:PatchData = null;
         if(this.mediator.connected)
         {
            _loc2_ = PatchData.restore(this.view.patchList.selectedItem);
            this.mediator.sysex.setTemporaryParams(_loc2_.params);
         }
         else
         {
            this.mediator.sysex.params.temporaryParams = PatchData.restore(this.view.patchList.selectedItem).params;
            this.mediator.sysex.dispatchPatchChange();
         }
      }
      
      private function livesetLoadFaultHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
         this.livesetLoader.removeEventListener(ToneCentralEvents.LOAD_COMPLETE,this.liveSetLoadCompleteHandler);
         this.livesetLoader.removeEventListener(ToneCentralEvents.LOAD_FAULT,this.livesetLoadFaultHandler);
      }
      
      private function onRefresh(param1:MouseEvent) : void
      {
         this.view.loadFaultModal.visible = false;
         this.mediator.showLoading();
         this.refreshTimer.addEventListener(TimerEvent.TIMER,this.delayRefresh,false,0,true);
         this.refreshTimer.start();
      }
      
      private function delayRefresh(param1:TimerEvent) : void
      {
         this.refreshTimer.removeEventListener(TimerEvent.TIMER,this.delayRefresh);
         this.refreshTimer.reset();
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_COMPLETE,this.entryLoadCompleteHandler);
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_FAULT,this.entryLoadFaultHandler);
         this.apiLoader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.refreshLoadCompleteHandler,false,0,true);
         this.apiLoader.addEventListener(ToneCentralEvents.LOAD_FAULT,this.refreshLoadFaultHandler,false,0,true);
         this.load();
      }
      
      private function refreshLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
         ToneCentralMediator.getInstance().dispatchEvent(new ToneCentralEvents(ToneCentralEvents.REFRESH_COMPLETE_TC));
         this.entryLoadCompleteHandler(param1);
      }
      
      private function refreshLoadFaultHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_COMPLETE,this.refreshLoadCompleteHandler);
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_FAULT,this.entryLoadFaultHandler);
      }
      
      private function entryLoadFaultHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_COMPLETE,this.entryLoadCompleteHandler);
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_FAULT,this.entryLoadFaultHandler);
      }
      
      private function entryLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_COMPLETE,this.entryLoadCompleteHandler);
         this.apiLoader.removeEventListener(ToneCentralEvents.LOAD_FAULT,this.entryLoadFaultHandler);
         var _loc2_:ArrayCollection = new ArrayCollection();
         this.pageDataList = param1.data as Vector.<TCPageData>;
         var _loc3_:int = 0;
         while(_loc3_ < this.pageDataList.length)
         {
            _loc2_.addItem(this.pageDataList[_loc3_]);
            _loc3_++;
         }
         this.view.liveSetList.dataProvider = _loc2_;
         this.view.liveSetList.selectedIndex = 0;
         this.view.infoArea.pageData = this.view.liveSetList.selectedItem;
         this.view.infoArea.changeEnablePermaLinkButton(true);
         this.loadLiveSet();
      }
      
      private function tcTagChangeHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:int = 0;
         while(_loc3_ < this.pageDataList.length)
         {
            if(this.mediator.data == ToneCentralDefinition.GENRE_PICKUP)
            {
               if(this.pageDataList[_loc3_].pickup || this.pageDataList[_loc3_].promotion)
               {
                  _loc2_.addItem(this.pageDataList[_loc3_]);
               }
            }
            else if(this.mediator.data == ToneCentralDefinition.GENRE_ALL || this.pageDataList[_loc3_].tags.indexOf(this.mediator.data) != -1)
            {
               _loc2_.addItem(this.pageDataList[_loc3_]);
            }
            _loc3_++;
         }
         this.view.liveSetList.dataProvider = _loc2_;
         this.view.liveSetList.selectedIndex = 0;
         this.view.infoArea.pageData = this.view.liveSetList.selectedItem;
         this.setSelectedPatchList();
      }
      
      private function loadLiveSet() : void
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.pageDataList.length)
         {
            _loc1_.push({
               "name":this.pageDataList[_loc2_].basename,
               "url":this.pageDataList[_loc2_].livesetURL,
               "date":this.pageDataList[_loc2_].modifiedDate
            });
            _loc2_++;
         }
         this.livesetLoader.load(_loc1_);
      }
      
      private function liveSetLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.setSelectedPatchList();
      }
      
      private function setSelectedPatchList() : void
      {
         var _loc4_:FileStream = null;
         var _loc5_:String = null;
         var _loc6_:ArrayCollection = null;
         var _loc7_:int = 0;
         if(this.view.liveSetList.selectedItem == null)
         {
            this.view.patchList.visible = false;
            return;
         }
         this.view.patchList.visible = true;
         var _loc1_:TCPageData = this.view.liveSetList.selectedItem;
         var _loc2_:String = _loc1_.basename + ".tsl";
         var _loc3_:File = File.applicationStorageDirectory.resolvePath("livesets/" + _loc2_);
         if(_loc3_.exists)
         {
            _loc4_ = new FileStream();
            _loc4_.open(_loc3_,FileMode.READ);
            _loc5_ = _loc4_.readUTFBytes(_loc4_.bytesAvailable);
            _loc4_.close();
            this.liveSetData = LibraryDataSet.restore(JSON.parse(_loc5_));
            _loc6_ = new ArrayCollection();
            _loc7_ = 0;
            while(_loc7_ < this.liveSetData.patchList.length)
            {
               _loc6_.addItem(this.liveSetData.patchList[_loc7_]);
               _loc7_++;
            }
            this.view.patchList.dataProvider = _loc6_;
            this.chnageEnableDownloadLiveSet(true);
         }
         else
         {
            this.view.patchList.dataProvider = new ArrayCollection();
            this.chnageEnableDownloadLiveSet(false);
         }
         this.mediator.hideLoading();
      }
      
      private function chnageEnableDownloadLiveSet(param1:Boolean) : void
      {
         this.view.downloadButton.enabled = param1;
      }
      
      private function loadFaultHandler(param1:ToneCentralEvents) : void
      {
      }
      
      private function liveSetChangeHandler(param1:IndexChangeEvent) : void
      {
         this.view.infoArea.pageData = this.view.liveSetList.selectedItem;
         this.setSelectedPatchList();
         this.logMng.logLiveset(this.liveSetData.liveSetData.name);
      }
      
      private function downloadButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:TCPageData = this.view.liveSetList.selectedItem;
         var _loc3_:Array = _loc2_.imageEN.split("/");
         this.downloader.addEventListener(NetEvent.COMPLETE,this.imageLoadCompleteHandler,false,0,true);
         this.downloader.addEventListener(NetEvent.IO_ERROR,this.imageLoadErrorHandler,false,0,true);
         this.downloader.addEventListener(NetEvent.SECURITY_ERROR,this.imageLoadErrorHandler,false,0,true);
         this.downloader.download(_loc2_.imageEN,File.applicationStorageDirectory.nativePath + "/artwork/" + _loc3_[_loc3_.length - 1]);
         this.liveSetData.liveSetData.image = _loc3_[_loc3_.length - 1];
      }
      
      private function imageLoadCompleteHandler(param1:NetEvent) : void
      {
         this.downloader.removeEventListener(NetEvent.COMPLETE,this.imageLoadCompleteHandler);
         this.addLiveSet();
      }
      
      private function imageLoadErrorHandler(param1:NetEvent) : void
      {
         this.liveSetData.liveSetData.image = null;
         this.addLiveSet();
      }
      
      private function addLiveSet() : void
      {
         var _loc1_:int = this.liveSetStorageMng.getLivesetCount();
         this.liveSetData.setNewId();
         this.liveSetData.setTcFlag();
         this.liveSetData.liveSetData.orderNumber = _loc1_ + 1;
         this.liveSetStorageMng.save(this.liveSetData);
         this.chnageEnableDownloadLiveSet(false);
         this.downloadBtnTimer.addEventListener(TimerEvent.TIMER,this.msgTimerHandler,false,0,true);
         this.downloadBtnTimer.start();
         this.mediator.showAddLiveSetMsg();
         this.logMng.logLivesetAdd(this.liveSetData.liveSetData.name);
      }
      
      private function msgTimerHandler(param1:TimerEvent) : void
      {
         this.downloadBtnTimer.removeEventListener(TimerEvent.TIMER,this.msgTimerHandler);
         this.downloadBtnTimer.reset();
         this.chnageEnableDownloadLiveSet(true);
         this.mediator.hideAddLiveSetMsg();
      }
   }
}

