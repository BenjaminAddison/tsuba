package
{
   import mx.resources.ResourceBundle;
   
   public class ja_JP$effects_properties extends ResourceBundle
   {
      
      public function ja_JP$effects_properties()
      {
         super("ja_JP","effects");
      }
      
      override protected function getContent() : Object
      {
         return {
            "incorrectTrigger":"Zoom エフェクトは moveEffect トリガーでトリガーすることはできません。",
            "incorrectSource":"Source プロパティは Class または String である必要があります。"
         };
      }
   }
}

