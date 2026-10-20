package tonecentral.common.storage.model
{
   import jp.cre8system.framework.airrecord.model.ARModel;
   
   public class PatchDataModel extends ARModel
   {
      
      public var id:String;
      
      public var liveSetId:String;
      
      public var name:String;
      
      public var gt100Name1:String;
      
      public var gt100Name2:String;
      
      public var note:String;
      
      public var params:String;
      
      public var orderNumber:int;
      
      public var logPatchName:String;
      
      public var tcPatch:int;
      
      public var flag:int = 1;
      
      public function PatchDataModel()
      {
         super();
         this.__table = "patches";
      }
   }
}

