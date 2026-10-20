package tonecentral.common.util
{
   import com.hurlant.util.Hex;
   import flash.desktop.NativeApplication;
   import spark.components.Label;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ToneCentralUtil
   {
      
      public function ToneCentralUtil()
      {
         super();
      }
      
      public static function sendPatchName(param1:String) : void
      {
         var _loc6_:int = 0;
         var _loc2_:ToneCentralMediator = ToneCentralMediator.getInstance();
         var _loc3_:AddressMap = AddressMap.getInstance();
         var _loc4_:String = ToneCentralUtil.convertAsciiToHex(param1);
         var _loc5_:Array = _loc4_.split(",");
         _loc6_ = int(_loc5_.length);
         while(_loc6_ < 16)
         {
            _loc5_[_loc6_] = "20";
            _loc6_++;
         }
         _loc4_ = _loc5_.join(",");
         _loc2_.sysex.setDataFunc(_loc3_.addressObj.temporary[0].address,_loc4_);
      }
      
      public static function zeroPadding(param1:String, param2:int = 0) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public static function convertDecimal(param1:String) : String
      {
         var _loc2_:String = null;
         return parseInt(param1,16).toString(10);
      }
      
      public static function convertHexaDecimal(param1:String, param2:int = 0) : String
      {
         var _loc3_:String = null;
         _loc3_ = parseInt(param1,10).toString(16);
         _loc3_ = zeroPadding(_loc3_,param2);
         return _loc3_.toUpperCase();
      }
      
      public static function convertDecimalArray(param1:Array) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            _loc2_.push(convertDecimal(_loc3_));
         }
         return _loc2_;
      }
      
      public static function convertHexaDecimalDoubleDigit(param1:int) : String
      {
         var _loc2_:Number = Math.floor(param1 / 128);
         var _loc3_:Number = param1 % 128;
         return ToneCentralUtil.convertHexaDecimalArray([_loc2_,_loc3_],2).join(",");
      }
      
      public static function convertHexaDecimalArray(param1:Array, param2:int = 0) : Array
      {
         var _loc4_:String = null;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1)
         {
            _loc3_.push(convertHexaDecimal(_loc4_,param2));
         }
         return _loc3_;
      }
      
      public static function convertHexToAscii(param1:Array) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = "";
         for each(_loc3_ in param1)
         {
            _loc2_ += Hex.toString(_loc3_);
         }
         return _loc2_;
      }
      
      public static function convertAsciiToHex(param1:String) : String
      {
         var _loc6_:String = null;
         var _loc2_:Array = [];
         var _loc3_:String = "";
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.charAt(_loc5_);
            _loc2_.push(Hex.fromString(_loc6_));
            _loc5_++;
         }
         if(_loc2_.length > 0)
         {
            _loc3_ = _loc2_.join(",");
         }
         return _loc3_.toUpperCase();
      }
      
      public static function timeFormat(param1:Number = 0) : String
      {
         if(param1 < 0)
         {
            return "00:00";
         }
         var _loc2_:* = Math.floor(param1 % 3600 / 60);
         var _loc3_:* = Math.floor(param1 % 60);
         if(_loc2_ < 10)
         {
            _loc2_ = "0" + _loc2_;
         }
         if(_loc3_ < 10)
         {
            _loc3_ = "0" + _loc3_;
         }
         return _loc2_ + ":" + _loc3_;
      }
      
      public static function incrementAddress(param1:String, param2:int) : String
      {
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(convertDecimal(_loc3_[3])) + param2;
         _loc3_[3] = convertHexaDecimal(String(_loc4_),2);
         return _loc3_.join(",");
      }
      
      public static function getThisVersion() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::versionNumber;
      }
      
      public static function getThisVersionLabel() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::versionLabel;
      }
      
      public static function setToolTipData(param1:Label) : void
      {
         param1.validateDisplayList();
         if(param1.isTruncated)
         {
            param1.toolTip = param1.text;
         }
         else
         {
            param1.toolTip = null;
         }
      }
   }
}

