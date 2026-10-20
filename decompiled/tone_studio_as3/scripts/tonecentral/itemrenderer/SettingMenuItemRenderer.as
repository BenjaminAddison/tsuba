package tonecentral.itemrenderer
{
   import flash.display.Graphics;
   import mx.core.UIComponent;
   import mx.resources.ResourceManager;
   import spark.components.Label;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class SettingMenuItemRenderer extends AbstractToneCentralItemRenderer
   {
      
      private var nameLabel:Label;
      
      private var bg:UIComponent;
      
      private var mediator:ToneCentralMediator;
      
      public function SettingMenuItemRenderer()
      {
         super();
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED,this.settingLanguageCompleteHandler,false,0,true);
      }
      
      private function settingLanguageCompleteHandler(param1:ToneCentralEvents) : void
      {
         this.nameLabel.styleName = ResourceManager.getInstance().getString("resource","setting.menulabel.style");
         this.drawBg();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.nameLabel.text = data.title;
      }
      
      override protected function createChildren() : void
      {
         width = 150;
         height = 40;
         buttonMode = true;
         this.bg = new UIComponent();
         addElement(this.bg);
         this.createLabel();
         this.drawBg();
      }
      
      private function createLabel() : void
      {
         this.nameLabel = new Label();
         this.nameLabel.x = 10;
         this.nameLabel.width = 140;
         this.nameLabel.height = 13;
         this.nameLabel.styleName = ResourceManager.getInstance().getString("resource","setting.menulabel.style");
         addElement(this.nameLabel);
      }
      
      private function drawBg() : void
      {
         if(!this.bg)
         {
            return;
         }
         var _loc1_:uint = 2299925;
         if(selected)
         {
            _loc1_ = 865598;
            this.nameLabel.styleName = ResourceManager.getInstance().getString("resource","setting.menulabel.selected.style");
         }
         else
         {
            this.nameLabel.styleName = ResourceManager.getInstance().getString("resource","setting.menulabel.style");
         }
         var _loc2_:Graphics = this.bg.graphics;
         _loc2_.clear();
         _loc2_.beginFill(_loc1_);
         _loc2_.drawRect(0,0,this.width,this.height);
         _loc2_.endFill();
         _loc2_.lineStyle(1,3352871);
         _loc2_.moveTo(0,this.height - 1);
         _loc2_.lineTo(this.width,this.height - 1);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         this.drawBg();
         this.nameLabel.y = height / 2 - this.nameLabel.height / 2;
      }
   }
}

