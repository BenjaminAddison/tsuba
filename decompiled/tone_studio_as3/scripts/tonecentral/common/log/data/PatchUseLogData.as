package tonecentral.common.log.data
{
   public class PatchUseLogData
   {
      
      public var guid:String;
      
      public var patch_name:String;
      
      public function PatchUseLogData(param1:String, param2:String)
      {
         super();
         this.guid = param1;
         this.patch_name = param2;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.patch_name = this.patch_name;
         return _loc1_;
      }
   }
}

