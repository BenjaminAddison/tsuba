package tonecentral.itemrenderer
{
   import flash.display.Graphics;
   import mx.core.UIComponent;
   import mx.resources.ResourceManager;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   
   public class DeviceListItemRenderer extends ItemRenderer
   {
      
      private var nameLabel:Label;
      
      private var bg:UIComponent;
      
      public function DeviceListItemRenderer()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.height = 30;
         this.bg = new UIComponent();
         addElement(this.bg);
         this.nameLabel = new Label();
         this.nameLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style");
         this.nameLabel.x = 10;
         this.nameLabel.height = 12;
         addElement(this.nameLabel);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(this.nameLabel)
         {
            this.nameLabel.text = data.deviceName;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.nameLabel.y = param2 / 2 - this.nameLabel.height / 2;
         this.nameLabel.width = param1 - 20;
         this.drawBG();
         this.nameLabel.styleName = ResourceManager.getInstance().getString("resource","dialog.msg.style");
      }
      
      private function drawBG() : void
      {
         if(!this.bg)
         {
            return;
         }
         var _loc1_:uint = 2299925;
         if(selected)
         {
            _loc1_ = 865598;
            this.nameLabel.styleName = "dialogMsgLabelSelectedJP";
         }
         else
         {
            this.nameLabel.styleName = "dialogMsgLabelJP";
         }
         var _loc2_:Graphics = this.bg.graphics;
         _loc2_.clear();
         _loc2_.beginFill(_loc1_);
         _loc2_.drawRect(0,0,this.width,this.height);
         _loc2_.endFill();
         _loc2_.lineStyle(1,3352871);
         _loc2_.moveTo(0,29);
         _loc2_.lineTo(this.width,29);
      }
   }
}

