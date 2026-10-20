package tonecentral.common.data
{
   public class LibraryDataSet
   {
      
      public var device:String = "GT";
      
      public var version:String = "1.0.0";
      
      public var liveSetData:LiveSetData;
      
      public var patchList:Vector.<PatchData>;
      
      public function LibraryDataSet()
      {
         super();
         this.init();
      }
      
      public static function restore(param1:Object) : LibraryDataSet
      {
         var _loc3_:int = 0;
         var _loc2_:LibraryDataSet = new LibraryDataSet();
         _loc2_.liveSetData = LiveSetData.restore(param1.liveSetData);
         _loc2_.patchList = new Vector.<PatchData>();
         if(param1.patchList)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.patchList.length)
            {
               _loc2_.patchList.push(PatchData.restore(param1.patchList[_loc3_]));
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public static function importData(param1:Object) : LibraryDataSet
      {
         var _loc2_:LibraryDataSet = new LibraryDataSet();
         _loc2_.liveSetData = LiveSetData.restore(param1.liveSetData);
         _loc2_.patchList = new Vector.<PatchData>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.patchList.length)
         {
            _loc2_.patchList.push(PatchData.restore(param1.patchList[_loc3_]));
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function init() : void
      {
         this.liveSetData = new LiveSetData();
         this.liveSetData.name = "Liveset";
         this.patchList = new Vector.<PatchData>();
      }
      
      public function addPatch(param1:PatchData) : void
      {
         this.patchList.push(param1);
      }
      
      public function setNewId() : void
      {
         var _loc2_:PatchData = null;
         this.liveSetData.setNewId();
         var _loc1_:int = 0;
         while(_loc1_ < this.patchList.length)
         {
            _loc2_ = this.patchList[_loc1_];
            _loc2_.liveSetId = this.liveSetData.id;
            _loc2_.setNewID();
            _loc1_++;
         }
      }
      
      public function setTcFlag() : void
      {
         var _loc2_:PatchData = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.patchList.length)
         {
            _loc2_ = this.patchList[_loc1_];
            _loc2_.liveSetId = this.liveSetData.id;
            _loc2_.tcPatch = true;
            _loc2_.logPatchName = this.liveSetData.name + ":" + _loc2_.name;
            _loc1_++;
         }
      }
   }
}

