package jp.cre8system.framework.airrecord.model
{
   public class ARAssociation
   {
      
      public var className:String;
      
      public var joinTable:String;
      
      public var foreignKey:String;
      
      public var associationForeignKey:String;
      
      public var order:String;
      
      public var recursiveLast:Boolean;
      
      public var conditions:*;
      
      public var limit:String;
      
      public function ARAssociation(param1:String = null, param2:String = null, param3:String = null, param4:String = null, param5:String = null, param6:String = null, param7:String = null, param8:Boolean = false)
      {
         super();
         this.className = param1;
         this.foreignKey = param2;
         this.conditions = param3;
         this.order = param4;
         this.limit = param5;
         this.joinTable = param6;
         this.associationForeignKey = param7;
         this.recursiveLast = param8;
      }
   }
}

