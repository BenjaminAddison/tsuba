package tonecentral.common.log.data
{
   public class ErrorLogData
   {
      
      public var guid:String;
      
      public var error_type:String;
      
      public var error_log:String;
      
      public function ErrorLogData(param1:String, param2:String, param3:String)
      {
         super();
         this.guid = param1;
         this.error_type = param2;
         this.error_log = param3;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.error_type = this.error_type;
         _loc1_.error_log = this.error_log;
         return _loc1_;
      }
   }
}

