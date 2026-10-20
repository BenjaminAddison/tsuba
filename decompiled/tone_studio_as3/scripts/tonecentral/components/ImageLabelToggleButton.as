package tonecentral.components
{
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.ToggleButton;
   import tonecentral.skin.ImageLabelToggleButtonSkin;
   
   public class ImageLabelToggleButton extends ToggleButton
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function ImageLabelToggleButton()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.setStyle("skinClass",ImageLabelToggleButtonSkin);
         this.buttonMode = true;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this.alpha = param1 ? 1 : 0.3;
      }
      
      override public function set styleName(param1:Object) : void
      {
         super.styleName = param1;
         dispatchEvent(new ComponentEvent(ComponentEvent.STYLE_CHANGE));
      }
   }
}

