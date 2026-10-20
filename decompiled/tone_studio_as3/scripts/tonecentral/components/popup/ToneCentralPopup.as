package tonecentral.components.popup
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import jp.co.site4d.view.popup.PopupContainer;
   import mx.core.UIComponent;
   import spark.components.Group;
   import spark.components.Label;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ToneCentralPopup extends PopupContainer
   {
      
      protected var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      protected var closeButton:ImageLabelButton;
      
      protected var okButton:ImageLabelButton;
      
      protected var label:Label;
      
      private var _text:String = "";
      
      public var container:Group;
      
      protected var _openFlag:Boolean = false;
      
      protected var backgoundLayer:UIComponent;
      
      protected var dialogWidth:Number = 430;
      
      protected var dialogHeight:Number = 447;
      
      public function ToneCentralPopup(param1:String = "")
      {
         this._text = param1;
         this.openFlag = true;
         super();
      }
      
      override public function isShowOK(param1:UIComponent) : Boolean
      {
         return true;
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
         addEventListener(Event.ADDED_TO_STAGE,this.addHandler,false,0,true);
         addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.keyFocusChangeHandler,false,0,true);
         this.addDialog();
         this.addBackGrouud();
         this.addLabel();
         this.addButton();
         this.addOther();
         this.drawBackground();
      }
      
      private function keyFocusChangeHandler(param1:FocusEvent) : void
      {
         if(!ToneCentralMediator.getInstance().connected)
         {
            param1.preventDefault();
         }
      }
      
      protected function addHandler(param1:Event) : void
      {
      }
      
      public function set message(param1:String) : void
      {
         this._text = param1;
         if(this.label)
         {
            this.label.text = param1;
         }
      }
      
      protected function setDialogSize(param1:Number, param2:Number) : void
      {
         this.dialogWidth = param1;
         this.dialogHeight = param2;
         if(this.container)
         {
            this.container.width = this.dialogWidth;
            this.container.height = this.dialogHeight;
         }
         this.drawBackground();
      }
      
      protected function drawBackground() : void
      {
         if(!this.backgoundLayer)
         {
            return;
         }
         this.backgoundLayer.graphics.clear();
         this.backgoundLayer.graphics.lineStyle(4,0);
         this.backgoundLayer.graphics.beginFill(3881787);
         this.backgoundLayer.graphics.drawRoundRect(0,0,this.dialogWidth,this.dialogHeight,10,10);
         this.backgoundLayer.graphics.endFill();
      }
      
      protected function addDialog() : void
      {
         this.container = new Group();
         this.container.width = this.dialogWidth;
         this.container.height = this.dialogHeight;
         addElement(this.container);
      }
      
      protected function addBackGrouud() : void
      {
         this.backgoundLayer = new UIComponent();
         this.container.addElement(this.backgoundLayer);
      }
      
      protected function addButton() : void
      {
      }
      
      protected function addLabel() : void
      {
         this.label = new Label();
         this.label.width = this.dialogWidth - 140;
         this.label.horizontalCenter = 0;
         this.label.verticalCenter = -20;
         this.label.setStyle("textAlign","center");
         this.label.styleName = "errorMessage";
         this.label.text = this._text;
         this.container.addElement(this.label);
      }
      
      protected function addOther() : void
      {
      }
      
      protected function onCloseClick(param1:MouseEvent) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CANCEL));
         this.close();
      }
      
      override public function close() : void
      {
         this.openFlag = false;
         super.close();
      }
      
      public function get openFlag() : Boolean
      {
         return this._openFlag;
      }
      
      public function set openFlag(param1:Boolean) : void
      {
         this._openFlag = param1;
      }
   }
}

