package tonecentral.components.popup
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Label;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class HighCommunicationLevelPopup extends ToneCentralPopup
   {
      
      private var _103149406logic:HighCommunicationLevelPopupLogic;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var downloadButton:ImageLabelButton;
      
      private var titleLabel:Label;
      
      private var msg:Label;
      
      private var offlineMsgLabel:Label;
      
      public function HighCommunicationLevelPopup()
      {
         super();
         mx_internal::_document = this;
         this.width = 300;
         this.height = 320;
         this._HighCommunicationLevelPopup_HighCommunicationLevelPopupLogic1_i();
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(300,320);
      }
      
      override protected function addLabel() : void
      {
         this.titleLabel = new Label();
         this.titleLabel.text = "UPDATE";
         this.titleLabel.styleName = "dialogConnectPortTitleLabel";
         this.titleLabel.x = 10;
         this.titleLabel.y = 12;
         container.addElement(this.titleLabel);
         this.msg = new Label();
         this.msg.x = 10;
         this.msg.y = 50;
         this.msg.text = ResourceManager.getInstance().getString("resource","dialog.highCommunicationLevelMsg");
         this.msg.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style");
         container.addElement(this.msg);
         this.offlineMsgLabel = new Label();
         this.offlineMsgLabel.text = ResourceManager.getInstance().getString("resource","dialog.notconnected.msg2");
         this.offlineMsgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style2");
         this.offlineMsgLabel.setStyle("lineHeight",17);
         this.offlineMsgLabel.left = 12;
         this.offlineMsgLabel.bottom = 55;
         this.offlineMsgLabel.right = 15;
         container.addElement(this.offlineMsgLabel);
      }
      
      override protected function addButton() : void
      {
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.horizontalCenter = 0;
         closeButton.bottom = 13;
         closeButton.width = 100;
         closeButton.height = 25;
         closeButton.label = "OFFLINE MODE";
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
         this.downloadButton = new ImageLabelButton();
         this.downloadButton.styleName = "notConnectedDeviseDownloadButton";
         this.downloadButton.horizontalCenter = 0;
         this.downloadButton.y = 96;
         this.downloadButton.width = 180;
         this.downloadButton.height = 45;
         this.downloadButton.label = "DOWNLOAD";
         container.addElement(this.downloadButton);
         this.downloadButton.addEventListener(MouseEvent.CLICK,this.onDownloadClick,false,0,true);
      }
      
      override protected function drawBackground() : void
      {
         if(!backgoundLayer)
         {
            return;
         }
         super.drawBackground();
         backgoundLayer.graphics.lineStyle(1,1973790);
         backgoundLayer.graphics.beginFill(4802889);
         backgoundLayer.graphics.drawRoundRect(12,85,dialogWidth - 24,65,5,5);
         backgoundLayer.graphics.endFill();
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(0,160);
         backgoundLayer.graphics.lineTo(dialogWidth,160);
         backgoundLayer.graphics.endFill();
      }
      
      private function onDownloadClick(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(ToneCentralMediator.getInstance().ampModel)
         {
            case 0:
               if(mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_50_EN;
               }
               else
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_50_JP;
               }
               break;
            case 1:
               if(mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_100_EN;
               }
               else
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_100_JP;
               }
               break;
            case 2:
               if(mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_100_212_EN;
               }
               else
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_100_212_JP;
               }
               break;
            default:
            case 3:
               if(mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_HEAD_EN;
               }
               else
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_HEAD_JP;
               }
               break;
            case 4:
               if(mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_ARTIST_EN;
               }
               else
               {
                  _loc2_ = URLDefinition.FIRM_KATANA_ARTIST_JP;
               }
         }
         this.openBrowser(_loc2_);
      }
      
      private function openBrowser(param1:String) : void
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         navigateToURL(_loc2_);
      }
      
      private function _HighCommunicationLevelPopup_HighCommunicationLevelPopupLogic1_i() : HighCommunicationLevelPopupLogic
      {
         var _loc1_:HighCommunicationLevelPopupLogic = new HighCommunicationLevelPopupLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : HighCommunicationLevelPopupLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:HighCommunicationLevelPopupLogic) : void
      {
         var _loc2_:Object = this._103149406logic;
         if(_loc2_ !== param1)
         {
            this._103149406logic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logic",_loc2_,param1));
            }
         }
      }
   }
}

