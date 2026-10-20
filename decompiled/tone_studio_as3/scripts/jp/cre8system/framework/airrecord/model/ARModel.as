package jp.cre8system.framework.airrecord.model
{
   import flash.data.SQLResult;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import jp.cre8system.framework.airrecord.db.ARDatabase;
   import mx.collections.ArrayCollection;
   
   public class ARModel
   {
      
      protected var __hasMany:Object = null;
      
      protected var __dbName:String = "";
      
      protected var __hasOne:Object = null;
      
      protected var __belongsTo:Object = null;
      
      protected var __recursive:int = 1;
      
      protected var __primaryKey:String = "id";
      
      protected var __db:ARDatabase = ARDatabase.instance;
      
      protected var __table:String = "";
      
      protected var __hasAndBelongsToMany:Object = null;
      
      protected var __displayField:String = "name";
      
      public function ARModel()
      {
         super();
      }
      
      public function generateList(param1:* = null, param2:String = "", param3:String = "") : Array
      {
         var _loc7_:* = undefined;
         var _loc4_:Array = this.find(param1,param2,param3);
         if(!_loc4_)
         {
            return null;
         }
         var _loc5_:Array = [];
         var _loc6_:ArrayCollection = new ArrayCollection(_loc4_);
         for each(_loc7_ in _loc6_)
         {
            _loc5_.push(_loc7_[this.__displayField]);
         }
         return _loc5_;
      }
      
      private function _addConndition(param1:*, param2:*) : *
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         if(param1 is Object)
         {
            for(_loc3_ in param2)
            {
               param1[_loc3_] = param2[_loc3_];
            }
            return param1;
         }
         if(!param1)
         {
            return param2;
         }
         _loc4_ = [];
         for(_loc3_ in param2)
         {
            _loc4_.push(_loc3_ + " = \'" + param2[_loc3_] + "\'");
         }
         return "(" + param1 + ") and (" + _loc4_.join(" and") + ")";
      }
      
      public function query(param1:String) : SQLResult
      {
         return this.__db.query(param1,this.__dbName);
      }
      
      public function del(param1:* = null) : SQLResult
      {
         return this.__db.del(this.__table,param1,this.__dbName);
      }
      
      public function findone(param1:* = null, param2:String = "") : Object
      {
         var _loc3_:Array = this.find(param1,param2,"1");
         if(!_loc3_)
         {
            return null;
         }
         return _loc3_[0];
      }
      
      private function _createModel(param1:String, param2:Boolean = false) : ARModel
      {
         var _loc3_:String = this._getThisPackageName();
         var _loc4_:Class = getDefinitionByName(_loc3_ + "." + param1) as Class;
         var _loc5_:Object = new _loc4_();
         _loc5_.__db = this.__db;
         if(param2)
         {
            _loc5_.__recursive = 0;
         }
         else
         {
            _loc5_.__recursive = this.__recursive - 1;
         }
         return _loc5_ as ARModel;
      }
      
      public function update(param1:* = null, param2:Object = null) : SQLResult
      {
         if(param2 == null)
         {
            param2 = createDynamicObject();
         }
         return this.__db.update(this.__table,param2,param1,this.__dbName);
      }
      
      public function insert(param1:Object = null) : SQLResult
      {
         if(param1 == null)
         {
            param1 = createDynamicObject();
         }
         return this.__db.insert(this.__table,param1,this.__dbName);
      }
      
      public function cleanDynamicObject(param1:Object) : Object
      {
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Object = {};
         var _loc3_:XML = describeType(this);
         for each(_loc4_ in _loc3_.variable)
         {
            _loc5_ = String(_loc4_.@name);
            _loc6_ = String(_loc4_.@type);
            if(_loc5_ in param1)
            {
               _loc2_[_loc5_] = param1[_loc5_];
            }
         }
         return _loc2_;
      }
      
      public function findQuery(param1:String, param2:* = null, param3:String = "", param4:String = "", param5:String = "") : Array
      {
         var _loc6_:SQLResult = this.__db.findQuery(param1,param2,param3,param4,param5,this.__dbName);
         return _loc6_.data;
      }
      
      private function _addHasMany(param1:Array) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         var _loc5_:ARAssociation = null;
         var _loc6_:ARModel = null;
         var _loc7_:Object = null;
         var _loc8_:* = undefined;
         if(!this.__hasMany)
         {
            return;
         }
         var _loc2_:ArrayCollection = new ArrayCollection(param1);
         for each(_loc3_ in _loc2_)
         {
            for(_loc4_ in this.__hasMany)
            {
               _loc5_ = this.__hasMany[_loc4_] as ARAssociation;
               if(!_loc5_.className)
               {
                  _loc5_.className = _loc4_;
               }
               if(!_loc5_.foreignKey)
               {
                  _loc5_.foreignKey = this._getThisClassName().toLocaleLowerCase() + "_id";
               }
               _loc6_ = this._createModel(_loc5_.className,_loc5_.recursiveLast);
               _loc7_ = {};
               _loc7_[_loc5_.foreignKey] = _loc3_[_loc6_.__primaryKey];
               _loc8_ = this._addConndition(_loc5_.conditions,_loc7_);
               _loc3_[_loc4_] = _loc6_.find(_loc8_,_loc5_.order,_loc5_.limit);
            }
         }
      }
      
      public function createDynamicObject() : Object
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc1_:Object = {};
         var _loc2_:XML = describeType(this);
         for each(_loc3_ in _loc2_.variable)
         {
            _loc4_ = String(_loc3_.@name);
            _loc5_ = String(_loc3_.@type);
            _loc1_[_loc4_] = this[_loc4_];
         }
         return _loc1_;
      }
      
      private function _getThisPackageName() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         var _loc2_:Array = _loc1_.split("::");
         return _loc2_[0];
      }
      
      private function _getThisClassName() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         var _loc2_:Array = _loc1_.split("::");
         return _loc2_[1];
      }
      
      private function _addHasAndBelongsToMany(param1:Array) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         var _loc5_:ARAssociation = null;
         var _loc6_:ARModel = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         if(!this.__hasAndBelongsToMany)
         {
            return;
         }
         var _loc2_:ArrayCollection = new ArrayCollection(param1);
         for each(_loc3_ in _loc2_)
         {
            for(_loc4_ in this.__hasAndBelongsToMany)
            {
               _loc5_ = this.__hasAndBelongsToMany[_loc4_] as ARAssociation;
               if(!_loc5_.className)
               {
                  _loc5_.className = _loc4_;
               }
               if(!_loc5_.joinTable)
               {
                  _loc5_.joinTable = this._getThisClassName().toLocaleLowerCase() + "_" + _loc5_.className.toLocaleLowerCase();
               }
               if(!_loc5_.foreignKey)
               {
                  _loc5_.foreignKey = this._getThisClassName().toLocaleLowerCase() + "_id";
               }
               if(!_loc5_.associationForeignKey)
               {
                  _loc5_.associationForeignKey = _loc5_.className.toLocaleLowerCase() + "_id";
               }
               _loc6_ = this._createModel(_loc5_.className,_loc5_.recursiveLast);
               _loc7_ = "(select " + _loc5_.associationForeignKey + " from " + _loc5_.joinTable + " where " + _loc5_.foreignKey + " = \'" + _loc3_[this.__primaryKey] + "\')";
               _loc8_ = "select * from " + _loc6_.__table;
               _loc9_ = [];
               _loc10_ = "";
               if(_loc5_.conditions is Object)
               {
                  for(_loc11_ in _loc5_.conditions)
                  {
                     _loc9_.push(_loc11_ + " = \'" + _loc5_.conditions[_loc11_] + "\'");
                  }
                  _loc10_ = _loc9_.join(" and ");
               }
               if(_loc10_ == "")
               {
                  _loc10_ = _loc6_.__primaryKey + " in " + _loc7_;
               }
               else
               {
                  _loc10_ = "(" + _loc10_ + ") and " + _loc6_.__primaryKey + " in " + _loc7_;
               }
               _loc3_[_loc4_] = _loc6_.findQuery(_loc8_,_loc10_,_loc5_.order,_loc5_.limit);
            }
         }
      }
      
      public function begin() : void
      {
         this.__db.begin(this.__dbName);
      }
      
      public function rollback() : void
      {
         this.__db.rollback(this.__dbName);
      }
      
      private function _addBelongsTo(param1:Array) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         var _loc5_:ARAssociation = null;
         var _loc6_:ARModel = null;
         var _loc7_:Object = null;
         var _loc8_:* = undefined;
         if(!this.__belongsTo)
         {
            return;
         }
         var _loc2_:ArrayCollection = new ArrayCollection(param1);
         for each(_loc3_ in _loc2_)
         {
            for(_loc4_ in this.__belongsTo)
            {
               _loc5_ = this.__belongsTo[_loc4_] as ARAssociation;
               if(!_loc5_.className)
               {
                  _loc5_.className = _loc4_;
               }
               if(!_loc5_.foreignKey)
               {
                  _loc5_.foreignKey = _loc5_.className.toLocaleLowerCase() + "_id";
               }
               _loc6_ = this._createModel(_loc5_.className,_loc5_.recursiveLast);
               _loc7_ = {};
               _loc7_[_loc6_.__primaryKey] = _loc3_[_loc5_.foreignKey];
               _loc8_ = this._addConndition(_loc5_.conditions,_loc7_);
               _loc3_[_loc4_] = _loc6_.findone(_loc8_,_loc5_.order);
            }
         }
      }
      
      private function _addHasOne(param1:Array) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         var _loc5_:ARAssociation = null;
         var _loc6_:ARModel = null;
         var _loc7_:Object = null;
         var _loc8_:* = undefined;
         if(!this.__hasOne)
         {
            return;
         }
         var _loc2_:ArrayCollection = new ArrayCollection(param1);
         for each(_loc3_ in _loc2_)
         {
            for(_loc4_ in this.__hasOne)
            {
               _loc5_ = this.__hasOne[_loc4_] as ARAssociation;
               if(!_loc5_.className)
               {
                  _loc5_.className = _loc4_;
               }
               if(!_loc5_.foreignKey)
               {
                  _loc5_.foreignKey = this._getThisClassName().toLocaleLowerCase() + "_id";
               }
               _loc6_ = this._createModel(_loc5_.className,_loc5_.recursiveLast);
               _loc7_ = {};
               _loc7_[_loc5_.foreignKey] = _loc3_[_loc6_.__primaryKey];
               _loc8_ = this._addConndition(_loc5_.conditions,_loc7_);
               _loc3_[_loc4_] = _loc6_.findone(_loc8_,_loc5_.order);
            }
         }
      }
      
      public function commit() : void
      {
         this.__db.commit(this.__dbName);
      }
      
      public function find(param1:* = null, param2:String = "", param3:String = "", param4:String = "") : Array
      {
         var _loc5_:SQLResult = this.__db.find(this.__table,param1,param2,param3,param4,this.__dbName);
         var _loc6_:Array = _loc5_.data;
         if(this.__recursive == 0)
         {
            return _loc6_;
         }
         this._addHasOne(_loc6_);
         this._addHasMany(_loc6_);
         this._addBelongsTo(_loc6_);
         this._addHasAndBelongsToMany(_loc6_);
         return _loc6_;
      }
   }
}

