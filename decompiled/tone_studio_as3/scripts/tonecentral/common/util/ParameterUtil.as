package tonecentral.common.util
{
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.QuickSettingDefinitionGT;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.SystemParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class ParameterUtil
   {
      
      private static var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      private static var addressMap:AddressMap = AddressMap.getInstance();
      
      public function ParameterUtil()
      {
         super();
      }
      
      public static function getEffectType(param1:String) : String
      {
         var _loc2_:SystemParams = mediator.sysex.params.system;
         var _loc3_:TemporaryParams = mediator.sysex.params.temporaryParams;
         var _loc4_:Object = {};
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.COMP_TYPE,_loc3_.comp_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.ODDS_TYPE,_loc3_.od_ds_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.PREAMP_TYPE,_loc3_.preamp_a_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.PREAMP_TYPE,_loc3_.preamp_b_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.EQ_TYPE,_loc3_.eq_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.FX1_TYPE,_loc3_.fx1_fx_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.FX2_TYPE,_loc3_.fx2_fx_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.DELAY_TYPE,_loc3_.delay_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.CHORUS_TYPE,_loc3_.chorus_mode);
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.REVERB_TYPE,_loc3_.reverb_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.PEDAL_FX_TYPE,_loc3_.pedal_fx_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[11]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[11];
               break;
            case ParameterDefinitionGT.EFECT_NAME[12]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[12];
               break;
            case ParameterDefinitionGT.EFECT_NAME[13]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[13];
               break;
            case ParameterDefinitionGT.EFECT_NAME[14]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[14];
               break;
            case ParameterDefinitionGT.EFECT_NAME[15]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[15];
               break;
            case ParameterDefinitionGT.EFECT_NAME[16]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[16];
               break;
            case ParameterDefinitionGT.EFECT_NAME[17]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.ACCEL_FX_TYPE,_loc3_.accel_fx_type);
               break;
            case ParameterDefinitionGT.EFECT_NAME[18]:
               _loc4_ = ParameterDefinitionGT.EFECT_NAME[18];
               break;
            case ParameterDefinitionGT.EFECT_NAME[19]:
               _loc4_ = getEffectTypeObject(ParameterDefinitionGT.DELAY_TYPE,_loc3_.delay2_type);
         }
         if(_loc4_.hasOwnProperty("name"))
         {
            return _loc4_.name;
         }
         return String(_loc4_);
      }
      
      public static function getEffectTypeValue(param1:String, param2:TemporaryParams) : int
      {
         var _loc3_:int = 0;
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               _loc3_ = param2.comp_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               _loc3_ = param2.od_ds_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               _loc3_ = param2.preamp_a_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               _loc3_ = param2.preamp_b_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               _loc3_ = param2.fx1_fx_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               _loc3_ = param2.fx2_fx_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               _loc3_ = param2.delay_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               _loc3_ = param2.chorus_mode;
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               _loc3_ = param2.reverb_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               _loc3_ = param2.pedal_fx_type;
            case ParameterDefinitionGT.EFECT_NAME[17]:
               _loc3_ = param2.accel_fx_type;
               break;
            case ParameterDefinitionGT.EFECT_NAME[19]:
               _loc3_ = param2.delay2_type;
         }
         return _loc3_;
      }
      
      public static function getEffectTypeObject(param1:Array, param2:int) : Object
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_].val == param2)
            {
               return param1[_loc3_];
            }
            _loc3_++;
         }
         return {};
      }
      
      public static function getEffectDefine(param1:String, param2:String) : Array
      {
         var _loc3_:Array = null;
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.COMP_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.ODDS_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.PREAMP_A_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.PREAMP_B_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.EQ_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.FX1_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.FX2_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.DELAY_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.CHORUS_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.REVERB_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.PEDAL_FX_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[11]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.FOOT_VOLUME_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[12]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.DIVIDER_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[13]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.MIXER_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[14]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.SEND_RETURN_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[15]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.NS1_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[16]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.NS2_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[17]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.ACCEL_FX_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[18]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.MASTER_SETTING_PARAMS_LIST,param2);
               _loc3_ = _loc3_.concat().filter(deviseFilterForMasterSetting);
               break;
            case ParameterDefinitionGT.EFECT_NAME[19]:
               _loc3_ = getDefineDataByKey(ParameterDefinitionGT.DELAY2_PARAMS_LIST,param2);
         }
         return _loc3_;
      }
      
      public static function deviseFilterForMasterSetting(param1:*, param2:int, param3:Array) : Boolean
      {
         return param1.id != "amp_control";
      }
      
      public static function getQuickSettingDefine(param1:String, param2:String) : Array
      {
         var _loc3_:Array = null;
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.COMP_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.ODDS_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.PREAMP_A_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.PREAMP_A_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.EQ_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.FX1_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.FX2_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.DELAY_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.CHORUS_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.REVERB_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.PEDAL_FX_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[12]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.DIVIDER_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[14]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.SEND_RETURN_PARAMS_LIST,param2);
         }
         return _loc3_;
      }
      
      public static function getPatchQuickSettingDefine(param1:String, param2:String) : Array
      {
         var _loc3_:Array = null;
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.COMP_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.ODDS_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.PREAMP_A_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.PREAMP_B_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.EQ_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.FX1_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.FX2_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.DELAY_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.CHORUS_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.REVERB_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.PEDAL_FX_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[12]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.DIVIDER_PARAMS_LIST,param2);
               break;
            case ParameterDefinitionGT.EFECT_NAME[14]:
               _loc3_ = getDefineDataByKey(QuickSettingDefinitionGT.SEND_RETURN_PARAMS_LIST,param2);
         }
         return _loc3_;
      }
      
      private static function getDefineDataByKey(param1:Object, param2:String) : Array
      {
         if(param1.hasOwnProperty(param2))
         {
            return param1[param2];
         }
         return param1["DEFAULT"];
      }
      
      public static function getEffectList(param1:String) : Array
      {
         var _loc2_:Array = [];
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               _loc2_ = ParameterDefinitionGT.COMP_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               _loc2_ = ParameterDefinitionGT.ODDS_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               _loc2_ = ParameterDefinitionGT.PREAMP_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               _loc2_ = ParameterDefinitionGT.PREAMP_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               _loc2_ = ParameterDefinitionGT.EQ_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               _loc2_ = ParameterDefinitionGT.FX1_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               _loc2_ = ParameterDefinitionGT.FX2_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               _loc2_ = ParameterDefinitionGT.DELAY_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               _loc2_ = ParameterDefinitionGT.CHORUS_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               _loc2_ = ParameterDefinitionGT.REVERB_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               _loc2_ = ParameterDefinitionGT.PEDAL_FX_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[17]:
               _loc2_ = ParameterDefinitionGT.ACCEL_FX_TYPE;
               break;
            case ParameterDefinitionGT.EFECT_NAME[19]:
               _loc2_ = ParameterDefinitionGT.DELAY_TYPE;
         }
         return _loc2_;
      }
      
      public static function getSubType(param1:String, param2:String) : Array
      {
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[1]:
               if(ParameterDefinitionGT.ODDS_SUB_TYPE_LIST.hasOwnProperty(param2))
               {
                  return ParameterDefinitionGT.ODDS_SUB_TYPE_LIST[param2];
               }
               break;
            case ParameterDefinitionGT.EFECT_NAME[2]:
            case ParameterDefinitionGT.EFECT_NAME[3]:
               if(ParameterDefinitionGT.PREAMP_SUB_TYPE_LIST.hasOwnProperty(param2))
               {
                  return ParameterDefinitionGT.PREAMP_SUB_TYPE_LIST[param2];
               }
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               if(ParameterDefinitionGT.FX1_SUB_TYPE_LIST.hasOwnProperty(param2))
               {
                  return ParameterDefinitionGT.FX1_SUB_TYPE_LIST[param2];
               }
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               if(ParameterDefinitionGT.FX2_SUB_TYPE_LIST.hasOwnProperty(param2))
               {
                  return ParameterDefinitionGT.FX2_SUB_TYPE_LIST[param2];
               }
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               return ParameterDefinitionGT.PEDAL_FX_SUB_TYPE_LIST[param2];
            case ParameterDefinitionGT.EFECT_NAME[17]:
               if(ParameterDefinitionGT.ACCEL_FX_SUB_TYPE_LIST.hasOwnProperty(param2))
               {
                  return ParameterDefinitionGT.ACCEL_FX_SUB_TYPE_LIST[param2];
               }
         }
         return null;
      }
      
      public static function getSubTypeParamName(param1:String, param2:String) : String
      {
         if(param1 == ParameterDefinitionGT.EFECT_NAME[1])
         {
            switch(param2)
            {
               case "CUSTOM":
                  return "od_ds_custom_type";
            }
         }
         else if(param1 == ParameterDefinitionGT.EFECT_NAME[2])
         {
            switch(param2)
            {
               case "CUSTOM":
                  return "preamp_a_custom_type";
            }
         }
         else if(param1 == ParameterDefinitionGT.EFECT_NAME[3])
         {
            switch(param2)
            {
               case "CUSTOM":
                  return "preamp_b_custom_type";
            }
         }
         else if(param1 == ParameterDefinitionGT.EFECT_NAME[5])
         {
            switch(param2)
            {
               case "PEDAL WAH":
                  return "fx1_sub_wah_type";
               case "COMP":
                  return "fx1_adv_comp_type";
               case "LIMITER":
                  return "fx1_limiter_type";
               case "SUB OD/DS":
                  return "fx1_sub_od_ds_type";
               case "TONE MODIFY":
                  return "fx1_tone_modify_type";
               case "GUITAR SIM":
                  return "fx1_guitar_sim_type";
               case "SUB DELAY":
                  return "fx1_sub_delay_type";
               case "PAN":
                  return "fx1_pan_type";
               case "WAVE SYNTH":
                  return "fx1_wave_synth_wave";
               case "PITCH SHIFTER":
                  return "fx1_pitch_shifter_voice";
               case "HARMONIST":
                  return "fx1_harmonist_voice";
               case "AC.PROCESSOR":
                  return "fx1_ac_processor_type";
               case "PHASER":
                  return "fx1_phaser_type";
               case "RING MOD":
                  return "fx1_ring_mod_mode";
               case "HUMANIZER":
                  return "fx1_humanizer_mode";
               case "DC-30":
                  return "fx1_dc30_selector";
            }
         }
         else if(param1 == ParameterDefinitionGT.EFECT_NAME[6])
         {
            switch(param2)
            {
               case "PEDAL WAH":
                  return "fx2_sub_wah_type";
               case "COMP":
                  return "fx2_adv_comp_type";
               case "LIMITER":
                  return "fx2_limiter_type";
               case "SUB OD/DS":
                  return "fx2_sub_od_ds_type";
               case "TONE MODIFY":
                  return "fx2_tone_modify_type";
               case "GUITAR SIM":
                  return "fx2_guitar_sim_type";
               case "SUB DELAY":
                  return "fx2_sub_delay_type";
               case "PAN":
                  return "fx2_pan_type";
               case "TERA ECHO":
                  return "prm_fx2_teraecho_mode";
               case "WAVE SYNTH":
                  return "fx2_wave_synth_wave";
               case "PITCH SHIFTER":
                  return "fx2_pitch_shifter_voice";
               case "HARMONIST":
                  return "fx2_harmonist_voice";
               case "AC.PROCESSOR":
                  return "fx2_ac_processor_type";
               case "PHASER":
                  return "fx2_phaser_type";
               case "RING MOD":
                  return "fx2_ring_mod_mode";
               case "HUMANIZER":
                  return "fx2_humanizer_mode";
               case "DC-30":
                  return "fx2_dc30_selector";
            }
         }
         else if(param1 == ParameterDefinitionGT.EFECT_NAME[10])
         {
            if(param2 == "PEDAL WAH")
            {
               return "pedal_fx_wah_type";
            }
         }
         else if(param1 == ParameterDefinitionGT.EFECT_NAME[17])
         {
            if(param2 == "FEEDBACKER")
            {
               return "accel_fx_feedbacker_mode";
            }
         }
         return "";
      }
      
      public static function getDoubleByteDataSetting(param1:String, param2:Number, param3:String) : Number
      {
         if(SystemSettingDefinitionGT.PROGRAM_MAP_START_ADDRESS <= param1 && param1 <= SystemSettingDefinitionGT.PROGRAM_MAP_END_ADDRESS)
         {
            return mediator.sysex.params.midiParams.getDoubleByteDataProgramMap(param3);
         }
         return getDoubleByteData(param1,param2);
      }
      
      public static function getDoubleByteData(param1:String, param2:Number) : Number
      {
         switch(param1)
         {
            case addressMap.temp_delay_delay_time_h.address:
            case addressMap.temp_delay_delay_time_l.address:
               return mediator.sysex.params.temporaryParams.delay_delay_time;
            case addressMap.temp_delay_d1_time_h.address:
            case addressMap.temp_delay_d1_time_l.address:
               return mediator.sysex.params.temporaryParams.delay_d1_time;
            case addressMap.temp_delay_d2_time_h.address:
            case addressMap.temp_delay_d2_time_l.address:
               return mediator.sysex.params.temporaryParams.delay_d2_time;
            case addressMap.temp_delay2_delay_time_h.address:
            case addressMap.temp_delay2_delay_time_l.address:
               return mediator.sysex.params.temporaryParams.delay2_delay_time;
            case addressMap.temp_delay2_d1_time_h.address:
            case addressMap.temp_delay2_d1_time_l.address:
               return mediator.sysex.params.temporaryParams.delay2_d1_time;
            case addressMap.temp_delay2_d2_time_h.address:
            case addressMap.temp_delay2_d2_time_l.address:
               return mediator.sysex.params.temporaryParams.delay2_d2_time;
            case addressMap.temp_reverb_pre_delay_h.address:
            case addressMap.temp_reverb_pre_delay_l.address:
               return mediator.sysex.params.temporaryParams.reverb_pre_delay;
            case addressMap.temp_master_bpm_h.address:
            case addressMap.temp_master_bpm_l.address:
               return mediator.sysex.params.temporaryParams.master_bpm;
            case addressMap.temp_fx1_pitch_shifter_ps1pre_dly_h.address:
            case addressMap.temp_fx1_pitch_shifter_ps1pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx1_pitch_shifter_ps1pre_dly;
            case addressMap.temp_fx1_pitch_shifter_ps2pre_dly_h.address:
            case addressMap.temp_fx1_pitch_shifter_ps2pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx1_pitch_shifter_ps2pre_dly;
            case addressMap.temp_fx2_pitch_shifter_ps1pre_dly_h.address:
            case addressMap.temp_fx2_pitch_shifter_ps1pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx2_pitch_shifter_ps1pre_dly;
            case addressMap.temp_fx2_pitch_shifter_ps2pre_dly_h.address:
            case addressMap.temp_fx2_pitch_shifter_ps2pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx2_pitch_shifter_ps2pre_dly;
            case addressMap.temp_fx1_harmonist_hr1pre_dly_h.address:
            case addressMap.temp_fx1_harmonist_hr1pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx1_harmonist_hr1pre_dly;
            case addressMap.temp_fx1_harmonist_hr2pre_dly_h.address:
            case addressMap.temp_fx1_harmonist_hr2pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx1_harmonist_hr2pre_dly;
            case addressMap.temp_fx1_sub_delay_time_h.address:
            case addressMap.temp_fx1_sub_delay_time_l.address:
               return mediator.sysex.params.temporaryParams.fx1_sub_delay_time;
            case addressMap.temp_fx2_harmonist_hr1pre_dly_h.address:
            case addressMap.temp_fx2_harmonist_hr1pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx2_harmonist_hr1pre_dly;
            case addressMap.temp_fx2_harmonist_hr2pre_dly_h.address:
            case addressMap.temp_fx2_harmonist_hr2pre_dly_l.address:
               return mediator.sysex.params.temporaryParams.fx2_harmonist_hr2pre_dly;
            case addressMap.temp_fx2_sub_delay_time_h.address:
            case addressMap.temp_fx2_sub_delay_time_l.address:
               return mediator.sysex.params.temporaryParams.fx2_sub_delay_time;
            case addressMap.temp_fx1_dc30_echo_repeat_rate_h.address:
            case addressMap.temp_fx1_dc30_echo_repeat_rate_l.address:
               return mediator.sysex.params.temporaryParams.fx1_dc30_echo_repeat_rate;
            case addressMap.temp_fx2_dc30_echo_repeat_rate_h.address:
            case addressMap.temp_fx2_dc30_echo_repeat_rate_l.address:
               return mediator.sysex.params.temporaryParams.fx2_dc30_echo_repeat_rate;
            case addressMap.temp_exp_pedal_assign_delay_min_h.address:
            case addressMap.temp_exp_pedal_assign_delay_min_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_delay_min;
            case addressMap.temp_exp_pedal_assign_delay_max_h.address:
            case addressMap.temp_exp_pedal_assign_delay_max_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_delay_max;
            case addressMap.temp_exp_pedal_assign_reverb_min_h.address:
            case addressMap.temp_exp_pedal_assign_reverb_min_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_reverb_min;
            case addressMap.temp_exp_pedal_assign_reverb_max_h.address:
            case addressMap.temp_exp_pedal_assign_reverb_max_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_reverb_max;
            case addressMap.temp_exp_pedal_assign_pitch_shifter_min_h.address:
            case addressMap.temp_exp_pedal_assign_pitch_shifter_min_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_pitch_shifter_min;
            case addressMap.temp_exp_pedal_assign_pitch_shifter_max_h.address:
            case addressMap.temp_exp_pedal_assign_pitch_shifter_max_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_pitch_shifter_max;
            case addressMap.temp_exp_pedal_assign_harmonist_min_h.address:
            case addressMap.temp_exp_pedal_assign_harmonist_min_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_harmonist_min;
            case addressMap.temp_exp_pedal_assign_harmonist_max_h.address:
            case addressMap.temp_exp_pedal_assign_harmonist_max_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_harmonist_max;
            case addressMap.temp_exp_pedal_assign_dc30_min_h.address:
            case addressMap.temp_exp_pedal_assign_dc30_min_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_dc30_min;
            case addressMap.temp_exp_pedal_assign_dc30_max_h.address:
            case addressMap.temp_exp_pedal_assign_dc30_max_l.address:
               return mediator.sysex.params.temporaryParams.exp_pedal_assign_dc30_max;
            case addressMap.temp_gafc_exp1_assign_delay_min_h.address:
            case addressMap.temp_gafc_exp1_assign_delay_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_delay_min;
            case addressMap.temp_gafc_exp1_assign_delay_max_h.address:
            case addressMap.temp_gafc_exp1_assign_delay_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_delay_max;
            case addressMap.temp_gafc_exp1_assign_reverb_min_h.address:
            case addressMap.temp_gafc_exp1_assign_reverb_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_reverb_min;
            case addressMap.temp_gafc_exp1_assign_reverb_max_h.address:
            case addressMap.temp_gafc_exp1_assign_reverb_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_reverb_max;
            case addressMap.temp_gafc_exp1_assign_pitch_shifter_min_h.address:
            case addressMap.temp_gafc_exp1_assign_pitch_shifter_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_pitch_shifter_min;
            case addressMap.temp_gafc_exp1_assign_pitch_shifter_max_h.address:
            case addressMap.temp_gafc_exp1_assign_pitch_shifter_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_pitch_shifter_max;
            case addressMap.temp_gafc_exp1_assign_harmonist_min_h.address:
            case addressMap.temp_gafc_exp1_assign_harmonist_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_harmonist_min;
            case addressMap.temp_gafc_exp1_assign_harmonist_max_h.address:
            case addressMap.temp_gafc_exp1_assign_harmonist_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_harmonist_max;
            case addressMap.temp_gafc_exp1_assign_dc30_min_h.address:
            case addressMap.temp_gafc_exp1_assign_dc30_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_dc30_min;
            case addressMap.temp_gafc_exp1_assign_dc30_max_h.address:
            case addressMap.temp_gafc_exp1_assign_dc30_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp1_assign_dc30_max;
            case addressMap.temp_gafc_exp2_assign_delay_min_h.address:
            case addressMap.temp_gafc_exp2_assign_delay_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_delay_min;
            case addressMap.temp_gafc_exp2_assign_delay_max_h.address:
            case addressMap.temp_gafc_exp2_assign_delay_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_delay_max;
            case addressMap.temp_gafc_exp2_assign_reverb_min_h.address:
            case addressMap.temp_gafc_exp2_assign_reverb_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_reverb_min;
            case addressMap.temp_gafc_exp2_assign_reverb_max_h.address:
            case addressMap.temp_gafc_exp2_assign_reverb_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_reverb_max;
            case addressMap.temp_gafc_exp2_assign_pitch_shifter_min_h.address:
            case addressMap.temp_gafc_exp2_assign_pitch_shifter_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_pitch_shifter_min;
            case addressMap.temp_gafc_exp2_assign_pitch_shifter_max_h.address:
            case addressMap.temp_gafc_exp2_assign_pitch_shifter_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_pitch_shifter_max;
            case addressMap.temp_gafc_exp2_assign_harmonist_min_h.address:
            case addressMap.temp_gafc_exp2_assign_harmonist_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_harmonist_min;
            case addressMap.temp_gafc_exp2_assign_harmonist_max_h.address:
            case addressMap.temp_gafc_exp2_assign_harmonist_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_harmonist_max;
            case addressMap.temp_gafc_exp2_assign_dc30_min_h.address:
            case addressMap.temp_gafc_exp2_assign_dc30_min_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_dc30_min;
            case addressMap.temp_gafc_exp2_assign_dc30_max_h.address:
            case addressMap.temp_gafc_exp2_assign_dc30_max_l.address:
               return mediator.sysex.params.temporaryParams.gafc_exp2_assign_dc30_max;
            case addressMap.temp_assign1_target_h.address:
            case addressMap.temp_assign1_target_l.address:
               return mediator.sysex.params.temporaryParams.assign1_target;
            case addressMap.temp_assign1_target_min_h.address:
            case addressMap.temp_assign1_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign1_target_min;
            case addressMap.temp_assign1_target_max_h.address:
            case addressMap.temp_assign1_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign1_target_max;
            case addressMap.temp_assign2_target_h.address:
            case addressMap.temp_assign2_target_l.address:
               return mediator.sysex.params.temporaryParams.assign2_target;
            case addressMap.temp_assign2_target_min_h.address:
            case addressMap.temp_assign2_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign2_target_min;
            case addressMap.temp_assign2_target_max_h.address:
            case addressMap.temp_assign2_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign2_target_max;
            case addressMap.temp_assign3_target_h.address:
            case addressMap.temp_assign3_target_l.address:
               return mediator.sysex.params.temporaryParams.assign3_target;
            case addressMap.temp_assign3_target_min_h.address:
            case addressMap.temp_assign3_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign3_target_min;
            case addressMap.temp_assign3_target_max_h.address:
            case addressMap.temp_assign3_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign3_target_max;
            case addressMap.temp_assign4_target_h.address:
            case addressMap.temp_assign4_target_l.address:
               return mediator.sysex.params.temporaryParams.assign4_target;
            case addressMap.temp_assign4_target_min_h.address:
            case addressMap.temp_assign4_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign4_target_min;
            case addressMap.temp_assign4_target_max_h.address:
            case addressMap.temp_assign4_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign4_target_max;
            case addressMap.temp_assign5_target_h.address:
            case addressMap.temp_assign5_target_l.address:
               return mediator.sysex.params.temporaryParams.assign5_target;
            case addressMap.temp_assign5_target_min_h.address:
            case addressMap.temp_assign5_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign5_target_min;
            case addressMap.temp_assign5_target_max_h.address:
            case addressMap.temp_assign5_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign5_target_max;
            case addressMap.temp_assign6_target_h.address:
            case addressMap.temp_assign6_target_l.address:
               return mediator.sysex.params.temporaryParams.assign6_target;
            case addressMap.temp_assign6_target_min_h.address:
            case addressMap.temp_assign6_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign6_target_min;
            case addressMap.temp_assign6_target_max_h.address:
            case addressMap.temp_assign6_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign6_target_max;
            case addressMap.temp_assign7_target_h.address:
            case addressMap.temp_assign7_target_l.address:
               return mediator.sysex.params.temporaryParams.assign7_target;
            case addressMap.temp_assign7_target_min_h.address:
            case addressMap.temp_assign7_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign7_target_min;
            case addressMap.temp_assign7_target_max_h.address:
            case addressMap.temp_assign7_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign7_target_max;
            case addressMap.temp_assign8_target_h.address:
            case addressMap.temp_assign8_target_l.address:
               return mediator.sysex.params.temporaryParams.assign8_target;
            case addressMap.temp_assign8_target_min_h.address:
            case addressMap.temp_assign8_target_min_l.address:
               return mediator.sysex.params.temporaryParams.assign8_target_min;
            case addressMap.temp_assign8_target_max_h.address:
            case addressMap.temp_assign8_target_max_l.address:
               return mediator.sysex.params.temporaryParams.assign8_target_max;
            case addressMap.sys_play_option_bank_extent_min_l.address:
            case addressMap.sys_play_option_bank_extent_min_h.address:
               return mediator.sysex.params.system.sys_play_option_bank_extent_min;
            case addressMap.sys_play_option_bank_extent_max_l.address:
            case addressMap.sys_play_option_bank_extent_max_h.address:
               return mediator.sysex.params.system.sys_play_option_bank_extent_max;
            case addressMap.sys_play_option_patch_ext_min_l.address:
            case addressMap.sys_play_option_patch_ext_min_h.address:
               return mediator.sysex.params.system.sys_play_option_patch_ext_min;
            case addressMap.sys_play_option_patch_ext_max_l.address:
            case addressMap.sys_play_option_patch_ext_max_h.address:
               return mediator.sysex.params.system.sys_play_option_patch_ext_max;
            case addressMap.sys_knob_setting_knob1_l.address:
            case addressMap.sys_knob_setting_knob1_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob1;
            case addressMap.sys_knob_setting_knob2_l.address:
            case addressMap.sys_knob_setting_knob2_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob2;
            case addressMap.sys_knob_setting_knob3_l.address:
            case addressMap.sys_knob_setting_knob3_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob3;
            case addressMap.sys_knob_setting_knob4_l.address:
            case addressMap.sys_knob_setting_knob4_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob4;
            case addressMap.sys_knob_setting_knob5_l.address:
            case addressMap.sys_knob_setting_knob5_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob5;
            case addressMap.sys_knob_setting_knob6_l.address:
            case addressMap.sys_knob_setting_knob6_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob6;
            case addressMap.sys_knob_setting_knob7_l.address:
            case addressMap.sys_knob_setting_knob7_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob7;
            case addressMap.sys_knob_setting_knob8_l.address:
            case addressMap.sys_knob_setting_knob8_h.address:
               return mediator.sysex.params.system.sys_knob_setting_knob8;
            default:
               return param2;
         }
      }
      
      public static function isDoubleByteAddress(param1:String) : Boolean
      {
         if(SystemSettingDefinitionGT.PROGRAM_MAP_START_ADDRESS <= param1 && param1 <= SystemSettingDefinitionGT.PROGRAM_MAP_END_ADDRESS || param1 == addressMap.sys_knob_setting_knob1.address || param1 == addressMap.sys_knob_setting_knob2.address || param1 == addressMap.sys_knob_setting_knob3.address || param1 == addressMap.sys_knob_setting_knob4.address || param1 == addressMap.sys_knob_setting_knob5.address || param1 == addressMap.sys_knob_setting_knob6.address || param1 == addressMap.sys_knob_setting_knob7.address || param1 == addressMap.sys_knob_setting_knob8.address || param1 == addressMap.sys_play_option_patch_ext_min.address || param1 == addressMap.sys_play_option_patch_ext_max.address || param1 == addressMap.sys_play_option_bank_extent_min.address || param1 == addressMap.sys_play_option_bank_extent_max.address || param1 == addressMap.temp_assign1_target_min.address || param1 == addressMap.temp_assign1_target_max.address || param1 == addressMap.temp_assign2_target_min.address || param1 == addressMap
         .temp_assign2_target_max.address || param1 == addressMap.temp_assign3_target_min.address || param1 == addressMap.temp_assign3_target_max.address || param1 == addressMap.temp_assign4_target_min.address || param1 == addressMap.temp_assign4_target_max.address || param1 == addressMap.temp_assign5_target_min.address || param1 == addressMap.temp_assign5_target_max.address || param1 == addressMap.temp_assign6_target_min.address || param1 == addressMap.temp_assign6_target_max.address || param1 == addressMap.temp_assign7_target_min.address || param1 == addressMap.temp_assign7_target_max.address || param1 == addressMap.temp_assign8_target_min.address || param1 == addressMap.temp_assign8_target_max.address || param1 == addressMap.temp_delay_delay_time.address || param1 == addressMap.temp_delay_d1_time.address || param1 == addressMap.temp_delay_d2_time.address || param1 == addressMap.temp_delay2_delay_time.address || param1 == addressMap.temp_delay2_d1_time.address || param1 == addressMap.temp_delay2_d2_time
         .address || param1 == addressMap.temp_reverb_pre_delay.address || param1 == addressMap.temp_master_bpm.address || param1 == addressMap.temp_fx1_pitch_shifter_ps1pre_dly.address || param1 == addressMap.temp_fx2_pitch_shifter_ps1pre_dly.address || param1 == addressMap.temp_fx1_pitch_shifter_ps2pre_dly.address || param1 == addressMap.temp_fx2_pitch_shifter_ps2pre_dly.address || param1 == addressMap.temp_fx1_harmonist_hr1pre_dly.address || param1 == addressMap.temp_fx2_harmonist_hr1pre_dly.address || param1 == addressMap.temp_fx1_harmonist_hr2pre_dly.address || param1 == addressMap.temp_fx2_harmonist_hr2pre_dly.address || param1 == addressMap.temp_fx1_sub_delay_time.address || param1 == addressMap.temp_fx2_sub_delay_time.address || param1 == addressMap.temp_fx1_dc30_echo_repeat_rate.address || param1 == addressMap.temp_fx2_dc30_echo_repeat_rate.address || param1 == addressMap.temp_exp_pedal_assign_delay_min.address || param1 == addressMap.temp_exp_pedal_assign_delay_max.address || param1 == addressMap
         .temp_exp_pedal_assign_reverb_min.address || param1 == addressMap.temp_exp_pedal_assign_reverb_max.address || param1 == addressMap.temp_exp_pedal_assign_pitch_shifter_min.address || param1 == addressMap.temp_exp_pedal_assign_pitch_shifter_max.address || param1 == addressMap.temp_exp_pedal_assign_harmonist_min.address || param1 == addressMap.temp_exp_pedal_assign_harmonist_max.address || param1 == addressMap.temp_exp_pedal_assign_dc30_min.address || param1 == addressMap.temp_exp_pedal_assign_dc30_max.address || param1 == addressMap.temp_gafc_exp1_assign_delay_min.address || param1 == addressMap.temp_gafc_exp1_assign_delay_max.address || param1 == addressMap.temp_gafc_exp1_assign_reverb_min.address || param1 == addressMap.temp_gafc_exp1_assign_reverb_max.address || param1 == addressMap.temp_gafc_exp1_assign_pitch_shifter_min.address || param1 == addressMap.temp_gafc_exp1_assign_pitch_shifter_max.address || param1 == addressMap.temp_gafc_exp1_assign_harmonist_min.address || param1 == addressMap
         .temp_gafc_exp1_assign_harmonist_max.address || param1 == addressMap.temp_gafc_exp1_assign_dc30_min.address || param1 == addressMap.temp_gafc_exp1_assign_dc30_max.address || param1 == addressMap.temp_gafc_exp2_assign_delay_min.address || param1 == addressMap.temp_gafc_exp2_assign_delay_max.address || param1 == addressMap.temp_gafc_exp2_assign_reverb_min.address || param1 == addressMap.temp_gafc_exp2_assign_reverb_max.address || param1 == addressMap.temp_gafc_exp2_assign_pitch_shifter_min.address || param1 == addressMap.temp_gafc_exp2_assign_pitch_shifter_max.address || param1 == addressMap.temp_gafc_exp2_assign_harmonist_min.address || param1 == addressMap.temp_gafc_exp2_assign_harmonist_max.address || param1 == addressMap.temp_gafc_exp2_assign_dc30_min.address || param1 == addressMap.temp_gafc_exp2_assign_dc30_max.address)
         {
            return true;
         }
         return false;
      }
   }
}

