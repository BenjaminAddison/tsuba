package tonecentral.common.log.data
{
   public class LivesetLogData
   {
      
      public var guid:String;
      
      public var liveset_name:String;
      
      public function LivesetLogData(param1:String, param2:String)
      {
         super();
         this.guid = param1;
         this.liveset_name = param2;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.liveset_name = this.liveset_name;
         return _loc1_;
      }
   }
}

