package tonecentral.itemrenderer
{
   import flash.events.Event;
   import mx.resources.ResourceManager;
   import spark.components.supportClasses.InteractionState;
   import spark.components.supportClasses.InteractionStateDetector;
   import spark.skins.spark.DefaultItemRenderer;
   
   public class LocaleDropDownListItemRenderer extends DefaultItemRenderer
   {
      
      private var interactionStateDetector:InteractionStateDetector;
      
      public function LocaleDropDownListItemRenderer()
      {
         super();
         this.interactionStateDetector = new InteractionStateDetector(this);
         this.interactionStateDetector.addEventListener(Event.CHANGE,this.interactionStateDetector_changeHandler);
      }
      
      private function interactionStateDetector_changeHandler(param1:Event) : void
      {
         invalidateDisplayList();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.height = 25;
         labelDisplay.styleName = ResourceManager.getInstance().getString("resource","skin.dropdown.style");
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:uint = 0;
         if(this.interactionStateDetector.state == InteractionState.DOWN)
         {
            _loc3_ = 6710886;
            labelDisplay.styleName = ResourceManager.getInstance().getString("resource","skin.dropdown.style");
         }
         else if(selected)
         {
            _loc3_ = 865598;
            labelDisplay.styleName = ResourceManager.getInstance().getString("resource","skin.dropdown.selected.style");
         }
         else if(this.interactionStateDetector.state == InteractionState.OVER)
         {
            _loc3_ = 6710886;
            labelDisplay.styleName = ResourceManager.getInstance().getString("resource","skin.dropdown.style");
         }
         else
         {
            labelDisplay.styleName = ResourceManager.getInstance().getString("resource","skin.dropdown.style");
         }
         this.graphics.clear();
         this.graphics.beginFill(_loc3_);
         this.graphics.drawRect(0,0,param1,param2);
         this.graphics.endFill();
         this.graphics.lineStyle(1,2960685);
         this.graphics.moveTo(0,param2 - 1);
         this.graphics.lineTo(param1,param2 - 1);
         var _loc4_:Number = param1 - 6;
         _loc4_ = Math.max(labelDisplay.getMinBoundsWidth(),Math.min(labelDisplay.getMaxBoundsWidth(),_loc4_));
         var _loc5_:Number = param2 - 10;
         _loc5_ = Math.max(labelDisplay.getMinBoundsHeight(),Math.min(labelDisplay.getMaxBoundsHeight(),_loc5_));
         labelDisplay.setLayoutBoundsSize(_loc4_,_loc5_);
         labelDisplay.setLayoutBoundsPosition(3,5);
         labelDisplay.y = param2 / 2 - labelDisplay.height / 2 + 2;
      }
   }
}

