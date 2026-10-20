package tonecentral.parametors
{
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ChainParams
   {
      
      private static var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      public var position1:int;
      
      public var position2:int;
      
      public var position3:int;
      
      public var position4:int;
      
      public var position5:int;
      
      public var position6:int;
      
      public var position7:int;
      
      public var position8:int;
      
      public var position9:int;
      
      public var position10:int;
      
      public var position11:int;
      
      public var position12:int;
      
      public var position13:int;
      
      public var position14:int;
      
      public var position15:int;
      
      public var position16:int;
      
      public var position17:int;
      
      public var position18:int;
      
      public var position19:int;
      
      public var position20:int;
      
      public function ChainParams()
      {
         super();
      }
      
      public static function getEffectName(param1:int) : Object
      {
         switch(param1)
         {
            case 0:
               return {
                  "label":"CMP",
                  "name":ParameterDefinitionGT.EFECT_NAME[0]
               };
            case 1:
               return {
                  "label":"S/R",
                  "name":ParameterDefinitionGT.EFECT_NAME[14]
               };
            case 2:
               return {
                  "label":"PrA",
                  "name":ParameterDefinitionGT.EFECT_NAME[2]
               };
            case 3:
               return {
                  "label":"PrB",
                  "name":ParameterDefinitionGT.EFECT_NAME[3]
               };
            case 4:
               return {
                  "label":"EQ",
                  "name":ParameterDefinitionGT.EFECT_NAME[4]
               };
            case 5:
               return {
                  "label":"FX1",
                  "name":ParameterDefinitionGT.EFECT_NAME[5]
               };
            case 6:
               return {
                  "label":"FX2",
                  "name":ParameterDefinitionGT.EFECT_NAME[6]
               };
            case 7:
               return {
                  "label":"DLY",
                  "name":ParameterDefinitionGT.EFECT_NAME[7]
               };
            case 8:
               return {
                  "label":"CHO",
                  "name":ParameterDefinitionGT.EFECT_NAME[8]
               };
            case 9:
               return {
                  "label":"REV",
                  "name":ParameterDefinitionGT.EFECT_NAME[9]
               };
            case 10:
               return {
                  "label":"ACC",
                  "name":ParameterDefinitionGT.EFECT_NAME[17]
               };
            case 11:
               return {
                  "label":"PDL",
                  "name":ParameterDefinitionGT.EFECT_NAME[10]
               };
            case 12:
               return {
                  "label":"FV",
                  "name":ParameterDefinitionGT.EFECT_NAME[11]
               };
            case 13:
               return {
                  "label":"NS1",
                  "name":ParameterDefinitionGT.EFECT_NAME[15]
               };
            case 14:
               return {
                  "label":"NS2",
                  "name":ParameterDefinitionGT.EFECT_NAME[16]
               };
            case 15:
               return {
                  "label":"OD",
                  "name":ParameterDefinitionGT.EFECT_NAME[1]
               };
            case 16:
               return {
                  "label":"USB",
                  "name":""
               };
            case 17:
               return {
                  "label":"DIV",
                  "name":ParameterDefinitionGT.EFECT_NAME[12]
               };
            case 18:
               return {
                  "label":"MXDV",
                  "name":""
               };
            case 19:
               return {
                  "label":"MIX",
                  "name":ParameterDefinitionGT.EFECT_NAME[13]
               };
            case 20:
               return {
                  "label":"MST",
                  "name":ParameterDefinitionGT.EFECT_NAME[18]
               };
            default:
               return {
                  "label":"",
                  "name":""
               };
         }
      }
      
      public static function isEditable(param1:int) : Boolean
      {
         if(16 != param1 && 18 != param1)
         {
            if(1 == param1)
            {
               return false;
            }
            return true;
         }
         return false;
      }
      
      public function get positionList() : Array
      {
         return [this.position1,this.position2,this.position3,this.position4,this.position5,this.position6,this.position7,this.position8,this.position9,this.position10,this.position11,this.position12,this.position13,this.position14,this.position15,this.position16,this.position17,this.position18,this.position19,this.position20];
      }
   }
}

