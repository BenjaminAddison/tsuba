package tonecentral.views.library
{
   import flash.display.Graphics;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import mx.core.UIComponent;
   
   public class PatchEditMessage extends UIComponent
   {
      
      private var label:TextField;
      
      public function PatchEditMessage()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         width = 150;
         height = 20;
         this.label = new TextField();
         this.label.defaultTextFormat = new TextFormat("A-OTF 新ゴ Pro R",12,3355443,null,null,null,null,null,"center");
         this.label.y = 1;
         this.label.height = 18;
         this.label.width = 150;
         addChild(this.label);
         this.drawBg();
      }
      
      private function drawBg() : void
      {
         var _loc1_:Graphics = this.graphics;
         _loc1_.clear();
         _loc1_.beginFill(13421772);
         _loc1_.drawRoundRect(0,0,150,20,20,20);
         _loc1_.endFill();
      }
      
      public function set text(param1:String) : void
      {
         this.label.text = param1;
      }
   }
}

