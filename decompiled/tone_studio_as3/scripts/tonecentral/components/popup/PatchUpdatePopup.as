package tonecentral.components.popup
{
   import flash.events.MouseEvent;
   import mx.resources.ResourceManager;
   import spark.components.CheckBox;
   import spark.components.Label;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.skin.CustomCheckBoxSkin;
   
   public class PatchUpdatePopup extends ToneCentralPopup
   {
      
      private var headerLabel:Label;
      
      private var headerText:String;
      
      private var msgLabel:Label;
      
      private var msgText:String;
      
      private var dontaskCheck:CheckBox;
      
      public var target:Object;
      
      public function PatchUpdatePopup(param1:String = "")
      {
         super(param1);
      }
      
      public function setHeaderText(param1:String) : void
      {
         this.headerText = param1;
      }
      
      public function setMsgText(param1:String) : void
      {
         this.msgText = param1;
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
         backgoundLayer.graphics.moveTo(0,dialogHeight - 47);
         backgoundLayer.graphics.lineTo(dialogWidth,dialogHeight - 47);
         backgoundLayer.graphics.endFill();
      }
      
      override protected function addOther() : void
      {
         this.headerLabel = new Label();
         this.headerLabel.text = ResourceManager.getInstance().getString("resource",this.headerText);
         this.headerLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.header.style2");
         this.headerLabel.x = 12;
         this.headerLabel.y = 12;
         container.addElement(this.headerLabel);
         this.msgLabel = new Label();
         this.msgLabel.text = ResourceManager.getInstance().getString("resource",this.msgText);
         this.msgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style2");
         this.msgLabel.x = 12;
         this.msgLabel.y = 45;
         container.addElement(this.msgLabel);
         this.dontaskCheck = new CheckBox();
         this.dontaskCheck.label = ResourceManager.getInstance().getString("resource","dialog.check.dontask");
         this.dontaskCheck.x = 12;
         this.dontaskCheck.bottom = 52;
         this.dontaskCheck.setStyle("skinClass",CustomCheckBoxSkin);
         this.dontaskCheck.buttonMode = true;
         container.addElement(this.dontaskCheck);
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(300,150);
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
         container.addElement(okButton);
         okButton.addEventListener(MouseEvent.CLICK,this.okClickHandler,false,0,true);
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.x = 10;
         closeButton.bottom = 10;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CANCEL";
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
      }
      
      private function okClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.OK);
         _loc2_.data = {"dontask":this.dontaskCheck.selected};
         dispatchEvent(_loc2_);
         openFlag = false;
         close();
      }
   }
}

