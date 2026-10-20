package tonecentral.components
{
   import flash.utils.Timer;
   
   public class DelayTimer extends Timer
   {
      
      private var _data:Object;
      
      public function DelayTimer(param1:Number, param2:int = 0)
      {
         super(param1,param2);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
   }
}

