package tonecentral.systemexclusive
{
   import mx.collections.ArrayCollection;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.MidiParams;
   import tonecentral.parametors.QuickSettingParams;
   import tonecentral.parametors.SystemParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class SysExParams
   {
      
      private var _id:XML;
      
      public var deviceID:String;
      
      public var idCheck:Boolean;
      
      public var editorComunicationLevel:String;
      
      public var editorComunicationMode:String;
      
      public var currentPatchNo:String;
      
      public var system:SystemParams = new SystemParams();
      
      public var midiParams:MidiParams = new MidiParams();
      
      public var patchlistParams:ArrayCollection = new ArrayCollection();
      
      public var temporaryParams:TemporaryParams = new TemporaryParams();
      
      public var quickSettingParams:Vector.<QuickSettingParams> = new Vector.<QuickSettingParams>();
      
      public var value:String;
      
      public var me80data:String;
      
      public function SysExParams()
      {
         super();
      }
      
      private function checkID() : void
      {
         var _loc1_:AddressMap = AddressMap.getInstance();
         var _loc2_:int = this.id.children().length();
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ += this._id.data[_loc4_];
            _loc4_++;
         }
         var _loc5_:String = "F07E" + ToneCentralUtil.convertHexaDecimal(this.deviceID,2) + "06024133030000";
         if(_loc3_.search(_loc5_) == 0 && this._id.data[_loc2_ - 1] == "F7")
         {
            switch(_loc3_.charAt(21))
            {
               case "0":
               case "1":
               case "2":
               case "3":
               case "4":
                  this.idCheck = true;
                  break;
               case "5":
               case "6":
               case "7":
               default:
                  this.idCheck = false;
            }
         }
         else
         {
            this.idCheck = false;
         }
         ToneCentralMediator.getInstance().ampModel = parseInt(_loc3_.charAt(21));
      }
      
      public function get id() : XML
      {
         return this._id;
      }
      
      public function set id(param1:XML) : void
      {
         this._id = param1;
         this.checkID();
      }
   }
}

