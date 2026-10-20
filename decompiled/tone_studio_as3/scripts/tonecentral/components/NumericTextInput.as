package tonecentral.components
{
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.TextInput;
   import tonecentral.skin.CustomNumericTextInputSkin;
   
   public class NumericTextInput extends TextInput
   {
      
      private static var _skinParts:Object = {
         "promptDisplay":false,
         "textDisplay":false
      };
      
      public function NumericTextInput()
      {
         super();
         setStyle("skinClass",CustomNumericTextInputSkin);
      }
      
      override public function set styleName(param1:Object) : void
      {
         super.styleName = param1;
         dispatchEvent(new ComponentEvent(ComponentEvent.STYLE_CHANGE));
      }
   }
}

