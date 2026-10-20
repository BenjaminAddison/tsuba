package tonecentral.components
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import jp.co.site4d.events.ComponentEvent;
   import jp.co.site4d.skin.desktop.ImageButtonSkin;
   import spark.components.Button;
   
   public class ImageButton extends Button
   {
      
      private static var _skinParts:Object = {
         "iconDisplay":false,
         "labelDisplay":false
      };
      
      public function ImageButton()
      {
         super();
         this.setStyle("skinClass",ImageButtonSkin);
         this.buttonMode = true;
         this.tabFocusEnabled = false;
      }
      
      override public function set styleName(param1:Object) : void
      {
         if(super.styleName == param1)
         {
            return;
         }
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
   }
}

