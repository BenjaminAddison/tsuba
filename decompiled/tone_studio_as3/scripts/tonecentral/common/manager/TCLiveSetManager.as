package tonecentral.common.manager
{
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import tonecentral.common.data.LibraryDataSet;
   
   public class TCLiveSetManager
   {
      
      private static var instance:TCLiveSetManager;
      
      private var liveSetList:Object = {};
      
      public function TCLiveSetManager(param1:Blocker)
      {
         super();
      }
      
      public static function getInstance() : TCLiveSetManager
      {
         if(!instance)
         {
            instance = new TCLiveSetManager(new Blocker());
         }
         return instance;
      }
      
      public function restoreAllLiveSet() : void
      {
         var _loc4_:File = null;
         var _loc5_:FileStream = null;
         var _loc6_:String = null;
         var _loc7_:LibraryDataSet = null;
         var _loc1_:File = File.applicationStorageDirectory.resolvePath("livesets");
         if(!_loc1_.exists)
         {
            return;
         }
         var _loc2_:Array = _loc1_.getDirectoryListing();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_] as File;
            if(Boolean(_loc4_.exists) && _loc4_.extension == ".tsl")
            {
               _loc5_ = new FileStream();
               _loc5_.open(_loc4_,FileMode.READ);
               _loc6_ = _loc5_.readUTFBytes(_loc5_.bytesAvailable);
               _loc5_.close();
               _loc7_ = LibraryDataSet.restore(JSON.parse(_loc6_));
               if(!this.liveSetList.hasOwnProperty(_loc7_.liveSetData.id))
               {
                  this.liveSetList[_loc7_.liveSetData.id] = _loc7_;
               }
            }
            _loc3_++;
         }
      }
      
      public function isToneCentralPatch(param1:String) : Boolean
      {
         return this.liveSetList.hasOwnProperty(param1);
      }
   }
}

class Blocker
{
   
   public function Blocker()
   {
      super();
   }
}
