package tonecentral.components.popup
{
   import flash.events.MouseEvent;
   import mx.resources.ResourceManager;
   import spark.components.Label;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.events.ToneCentralEvents;
   
   public class CompletePopup extends ToneCentralPopup
   {
      
      private static var callback:Function;
      
      private var headerLabel:Label;
      
      private var headerText:String;
      
      private var msgLabel:Label;
      
      private var msgText:String;
      
      private var replaceText:String;
      
      public var target:Object;
      
      public function CompletePopup(param1:String = "")
      {
         super(param1);
      }
      
      public static function showCompleteDialog(param1:String, param2:String, param3:String = "", param4:Function = null) : void
      {
         var _loc5_:CompletePopup = new CompletePopup();
         _loc5_.setHeaderText(param1);
         _loc5_.setMsgText(param2,param3);
         _loc5_.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = _loc5_;
         callback = param4;
      }
      
      public function setHeaderText(param1:String) : void
      {
         this.headerText = param1;
      }
      
      public function setMsgText(param1:String, param2:String) : void
      {
         this.msgText = param1;
         this.replaceText = param2;
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
         var _loc1_:String = ResourceManager.getInstance().getString("resource",this.msgText);
         if(this.replaceText)
         {
            _loc1_ = _loc1_.replace("[replace]",this.replaceText);
         }
         this.msgLabel.text = _loc1_;
         this.msgLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style2");
         this.msgLabel.x = 12;
         this.msgLabel.y = 45;
         container.addElement(this.msgLabel);
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(320,150);
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
      }
      
      private function okClickHandler(param1:MouseEvent) : void
      {
         openFlag = false;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.OK));
         if(callback != null)
         {
            callback();
            callback = null;
         }
         close();
      }
   }
}

