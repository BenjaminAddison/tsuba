package tonecentral.components
{
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.RadioButton;
   import tonecentral.skin.ImageLabelRadioButtonSkin;
   
   public class ImageLabelRadioButton extends RadioButton
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function ImageLabelRadioButton()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.setStyle("skinClass",ImageLabelRadioButtonSkin);
         this.buttonMode = true;
         this.tabFocusEnabled = true;
      }
      
      override public function set styleName(param1:Object) : void
      {
         super.styleName = param1;
         dispatchEvent(new ComponentEvent(ComponentEvent.STYLE_CHANGE));
      }
   }
}

