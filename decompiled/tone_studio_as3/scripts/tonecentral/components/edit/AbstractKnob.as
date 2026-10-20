package tonecentral.components.edit
{
   import spark.components.Group;
   import spark.components.Label;
   
   public class AbstractKnob extends Group
   {
      
      public var index:Number;
      
      protected var parameterMax:Number;
      
      protected var parameterMin:Number;
      
      public var parameterName:String;
      
      protected var parameterStep:Number;
      
      protected var parameterNameLabel:Label;
      
      protected var _selected:Boolean;
      
      protected var _pointX:Number;
      
      protected var _pointY:Number;
      
      protected var _parameterVal:Number;
      
      protected var _key:String = "";
      
      private var _knobEnabled:Boolean = true;
      
      protected var _data:Object;
      
      public function AbstractKnob()
      {
         super();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get pointX() : Number
      {
         return this._pointX;
      }
      
      public function get pointY() : Number
      {
         return this._pointY;
      }
      
      public function set parameterVal(param1:Number) : void
      {
         this._parameterVal = param1;
      }
      
      public function get knobEnabled() : Boolean
      {
         return this._knobEnabled;
      }
      
      public function set knobEnabled(param1:Boolean) : void
      {
         this._knobEnabled = param1;
         buttonMode = param1;
         if(!param1)
         {
            alpha = 0.3;
            this.selected = false;
         }
         else
         {
            alpha = 1;
         }
      }
      
      public function setData(param1:Object) : void
      {
         this._key = param1.id;
         this._data = param1;
         this.parameterName = param1.name;
         this.parameterMax = param1.max;
         this.parameterMin = param1.min;
         this.parameterVal = param1.val;
         this.parameterStep = param1.step;
         this.drawKnob();
      }
      
      protected function drawKnob() : void
      {
      }
      
      public function knobRotation(param1:Object) : void
      {
      }
      
      public function adjustHarmonistCodeLabel(param1:Object) : void
      {
      }
   }
}

