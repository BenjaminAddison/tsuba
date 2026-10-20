package tonecentral.common.log.data
{
   public class YouTubeLogData
   {
      
      public var guid:String;
      
      public var play_event:String;
      
      public function YouTubeLogData(param1:String, param2:String)
      {
         super();
         this.guid = param1;
         this.play_event = param2;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.play_event = this.play_event;
         return _loc1_;
      }
   }
}

