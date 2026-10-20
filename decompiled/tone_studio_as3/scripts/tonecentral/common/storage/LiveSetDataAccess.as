package tonecentral.common.storage
{
   import flash.data.SQLConnection;
   import flash.data.SQLResult;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import jp.cre8system.framework.airrecord.db.ARDatabase;
   import tonecentral.common.data.LibraryDataSet;
   import tonecentral.common.storage.model.LiveSetDataModel;
   import tonecentral.common.storage.model.PatchDataModel;
   
   public class LiveSetDataAccess extends EventDispatcher
   {
      
      private static const DDL:Array = ["CREATE TABLE IF NOT EXISTS livesets (" + "id TEXT PRIMARY KEY," + "name TEXT," + "url TEXT," + "image TEXT," + "flag INTEGER" + ")","CREATE TABLE IF NOT EXISTS patches (" + "id TEXT PRIMARY KEY," + "liveSetId TEXT," + "name TEXT," + "gt100Name1 TEXT," + "gt100Name2 TEXT," + "note TEXT," + "params TEXT," + "orderNumber INTEGER," + "logPatchName TEXT," + "tcPatch INTEGER," + "flag INTEGER" + ")","CREATE TABLE IF NOT EXISTS btc_user (" + "id INTEGER PRIMARY KEY," + "guid TEXT NOT NULL," + "remote_addr TEXT," + "product TEXT," + "app_name TEXT," + "app_version TEXT," + "app_revision TEXT," + "os TEXT," + "resolution_x INTEGER," + "resolution_y INTEGER," + "runtime TEXT" + ")","CREATE TABLE IF NOT EXISTS btc_errorlogs (" + "id INTEGER PRIMARY KEY," + "guid TEXT NOT NULL," + "error_type TEXT NOT NULL," + "error_log TEXT NOT NULL" + ")","CREATE TABLE IF NOT EXISTS btc_statuslogs (" + "id INTEGER PRIMARY KEY," + "guid TEXT NOT NULL," + "status_date TEXT NOT NULL," + "status_flag INTEGER NOT NULL" + ")"
      ,"CREATE TABLE IF NOT EXISTS btc_updatelogs (" + "id INTEGER PRIMARY KEY," + "guid TEXT NOT NULL," + "update_version TEXT NOT NULL" + ")","CREATE TABLE IF NOT EXISTS btc_patch_uselogs (" + "id INTEGER PRIMARY KEY," + "guid TEXT NOT NULL," + "patch_name TEXT NOT NULL" + ")","CREATE TABLE IF NOT EXISTS btc_liveset_addlogs (" + "id INTEGER PRIMARY KEY," + "guid TEXT NOT NULL," + "liveset_name TEXT NOT NULL" + ")"];
      
      private var conn:SQLConnection;
      
      private var db:ARDatabase = ARDatabase.instance;
      
      public function LiveSetDataAccess(param1:IEventDispatcher = null)
      {
         super(param1);
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:SQLResult = null;
         var _loc2_:int = 0;
         var _loc3_:LiveSetDataModel = null;
         this.db.add("","","liveset",DDL);
         this.db.connect();
         try
         {
            this.db.query("ALTER TABLE livesets ADD orderNumber INTEGER");
            _loc1_ = this.db.find("livesets");
            _loc2_ = 0;
            while(_loc2_ < _loc1_.data.length)
            {
               _loc3_ = new LiveSetDataModel();
               _loc3_.id = _loc1_.data[_loc2_].id;
               _loc3_.name = _loc1_.data[_loc2_].name;
               _loc3_.url = _loc1_.data[_loc2_].url;
               _loc3_.image = _loc1_.data[_loc2_].image;
               _loc3_.orderNumber = _loc2_ + 1;
               _loc3_.update({"id":_loc1_.data[_loc2_].id});
               _loc2_++;
            }
         }
         catch(e:Error)
         {
         }
         try
         {
            this.db.query("ALTER TABLE btc_user ADD app_language TEXT");
            this.db.query("ALTER TABLE btc_user ADD os_language TEXT");
         }
         catch(e:Error)
         {
         }
      }
      
      public function updateLivesetOrder(param1:LibraryDataSet) : void
      {
         var _loc2_:LiveSetDataModel = param1.liveSetData.getModel();
         if(_loc2_)
         {
            _loc2_.update({"id":param1.liveSetData.id});
         }
      }
      
      public function insert(param1:LibraryDataSet) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:Vector.<String> = null;
         var _loc7_:Array = null;
         var _loc8_:Boolean = false;
         var _loc9_:PatchDataModel = null;
         var _loc10_:PatchDataModel = null;
         var _loc4_:Object = this.findOne(param1.liveSetData.id);
         var _loc5_:LiveSetDataModel = param1.liveSetData.getModel();
         this.db.begin();
         if(_loc4_)
         {
            _loc5_.update({"id":_loc5_.id});
            _loc6_ = new Vector.<String>();
            _loc7_ = _loc4_.patchList;
            if(_loc7_)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc7_.length)
               {
                  _loc8_ = false;
                  _loc3_ = 0;
                  while(_loc3_ < param1.patchList.length)
                  {
                     if(_loc7_[_loc2_].id == param1.patchList[_loc3_].id)
                     {
                        _loc8_ = true;
                        break;
                     }
                     _loc3_++;
                  }
                  if(!_loc8_)
                  {
                     _loc6_.push(_loc7_[_loc2_].id);
                  }
                  _loc2_++;
               }
               if(_loc6_.length > 0)
               {
                  _loc9_ = new PatchDataModel();
                  _loc2_ = 0;
                  while(_loc2_ < _loc6_.length)
                  {
                     _loc9_.del({"id":_loc6_[_loc2_]});
                     _loc2_++;
                  }
               }
            }
         }
         else
         {
            _loc5_.insert();
         }
         _loc2_ = 0;
         while(_loc2_ < param1.patchList.length)
         {
            _loc10_ = param1.patchList[_loc2_].getModel();
            if(this.checkPatchDataSaved(_loc10_,_loc4_))
            {
               _loc10_.update({"id":_loc10_.id});
            }
            else
            {
               _loc10_.insert();
            }
            _loc2_++;
         }
         this.db.commit();
      }
      
      public function updateLiveset(param1:LibraryDataSet) : void
      {
         var _loc2_:Object = this.findOne(param1.liveSetData.id);
         var _loc3_:LiveSetDataModel = param1.liveSetData.getModel();
         this.db.begin();
         if(_loc2_)
         {
            _loc3_.update({"id":_loc3_.id});
         }
      }
      
      private function checkPatchDataSaved(param1:PatchDataModel, param2:Object) : Boolean
      {
         if(!param2)
         {
            return false;
         }
         var _loc3_:Array = param2.patchList;
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].id == param1.id)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      private function checkLiveSetDataSaved(param1:LiveSetDataModel, param2:Array) : Boolean
      {
         if(!param2)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            if(param2[_loc3_].id == param1.id)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function find() : Array
      {
         var _loc1_:LiveSetDataModel = new LiveSetDataModel();
         return _loc1_.find(null,"orderNumber");
      }
      
      public function findOne(param1:String) : Object
      {
         var _loc2_:LiveSetDataModel = new LiveSetDataModel();
         return _loc2_.findone({"id":param1});
      }
   }
}

