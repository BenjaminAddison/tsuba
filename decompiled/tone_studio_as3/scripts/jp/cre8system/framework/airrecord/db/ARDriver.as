package jp.cre8system.framework.airrecord.db
{
   import flash.data.SQLConnection;
   import flash.data.SQLResult;
   
   public interface ARDriver
   {
      
      function escape(param1:String) : String;
      
      function rollback(param1:SQLConnection) : void;
      
      function parseCondition(param1:*, param2:String = "") : String;
      
      function begin(param1:SQLConnection) : void;
      
      function connect(param1:ARDatabaseConfig, param2:Boolean = false) : SQLConnection;
      
      function query(param1:SQLConnection, param2:String) : SQLResult;
      
      function value(param1:*) : String;
      
      function commit(param1:SQLConnection) : void;
      
      function getFindQuery(param1:String, param2:* = null, param3:String = "", param4:String = "", param5:String = "") : String;
      
      function field(param1:String) : String;
      
      function createCondition(param1:String, param2:*) : String;
   }
}

