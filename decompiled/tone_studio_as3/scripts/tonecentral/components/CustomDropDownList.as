package tonecentral.components
{
   import mx.events.FlexEvent;
   import spark.components.DropDownList;
   import spark.events.IndexChangeEvent;
   import tonecentral.skin.CustomDropDownListSkin;
   import tonecentral.skin.SystemDropDownListSkin;
   
   public class CustomDropDownList extends DropDownList
   {
      
      private static var _skinParts:Object = {
         "scroller":false,
         "dropDown":false,
         "labelDisplay":false,
         "openButton":true,
         "dropIndicator":false,
         "dataGroup":false
      };
      
      public var isSystemSetting:Boolean;
      
      public function CustomDropDownList()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         if(this.isSystemSetting)
         {
            this.setStyle("skinClass",SystemDropDownListSkin);
         }
         else
         {
            this.setStyle("skinClass",CustomDropDownListSkin);
         }
         addEventListener(FlexEvent.CREATION_COMPLETE,this.createCompleteHandler,false,0,true);
         addEventListener(IndexChangeEvent.CHANGE,this.changeHandler,false,0,true);
      }
      
      private function changeHandler(param1:IndexChangeEvent) : void
      {
         this.callLater(this.setToolTipData);
      }
      
      private function createCompleteHandler(param1:FlexEvent) : void
      {
         this.setToolTipData();
      }
      
      private function setToolTipData() : void
      {
         if(this.isSystemSetting)
         {
            (this.skin as SystemDropDownListSkin).setToolTipData();
         }
         else
         {
            (this.skin as CustomDropDownListSkin).setToolTipData();
         }
      }
   }
}

