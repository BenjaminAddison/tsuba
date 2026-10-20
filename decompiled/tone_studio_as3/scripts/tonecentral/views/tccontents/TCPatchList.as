package tonecentral.views.tccontents
{
   import flash.events.KeyboardEvent;
   import tonecentral.components.CustomList;
   
   public class TCPatchList extends CustomList
   {
      
      private static var _skinParts:Object = {
         "scroller":false,
         "dropIndicator":false,
         "dataGroup":false
      };
      
      public function TCPatchList()
      {
         super();
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
      }
   }
}

