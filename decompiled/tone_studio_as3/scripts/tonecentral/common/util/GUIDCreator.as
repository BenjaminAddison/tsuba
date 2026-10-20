package tonecentral.common.util
{
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   
   public class GUIDCreator
   {
      
      public static const GUID_DATA:String = "guid_data";
      
      public var guid:String;
      
      public function GUIDCreator()
      {
         super();
      }
      
      public function getGUID() : Object
      {
         return SharedObjectUtil.get(GUID_DATA);
      }
      
      public function genarateGUID() : void
      {
         var _loc3_:int = 0;
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < 32)
         {
            _loc3_ = Math.round(Math.random() * 15);
            _loc1_ += _loc3_.toString(16).toUpperCase();
            if(_loc2_ == 7 || _loc2_ == 11 || _loc2_ == 15 || _loc2_ == 19)
            {
               _loc1_ += "-";
            }
            _loc2_++;
         }
         this.guid = _loc1_;
         SharedObjectUtil.set(GUID_DATA,this.guid);
      }
   }
}

