package tonecentral.itemrenderer
{
   import flash.display.Graphics;
   import mx.core.UIComponent;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   
   public class TrackListItemRenderer extends ItemRenderer
   {
      
      private var nameLabel:Label;
      
      private var bg:UIComponent;
      
      private var leftRect:UIComponent;
      
      public function TrackListItemRenderer()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         width = 170;
         height = 30;
         buttonMode = true;
         this.bg = new UIComponent();
         addElement(this.bg);
         this.createLabel();
         this.leftRect = new UIComponent();
         this.leftRect.height = height - 1;
         this.leftRect.width = 10;
         addElement(this.leftRect);
         this.drawBg();
         this.drawLeftRect();
      }
      
      override public function set data(param1:Object) : void
      {
         this.nameLabel.text = param1.name;
      }
      
      private function createLabel() : void
      {
         this.nameLabel = new Label();
         this.nameLabel.x = 20;
         this.nameLabel.width = 150;
         this.nameLabel.height = 13;
         this.nameLabel.styleName = "patchlistName";
         addElement(this.nameLabel);
      }
      
      private function drawLeftRect() : void
      {
         var _loc1_:Graphics = this.leftRect.graphics;
         _loc1_.clear();
         if(selected)
         {
            _loc1_.lineStyle(1,4228761);
            _loc1_.beginFill(3438730);
         }
         else if(hovered)
         {
            _loc1_.lineStyle(1,3589105);
            _loc1_.beginFill(3325423);
         }
         else
         {
            _loc1_.lineStyle(1,7171437);
            _loc1_.beginFill(7171437);
         }
         _loc1_.drawRect(0.5,0.5,this.leftRect.width - 1,this.leftRect.height - 1);
         _loc1_.endFill();
      }
      
      private function drawBg() : void
      {
         var _loc1_:Graphics = this.bg.graphics;
         _loc1_.clear();
         if(selected)
         {
            _loc1_.beginFill(806749);
         }
         else if(hovered)
         {
            _loc1_.beginFill(222114);
         }
         else
         {
            _loc1_.beginFill(3092271);
         }
         _loc1_.drawRect(0,0,width,height);
         _loc1_.endFill();
         _loc1_.lineStyle(1,0);
         _loc1_.moveTo(0,height - 1);
         _loc1_.lineTo(width - 1,height - 1);
         _loc1_.moveTo(width - 1,0);
         _loc1_.lineTo(width - 1,height - 1);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         this.drawBg();
         this.drawLeftRect();
         this.nameLabel.y = height / 2 - this.nameLabel.height / 2;
      }
   }
}

