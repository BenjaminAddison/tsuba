package jp.cre8system.framework.airrecord.db
{
   import flash.data.SQLConnection;
   import flash.data.SQLResult;
   import flash.data.SQLStatement;
   import flash.filesystem.File;
   
   public class ARSQLite implements ARDriver
   {
      
      private static const DBFILE_EXT:String = ".db";
      
      private static const DEFAULT_DBPATH:String = "app-storage:/";
      
      private var sqlStatement:SQLStatement;
      
      public function ARSQLite()
      {
         super();
      }
      
      public function getFindQuery(param1:String, param2:* = null, param3:String = "", param4:String = "", param5:String = "") : String
      {
         if(param2)
         {
            param1 = param1 + " WHERE " + this.parseCondition(param2);
         }
         if(param5)
         {
            param1 = param1 + " GROUP BY " + param5;
         }
         if(param3)
         {
            param1 = param1 + " ORDER BY " + param3;
         }
         if(param4)
         {
            param1 = param1 + " LIMIT " + param4;
         }
         return param1;
      }
      
      public function escape(param1:String) : String
      {
         var _loc2_:String = param1;
         var _loc3_:RegExp = /'/g;
         return _loc2_.replace(_loc3_,"\'\'");
      }
      
      public function rollback(param1:SQLConnection) : void
      {
         param1.rollback();
      }
      
      public function begin(param1:SQLConnection) : void
      {
         param1.begin();
      }
      
      public function parseCondition(param1:*, param2:String = "") : String
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(param1 == null)
         {
            return "";
         }
         if(param1 is String)
         {
            return param1;
         }
         var _loc3_:Array = [];
         var _loc4_:Object = param1 as Object;
         for(_loc5_ in _loc4_)
         {
            _loc3_.push(this.createCondition(_loc5_,_loc4_[_loc5_]));
         }
         _loc6_ = _loc3_.join(" AND ");
         if(_loc6_)
         {
            _loc6_ = param2 + _loc6_;
         }
         return _loc6_;
      }
      
      public function connect(param1:ARDatabaseConfig, param2:Boolean = false) : SQLConnection
      {
         var _loc3_:String = param1.path;
         if(!_loc3_)
         {
            _loc3_ = DEFAULT_DBPATH;
         }
         var _loc4_:File = new File(_loc3_ + param1.db + DBFILE_EXT);
         if(param2 && Boolean(_loc4_.exists))
         {
            _loc4_.deleteFile();
         }
         var _loc5_:SQLConnection = new SQLConnection();
         _loc5_.open(_loc4_);
         return _loc5_;
      }
      
      public function query(param1:SQLConnection, param2:String) : SQLResult
      {
         if(sqlStatement == null || sqlStatement.sqlConnection !== param1)
         {
            sqlStatement = new SQLStatement();
            sqlStatement.sqlConnection = param1;
         }
         sqlStatement.text = param2;
         sqlStatement.execute();
         return sqlStatement.getResult();
      }
      
      public function value(param1:*) : String
      {
         if(param1 == null || param1 is Number && isNaN(param1))
         {
            return "NULL";
         }
         param1 = this.escape(param1);
         return "\'" + param1 + "\'";
      }
      
      public function field(param1:String) : String
      {
         return param1;
      }
      
      public function commit(param1:SQLConnection) : void
      {
         param1.commit();
      }
      
      public function createCondition(param1:String, param2:*) : String
      {
         return this.field(param1) + "=" + this.value(param2);
      }
   }
}

