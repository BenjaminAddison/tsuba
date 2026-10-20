package tonecentral.components.library
{
   import spark.components.TextInput;
   import tonecentral.skin.PatchTextInputSkin;
   
   public class PatchTextInput extends TextInput
   {
      
      private static var _skinParts:Object = {
         "promptDisplay":false,
         "textDisplay":false
      };
      
      private var isFocus:Boolean = false;
      
      public function PatchTextInput()
      {
         super();
         this.setStyle("skinClass",PatchTextInputSkin);
      }
   }
}

