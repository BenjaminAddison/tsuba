package tonecentral.components
{
   import flash.display.Graphics;
   import flash.geom.Point;
   import mx.events.PropertyChangeEvent;
   import spark.primitives.Line;
   
   public class DashedLine extends Line
   {
      
      private var _1237360920dashLength:uint;
      
      public function DashedLine()
      {
         super();
      }
      
      override protected function draw(param1:Graphics) : void
      {
         var _loc2_:Number = measuredX + drawX;
         var _loc3_:Number = measuredY + drawY;
         var _loc4_:Number = measuredX + drawX + width;
         var _loc5_:Number = measuredY + drawY + height;
         if(xFrom <= xTo == yFrom <= yTo)
         {
            this.lineFromTo(param1,_loc2_,_loc3_,_loc4_,_loc5_);
         }
         else
         {
            this.lineFromTo(param1,_loc2_,_loc5_,_loc4_,_loc3_);
         }
      }
      
      private function lineFromTo(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc13_:Point = null;
         var _loc6_:Point = new Point(param2,param3);
         var _loc7_:Point = new Point(param4,param5);
         if(this.dashLength < 0)
         {
            throw "dashLength を設定してください。";
         }
         var _loc8_:Number = Point.distance(_loc6_,_loc7_);
         param1.moveTo(_loc6_.x,_loc6_.y);
         if(_loc8_ <= this.dashLength)
         {
            param1.lineTo(_loc7_.x,_loc7_.y);
            return;
         }
         var _loc9_:Number = this.dashLength / _loc8_;
         var _loc10_:Point = Point.interpolate(_loc7_,_loc6_,_loc9_);
         var _loc11_:Point = _loc10_.subtract(_loc6_);
         var _loc12_:Number = 0;
         while(_loc12_ < 1)
         {
            _loc12_ += _loc9_;
            _loc13_ = _loc6_.add(_loc11_);
            if(_loc12_ > 1)
            {
               param1.lineTo(_loc7_.x,_loc7_.y);
               break;
            }
            param1.lineTo(_loc13_.x,_loc13_.y);
            _loc12_ += _loc9_;
            _loc6_ = _loc13_.add(_loc11_);
            if(_loc12_ > 1)
            {
               break;
            }
            param1.moveTo(_loc6_.x,_loc6_.y);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dashLength() : uint
      {
         return this._1237360920dashLength;
      }
      
      public function set dashLength(param1:uint) : void
      {
         var _loc2_:Object = this._1237360920dashLength;
         if(_loc2_ !== param1)
         {
            this._1237360920dashLength = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dashLength",_loc2_,param1));
            }
         }
      }
   }
}

