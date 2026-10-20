package tonecentral.components
{
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import jp.co.site4d.events.ComponentEvent;
   import spark.components.Button;
   import tonecentral.skin.ImageLabelButtonSkin;
   
   public class ImageLabelButton extends Button
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function ImageLabelButton()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.setStyle("skinClass",ImageLabelButtonSkin);
         this.buttonMode = true;
         addEventListener(Event.REMOVED_FROM_STAGE,this.removeHandler,false,0,true);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
      }
      
      override public function set styleName(param1:Object) : void
      {
         super.styleName = param1;
         dispatchEvent(new ComponentEvent(ComponentEvent.STYLE_CHANGE));
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.SPACE)
         {
            param1.preventDefault();
            return;
         }
         super.keyDownHandler(param1);
      }
      
      private function removeHandler(param1:Event) : void
      {
      }
      
      override protected function clickHandler(param1:MouseEvent) : void
      {
         super.clickHandler(param1);
      }
      
      override protected function mouseEventHandler(param1:Event) : void
      {
         super.mouseEventHandler(param1);
         if(param1.type == MouseEvent.ROLL_OVER)
         {
         }
      }
   }
}

