package tonecentral.components
{
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.RadioButton;
   import tonecentral.skin.ImageLabelRadioButtonDisableNonAlphaSkin;
   
   public class ImageLabelRadioButtonDisableNonAlpha extends RadioButton
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function ImageLabelRadioButtonDisableNonAlpha()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.setStyle("skinClass",ImageLabelRadioButtonDisableNonAlphaSkin);
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

