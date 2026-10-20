package tonecentral.common.data
{
   import tonecentral.common.storage.model.LiveSetDataModel;
   import tonecentral.common.util.DataUtil;
   
   public class LiveSetData
   {
      
      public var id:String;
      
      public var name:String;
      
      public var url:String;
      
      public var path:String;
      
      public var image:String;
      
      public var orderNumber:int;
      
      public function LiveSetData()
      {
         super();
         this.id = DataUtil.getDataID();
      }
      
      public static function restore(param1:Object) : LiveSetData
      {
         var _loc2_:LiveSetData = new LiveSetData();
         _loc2_.id = param1.id;
         _loc2_.name = param1.name;
         _loc2_.url = param1.url;
         _loc2_.path = param1.path;
         _loc2_.image = param1.image;
         _loc2_.orderNumber = param1.orderNumber;
         return _loc2_;
      }
      
      public function clone() : LiveSetData
      {
         var _loc1_:LiveSetData = restore(this);
         _loc1_.id = DataUtil.getDataID();
         return _loc1_;
      }
      
      public function getModel() : LiveSetDataModel
      {
         var _loc1_:LiveSetDataModel = new LiveSetDataModel();
         _loc1_.id = this.id;
         _loc1_.name = this.name;
         _loc1_.url = this.url;
         _loc1_.image = this.image;
         _loc1_.orderNumber = this.orderNumber;
         return _loc1_;
      }
      
      public function setNewId() : void
      {
         this.id = DataUtil.getDataID();
      }
   }
}

