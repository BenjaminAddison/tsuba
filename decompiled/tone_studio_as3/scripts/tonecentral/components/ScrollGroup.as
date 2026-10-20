package tonecentral.components
{
   import flash.events.MouseEvent;
   import spark.components.Group;
   
   public class ScrollGroup extends Group
   {
      
      public function ScrollGroup()
      {
         super();
         addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandler,false,0,true);
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         param1.delta *= 60;
      }
   }
}

