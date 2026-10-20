package tonecentral.views.tccontents
{
   import spark.components.Group;
   import spark.components.Label;
   
   public class InfoTagItem extends Group
   {
      
      private var label:Label;
      
      public function InfoTagItem()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         this.width = 65;
         this.height = 25;
         this.label = new Label();
         this.label.styleName = "InfoTagItem";
         this.label.height = this.height;
         this.label.width = this.width;
         this.label.y = 8;
         addElement(this.label);
         this.graphics.clear();
         this.graphics.beginFill(4473924);
         this.graphics.drawRoundRect(0.5,0.5,this.width,this.height,30,35);
         this.graphics.endFill();
      }
      
      public function set tagName(param1:String) : void
      {
         this.label.text = param1.replace("&amp;","&");
      }
   }
}

