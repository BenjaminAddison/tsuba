package tonecentral.components
{
   import flash.events.MouseEvent;
   import spark.components.List;
   
   public class CustomList extends List
   {
      
      private static var _skinParts:Object = {
         "scroller":false,
         "dropIndicator":false,
         "dataGroup":false
      };
      
      private var _isItemDrop:Boolean = false;
      
      public function CustomList()
      {
         super();
         addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandler,false,0,true);
      }
      
      public function get isItemDrop() : Boolean
      {
         return this._isItemDrop;
      }
      
      public function set isItemDrop(param1:Boolean) : void
      {
         this._isItemDrop = param1;
         if(this._isItemDrop)
         {
            destroyDropIndicator();
         }
         else
         {
            createDropIndicator();
         }
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         param1.delta *= 60;
      }
   }
}

