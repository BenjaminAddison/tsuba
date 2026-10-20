package tonecentral.common.log.data
{
   public class StatusLogData
   {
      
      public var guid:String;
      
      public var status_date:String;
      
      public var status_flag:String;
      
      public function StatusLogData(param1:String, param2:String, param3:String)
      {
         super();
         this.guid = param1;
         this.status_date = param2;
         this.status_flag = param3;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.status_date = this.status_date;
         _loc1_.status_flag = this.status_flag;
         return _loc1_;
      }
   }
}

