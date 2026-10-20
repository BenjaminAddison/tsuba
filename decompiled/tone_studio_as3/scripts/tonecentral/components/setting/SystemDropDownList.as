package tonecentral.components.setting
{
   import spark.components.DropDownList;
   import tonecentral.skin.SystemDropDownListSkin;
   
   public class SystemDropDownList extends DropDownList
   {
      
      private static var _skinParts:Object = {
         "scroller":false,
         "dropDown":false,
         "labelDisplay":false,
         "openButton":true,
         "dropIndicator":false,
         "dataGroup":false
      };
      
      public function SystemDropDownList()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         this.setStyle("skinClass",SystemDropDownListSkin);
      }
   }
}

