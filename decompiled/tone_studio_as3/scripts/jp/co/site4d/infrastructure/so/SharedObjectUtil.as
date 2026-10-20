package jp.co.site4d.infrastructure.so
{
   import flash.net.SharedObject;
   
   public class SharedObjectUtil
   {
      
      public function SharedObjectUtil()
      {
         super();
      }
      
      public static function get(param1:String) : Object
      {
         var _loc2_:SharedObject = getSharedObject(param1);
         return _loc2_.data[param1];
      }
      
      public static function set(param1:String, param2:Object) : void
      {
         var so:SharedObject = null;
         var name:String = param1;
         var value:Object = param2;
         try
         {
            so = getSharedObject(name);
            so.data[name] = value;
            so.flush();
         }
         catch(e:Error)
         {
            trace(e);
         }
      }
      
      private static function getSharedObject(param1:String) : SharedObject
      {
         return SharedObject.getLocal(param1);
      }
   }
}

