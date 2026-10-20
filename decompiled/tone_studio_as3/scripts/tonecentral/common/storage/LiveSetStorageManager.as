package tonecentral.common.storage
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import tonecentral.common.data.LibraryDataSet;
   import tonecentral.common.storage.model.LiveSetDataModel;
   import tonecentral.common.storage.model.PatchDataModel;
   
   public class LiveSetStorageManager extends EventDispatcher
   {
      
      private static var instance:LiveSetStorageManager;
      
      private var livesetDataAccess:LiveSetDataAccess;
      
      private var patchInsertCount:int = 0;
      
      private var saveData:LibraryDataSet;
      
      private var saveLivesetId:Number;
      
      public function LiveSetStorageManager(param1:Blocker, param2:IEventDispatcher = null)
      {
         super(param2);
         this.init();
      }
      
      public static function getInstance() : LiveSetStorageManager
      {
         if(!instance)
         {
            instance = new LiveSetStorageManager(new Blocker());
         }
         return instance;
      }
      
      private function init() : void
      {
         this.livesetDataAccess = new LiveSetDataAccess();
      }
      
      public function find() : Array
      {
         var _loc4_:Object = null;
         var _loc5_:LibraryDataSet = null;
         var _loc1_:Array = this.livesetDataAccess.find();
         var _loc2_:Array = [];
         if(!_loc1_)
         {
            return _loc2_;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_ = {
               "liveSetData":{
                  "id":_loc1_[_loc3_].id,
                  "name":_loc1_[_loc3_].name,
                  "url":_loc1_[_loc3_].url,
                  "path":_loc1_[_loc3_].path,
                  "image":_loc1_[_loc3_].image,
                  "orderNumber":_loc1_[_loc3_].orderNumber
               },
               "patchList":_loc1_[_loc3_].patchList
            };
            _loc5_ = LibraryDataSet.restore(_loc4_);
            _loc2_.push(_loc5_);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getLivesetCount() : int
      {
         var _loc1_:Array = this.livesetDataAccess.find();
         if(_loc1_)
         {
            return _loc1_.length;
         }
         return 0;
      }
      
      public function save(param1:LibraryDataSet) : void
      {
         this.saveData = param1;
         this.livesetDataAccess.insert(param1);
      }
      
      public function saveLivesetData(param1:LibraryDataSet) : void
      {
         this.saveData = param1;
         this.livesetDataAccess.updateLiveset(param1);
      }
      
      public function del(param1:LibraryDataSet) : void
      {
         var _loc2_:LiveSetDataModel = new LiveSetDataModel();
         _loc2_.del({"id":param1.liveSetData.id});
         var _loc3_:PatchDataModel = new PatchDataModel();
         var _loc4_:int = 0;
         while(_loc4_ < param1.patchList.length)
         {
            _loc3_.del({"id":param1.patchList[_loc4_].id});
            _loc4_++;
         }
      }
      
      public function findById(param1:String) : Object
      {
         return this.livesetDataAccess.findOne(param1);
      }
      
      public function saveListsetOrder(param1:LibraryDataSet) : void
      {
         this.livesetDataAccess.updateLivesetOrder(param1);
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
