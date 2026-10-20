package tonecentral.common.log.data
{
   public class UserData
   {
      
      public var guid:String;
      
      public var remote_addr:String;
      
      public var product:String;
      
      public var app_name:String;
      
      public var app_version:String;
      
      public var app_revision:String;
      
      public var app_language:String;
      
      public var os:String;
      
      public var os_language:String;
      
      public var resolution_x:String;
      
      public var resolution_y:String;
      
      public var runtime:String;
      
      public function UserData(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:String, param10:String, param11:String, param12:String)
      {
         super();
         this.guid = param1;
         this.remote_addr = param2;
         this.product = param3;
         this.app_name = param4;
         this.app_version = param5;
         this.app_revision = param6;
         this.app_language = param11;
         this.os = param7;
         this.os_language = param12;
         this.resolution_x = param8;
         this.resolution_y = param9;
         this.runtime = param10;
      }
      
      public function getInsertData() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.guid = this.guid;
         _loc1_.remote_addr = this.remote_addr;
         _loc1_.product = this.product;
         _loc1_.app_name = this.app_name;
         _loc1_.app_version = this.app_version;
         _loc1_.app_revision = this.app_revision;
         _loc1_.app_language = this.app_language;
         _loc1_.os = this.os;
         _loc1_.os_language = this.os_language;
         _loc1_.resolution_x = this.resolution_x;
         _loc1_.resolution_y = this.resolution_y;
         _loc1_.runtime = this.runtime;
         return _loc1_;
      }
   }
}

