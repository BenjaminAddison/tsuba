package tonecentral.components
{
   import spark.components.TextInput;
   import tonecentral.skin.LivesetEditTextInputSkin;
   
   public class LivesetEditTextInput extends TextInput
   {
      
      private static var _skinParts:Object = {
         "promptDisplay":false,
         "textDisplay":false
      };
      
      private var isFocus:Boolean = false;
      
      public function LivesetEditTextInput()
      {
         super();
         this.setStyle("skinClass",LivesetEditTextInputSkin);
      }
   }
}

