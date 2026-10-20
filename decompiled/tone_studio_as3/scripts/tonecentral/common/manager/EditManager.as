package tonecentral.common.manager
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayList;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.QuickSettingDefinitionGT;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.EditorEvent;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.SystemParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class EditManager extends EventDispatcher
   {
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var systemMng:SystemManager;
      
      private var _effectCategory:String;
      
      private var _effectType:String;
      
      private var _effectTypeList:ArrayList;
      
      private var _effectTypeIndex:int;
      
      private var _effectTypeAddress:String;
      
      private var _parameterArray:Array;
      
      private var _subTypeList:ArrayList;
      
      private var _subTypeParamName:String;
      
      private var _subTypeAddress:String;
      
      private var _subTypeIndex:int;
      
      private var _effectSw:Boolean;
      
      private var _effectSwAddress:String;
      
      private var _quickSettingParamArray:Array;
      
      private var _patchQuickSettingParamArray:Array;
      
      private var _quickSettingPresetNum:int = 0;
      
      private var _subTypeVal:int;
      
      public function EditManager(param1:IEventDispatcher = null)
      {
         super(param1);
         this.init();
      }
      
      public function get quickSettingPresetNum() : int
      {
         return this._quickSettingPresetNum;
      }
      
      public function set effectSw(param1:Boolean) : void
      {
         var _loc2_:String = null;
         this._effectSw = param1;
         if(this._effectSw)
         {
            _loc2_ = ToneCentralUtil.convertHexaDecimal("1",2);
         }
         else
         {
            _loc2_ = ToneCentralUtil.convertHexaDecimal("0",2);
         }
         this.mediator.sysex.setDataFunc(this.effectSwAddress,_loc2_);
      }
      
      public function set subTypeIndex(param1:int) : void
      {
         this._subTypeIndex = param1;
         var _loc2_:String = ToneCentralUtil.convertHexaDecimal(this._subTypeList.getItemAt(this._subTypeIndex).val,2);
         this.mediator.sysex.setDataFunc(this._subTypeAddress,_loc2_);
      }
      
      public function set effectTypeIndex(param1:int) : void
      {
         this._effectTypeIndex = param1;
         var _loc2_:String = ToneCentralUtil.convertHexaDecimal(this._effectTypeList.getItemAt(this._effectTypeIndex).val,2);
         this.mediator.sysex.setDataFunc(this._effectTypeAddress,_loc2_);
      }
      
      public function get effectSwAddress() : String
      {
         return this._effectSwAddress;
      }
      
      public function get effectSw() : Boolean
      {
         return this._effectSw;
      }
      
      public function get subTypeIndex() : int
      {
         return this._subTypeIndex;
      }
      
      public function get subTypeAddress() : String
      {
         return this._subTypeAddress;
      }
      
      public function get subTypeParamName() : String
      {
         return this._subTypeParamName;
      }
      
      public function get subTypeList() : ArrayList
      {
         return this._subTypeList;
      }
      
      public function get parameterArray() : Array
      {
         return this._parameterArray;
      }
      
      public function get quickSettingParamArray() : Array
      {
         return this._quickSettingParamArray;
      }
      
      public function get patchQuickSettingParamArray() : Array
      {
         return this._patchQuickSettingParamArray;
      }
      
      public function get effectTypeAddress() : String
      {
         return this._effectTypeAddress;
      }
      
      public function get effectTypeIndex() : int
      {
         return this._effectTypeIndex;
      }
      
      public function get effectTypeList() : ArrayList
      {
         return this._effectTypeList;
      }
      
      private function init() : void
      {
         this._effectCategory = ParameterDefinitionGT.EFECT_NAME[1];
         this.mediator = ToneCentralMediator.getInstance();
         this.addressMap = AddressMap.getInstance();
         this.systemMng = SystemManager.getInstance();
         this.mediator.sysex.addUpdateTemporaryCallback(this.updateTemporaryParams);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.showTemporaryParams,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.systemMng.addEventListener(SystemEvent.SYSTEM1_CHANGE,this.systemParamUpdateHandler,false,0,true);
         this.systemMng.addEventListener(SystemEvent.SYSTEM2_CHANGE,this.systemParamUpdateHandler,false,0,true);
         this.systemMng.addEventListener(SystemEvent.SYSTEM3_CHANGE,this.systemParamUpdateHandler,false,0,true);
         this.systemMng.addEventListener(SystemEvent.PREFERENCE_CHANGE,this.preferenceChangeHandler,false,0,true);
         this.systemMng.addEventListener(SystemEvent.CTL_EXP_CHANGE,this.ctlExpChangeHandler,false,0,true);
      }
      
      private function systemParamUpdateHandler(param1:SystemEvent) : void
      {
         this.updateTemporaryParams(param1.data);
      }
      
      public function get effectType() : String
      {
         return this._effectType;
      }
      
      public function get effectCategory() : String
      {
         return this._effectCategory;
      }
      
      public function set effectCategory(param1:String) : void
      {
         this._effectCategory = param1;
         this.getEffectData();
         dispatchEvent(new ViewStatusEvent(ViewStatusEvent.VIEW_STATUS_CHANGE));
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.getEffectData();
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_CHANGED));
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.getEffectData();
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_CLEAR));
      }
      
      private function showTemporaryParams(param1:ToneCentralEvents) : void
      {
         this.getEffectData();
         dispatchEvent(new ViewStatusEvent(ViewStatusEvent.VIEW_STATUS_CHANGE));
      }
      
      private function preferenceChangeHandler(param1:SystemEvent) : void
      {
         this.getEffectData();
         dispatchEvent(new SystemEvent(SystemEvent.PREFERENCE_CHANGE));
      }
      
      private function ctlExpChangeHandler(param1:SystemEvent) : void
      {
         this.getEffectData();
         dispatchEvent(new SystemEvent(SystemEvent.CTL_EXP_CHANGE));
      }
      
      private function getEffectData() : void
      {
         this._effectType = ParameterUtil.getEffectType(this._effectCategory);
         this._effectTypeList = new ArrayList(ParameterUtil.getEffectList(this.effectCategory));
         this._effectTypeIndex = this.getEffectTypeIndex();
         this._effectTypeAddress = this.addressMap.getEffectTypeAddress(this.effectCategory);
         this._parameterArray = ParameterUtil.getEffectDefine(this.effectCategory,this.effectType);
         this._quickSettingParamArray = ParameterUtil.getQuickSettingDefine(this.effectCategory,this.effectType);
         this._patchQuickSettingParamArray = ParameterUtil.getPatchQuickSettingDefine(this.effectCategory,this.effectType);
         this._quickSettingPresetNum = this.getQuickSettingPresetNumber();
         this._subTypeList = new ArrayList(ParameterUtil.getSubType(this.effectCategory,this.effectType));
         this._effectSw = this.getSwOnOff();
         this._effectSwAddress = this.getEffectSwAddress();
         if(this._subTypeList.length > 0)
         {
            this._subTypeParamName = ParameterUtil.getSubTypeParamName(this.effectCategory,this.effectType);
            this._subTypeAddress = this.addressMap["temp_" + this.subTypeParamName].address;
            this._subTypeVal = this.mediator.sysex.params.temporaryParams[this.subTypeParamName];
            this._subTypeIndex = this.getSubTypeIndex();
         }
      }
      
      private function getEffectTypeIndex() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._effectTypeList.length)
         {
            if(this._effectTypeList.getItemAt(_loc1_).name == this.effectType)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return 0;
      }
      
      private function getSubTypeIndex() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._subTypeList.length)
         {
            if(this._subTypeList.getItemAt(_loc1_).val == this._subTypeVal)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return 0;
      }
      
      private function getSwOnOff() : Boolean
      {
         var _loc1_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[0])
         {
            return _loc1_.comp_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[1])
         {
            return _loc1_.od_ds_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[2])
         {
            return _loc1_.preamp_a_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[3])
         {
            return _loc1_.preamp_b_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[4])
         {
            return _loc1_.eq_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[5])
         {
            return _loc1_.fx1_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[6])
         {
            return _loc1_.fx2_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[7])
         {
            return _loc1_.delay_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[8])
         {
            return _loc1_.chorus_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[9])
         {
            return _loc1_.reverb_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[10])
         {
            return _loc1_.pedal_fx_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[11])
         {
            return true;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[12])
         {
            return true;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[13])
         {
            return true;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[14])
         {
            return _loc1_.send_return_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[15])
         {
            return _loc1_.ns1_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[16])
         {
            return _loc1_.ns2_on_off == 1;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[17])
         {
            return true;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[18])
         {
            return true;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[19])
         {
            return _loc1_.delay2_on_off == 1;
         }
         return false;
      }
      
      private function getEffectSwAddress() : String
      {
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[0])
         {
            return this.addressMap.temp_comp_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[1])
         {
            return this.addressMap.temp_od_ds_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[2])
         {
            return this.addressMap.temp_preamp_a_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[3])
         {
            return this.addressMap.temp_preamp_b_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[4])
         {
            return this.addressMap.temp_eq_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[5])
         {
            return this.addressMap.temp_fx1_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[6])
         {
            return this.addressMap.temp_fx2_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[7])
         {
            return this.addressMap.temp_delay_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[8])
         {
            return this.addressMap.temp_chorus_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[9])
         {
            return this.addressMap.temp_reverb_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[10])
         {
            return this.addressMap.temp_pedal_fx_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[14])
         {
            return this.addressMap.temp_send_return_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[15])
         {
            return this.addressMap.temp_ns1_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[16])
         {
            return this.addressMap.temp_ns2_on_off.address;
         }
         if(this.effectCategory == ParameterDefinitionGT.EFECT_NAME[19])
         {
            return this.addressMap.temp_delay2_on_off.address;
         }
         return "";
      }
      
      private function updateTemporaryParams(param1:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:EditorEvent = null;
         if(this.mediator.selectedMode != Mode.EDITOR || this.mediator.contentsAreaMode == Mode.TONE_CENTRAL)
         {
            return;
         }
         var _loc2_:String = param1.address as String;
         var _loc3_:Array = param1.value as Array;
         if(!_loc2_ || !_loc3_)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = ToneCentralUtil.incrementAddress(_loc2_,_loc4_);
            _loc6_ = int(_loc3_[_loc4_]);
            if(_loc5_ == this.effectSwAddress)
            {
               this._effectSw = this.getSwOnOff();
               dispatchEvent(new EditorEvent(EditorEvent.EFFECT_SW_CHANGE));
            }
            else if(!this.mediator.sysex.patchChangeFlag && _loc5_ == this.effectTypeAddress)
            {
               this.getEffectData();
               dispatchEvent(new ViewStatusEvent(ViewStatusEvent.VIEW_STATUS_CHANGE));
               dispatchEvent(new EditorEvent(EditorEvent.EFFECT_TYPE_CHANGE));
            }
            else if(_loc5_ == this.subTypeAddress)
            {
               this.getEffectData();
               dispatchEvent(new EditorEvent(EditorEvent.SUB_TYPE_CHANGE));
            }
            else
            {
               _loc7_ = new EditorEvent(EditorEvent.PARAM_CHANGE);
               _loc7_.data = {
                  "address":_loc5_,
                  "value":_loc6_
               };
               dispatchEvent(_loc7_);
            }
            _loc4_++;
         }
      }
      
      public function isEnableParameter(param1:Object) : Boolean
      {
         var _loc2_:Object = ParameterDefinitionGT.ENABLE_PATTERN_LIST[param1.id];
         if(!_loc2_)
         {
            return true;
         }
         switch(_loc2_.key)
         {
            case ParameterDefinitionGT.EFFECT_TYPE:
               if(_loc2_.value.indexOf(this.effectType) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.SUB_TYPE:
               if(_loc2_.value.indexOf(this.subTypeList.getItemAt(this.subTypeIndex).name) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.PRE_AMP_A_SP_TYPE:
               if(_loc2_.value.indexOf(this.getNameFromId("preamp_a_sp_type")) != -1 && this.getOutputSelectValue() == "LINE/PHONES")
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.PRE_AMP_B_SP_TYPE:
               if(_loc2_.value.indexOf(this.getNameFromId("preamp_b_sp_type")) != -1 && this.getOutputSelectValue() == "LINE/PHONES")
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.FX1_HR1_HARM:
               if(_loc2_.value.indexOf(this.getNameFromId("fx1_harmonist_hr1harm")) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.FX1_HR2_HARM:
               if(_loc2_.value.indexOf(this.getNameFromId("fx1_harmonist_hr2harm")) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.FX2_HR1_HARM:
               if(_loc2_.value.indexOf(this.getNameFromId("fx2_harmonist_hr1harm")) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.FX2_HR2_HARM:
               if(_loc2_.value.indexOf(this.getNameFromId("fx2_harmonist_hr2harm")) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.DIVIDER_MODE:
               if(_loc2_.value.indexOf(this.getNameFromId("divider_mode")) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.SEND_RETURN_MODE:
               if(_loc2_.value.indexOf(this.getNameFromId("send_return_mode")) != -1)
               {
                  return true;
               }
               return false;
               break;
            case ParameterDefinitionGT.OUTPUT:
               if(_loc2_.value.indexOf(this.getOutputSelectValue()) != -1)
               {
                  return true;
               }
               return false;
               break;
            default:
               return false;
         }
      }
      
      private function getOutputSelectValue() : String
      {
         var _loc2_:int = 0;
         var _loc1_:SystemParams = this.mediator.sysex.params.system;
         if(_loc1_.sys_preference_output_select == 1)
         {
            _loc2_ = this.mediator.sysex.params.system.sys_output_select;
         }
         else
         {
            _loc2_ = this.mediator.sysex.params.temporaryParams.output_select;
         }
         if(_loc2_ == 7)
         {
            return "LINE/PHONES";
         }
         return "";
      }
      
      private function getNameFromId(param1:String) : String
      {
         var _loc2_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         var _loc3_:int = ParameterUtil.getDoubleByteData(this.addressMap["temp_" + param1].address,_loc2_[param1]);
         return ParameterDefinitionGT.DROPDOWN_LIST[param1][_loc3_];
      }
      
      private function getQuickSettingPresetNumber() : int
      {
         var _loc2_:int = 0;
         var _loc1_:String = this._effectCategory;
         if(this._effectCategory.indexOf("ASSIGN") != -1)
         {
            _loc1_ = "ASSIGN";
         }
         if(QuickSettingDefinitionGT.PRESET_NUMBER_LIST.hasOwnProperty(_loc1_))
         {
            _loc2_ = int(QuickSettingDefinitionGT.PRESET_NUMBER_LIST[_loc1_]);
         }
         else
         {
            _loc2_ = int(QuickSettingDefinitionGT.PRESET_NUMBER_LIST[this._effectType]);
         }
         return _loc2_;
      }
   }
}

