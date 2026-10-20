package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.RotateInstance;
   
   use namespace mx_internal;
   
   public class Rotate extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var AFFECTED_PROPERTIES:Array = ["rotation"];
      
      public var angleFrom:Number = 0;
      
      public var angleTo:Number = 360;
      
      public var originX:Number;
      
      public var originY:Number;
      
      public function Rotate(param1:Object = null)
      {
         super(param1);
         instanceClass = RotateInstance;
         this.hideFocusRing = true;
      }
      
      override public function set hideFocusRing(param1:Boolean) : void
      {
         super.hideFocusRing = param1;
      }
      
      override public function get hideFocusRing() : Boolean
      {
         return super.hideFocusRing;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         var _loc2_:RotateInstance = RotateInstance(param1);
         _loc2_.angleFrom = this.angleFrom;
         _loc2_.angleTo = this.angleTo;
         _loc2_.originX = this.originX;
         _loc2_.originY = this.originY;
      }
   }
}

