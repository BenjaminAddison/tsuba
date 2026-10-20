package tonecentral.itemrenderer
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.UIComponent;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   
   public class AbstractToneCentralItemRenderer extends ItemRenderer
   {
      
      protected static const WIDTH:Number = 172;
      
      protected static const HEIGHT:Number = 50;
      
      protected static const UP:String = "up";
      
      protected static const OVER:String = "over";
      
      protected static const DOWN:String = "down";
      
      protected static const SELECT:String = "select";
      
      protected static const POINT:String = "point";
      
      protected var buttonState:String;
      
      protected var patchNoLabel:Label;
      
      protected var patchNameLabel:Label;
      
      protected var bgi:BitmapImage;
      
      protected var favicon:BitmapImage;
      
      protected var textDisplay:Label;
      
      private var pointed:Boolean = false;
      
      private var isPointMode:Boolean = false;
      
      protected var upImage:Class;
      
      protected var overImage:Class;
      
      protected var downImage:Class;
      
      protected var selectedImage:Class;
      
      protected var type:String;
      
      private var bg:UIComponent;
      
      public function AbstractToneCentralItemRenderer()
      {
         super();
         this.height = HEIGHT;
         this.width = WIDTH;
         this.buttonMode = true;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.bg = new UIComponent();
         addElement(this.bg);
         this.addBg();
         this.addLabel();
         this.addOhter();
         this.drawBorder();
      }
      
      private function drawBorder() : void
      {
         var _loc1_:Graphics = this.bg.graphics;
         _loc1_.beginFill(1973790,0.5);
         _loc1_.drawRect(0,0,this.width,this.height);
         _loc1_.endFill();
         _loc1_.lineStyle(1,0);
         _loc1_.moveTo(0,this.height - 1);
         _loc1_.lineTo(this.width,this.height - 1);
         _loc1_.endFill();
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
         addEventListener(MouseEvent.ROLL_OVER,this.mouseOverHandler,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removeHandler,false,0,true);
      }
      
      private function removeHandler(param1:Event) : void
      {
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
      }
      
      protected function addBg() : void
      {
         this.bgi = new BitmapImage();
         this.bgi.width = this.width;
         this.bgi.height = this.height;
         addElement(this.bgi);
      }
      
      protected function addLabel() : void
      {
         this.patchNoLabel = new Label();
         this.patchNoLabel.styleName = "patchlistNo";
         this.patchNoLabel.width = 172;
         this.patchNoLabel.height = 20;
         this.patchNoLabel.x = 15;
         this.patchNoLabel.y = 7;
         this.patchNoLabel.buttonMode = false;
         this.patchNoLabel.enabled = false;
         addElement(this.patchNoLabel);
         this.patchNameLabel = new Label();
         this.patchNameLabel.styleName = "patchlistName";
         this.patchNameLabel.width = 172;
         this.patchNameLabel.height = 20;
         this.patchNameLabel.x = 15;
         this.patchNameLabel.y = 28;
         this.patchNameLabel.buttonMode = false;
         this.patchNameLabel.enabled = false;
         addElement(this.patchNameLabel);
      }
      
      protected function addOhter() : void
      {
      }
      
      protected function changeBg() : void
      {
         if(!data || !this.bgi)
         {
            return;
         }
         if(hovered && !selected)
         {
            this.setOverStyle();
         }
         else if(down && !selected)
         {
            this.setDownStyle();
         }
         else if(selected)
         {
            this.setSelectedStyle();
         }
         else
         {
            this.setUpStyle();
         }
      }
      
      protected function setUpStyle() : void
      {
         if(!this.bgi)
         {
            return;
         }
         this.bgi.source = this.upImage;
         this.buttonState = UP;
         this.onUP();
      }
      
      protected function setOverStyle() : void
      {
         if(this.buttonState == OVER)
         {
            return;
         }
         this.bgi.source = this.overImage;
         this.buttonState = OVER;
         this.onOver();
      }
      
      protected function setDownStyle() : void
      {
         if(this.buttonState == DOWN)
         {
            return;
         }
         this.bgi.source = this.downImage;
         this.buttonState = DOWN;
         this.onDown();
      }
      
      protected function setSelectedStyle() : void
      {
         if(this.buttonState == SELECT)
         {
            return;
         }
         this.bgi.source = this.selectedImage;
         this.buttonState = SELECT;
         this.onSelected();
      }
      
      protected function onUP() : void
      {
      }
      
      protected function onOver() : void
      {
      }
      
      protected function onDown() : void
      {
      }
      
      protected function onSelected() : void
      {
      }
   }
}

