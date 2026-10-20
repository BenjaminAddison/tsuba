package tonecentral.skin
{
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.primitives.Line;
   
   public class RecDataGridSkinInnerClass2 extends Line
   {
      
      private var _88844982outerDocument:RecDataGridSkin;
      
      public function RecDataGridSkinInnerClass2()
      {
         super();
         this.stroke = this._RecDataGridSkinInnerClass2_SolidColorStroke1_c();
      }
      
      private function _RecDataGridSkinInnerClass2_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3352871;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
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

