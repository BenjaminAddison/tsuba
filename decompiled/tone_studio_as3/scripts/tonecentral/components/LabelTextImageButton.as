package tonecentral.components
{
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.Button;
   import tonecentral.skin.ImageButtonSkin;
   
   public class LabelTextImageButton extends Button
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function LabelTextImageButton()
      {
         super();
         this.setStyle("skinClass",ImageButtonSkin);
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

