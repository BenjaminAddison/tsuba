package tonecentral.skin
{
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.primitives.Rect;
   
   public class RecDataGridSkinInnerClass4 extends Rect
   {
      
      private var _88844982outerDocument:RecDataGridSkin;
      
      public function RecDataGridSkinInnerClass4()
      {
         super();
         this.fill = this._RecDataGridSkinInnerClass4_SolidColor1_c();
      }
      
      private function _RecDataGridSkinInnerClass4_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : RecDataGridSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:RecDataGridSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}

