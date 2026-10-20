package jp.cre8system.framework.airrecord.db
{
   import flash.data.SQLResult;
   import flash.utils.Dictionary;
   import jp.cre8system.framework.airrecord.error.ARError;
   
   public class ARDatabase
   {
      
      private static var _arDatabase:ARDatabase;
      
      private var _config:Dictionary;
      
      private var _driver:Dictionary;
      
      private var _connection:Dictionary;
      
      public function ARDatabase(param1:ARDatabaseInternal)
      {
         super();
         if(!param1)
         {
            throw new ARError(ARError.SINGLETON_INSTANCE_ERROR);
         }
         _config = new Dictionary();
         _connection = new Dictionary();
         _driver = new Dictionary();
      }
      
      public static function get instance() : ARDatabase
      {
         return ARDatabaseInternal.instance;
      }
      
      public function insert(param1:String, param2:Object, param3:String = "") : SQLResult
      {
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc4_:ARDriver = this._driver[param3];
         var _loc5_:String = "INSERT INTO " + param1 + "(";
         var _loc6_:Array = [];
         for(_loc7_ in param2)
         {
            _loc6_.push(_loc4_.field(_loc7_));
         }
         _loc5_ = _loc5_ + _loc6_.join(",") + ") VALUES(";
         _loc8_ = [];
         for(_loc7_ in param2)
         {
            _loc8_.push(_loc4_.value(param2[_loc7_]));
         }
         _loc5_ = _loc5_ + _loc8_.join(",") + ")";
         return this.query(_loc5_,param3);
      }
      
      public function rollback(param1:String = "") : void
      {
         var _loc2_:ARDatabaseConfig = this._config[param1];
         var _loc3_:ARDriver = this._driver[param1];
         return _loc3_.rollback(this._connection[param1]);
      }
      
      public function add(param1:String, param2:String, param3:String, param4:*, param5:String = "", param6:String = "") : void
      {
         var _loc7_:ARDatabaseConfig = new ARDatabaseConfig();
         _loc7_.user = param1;
         _loc7_.password = param2;
         _loc7_.db = param3;
         _loc7_.ddl = param4;
         _loc7_.path = param6;
         this._config[param5] = _loc7_;
      }
      
      public function update(param1:String, param2:Object, param3:* = null, param4:String = "") : SQLResult
      {
         var _loc8_:String = null;
         var _loc5_:ARDriver = this._driver[param4];
         var _loc6_:String = "UPDATE " + param1 + " SET ";
         var _loc7_:Array = [];
         for(_loc8_ in param2)
         {
            _loc7_.push(_loc5_.createCondition(_loc8_,param2[_loc8_]));
         }
         _loc6_ = _loc6_ + _loc7_.join(",") + _loc5_.parseCondition(param3," WHERE ");
         return this.query(_loc6_,param4);
      }
      
      public function connect(param1:String = "", param2:Boolean = false) : void
      {
         var _loc4_:ARDriver = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc3_:ARDatabaseConfig = this._config[param1];
         if(!this._driver[param1])
         {
            this._driver[param1] = new ARSQLite();
         }
         if(!this._connection[param1])
         {
            _loc4_ = this._driver[param1];
            this._connection[param1] = this._driver[param1].connect(_loc3_,param2);
            _loc5_ = [];
            if(_loc3_.ddl is String)
            {
               _loc5_.push(_loc3_.ddl);
            }
            else
            {
               _loc5_ = _loc3_.ddl as Array;
            }
            for each(_loc6_ in _loc5_)
            {
               _loc4_.query(this._connection[param1],_loc6_);
            }
         }
      }
      
      public function del(param1:String, param2:* = null, param3:String = "") : SQLResult
      {
         var _loc4_:ARDriver = this._driver[param3];
         var _loc5_:String = "DELETE FROM " + param1 + _loc4_.parseCondition(param2," WHERE ");
         return this.query(_loc5_,param3);
      }
      
      public function findQuery(param1:String, param2:* = null, param3:String = "", param4:String = "", param5:String = "", param6:String = "") : SQLResult
      {
         var _loc7_:ARDriver = this._driver[param6];
         param1 = _loc7_.getFindQuery(param1,param2,param3,param4,param5);
         return this.query(param1,param6);
      }
      
      public function begin(param1:String = "") : void
      {
         var _loc2_:ARDatabaseConfig = this._config[param1];
         var _loc3_:ARDriver = this._driver[param1];
         return _loc3_.begin(this._connection[param1]);
      }
      
      public function query(param1:String, param2:String = "") : SQLResult
      {
         var _loc3_:ARDatabaseConfig = this._config[param2];
         var _loc4_:ARDriver = this._driver[param2];
         return _loc4_.query(this._connection[param2],param1);
      }
      
      public function find(param1:String, param2:* = null, param3:String = "", param4:String = "", param5:String = "", param6:String = "") : SQLResult
      {
         var _loc7_:String = "SELECT * FROM " + param1;
         var _loc8_:ARDriver = this._driver[param6];
         _loc7_ = _loc8_.getFindQuery(_loc7_,param2,param3,param4,param5);
         return this.query(_loc7_,param6);
      }
      
      public function commit(param1:String = "") : void
      {
         var _loc2_:ARDatabaseConfig = this._config[param1];
         var _loc3_:ARDriver = this._driver[param1];
         return _loc3_.commit(this._connection[param1]);
      }
   }
}

import jp.cre8system.framework.airrecord.db.ARDatabase;

class ARDatabaseInternal
{
   
   public static var instance:ARDatabase = new ARDatabase(new ARDatabaseInternal());
   
   public function ARDatabaseInternal()
   {
      super();
   }
}
