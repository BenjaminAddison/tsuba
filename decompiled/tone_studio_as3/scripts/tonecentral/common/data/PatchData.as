package tonecentral.common.data
{
   import mx.utils.ObjectUtil;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.storage.model.PatchDataModel;
   import tonecentral.common.util.DataUtil;
   import tonecentral.parametors.TemporaryParams;
   
   public class PatchData
   {
      
      public var id:String;
      
      public var liveSetId:String;
      
      private var _name:String;
      
      public var note:String;
      
      public var params:TemporaryParams;
      
      public var orderNumber:int;
      
      public var patchNo:String;
      
      public var patchID:String;
      
      public var logPatchName:String;
      
      public var tcPatch:Boolean = false;
      
      public function PatchData()
      {
         super();
         this.id = DataUtil.getDataID();
      }
      
      public static function restore(param1:Object) : PatchData
      {
         var _loc2_:PatchData = new PatchData();
         _loc2_.id = param1.id;
         _loc2_.liveSetId = param1.liveSetId;
         _loc2_.patchNo = param1.patchNo;
         if(param1.params is String)
         {
            _loc2_.params = TemporaryParams.restore(JSON.parse(param1.params));
         }
         else
         {
            _loc2_.params = TemporaryParams.restore(ObjectUtil.copy(param1.params));
         }
         _loc2_.name = param1.name;
         _loc2_.note = param1.note;
         _loc2_.orderNumber = param1.orderNumber;
         _loc2_.logPatchName = param1.logPatchName;
         _loc2_.tcPatch = param1.tcPatch == "1" ? true : false;
         return _loc2_;
      }
      
      public function setNewID() : void
      {
         this.id = DataUtil.getDataID();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1.replace(" | ","");
         if(this.params)
         {
            this.setPatchParamName();
         }
      }
      
      public function setPatchParamName() : void
      {
         this.params.patchname = this._name;
      }
      
      public function get category() : String
      {
         if(this.params)
         {
            return ParameterDefinitionGT.PATCH_CATEGORY[this.params.patch_category];
         }
         return "";
      }
      
      public function set category(param1:String) : void
      {
      }
      
      public function setCategoryIndex(param1:int) : void
      {
         this.params.patch_category = param1;
      }
      
      public function clone() : PatchData
      {
         var _loc1_:PatchData = new PatchData();
         _loc1_.id = DataUtil.getDataID();
         _loc1_.name = this.name;
         _loc1_.note = this.note;
         _loc1_.logPatchName = this.logPatchName;
         _loc1_.tcPatch = this.tcPatch;
         if(this.params)
         {
            _loc1_.params = this.params.clone();
            this.setPatchParamName();
         }
         return _loc1_;
      }
      
      public function getModel() : PatchDataModel
      {
         var _loc1_:PatchDataModel = new PatchDataModel();
         _loc1_.id = this.id;
         _loc1_.liveSetId = this.liveSetId;
         var _loc2_:String = JSON.stringify(this.params);
         _loc2_ = _loc2_.replace(" | ","");
         _loc1_.params = _loc2_;
         _loc1_.name = this.name;
         _loc1_.note = this.note;
         _loc1_.orderNumber = this.orderNumber;
         _loc1_.logPatchName = this.logPatchName;
         _loc1_.tcPatch = this.tcPatch ? 1 : 0;
         return _loc1_;
      }
   }
}

