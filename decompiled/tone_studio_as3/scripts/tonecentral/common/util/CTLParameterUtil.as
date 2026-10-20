package tonecentral.common.util
{
   import tonecentral.common.define.CTLAssignTargetDefinitionGT;
   import tonecentral.common.define.CTLDefinitionGT;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.SystemParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class CTLParameterUtil
   {
      
      private static var targetCategory:String;
      
      private static var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      public function CTLParameterUtil()
      {
         super();
      }
      
      public static function getFuncType(param1:String, param2:Boolean, param3:Boolean) : String
      {
         if(param2)
         {
            return getFuncTypeFromSystem(param1,param3);
         }
         return getFuncTypeFromTemp(param1,param3);
      }
      
      public static function getFuncTypeFromTemp(param1:String, param2:Boolean) : String
      {
         var _loc3_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc4_:SystemParams = mediator.sysex.params.system;
         var _loc5_:String = "";
         switch(param1)
         {
            case CTLDefinitionGT.ACCEL_CTL:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_1_FUNC,_loc3_.ctl_exp_accel_ctl_func);
               break;
            case CTLDefinitionGT.EXP:
               if(param2)
               {
                  _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_2_FUNC_SYSTEM,_loc3_.ctl_exp_exp_func);
               }
               else
               {
                  _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_2_FUNC_PATCH,_loc3_.ctl_exp_exp_func);
               }
               break;
            case CTLDefinitionGT.SUB_CTL1:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_4_FUNC,_loc3_.ctl_exp_sub_ctl1_func);
               break;
            case CTLDefinitionGT.SUB_CTL2:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_4_FUNC,_loc3_.ctl_exp_sub_ctl2_func);
               break;
            case CTLDefinitionGT.SUB_EXP:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_3_FUNC,_loc3_.ctl_exp_sub_exp_func);
               break;
            case CTLDefinitionGT.EXP_SW:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_4_FUNC,_loc3_.ctl_exp_exp_sw_func);
         }
         return _loc5_;
      }
      
      public static function getFuncTypeFromSystem(param1:String, param2:Boolean) : String
      {
         var _loc3_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc4_:SystemParams = mediator.sysex.params.system;
         var _loc5_:String = "";
         switch(param1)
         {
            case CTLDefinitionGT.ACCEL_CTL:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_1_FUNC,_loc4_.sys_accel_ctl_func);
               break;
            case CTLDefinitionGT.EXP:
               if(param2)
               {
                  _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_2_FUNC_SYSTEM,_loc4_.sys_exp_func);
               }
               else
               {
                  _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_2_FUNC_PATCH,_loc4_.sys_exp_func);
               }
               break;
            case CTLDefinitionGT.SUB_CTL1:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_4_FUNC,_loc4_.sys_sub_ctl1_func);
               break;
            case CTLDefinitionGT.SUB_CTL2:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_4_FUNC,_loc4_.sys_sub_ctl2_func);
               break;
            case CTLDefinitionGT.SUB_EXP:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_3_FUNC,_loc4_.sys_sub_exp_func);
               break;
            case CTLDefinitionGT.EXP_SW:
               _loc5_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.PRESET_PATTERN_4_FUNC,_loc4_.sys_exp_sw_func);
         }
         return _loc5_;
      }
      
      public static function getFuncTypeList(param1:String, param2:Boolean) : Array
      {
         var _loc3_:Array = [];
         switch(param1)
         {
            case CTLDefinitionGT.ACCEL_CTL:
               _loc3_ = CTLDefinitionGT.PRESET_PATTERN_1_FUNC;
               break;
            case CTLDefinitionGT.EXP:
               if(param2)
               {
                  _loc3_ = CTLDefinitionGT.PRESET_PATTERN_2_FUNC_SYSTEM;
               }
               else
               {
                  _loc3_ = CTLDefinitionGT.PRESET_PATTERN_2_FUNC_PATCH;
               }
               break;
            case CTLDefinitionGT.SUB_CTL1:
               _loc3_ = CTLDefinitionGT.PRESET_PATTERN_4_FUNC;
               break;
            case CTLDefinitionGT.SUB_CTL2:
               _loc3_ = CTLDefinitionGT.PRESET_PATTERN_4_FUNC;
               break;
            case CTLDefinitionGT.SUB_EXP:
               _loc3_ = CTLDefinitionGT.PRESET_PATTERN_3_FUNC;
               break;
            case CTLDefinitionGT.EXP_SW:
               _loc3_ = CTLDefinitionGT.PRESET_PATTERN_4_FUNC;
         }
         return _loc3_.filter(deviseFilter);
      }
      
      public static function getCTLDefine(param1:String) : Array
      {
         return CTLDefinitionGT.PRESET_PARAMS_LIST[param1];
      }
      
      public static function isSystem(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc3_:SystemParams = mediator.sysex.params.system;
         switch(param1)
         {
            case CTLDefinitionGT.ACCEL_CTL:
               _loc4_ = _loc3_.sys_preference_accel_ctl;
               break;
            case CTLDefinitionGT.EXP:
               _loc4_ = _loc3_.sys_preference_exp;
               break;
            case CTLDefinitionGT.SUB_CTL1:
               _loc4_ = _loc3_.sys_preference_sub_ctl1;
               break;
            case CTLDefinitionGT.SUB_CTL2:
               _loc4_ = _loc3_.sys_preference_sub_ctl2;
               break;
            case CTLDefinitionGT.SUB_EXP:
               _loc4_ = _loc3_.sys_preference_sub_exp;
               break;
            case CTLDefinitionGT.EXP_SW:
               _loc4_ = _loc3_.sys_preference_exp_sw;
         }
         return _loc4_ == 1;
      }
      
      public static function isChangeParamSystem(param1:String, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = (CTLDefinitionGT.PARAM_CHANGE_RANGE_SYSTEM[param1] as Array).indexOf(param2);
         return _loc3_ != -1;
      }
      
      public static function isChangeParamTemp(param1:String, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = (CTLDefinitionGT.PARAM_CHANGE_RANGE_TEMP[param1] as Array).indexOf(param2);
         return _loc3_ != -1;
      }
      
      public static function isChangeAssignParamTemp(param1:String, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = (CTLDefinitionGT.ASSIGN_PARAM_CHANGE_RANGE_TEMP[param1] as Array).indexOf(param2);
         return _loc3_ != -1;
      }
      
      public static function getAssignSw(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc3_:SystemParams = mediator.sysex.params.system;
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               _loc4_ = _loc2_.assign1_on_off;
               break;
            case CTLDefinitionGT.ASSIGN2:
               _loc4_ = _loc2_.assign2_on_off;
               break;
            case CTLDefinitionGT.ASSIGN3:
               _loc4_ = _loc2_.assign3_on_off;
               break;
            case CTLDefinitionGT.ASSIGN4:
               _loc4_ = _loc2_.assign4_on_off;
               break;
            case CTLDefinitionGT.ASSIGN5:
               _loc4_ = _loc2_.assign5_on_off;
               break;
            case CTLDefinitionGT.ASSIGN6:
               _loc4_ = _loc2_.assign6_on_off;
               break;
            case CTLDefinitionGT.ASSIGN7:
               _loc4_ = _loc2_.assign7_on_off;
               break;
            case CTLDefinitionGT.ASSIGN8:
               _loc4_ = _loc2_.assign8_on_off;
         }
         return _loc4_ == 1;
      }
      
      public static function getPedalFunc(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc3_:SystemParams = mediator.sysex.params.system;
         switch(param1)
         {
            case CTLDefinitionGT.EXP_PEDAL:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.CTL_PEDAL_FUNC_LIST,_loc2_.pedal_function_exp_pedal);
               break;
            case CTLDefinitionGT.GAFC_EXP1:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.CTL_PEDAL_FUNC_LIST,_loc2_.pedal_function_gafc_exp1);
               break;
            case CTLDefinitionGT.GAFC_EXP2:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.CTL_PEDAL_FUNC_LIST,_loc2_.pedal_function_gafc_exp2);
         }
         return _loc4_;
      }
      
      public static function getAssignSource(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc3_:SystemParams = mediator.sysex.params.system;
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign1_source);
               break;
            case CTLDefinitionGT.ASSIGN2:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign2_source);
               break;
            case CTLDefinitionGT.ASSIGN3:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign3_source);
               break;
            case CTLDefinitionGT.ASSIGN4:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign4_source);
               break;
            case CTLDefinitionGT.ASSIGN5:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign5_source);
               break;
            case CTLDefinitionGT.ASSIGN6:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign6_source);
               break;
            case CTLDefinitionGT.ASSIGN7:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign7_source);
               break;
            case CTLDefinitionGT.ASSIGN8:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLParameterUtil.getAssignSourceList(CTLDefinitionGT.ASSIGN_SOURCE_LIST),_loc2_.assign8_source);
         }
         return _loc4_;
      }
      
      public static function getAssignSourceMode(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc3_:SystemParams = mediator.sysex.params.system;
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign1_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN2:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign2_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN3:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign3_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN4:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign4_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN5:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign5_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN6:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign6_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN7:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign7_source_mode);
               break;
            case CTLDefinitionGT.ASSIGN8:
               _loc4_ = CTLParameterUtil.getNameFromValue(CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST,_loc2_.assign8_source_mode);
         }
         return _loc4_;
      }
      
      public static function getAssignTargetAllStringData(param1:String) : Object
      {
         var _loc4_:Object = null;
         var _loc2_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc3_:SystemParams = mediator.sysex.params.system;
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign1_target));
               break;
            case CTLDefinitionGT.ASSIGN2:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign2_target));
               break;
            case CTLDefinitionGT.ASSIGN3:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign3_target));
               break;
            case CTLDefinitionGT.ASSIGN4:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign4_target));
               break;
            case CTLDefinitionGT.ASSIGN5:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign5_target));
               break;
            case CTLDefinitionGT.ASSIGN6:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign6_target));
               break;
            case CTLDefinitionGT.ASSIGN7:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign7_target));
               break;
            case CTLDefinitionGT.ASSIGN8:
               _loc4_ = CTLParameterUtil.getObjectFromValue(CTLAssignTargetDefinitionGT.ASSIGN_TARGET_MASTER_LIST,ToneCentralUtil.convertHexaDecimalDoubleDigit(_loc2_.assign8_target));
         }
         return _loc4_;
      }
      
      public static function getTargetCategory(param1:String) : String
      {
         return param1.split(": ")[0];
      }
      
      public static function getTarget(param1:String) : String
      {
         return param1.split(": ")[1];
      }
      
      public static function getAssignSourceList(param1:Array) : Array
      {
         var _loc3_:Object = null;
         param1 = param1.filter(deviseFilter);
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            if(_loc3_.name == "SUB CTL1 PDL")
            {
               _loc3_.name = "CTL1 PDL";
            }
            else if(_loc3_.name == "SUB CTL2 PDL")
            {
               _loc3_.name = "CTL2 PDL";
            }
            else if(_loc3_.name == "SUB CTL1")
            {
               _loc3_.name = "CTL1";
            }
            else if(_loc3_.name == "SUB CTL2")
            {
               _loc3_.name = "CTL2";
            }
            else if(_loc3_.name == "SUB CTL1 OUT")
            {
               _loc3_.name = "C1 OUT";
            }
            else if(_loc3_.name == "SUB CTL2 OUT")
            {
               _loc3_.name = "C2 OUT";
            }
            _loc2_++;
         }
         return param1;
      }
      
      public static function getCtlName(param1:String) : String
      {
         if(param1 == CTLDefinitionGT.SUB_CTL1)
         {
            param1 = "CTL1";
         }
         else if(param1 == CTLDefinitionGT.SUB_CTL2)
         {
            param1 = "CTL2";
         }
         return param1;
      }
      
      public static function getPedalFuncList() : Array
      {
         return CTLDefinitionGT.CTL_PEDAL_FUNC_LIST;
      }
      
      private static function getFxParamFromId(param1:String, param2:String) : Object
      {
         var _loc3_:Array = null;
         var _loc5_:Object = null;
         switch(param1)
         {
            case "BOOSTER":
               _loc3_ = ParameterDefinitionGT.ODDS_PARAMS_LIST["DEFAULT"];
               break;
            case "DELAY/DELAY2":
               _loc3_ = ParameterDefinitionGT.DELAY_PARAMS_LIST["MODULATE"];
               break;
            case "REVERB":
               _loc3_ = ParameterDefinitionGT.REVERB_PARAMS_LIST["DEFAULT"];
               break;
            default:
               _loc3_ = ParameterDefinitionGT.FX1_PARAMS_LIST[param1];
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            if(_loc5_.id == param2)
            {
               return _loc5_;
            }
            _loc4_++;
         }
         return "";
      }
      
      public static function getCtlTargetParam(param1:String, param2:int) : Object
      {
         var _loc3_:Object = CTLDefinitionGT.CTL_TARGET_LIST[param1][param2];
         if(_loc3_.id == "PRESET")
         {
            return _loc3_;
         }
         return getFxParamFromId(param1,_loc3_.id);
      }
      
      public static function getAssignSourceModeList() : Array
      {
         return CTLDefinitionGT.ASSIGN_SOURCE_MODE_LIST;
      }
      
      public static function getAssignTargetCategoryList() : Array
      {
         return CTLAssignTargetDefinitionGT.ASSIGN_TARGET_CATEGORY_LIST.filter(deviseFilterForTargetCategory);
      }
      
      public static function deviseFilterForTargetCategory(param1:*, param2:int, param3:Array) : Boolean
      {
         return param1 != "SEND/RETURN" && param1 != "MANUAL" && param1 != "PHRASE LOOP" && param1 != "AMP CONTROL";
      }
      
      public static function getAssignTargetList(param1:String) : Array
      {
         targetCategory = param1;
         return CTLAssignTargetDefinitionGT.ASSIGN_TARGET_LIST[targetCategory].filter(deviseFilterForTarget);
      }
      
      public static function deviseFilterForTarget(param1:*, param2:int, param3:Array) : Boolean
      {
         if(targetCategory == "PATCH")
         {
            return param1 != "BANK INC" && param1 != "BANK DEC";
         }
         return true;
      }
      
      public static function getNameFromValue(param1:Array, param2:Object) : String
      {
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            if(_loc4_.val == param2)
            {
               return _loc4_.name;
            }
            _loc3_++;
         }
         return "";
      }
      
      public static function getObjectFromValue(param1:Array, param2:Object) : Object
      {
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            if(_loc4_.val == param2)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return "";
      }
      
      public static function getObjectFromName(param1:Array, param2:Object) : Object
      {
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            if(_loc4_.name == param2)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return "";
      }
      
      public static function getAssingParameName(param1:String, param2:String) : String
      {
         var _loc3_:String = null;
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign1_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign1_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign1_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign1_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign1_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign1_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign1_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign1_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign1_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN2:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign2_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign2_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign2_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign2_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign2_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign2_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign2_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign2_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign2_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN3:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign3_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign3_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign3_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign3_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign3_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign3_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign3_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign3_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign3_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN4:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign4_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign4_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign4_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign4_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign4_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign4_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign4_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign4_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign4_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN5:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign5_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign5_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign5_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign5_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign5_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign5_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign5_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign5_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign5_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN6:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign6_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign6_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign6_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign6_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign6_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign6_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign6_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign6_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign6_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN7:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign7_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign7_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign7_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign7_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign7_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign7_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign7_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign7_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign7_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN8:
               switch(param2)
               {
                  case "TARGET MIN":
                     _loc3_ = "assign8_target_min";
                     break;
                  case "TARGET MAX":
                     _loc3_ = "assign8_target_max";
                     break;
                  case "ACT RANGE LO":
                     _loc3_ = "assign8_act_range_lo";
                     break;
                  case "ACT RANGE HI":
                     _loc3_ = "assign8_act_range_hi";
                     break;
                  case "WAVE RATE":
                     _loc3_ = "assign8_wave_rate";
                     break;
                  case "WAVE-FORM":
                     _loc3_ = "assign8_waveform";
                     break;
                  case "INT PDL TRIGGER":
                     _loc3_ = "assign8_int_pdl_trigger";
                     break;
                  case "INT PDL TIME":
                     _loc3_ = "assign8_int_pdl_time";
                     break;
                  case "INT PDL CURVE":
                     _loc3_ = "assign8_int_pdl_curve";
               }
               break;
            case CTLDefinitionGT.ASSIGN_COMMON:
               switch(param2)
               {
                  case "INPUT SENS":
                     _loc3_ = "assign_common_input_sens";
               }
         }
         return _loc3_;
      }
      
      public static function getCTLParamName(param1:String, param2:String) : String
      {
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < CTLDefinitionGT.CTL_PARAMNAME_LIST[param1].length)
         {
            _loc4_ = CTLDefinitionGT.CTL_PARAMNAME_LIST[param1][_loc3_];
            if(_loc4_.effect == param2)
            {
               return _loc4_.param;
            }
            _loc3_++;
         }
         return "";
      }
      
      private static function getMainCtl(param1:String) : String
      {
         switch(param1)
         {
            default:
            case CTLDefinitionGT.KNOB:
               return param1;
            case CTLDefinitionGT.EXP_PEDAL:
            case CTLDefinitionGT.EXP_PEDAL_MIN:
            case CTLDefinitionGT.EXP_PEDAL_MAX:
               return CTLDefinitionGT.EXP_PEDAL;
            case CTLDefinitionGT.GAFC_EXP1:
            case CTLDefinitionGT.GAFC_EXP1_MIN:
            case CTLDefinitionGT.GAFC_EXP1_MAX:
               return CTLDefinitionGT.GAFC_EXP1;
            case CTLDefinitionGT.GAFC_EXP2:
            case CTLDefinitionGT.GAFC_EXP2_MIN:
            case CTLDefinitionGT.GAFC_EXP2_MAX:
               return CTLDefinitionGT.GAFC_EXP2;
         }
      }
      
      public static function getAssignParamName(param1:String, param2:String) : String
      {
         var _loc3_:String = getMainCtl(param1);
         return getCTLParamName(_loc3_,param2);
      }
      
      public static function deviseFilter(param1:*, param2:int, param3:Array) : Boolean
      {
         return param1.gt001 == true;
      }
      
      public static function assignDataProviderFilter(param1:Array, param2:String) : Array
      {
         if(param2 == "INT PDL TRIGGER" || param2 == "sys_knob_setting_knob1" || param2 == "sys_knob_setting_knob2" || param2 == "sys_knob_setting_knob3" || param2 == "sys_knob_setting_knob4" || param2 == "sys_knob_setting_knob5" || param2 == "sys_knob_setting_knob6" || param2 == "sys_knob_setting_knob7" || param2 == "sys_knob_setting_knob8")
         {
            param1 = param1.filter(deviseFilter);
         }
         return param1;
      }
      
      public static function isDropDownDataObject(param1:String) : Boolean
      {
         if(param1 == "INT PDL TRIGGER" || param1 == "COMP: TYPE" || param1 == "OD/DS: TYPE" || param1 == "OD/DS: CUSTOM TYPE" || param1 == "PREAMP A: TYPE" || param1 == "PREAMP A: CUSTOM TYPE" || param1 == "PREAMP B: TYPE" || param1 == "PREAMP B: CUSTOM TYPE" || param1 == "FX1: TYPE" || param1 == "FX1 OD/DS: TYPE" || param1 == "FX2: TYPE" || param1 == "FX2 OD/DS: TYPE" || param1 == "DELAY: TYPE" || param1 == "ACCEL: TYPE" || param1 == "PEDAL WAH: TYPE" || param1 == "ACCEL FEEDBACKER: MODE" || param1 == "sys_knob_setting_knob1" || param1 == "sys_knob_setting_knob2" || param1 == "sys_knob_setting_knob3" || param1 == "sys_knob_setting_knob4" || param1 == "sys_knob_setting_knob5" || param1 == "sys_knob_setting_knob6" || param1 == "sys_knob_setting_knob7" || param1 == "sys_knob_setting_knob8")
         {
            return true;
         }
         return false;
      }
   }
}

