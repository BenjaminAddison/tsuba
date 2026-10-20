package tonecentral.common.storage.model
{
   import jp.cre8system.framework.airrecord.model.ARAssociation;
   import jp.cre8system.framework.airrecord.model.ARModel;
   
   public class LiveSetDataModel extends ARModel
   {
      
      public var id:String;
      
      public var name:String;
      
      public var url:String;
      
      public var image:String;
      
      public var flag:int = 1;
      
      public var orderNumber:int = 0;
      
      public function LiveSetDataModel()
      {
         super();
         this.__table = "livesets";
         this.__hasMany = {"patchList":new ARAssociation("PatchDataModel","liveSetId",null,"orderNumber ASC")};
      }
   }
}

