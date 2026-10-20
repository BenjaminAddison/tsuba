package tonecentral.common.log.data
{
   public class UpdateLogData
   {
      
      public var guid:String;
      
      public var update_version:String;
      
      public function UpdateLogData(param1:String, param2:String)
      {
         super();
         this.guid = param1;
         this.update_version = param2;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.update_version = this.update_version;
         return _loc1_;
      }
   }
}

