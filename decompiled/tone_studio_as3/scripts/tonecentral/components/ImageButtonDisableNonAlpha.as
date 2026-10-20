package tonecentral.components
{
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.Button;
   import tonecentral.skin.ImageButtonDisableNonAlphaSkin;
   
   public class ImageButtonDisableNonAlpha extends Button
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function ImageButtonDisableNonAlpha()
      {
         super();
         this.setStyle("skinClass",ImageButtonDisableNonAlphaSkin);
         this.buttonMode = true;
         this.tabFocusEnabled = false;
      }
      
      override public function set styleName(param1:Object) : void
      {
         if(super.styleName == param1)
         {
            return;
         }
         super.styleName = param1;
         dispatchEvent(new ComponentEvent(ComponentEvent.STYLE_CHANGE));
      }
   }
}

