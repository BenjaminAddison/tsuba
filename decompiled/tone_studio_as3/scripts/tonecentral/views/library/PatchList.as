package tonecentral.views.library
{
   import flash.display.DisplayObject;
   import tonecentral.components.CustomList;
   import tonecentral.events.ToneCentralEvents;
   
   public class PatchList extends CustomList
   {
      
      private static var _skinParts:Object = {
         "scroller":false,
         "dropIndicator":false,
         "dataGroup":false
      };
      
      private var _selected:Boolean;
      
      public function PatchList()
      {
         super();
         buttonMode = true;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         buttonMode = !param1;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECTED_LIVE_SET));
      }
      
      override public function createDropIndicator() : DisplayObject
      {
         if(isItemDrop)
         {
            return null;
         }
         return super.createDropIndicator();
      }
   }
}

