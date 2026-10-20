package tonecentral.components.popup
{
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import mx.resources.ResourceManager;
   import spark.components.Label;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class NotConnectedDevicePopup extends ToneCentralPopup
   {
      
      private var headerLabel:Label;
      
      private var msgLabel:Label;
      
      private var subMsgLabel:Label;
      
      private var downloadKatana50Button:ImageLabelButton;
      
      private var downloadKatana100Button:ImageLabelButton;
      
      private var downloadKatana100_212Button:ImageLabelButton;
      
      private var downloadKatanaHeadButton:ImageLabelButton;
      
      private var downloadKatanaArtistButton:ImageLabelButton;
      
      private var offlineMsgLabel:Label;
      
      public function NotConnectedDevicePopup(param1:String = "")
      {
         super(param1);
      }
      
      override protected function drawBackground() : void
      {
         if(!backgoundLayer)
         {
            return;
         }
         super.drawBackground();
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(0,35);
         backgoundLayer.graphics.lineTo(dialogWidth,35);
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(0,500);
         backgoundLayer.graphics.lineTo(dialogWidth,500);
         backgoundLayer.graphics.endFill();
         backgoundLayer.graphics.lineStyle(1,1973790);
         backgoundLayer.graphics.beginFill(4802889);
         backgoundLayer.graphics.drawRoundRect(12,105,dialogWidth - 24,335,5,5);
         backgoundLayer.graphics.endFill();
      }
      
      override protected function addOther() : void
      {
         this.headerLabel = new Label();
         this.headerLabel.text = ResourceManager.getInstance().getString("resource","dialog.notconnected.header");
         this.headerLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.header.style2");
         this.headerLabel.x = 12;
         this.headerLabel.y = 12;
         container.addElement(this.headerLabel);
         this.msgLabel = new Label();
         this.msgLabel.text = ResourceManager.getInstance().getString("resource","dialog.notconnected.msg");
         this.msgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style2");
         this.msgLabel.setStyle("lineHeight",17);
         this.msgLabel.left = 12;
         this.msgLabel.y = 45;
         this.msgLabel.right = 15;
         container.addElement(this.msgLabel);
         this.subMsgLabel = new Label();
         this.subMsgLabel.text = ResourceManager.getInstance().getString("resource","dialog.notconnected.subMsg");
         this.subMsgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style2");
         this.subMsgLabel.setStyle("lineHeight",17);
         this.subMsgLabel.horizontalCenter = 0;
         this.subMsgLabel.y = 125;
         this.subMsgLabel.width = 320;
         this.subMsgLabel.setStyle("textAlign","center");
         this.subMsgLabel.setStyle("verticalAlign","bottom");
         container.addElement(this.subMsgLabel);
         this.offlineMsgLabel = new Label();
         this.offlineMsgLabel.text = ResourceManager.getInstance().getString("resource","dialog.notconnected.msg2");
         this.offlineMsgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style2");
         this.offlineMsgLabel.setStyle("lineHeight",17);
         this.offlineMsgLabel.left = 12;
         this.offlineMsgLabel.bottom = 47;
         this.offlineMsgLabel.right = 15;
         container.addElement(this.offlineMsgLabel);
      }
      
      override protected function addButton() : void
      {
         okButton = new ImageLabelButton();
         okButton.styleName = "dialogOKButton";
         okButton.horizontalCenter = 0;
         okButton.y = 460;
         okButton.width = 80;
         okButton.height = 25;
         okButton.label = "REFRESH";
         okButton.setFocus();
         container.addElement(okButton);
         okButton.addEventListener(MouseEvent.CLICK,this.okClickHandler,false,0,true);
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogOKButton";
         closeButton.horizontalCenter = 0;
         closeButton.bottom = 12;
         closeButton.width = 100;
         closeButton.height = 25;
         closeButton.label = "OFFLINE MODE";
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
         this.downloadKatana50Button = new ImageLabelButton();
         this.downloadKatana50Button.styleName = "notConnectedDeviseDownloadButton";
         this.downloadKatana50Button.horizontalCenter = 0;
         this.downloadKatana50Button.y = 175;
         this.downloadKatana50Button.width = 180;
         this.downloadKatana50Button.height = 45;
         this.downloadKatana50Button.label = ResourceManager.getInstance().getString("resource","dialog.notconnected.buttonLabelKatana50");
         container.addElement(this.downloadKatana50Button);
         this.downloadKatana50Button.addEventListener(MouseEvent.CLICK,this.onDriverKatana50DownloadClick,false,0,true);
         this.downloadKatana100Button = new ImageLabelButton();
         this.downloadKatana100Button.styleName = "notConnectedDeviseDownloadButton";
         this.downloadKatana100Button.horizontalCenter = 0;
         this.downloadKatana100Button.y = 225;
         this.downloadKatana100Button.width = 180;
         this.downloadKatana100Button.height = 45;
         this.downloadKatana100Button.label = ResourceManager.getInstance().getString("resource","dialog.notconnected.buttonLabelKatana100");
         container.addElement(this.downloadKatana100Button);
         this.downloadKatana100Button.addEventListener(MouseEvent.CLICK,this.onDriverKatana100DownloadClick,false,0,true);
         this.downloadKatana100_212Button = new ImageLabelButton();
         this.downloadKatana100_212Button.styleName = "notConnectedDeviseDownloadButton";
         this.downloadKatana100_212Button.horizontalCenter = 0;
         this.downloadKatana100_212Button.y = 275;
         this.downloadKatana100_212Button.width = 180;
         this.downloadKatana100_212Button.height = 45;
         this.downloadKatana100_212Button.label = ResourceManager.getInstance().getString("resource","dialog.notconnected.buttonLabelKatana100_212");
         container.addElement(this.downloadKatana100_212Button);
         this.downloadKatana100_212Button.addEventListener(MouseEvent.CLICK,this.onDriverKatana100_212DownloadClick,false,0,true);
         this.downloadKatanaHeadButton = new ImageLabelButton();
         this.downloadKatanaHeadButton.styleName = "notConnectedDeviseDownloadButton";
         this.downloadKatanaHeadButton.horizontalCenter = 0;
         this.downloadKatanaHeadButton.y = 325;
         this.downloadKatanaHeadButton.width = 180;
         this.downloadKatanaHeadButton.height = 45;
         this.downloadKatanaHeadButton.label = ResourceManager.getInstance().getString("resource","dialog.notconnected.buttonLabelKatanaHead");
         container.addElement(this.downloadKatanaHeadButton);
         this.downloadKatanaHeadButton.addEventListener(MouseEvent.CLICK,this.onDriverKatanaHeadDownloadClick,false,0,true);
         this.downloadKatanaArtistButton = new ImageLabelButton();
         this.downloadKatanaArtistButton.styleName = "notConnectedDeviseDownloadButton";
         this.downloadKatanaArtistButton.horizontalCenter = 0;
         this.downloadKatanaArtistButton.y = 375;
         this.downloadKatanaArtistButton.width = 180;
         this.downloadKatanaArtistButton.height = 45;
         this.downloadKatanaArtistButton.label = ResourceManager.getInstance().getString("resource","dialog.notconnected.buttonLabelKatanaArtist");
         container.addElement(this.downloadKatanaArtistButton);
         this.downloadKatanaArtistButton.addEventListener(MouseEvent.CLICK,this.onDriverKatanaArtistDownloadClick,false,0,true);
      }
      
      private function onDriverKatana50DownloadClick(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralMediator = ToneCentralMediator.getInstance();
         var _loc3_:URLRequest = new URLRequest();
         if(_loc2_.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc3_.url = _loc2_.updateXmlKatana50.driver.url_en;
         }
         else
         {
            _loc3_.url = _loc2_.updateXmlKatana50.driver.url_jp;
         }
         navigateToURL(_loc3_);
      }
      
      private function onDriverKatana100DownloadClick(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralMediator = ToneCentralMediator.getInstance();
         var _loc3_:URLRequest = new URLRequest();
         if(_loc2_.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc3_.url = _loc2_.updateXmlKatana100.driver.url_en;
         }
         else
         {
            _loc3_.url = _loc2_.updateXmlKatana100.driver.url_jp;
         }
         navigateToURL(_loc3_);
      }
      
      private function onDriverKatana100_212DownloadClick(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralMediator = ToneCentralMediator.getInstance();
         var _loc3_:URLRequest = new URLRequest();
         if(_loc2_.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc3_.url = _loc2_.updateXmlKatana100_212.driver.url_en;
         }
         else
         {
            _loc3_.url = _loc2_.updateXmlKatana100_212.driver.url_jp;
         }
         navigateToURL(_loc3_);
      }
      
      private function onDriverKatanaHeadDownloadClick(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralMediator = ToneCentralMediator.getInstance();
         var _loc3_:URLRequest = new URLRequest();
         if(_loc2_.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc3_.url = _loc2_.updateXmlKatanaHead.driver.url_en;
         }
         else
         {
            _loc3_.url = _loc2_.updateXmlKatanaHead.driver.url_jp;
         }
         navigateToURL(_loc3_);
      }
      
      private function onDriverKatanaArtistDownloadClick(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralMediator = ToneCentralMediator.getInstance();
         var _loc3_:URLRequest = new URLRequest();
         if(_loc2_.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc3_.url = _loc2_.updateXmlKatanaArtist.driver.url_en;
         }
         else
         {
            _loc3_.url = _loc2_.updateXmlKatanaArtist.driver.url_jp;
         }
         navigateToURL(_loc3_);
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         if(mediator.conf.confLanguage == "ja_JP")
         {
            setDialogSize(405,620);
         }
         else
         {
            setDialogSize(405,620);
         }
      }
      
      private function okClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.OK));
      }
   }
}

