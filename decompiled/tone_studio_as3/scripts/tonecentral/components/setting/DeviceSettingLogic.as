package tonecentral.components.setting
{
   import flash.events.MouseEvent;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.collections.ArrayCollection;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.ConnectPortSelectPopup;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class DeviceSettingLogic extends ToneCentralViewLogic
   {
      
      private var view:DeviceSetting;
      
      private var mediator:ToneCentralMediator;
      
      private var appMng:ApplicationManager;
      
      private var deviceList:ArrayCollection;
      
      private var currentDeviceIndex:int;
      
      public function DeviceSettingLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = DeviceSetting(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.appMng = ApplicationManager.getInstance();
         this.view.refresh.addEventListener(MouseEvent.CLICK,this.refreshButtonClickHandler,false,0,true);
         this.view.okButton.addEventListener(MouseEvent.CLICK,this.okButtonClickHandler,false,0,true);
         this.view.detailButton.addEventListener(MouseEvent.CLICK,this.detailButtonClickHandler,false,0,true);
         this.createDeviceList();
      }
      
      private function detailButtonClickHandler(param1:MouseEvent) : void
      {
         Context.dialogMng.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SYSTEM_CLOSE));
         this.openConnectPortSelectPopup();
      }
      
      private function openConnectPortSelectPopup() : void
      {
         var _loc1_:ConnectPortSelectPopup = new ConnectPortSelectPopup();
         _loc1_.setMessage();
         _loc1_.addEventListener(ToneCentralEvents.DEVICE_PORT_SELECTED,this.devicePortSelectedHandler,false,0,true);
         _loc1_.addEventListener(ToneCentralEvents.DEVICE_PORT_REFRESH,this.devicePortRefreshHandler,false,0,true);
         Context.dialogMng.show(_loc1_,true);
      }
      
      private function devicePortRefreshHandler(param1:ToneCentralEvents) : void
      {
         this.openConnectPortSelectPopup();
      }
      
      private function devicePortSelectedHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DEVICE_PORT_SELECTED);
         _loc2_.data = param1.data;
         this.appMng.dispatchEvent(_loc2_);
      }
      
      private function okButtonClickHandler(param1:MouseEvent) : void
      {
         this.setDevice();
      }
      
      private function refreshButtonClickHandler(param1:MouseEvent) : void
      {
         this.createDeviceList();
      }
      
      private function createDeviceList() : void
      {
         this.deviceList = new ArrayCollection(this.mediator.sysex.createDeviceList());
         this.view.deviceList.dataProvider = this.deviceList;
         this.setCurrentDevice();
      }
      
      private function setCurrentDevice() : void
      {
         var _loc1_:Object = SharedObjectUtil.get(ToneCentralDefinition.DEVICE_DATA);
         var _loc2_:int = 0;
         while(_loc2_ < this.deviceList.length)
         {
            if(Boolean(this.deviceList[_loc2_] && this.deviceList[_loc2_].midiInKey == _loc1_.midiInKey && this.deviceList[_loc2_].midiOutKey == _loc1_.midiOutKey) && Boolean(this.deviceList[_loc2_].audioInKey == _loc1_.audioInKey) && this.deviceList[_loc2_].audioOutKey == _loc1_.audioOutKey)
            {
               this.view.deviceList.selectedIndex = _loc2_;
               this.currentDeviceIndex = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      private function setDevice() : void
      {
         var _loc1_:Object = this.view.deviceList.selectedItem;
         SharedObjectUtil.set(ToneCentralDefinition.DEVICE_DATA,_loc1_);
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.SETTING_DEVICE_SELECTED);
         _loc2_.data = _loc1_;
         this.mediator.dispatchEvent(_loc2_);
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.OK));
      }
   }
}

