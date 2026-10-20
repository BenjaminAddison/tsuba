package tonecentral.common.util
{
   public class DataUtil
   {
      
      public function DataUtil()
      {
         super();
      }
      
      public static function getDataID() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            _loc1_ += Math.round(Math.random() * 9);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function trimSpaceEnd(param1:String) : String
      {
         return param1.replace(/ *$/,"");
      }
      
      public static function trimSpace(param1:String) : String
      {
         var _loc2_:String = param1.replace(/ *$/,"");
         return _loc2_.replace(/^ */,"");
      }
      
      public static function addSpaceEnd(param1:String, param2:int) : String
      {
         var _loc3_:int = param1.length;
         while(_loc3_ < param2)
         {
            param1 += " ";
            _loc3_++;
         }
         return param1;
      }
   }
}

