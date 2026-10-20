package tonecentral.common.log.data
{
   public class SoundCloudLogData
   {
      
      public var guid:String;
      
      public var sound_name:String;
      
      public function SoundCloudLogData(param1:String, param2:String)
      {
         super();
         this.guid = param1;
         this.sound_name = param2;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.sound_name = this.sound_name;
         return _loc1_;
      }
   }
}

