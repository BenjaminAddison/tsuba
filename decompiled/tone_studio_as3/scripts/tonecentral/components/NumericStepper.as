package tonecentral.components
{
   import spark.components.NumericStepper;
   
   public class NumericStepper extends spark.components.NumericStepper
   {
      
      private static var _skinParts:Object = {
         "incrementButton":false,
         "textDisplay":true,
         "decrementButton":false
      };
      
      public function NumericStepper()
      {
         super();
         this.focusEnabled = false;
      }
   }
}

