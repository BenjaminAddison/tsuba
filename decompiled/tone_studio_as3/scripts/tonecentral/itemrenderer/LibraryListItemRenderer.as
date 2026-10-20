package tonecentral.itemrenderer
{
   import flash.display.Graphics;
   import mx.core.UIComponent;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import tonecentral.common.data.TCPageData;
   
   public class LibraryListItemRenderer extends ItemRenderer
   {
      
      private var nameLabel:Label;
      
      private var bg:UIComponent;
      
      private var bgIcon:UIComponent;
      
      private var icon:BitmapImage;
      
      private var _data:TCPageData;
      
      private var pickupLabel:Label;
      
      public function LibraryListItemRenderer()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         width = 170;
         height = 60;
         buttonMode = true;
         this.bg = new UIComponent();
         addElement(this.bg);
         this.bgIcon = new UIComponent();
         this.bgIcon.x = 7;
         this.bgIcon.y = 7;
         addElement(this.bgIcon);
         this.icon = new BitmapImage();
         this.icon.x = 8;
         this.icon.y = 8;
         this.icon.width = 25;
         this.icon.height = 25;
         addElement(this.icon);
         this.createLabel();
         this.drawBg();
         this.drawBgIcon();
      }
      
      override public function set data(param1:Object) : void
      {
         this._data = param1 as TCPageData;
         this.nameLabel.text = this._data.titleJA;
         this.icon.source = "";
         this.icon.source = this._data.imageJA;
         if(this._data.pickup || this._data.promotion)
         {
            this.pickupLabel.visible = true;
         }
         else
         {
            this.pickupLabel.visible = false;
         }
      }
      
      private function createLabel() : void
      {
         this.nameLabel = new Label();
         this.nameLabel.x = 45;
         this.nameLabel.y = 10;
         this.nameLabel.width = 100;
         this.nameLabel.height = 40;
         this.nameLabel.maxDisplayedLines = 2;
         this.nameLabel.styleName = "patchlistName";
         addElement(this.nameLabel);
         this.pickupLabel = new Label();
         this.pickupLabel.x = 8;
         this.pickupLabel.y = 40;
         this.pickupLabel.width = 30;
         this.pickupLabel.height = 15;
         this.pickupLabel.text = "pickup";
         this.pickupLabel.styleName = "pickup";
         this.pickupLabel.visible = false;
         addElement(this.pickupLabel);
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
      
      private function drawBgIcon() : void
      {
         var _loc1_:Graphics = this.bgIcon.graphics;
         _loc1_.beginFill(0);
         _loc1_.drawRect(0,0,27,27);
         _loc1_.endFill();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.drawBg();
      }
   }
}

