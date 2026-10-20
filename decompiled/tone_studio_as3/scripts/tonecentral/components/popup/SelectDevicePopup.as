package tonecentral.components.popup
{
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.collections.ArrayCollection;
   import mx.resources.ResourceManager;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.Scroller;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.components.CustomList;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.itemrenderer.DeviceListItemRendererFactory;
   import tonecentral.skin.ScrollerSkin;
   
   public class SelectDevicePopup extends ToneCentralPopup
   {
      
      private var deviceList:Array;
      
      private var deviceListGroup:List;
      
      private var scroller:Scroller;
      
      private var scrollConteiner:Group;
      
      private var msgLabel:Label;
      
      private var currentDeviceIndex:int;
      
      private var refleshButton:ImageLabelButton;
      
      public function SelectDevicePopup(param1:Array, param2:String = "")
      {
         super(param2);
         this.deviceList = param1;
      }
      
      override protected function addButton() : void
      {
         okButton = new ImageLabelButton();
         okButton.styleName = "dialogOKButton";
         okButton.horizontalCenter = 0;
         okButton.bottom = 10;
         okButton.width = 80;
         okButton.height = 25;
         okButton.label = "OK";
         okButton.setFocus();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.deviceList.length)
         {
            if(this.deviceList[_loc2_].deviceName)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         if(_loc1_ < 1)
         {
            okButton.visible = false;
         }
         else
         {
            okButton.visible = true;
         }
         okButton.addEventListener(MouseEvent.CLICK,this.selectedDeviceList,false,0,true);
         container.addElement(okButton);
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.x = 15;
         closeButton.bottom = 10;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CANCEL";
         closeButton.addEventListener(MouseEvent.CLICK,this.deviceSelectCancel,false,0,true);
         container.addElement(closeButton);
         this.refleshButton = new ImageLabelButton();
         this.refleshButton.styleName = "dialogOKButton";
         this.refleshButton.right = 15;
         this.refleshButton.bottom = 10;
         this.refleshButton.width = 80;
         this.refleshButton.height = 25;
         this.refleshButton.label = "REFRESH";
         this.refleshButton.addEventListener(MouseEvent.CLICK,this.refreshButtonClickHandler,false,0,true);
         container.addElement(this.refleshButton);
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
         _loc1_.moveTo(2,34);
         _loc1_.lineTo(403,34);
         _loc1_.moveTo(2,155);
         _loc1_.lineTo(403,155);
         _loc1_.beginFill(2299925);
         _loc1_.drawRect(2,35,401,150);
         _loc1_.lineStyle(1,3352871);
         _loc1_.moveTo(2,34 + 30);
         _loc1_.lineTo(401,34 + 30);
         _loc1_.moveTo(2,34 + 30 * 2);
         _loc1_.lineTo(401,34 + 30 * 2);
         _loc1_.moveTo(2,34 + 30 * 3);
         _loc1_.lineTo(401,34 + 30 * 3);
         _loc1_.moveTo(2,34 + 30 * 4);
         _loc1_.lineTo(401,34 + 30 * 4);
         _loc1_.endFill();
      }
      
      override protected function addOther() : void
      {
         this.msgLabel = new Label();
         this.msgLabel.text = ResourceManager.getInstance().getString("resource","dialog.deviceListMsg");
         this.msgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style");
         this.msgLabel.x = 10;
         this.msgLabel.y = 10;
         container.addElement(this.msgLabel);
         this.scroller = new Scroller();
         this.scroller.x = 2;
         this.scroller.y = 35;
         this.scroller.width = 401;
         this.scroller.height = 150;
         this.scroller.setStyle("verticalScrollPolicy","auto");
         this.scroller.setStyle("horizontalScrollPolicy","off");
         this.scroller.setStyle("skinClass",ScrollerSkin);
         container.addElement(this.scroller);
         this.scrollConteiner = new Group();
         this.scrollConteiner.width = 401;
         this.scrollConteiner.percentHeight = 100;
         this.scroller.viewport = this.scrollConteiner;
         this.deviceListGroup = new CustomList();
         this.deviceListGroup.width = 401;
         this.deviceListGroup.setStyle("borderVisible",false);
         this.deviceListGroup.itemRenderer = new DeviceListItemRendererFactory();
         this.deviceListGroup.setStyle("contentBackgroundAlpha",0);
         this.scrollConteiner.addElement(this.deviceListGroup);
         this.deviceListGroup.dataProvider = new ArrayCollection(this.deviceList);
         this.deviceListGroup.selectedIndex = 0;
      }
      
      private function selectedDeviceList(param1:MouseEvent) : void
      {
         var _loc2_:Object = this.deviceListGroup.selectedItem;
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DEVICE_LIST_SELECTED);
         _loc3_.data = _loc2_;
         mediator.dispatchEvent(_loc3_);
         close();
      }
      
      private function deviceSelectCancel(param1:MouseEvent) : void
      {
         onCloseClick(param1);
      }
      
      private function refreshButtonClickHandler(param1:MouseEvent) : void
      {
         this.createDeviceList();
      }
      
      private function createDeviceList() : void
      {
         this.deviceListGroup.dataProvider = new ArrayCollection(mediator.sysex.createDeviceList());
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
               this.deviceList.selectedIndex = _loc2_;
               this.currentDeviceIndex = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(405,230);
      }
      
      override protected function addLabel() : void
      {
         super.addLabel();
         label.styleName = "notFindDeviceError";
      }
   }
}

