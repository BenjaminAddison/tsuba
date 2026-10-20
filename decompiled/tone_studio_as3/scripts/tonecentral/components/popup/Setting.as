package tonecentral.components.popup
{
   import flash.events.MouseEvent;
   import jp.co.site4d.ns.develop;
   import mx.collections.ArrayCollection;
   import mx.events.FlexEvent;
   import mx.resources.ResourceManager;
   import spark.components.Label;
   import spark.components.List;
   import spark.events.IndexChangeEvent;
   import tonecentral.common.define.EnvSetting;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.setting.DeviceSetting;
   import tonecentral.components.setting.LanguageSetting;
   import tonecentral.components.setting.ManualSetting;
   import tonecentral.components.setting.detail.AbstractSettingDetail;
   import tonecentral.components.setting.detail.GlobalEqSetting;
   import tonecentral.components.setting.detail.LineOut_CabinetSetting;
   import tonecentral.components.setting.detail.MidiSetting;
   import tonecentral.components.setting.detail.Usb;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.itemrenderer.SettingMenuItemRendererFactory;
   import tonecentral.skin.CustomListSkin;
   
   public class Setting extends ToneCentralPopup
   {
      
      private var titleLabel:Label;
      
      private var msgLabel:Label;
      
      private var menuList:List;
      
      private var menuItemList:Array;
      
      private var currentSettingDeital:AbstractSettingDetail;
      
      public function Setting(param1:String = "")
      {
         super(param1);
         addEventListener(FlexEvent.CREATION_COMPLETE,this.creationCompleteHandler,false,0,true);
         mediator.addEventListener(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED,this.settingLanguageCompleteHandler,false,0,true);
         mediator.addEventListener(ToneCentralEvents.SETTING_EQTYPE_COMPLETED,this.settingEqTypeCompleteHandler,false,0,true);
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.updateDisplay(0);
         this.setSelectMenu();
      }
      
      private function settingLanguageCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.updateDisplay(this.menuList.selectedIndex);
         this.setTitleAndMsg();
      }
      
      private function settingEqTypeCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.setSelectMenu();
      }
      
      private function updateDisplay(param1:int) : void
      {
         this.menuItemList = new Array();
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.LINEOUT_CABINET_SETTING,
            "title":ResourceManager.getInstance().getString("resource","setting.lineout_cabinet.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.lineout_cabinet.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.GLOBAL_EQ_SETTING,
            "title":ResourceManager.getInstance().getString("resource","setting.global_eq.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.global_eq.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.USB_SETTING,
            "title":ResourceManager.getInstance().getString("resource","setting.usbSetting.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.usbSetting.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.MIDI_SETTING,
            "title":ResourceManager.getInstance().getString("resource","setting.midiSetting.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.midiSetting.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.LANGUAGE,
            "title":ResourceManager.getInstance().getString("resource","setting.language.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.language.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.MANUAL,
            "title":ResourceManager.getInstance().getString("resource","setting.manual.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.manual.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.DEVICE,
            "title":ResourceManager.getInstance().getString("resource","setting.device.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.device.msg")
         });
         this.menuItemList.push({
            "type":SystemSettingDefinitionGT.VERSION,
            "title":ResourceManager.getInstance().getString("resource","setting.version.title"),
            "msg":ResourceManager.getInstance().getString("resource","setting.version.msg")
         });
         this.menuList.dataProvider = new ArrayCollection(this.menuItemList);
         this.menuList.selectedIndex = param1;
         this.titleLabel.styleName = ResourceManager.getInstance().getString("resource","setting.title.style");
         this.msgLabel.styleName = ResourceManager.getInstance().getString("resource","setting.msg.style");
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(610,500);
      }
      
      override protected function addOther() : void
      {
         this.titleLabel = new Label();
         this.titleLabel.x = 170;
         this.titleLabel.y = 20;
         this.titleLabel.styleName = ResourceManager.getInstance().getString("resource","setting.title.style");
         container.addElement(this.titleLabel);
         this.msgLabel = new Label();
         this.msgLabel.x = 170;
         this.msgLabel.y = 50;
         this.msgLabel.width = 410;
         this.msgLabel.styleName = ResourceManager.getInstance().getString("resource","setting.msg.style");
         container.addElement(this.msgLabel);
         this.menuList = new List();
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.width = 160;
         this.menuList.height = 433;
         this.menuList.labelField = "title";
         this.menuList.addEventListener(IndexChangeEvent.CHANGE,this.menuChangeHandler,false,0,true);
         this.menuList.setStyle("contentBackgroundColor",2299925);
         this.menuList.setStyle("borderVisible",false);
         this.menuList.setStyle("horizontalScrollPolicy","off");
         this.menuList.setStyle("skinClass",CustomListSkin);
         this.menuList.itemRenderer = new SettingMenuItemRendererFactory();
         addElement(this.menuList);
      }
      
      private function deviceSettingOKHandler(param1:ToneCentralEvents) : void
      {
         close();
      }
      
      private function menuChangeHandler(param1:IndexChangeEvent) : void
      {
         this.setSelectMenu();
      }
      
      public function setSelectManual() : void
      {
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.menuItemList.length)
         {
            _loc3_ = this.menuItemList[_loc2_];
            if(_loc3_.type == SystemSettingDefinitionGT.MANUAL)
            {
               _loc1_ = _loc2_;
               break;
            }
            _loc2_++;
         }
         this.menuList.selectedIndex = _loc1_;
         this.setSelectMenu();
      }
      
      private function setTitleAndMsg() : void
      {
         var _loc1_:Object = this.menuList.selectedItem;
         this.titleLabel.text = _loc1_.title;
         if(_loc1_.type == SystemSettingDefinitionGT.VERSION)
         {
            if(EnvSetting.ns == develop)
            {
               this.msgLabel.text = ToneCentralUtil.getThisVersionLabel();
            }
            else
            {
               this.msgLabel.text = "Version " + ToneCentralUtil.getThisVersion();
            }
         }
         else
         {
            this.msgLabel.text = _loc1_.msg;
         }
      }
      
      private function removeDetail() : void
      {
         if(this.currentSettingDeital)
         {
            container.removeElement(this.currentSettingDeital);
         }
      }
      
      private function setSelectMenu() : void
      {
         var _loc2_:AbstractSettingDetail = null;
         this.removeDetail();
         this.setTitleAndMsg();
         var _loc1_:Object = this.menuList.selectedItem;
         switch(_loc1_.type)
         {
            case SystemSettingDefinitionGT.LINEOUT_CABINET_SETTING:
               _loc2_ = new LineOut_CabinetSetting();
               break;
            case SystemSettingDefinitionGT.GLOBAL_EQ_SETTING:
               _loc2_ = new GlobalEqSetting();
               break;
            case SystemSettingDefinitionGT.USB_SETTING:
               _loc2_ = new Usb();
               break;
            case SystemSettingDefinitionGT.MIDI_SETTING:
               _loc2_ = new MidiSetting();
               break;
            case SystemSettingDefinitionGT.LANGUAGE:
               _loc2_ = new LanguageSetting();
               break;
            case SystemSettingDefinitionGT.MANUAL:
               _loc2_ = new ManualSetting();
               break;
            case SystemSettingDefinitionGT.DEVICE:
               _loc2_ = new DeviceSetting();
               _loc2_.addEventListener(ToneCentralEvents.OK,this.deviceSettingOKHandler,false,0,true);
         }
         if(_loc2_)
         {
            _loc2_.x = 160;
            _loc2_.y = 80;
            container.addElement(_loc2_);
         }
         this.currentSettingDeital = _loc2_;
      }
      
      override protected function addButton() : void
      {
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.horizontalCenter = 0;
         closeButton.bottom = 23;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CLOSE";
         closeButton.setFocus();
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
      }
      
      override protected function drawBackground() : void
      {
         super.drawBackground();
         if(!backgoundLayer)
         {
            return;
         }
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(2,dialogHeight - 65);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,dialogHeight - 65);
         backgoundLayer.graphics.moveTo(152,2);
         backgoundLayer.graphics.lineTo(152,dialogHeight - 65);
      }
   }
}

