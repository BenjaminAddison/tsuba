package tonecentral.common.define
{
   import mx.formatters.NumberFormatter;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ParameterDefinitionGT
   {
      
      public static var PARAM_NO_LIST:Array;
      
      public static var MAX_PATCH_NUMBER:int = 8;
      
      public static const CODE_LIST:Array = ["C","Db","D","Eb","E","F","F#","G","Ab","A","Bb","B"];
      
      public static const AMP_TYPE_LIST:Array = ["ACOUSTIC","CLEAN","CRUNCH","LEAD","BROWN"];
      
      public static const PATCH_CATEGORY:Array = ["JAZZ","BLUES","COUNTRY","SURF ROCK","SOUL FUNK","WEST COAST","ROCK","PUNK ROCK","HARD ROCK","STUDIO","METAL","ACOUSTIC","VOCAL","USER1","USER2","USER3"];
      
      public static const EFECT_NAME:Array = ["COMP","OD/DS","PREAMP A","PREAMP B","EQ","FX1","FX2","DELAY","CHORUS","REVERB","PEDAL FX","FOOT VOLUME","DIVIDER","MIXER","SEND/RETURN","NS1","NS2","ACCEL FX","MASTER SETTING","DELAY2"];
      
      public static const AMP_EFECT_NAME:Array = ["OD/DS","FX1","DELAY","FX2","REVERB","DELAY2"];
      
      public static const PARAMETER_LIST_RE_CREATE_LIST:Array = ["FX1","FX2","DELAY","PEDAL FX","ACCEL FX","EQ","DELAY2"];
      
      public static const COMP_TYPE:Array = [{
         "val":0,
         "name":"BOSS COMP"
      },{
         "val":1,
         "name":"HI-BAND"
      },{
         "val":2,
         "name":"LIGHT"
      },{
         "val":3,
         "name":"D-COMP"
      },{
         "val":4,
         "name":"ORANGE"
      },{
         "val":5,
         "name":"FAT"
      },{
         "val":6,
         "name":"MILD"
      },{
         "val":7,
         "name":"STEREO COMP"
      }];
      
      public static const COMP_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"comp_sustain",
         "page":1,
         "row":1,
         "name":"SUSTAIN",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"comp_attack",
         "page":1,
         "row":1,
         "name":"ATTACK",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"comp_tone",
         "page":1,
         "row":1,
         "name":"TONE",
         "min":-50,
         "max":50,
         "step":1
      },{
         "id":"comp_level",
         "page":1,
         "row":1,
         "name":"LEVEL",
         "min":0,
         "max":100,
         "step":1
      }]};
      
      public static const ODDS_TYPE:Array = [{
         "val":1,
         "name":"CLEAN BOOST"
      },{
         "val":2,
         "name":"TREBLE BOOST"
      },{
         "val":0,
         "name":"MID BOOST"
      },{
         "val":3,
         "name":"CRUNCH OD"
      },{
         "val":10,
         "name":"BLUES DRIVE"
      },{
         "val":11,
         "name":"OVERDRIVE"
      },{
         "val":4,
         "name":"NATURAL OD"
      },{
         "val":5,
         "name":"WARM OD"
      },{
         "val":13,
         "name":"TURBO OD"
      },{
         "val":12,
         "name":"T-SCREAM"
      },{
         "val":14,
         "name":"DISTORTION"
      },{
         "val":6,
         "name":"FAT DS"
      },{
         "val":17,
         "name":"DST+"
      },{
         "val":16,
         "name":"GUV DS"
      },{
         "val":15,
         "name":"RAT"
      },{
         "val":18,
         "name":"METAL ZONE"
      },{
         "val":8,
         "name":"METAL DS"
      },{
         "val":19,
         "name":"\'60S FUZZ"
      },{
         "val":20,
         "name":"MUFF FUZZ"
      },{
         "val":9,
         "name":"OCT FUZZ"
      }];
      
      public static const ODDS_SUB_TYPE_LIST:Object = {"CUSTOM":[{
         "val":0,
         "name":"OD-1"
      },{
         "val":1,
         "name":"OD-2"
      },{
         "val":2,
         "name":"CRUNCH"
      },{
         "val":3,
         "name":"DS-1"
      },{
         "val":4,
         "name":"DS-2"
      },{
         "val":5,
         "name":"METAL1"
      },{
         "val":6,
         "name":"METAL2"
      },{
         "val":7,
         "name":"FUZZ"
      }]};
      
      public static const ODDS_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"od_ds_drive",
         "page":1,
         "row":1,
         "name":"DRIVE",
         "min":0,
         "max":120,
         "step":1
      },{
         "id":"od_ds_tone",
         "page":1,
         "row":1,
         "name":"TONE",
         "min":-50,
         "max":50,
         "step":1
      },{
         "id":"od_ds_bottom",
         "page":1,
         "row":1,
         "name":"BOTTOM",
         "min":-50,
         "max":50,
         "step":1
      },{
         "id":"od_ds_effect_level",
         "page":1,
         "row":1,
         "name":"EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"od_ds_solo_sw",
         "page":1,
         "row":2,
         "name":"SOLO SW",
         "min":0,
         "max":1,
         "step":1
      },{
         "id":"od_ds_solo_level",
         "page":1,
         "row":2,
         "name":"SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"od_ds_direct_mix",
         "page":1,
         "row":2,
         "name":"DIRECT MIX",
         "min":0,
         "max":100,
         "step":1
      }]};
      
      public static const AMP_PARAMS_LIST:Array = [{
         "id":"sys_knob_pos_type",
         "page":1,
         "row":1,
         "name":"AMP TYPE",
         "min":0,
         "max":4,
         "step":1
      },{
         "id":"sys_knob_pos_gain",
         "page":1,
         "row":1,
         "name":"GAIN",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"sys_knob_pos_volume",
         "page":1,
         "row":1,
         "name":"VALUME",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"sys_knob_pos_bass",
         "page":1,
         "row":1,
         "name":"BASS",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"sys_knob_pos_middle",
         "page":1,
         "row":1,
         "name":"MIDDLE",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"sys_knob_pos_treble",
         "page":1,
         "row":1,
         "name":"TREBLE",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"sys_knob_pos_fx1",
         "page":1,
         "row":1,
         "name":"FX1",
         "min":0,
         "max":103,
         "step":1
      },{
         "id":"sys_knob_pos_fx2",
         "page":1,
         "row":1,
         "name":"FX2",
         "min":0,
         "max":103,
         "step":1
      },{
         "id":"sys_knob_pos_fx3",
         "page":1,
         "row":1,
         "name":"FX3",
         "min":0,
         "max":101,
         "step":1
      },{
         "id":"sys_knob_pos_presnce",
         "page":1,
         "row":1,
         "name":"PRESENCE",
         "min":0,
         "max":100,
         "step":1
      }];
      
      public static const PREAMP_TYPE:Array = [{
         "val":0,
         "name":"NATURAL CLEAN"
      },{
         "val":1,
         "name":"FULL RANGE"
      },{
         "val":2,
         "name":"COMBO CRUNCH"
      },{
         "val":3,
         "name":"STACK CRUNCH"
      },{
         "val":4,
         "name":"HiGAIN STACK"
      },{
         "val":5,
         "name":"POWER DRIVE"
      },{
         "val":6,
         "name":"EXTREME LEAD"
      },{
         "val":7,
         "name":"CORE METAL"
      },{
         "val":8,
         "name":"JC-120"
      },{
         "val":9,
         "name":"CLEAN TWIN"
      },{
         "val":10,
         "name":"PRO CRUNCH"
      },{
         "val":11,
         "name":"TWEED"
      },{
         "val":12,
         "name":"DELUXE CRUNCH"
      },{
         "val":13,
         "name":"VO DRIVE"
      },{
         "val":14,
         "name":"VO LEAD"
      },{
         "val":15,
         "name":"MATCH DRIVE"
      },{
         "val":16,
         "name":"BG LEAD"
      },{
         "val":17,
         "name":"BG DRIVE"
      },{
         "val":18,
         "name":"MS1959 I"
      },{
         "val":19,
         "name":"MS1959 I+II"
      },{
         "val":20,
         "name":"R-FIER VINTAGE"
      },{
         "val":21,
         "name":"R-FIER MODERN"
      },{
         "val":22,
         "name":"T-AMP LEAD"
      },{
         "val":23,
         "name":"SLDN"
      },{
         "val":24,
         "name":"5150 DRIVE"
      },{
         "val":26,
         "name":"BGNR UB METAL"
      },{
         "val":27,
         "name":"ORNG ROCK REVERB"
      },{
         "val":25,
         "name":"CUSTOM"
      }];
      
      public static const PREAMP_SUB_TYPE_LIST:Object = {"CUSTOM":[{
         "val":0,
         "name":"JC CLEAN"
      },{
         "val":1,
         "name":"TW CLEAN"
      },{
         "val":2,
         "name":"CRUNCH"
      },{
         "val":3,
         "name":"COMBO DRIVE"
      },{
         "val":4,
         "name":"COMBO LEAD"
      },{
         "val":5,
         "name":"MS HiGAIN"
      },{
         "val":6,
         "name":"MODERN STACK"
      }]};
      
      public static const PREAMP_A_PARAMS_LIST:Object = {"DEFAULT":[{
         "sys1Id":"sys_system1_preamp_a_gain",
         "sys2Id":"sys_system2_preamp_a_gain",
         "sys3Id":"sys_system3_preamp_a_gain",
         "id":"preamp_a_gain",
         "page":1,
         "row":1,
         "name":"GAIN",
         "min":0,
         "max":120,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_gain_sw",
         "sys2Id":"sys_system2_preamp_a_gain_sw",
         "sys3Id":"sys_system3_preamp_a_gain_sw",
         "id":"preamp_a_gain_sw",
         "page":1,
         "row":1,
         "name":"GAIN SW",
         "min":0,
         "max":2,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_t_comp",
         "sys2Id":"sys_system2_preamp_a_t_comp",
         "sys3Id":"sys_system3_preamp_a_t_comp",
         "id":"preamp_a_t_comp",
         "page":1,
         "row":1,
         "name":"T-COMP",
         "min":-10,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_level",
         "sys2Id":"sys_system2_preamp_a_level",
         "sys3Id":"sys_system3_preamp_a_level",
         "id":"preamp_a_level",
         "page":1,
         "row":1,
         "name":"LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_bright",
         "sys2Id":"sys_system2_preamp_a_bright",
         "sys3Id":"sys_system3_preamp_a_bright",
         "id":"preamp_a_bright",
         "page":1,
         "row":2,
         "name":"BRIGHT",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_bass",
         "sys2Id":"sys_system2_preamp_a_bass",
         "sys3Id":"sys_system3_preamp_a_bass",
         "id":"preamp_a_bass",
         "page":1,
         "row":2,
         "name":"BASS",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_middle",
         "sys2Id":"sys_system2_preamp_a_middle",
         "sys3Id":"sys_system3_preamp_a_middle",
         "id":"preamp_a_middle",
         "page":1,
         "row":2,
         "name":"MIDDLE",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_treble",
         "sys2Id":"sys_system2_preamp_a_treble",
         "sys3Id":"sys_system3_preamp_a_treble",
         "id":"preamp_a_treble",
         "page":1,
         "row":2,
         "name":"TREBLE",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_presence",
         "sys2Id":"sys_system2_preamp_a_presence",
         "sys3Id":"sys_system3_preamp_a_presence",
         "id":"preamp_a_presence",
         "page":1,
         "row":2,
         "name":"PRESENCE",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_solo_sw",
         "sys2Id":"sys_system2_preamp_a_solo_sw",
         "sys3Id":"sys_system3_preamp_a_solo_sw",
         "id":"preamp_a_solo_sw",
         "page":2,
         "row":1,
         "name":"SOLO SW",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_solo_level",
         "sys2Id":"sys_system2_preamp_a_solo_level",
         "sys3Id":"sys_system3_preamp_a_solo_level",
         "id":"preamp_a_solo_level",
         "page":2,
         "row":1,
         "name":"SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_char",
         "sys2Id":"sys_system2_preamp_a_custom_char",
         "sys3Id":"sys_system3_preamp_a_custom_char",
         "id":"preamp_a_custom_char",
         "page":3,
         "row":1,
         "name":"CUSTOM CHARACTER",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_bottom",
         "sys2Id":"sys_system2_preamp_a_custom_bottom",
         "sys3Id":"sys_system3_preamp_a_custom_bottom",
         "id":"preamp_a_custom_bottom",
         "page":3,
         "row":1,
         "name":"CUSTOM BOTTOM",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_edge",
         "sys2Id":"sys_system2_preamp_a_custom_edge",
         "sys3Id":"sys_system3_preamp_a_custom_edge",
         "id":"preamp_a_custom_edge",
         "page":3,
         "row":1,
         "name":"CUSTOM EDGE",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_preamp_low",
         "sys2Id":"sys_system2_preamp_a_custom_preamp_low",
         "sys3Id":"sys_system3_preamp_a_custom_preamp_low",
         "id":"preamp_a_custom_preamp_low",
         "page":3,
         "row":2,
         "name":"CUSTOM PREAMP LOW",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_preamp_high",
         "sys2Id":"sys_system1_preamp_a_custom_preamp_high",
         "sys3Id":"sys_system3_preamp_a_custom_preamp_high",
         "id":"preamp_a_custom_preamp_high",
         "page":3,
         "row":2,
         "name":"CUSTOM PREAMP HIGH",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_sp_type",
         "sys2Id":"sys_system2_preamp_a_sp_type",
         "sys3Id":"sys_system3_preamp_a_sp_type",
         "id":"preamp_a_sp_type",
         "page":4,
         "row":1,
         "name":"SP TYPE",
         "min":0,
         "max":9,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_mic_type",
         "sys2Id":"sys_system2_preamp_a_mic_type",
         "sys3Id":"sys_system3_preamp_a_mic_type",
         "id":"preamp_a_mic_type",
         "page":4,
         "row":1,
         "name":"MIC TYPE",
         "min":0,
         "max":4,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_mic_dis",
         "sys2Id":"sys_system2_preamp_a_mic_dis",
         "sys3Id":"sys_system3_preamp_a_mic_dis",
         "id":"preamp_a_mic_dis",
         "page":4,
         "row":1,
         "name":"MIC DISTANCE",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_mic_pos",
         "sys2Id":"sys_system2_preamp_a_mic_pos",
         "sys3Id":"sys_system3_preamp_a_mic_pos",
         "id":"preamp_a_mic_pos",
         "page":4,
         "row":1,
         "name":"MIC POSITION",
         "min":0,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_mic_level",
         "sys2Id":"sys_system2_preamp_a_mic_level",
         "sys3Id":"sys_system3_preamp_a_mic_level",
         "id":"preamp_a_mic_level",
         "page":4,
         "row":1,
         "name":"MIC LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_direct_mix",
         "sys2Id":"sys_system2_preamp_a_direct_mix",
         "sys3Id":"sys_system3_preamp_a_direct_mix",
         "id":"preamp_a_direct_mix",
         "page":4,
         "row":2,
         "name":"DIRECT MIX",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_sp_size",
         "sys2Id":"sys_system2_preamp_a_custom_sp_size",
         "sys3Id":"sys_system3_preamp_a_custom_sp_size",
         "id":"preamp_a_custom_sp_size",
         "page":5,
         "row":1,
         "name":"CUSTOM SPEAKER SIZE",
         "min":0,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_sp_num",
         "sys2Id":"sys_system2_preamp_a_custom_sp_num",
         "sys3Id":"sys_system3_preamp_a_custom_sp_num",
         "id":"preamp_a_custom_sp_num",
         "page":5,
         "row":1,
         "name":"CUSTOM SPEAKER NUMBER",
         "min":0,
         "max":3,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_sp_cabinet",
         "sys2Id":"sys_system2_preamp_a_custom_sp_cabinet",
         "sys3Id":"sys_system3_preamp_a_custom_sp_cabinet",
         "id":"preamp_a_custom_sp_cabinet",
         "page":5,
         "row":1,
         "name":"CUSTOM CABINET",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_sp_color_low",
         "sys2Id":"sys_system2_preamp_a_custom_sp_color_low",
         "sys3Id":"sys_system3_preamp_a_custom_sp_color_low",
         "id":"preamp_a_custom_sp_color_low",
         "page":5,
         "row":2,
         "name":"CUSTOM COLOR LOW",
         "min":-10,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_a_custom_sp_color_high",
         "sys2Id":"sys_system2_preamp_a_custom_sp_color_high",
         "sys3Id":"sys_system3_preamp_a_custom_sp_color_high",
         "id":"preamp_a_custom_sp_color_high",
         "page":5,
         "row":2,
         "name":"CUSTOM COLOR HIGH",
         "min":-10,
         "max":10,
         "step":1
      }]};
      
      public static const PREAMP_B_PARAMS_LIST:Object = {"DEFAULT":[{
         "sys1Id":"sys_system1_preamp_b_gain",
         "sys2Id":"sys_system2_preamp_b_gain",
         "sys3Id":"sys_system3_preamp_b_gain",
         "id":"preamp_b_gain",
         "page":1,
         "row":1,
         "name":"GAIN",
         "min":0,
         "max":120,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_gain_sw",
         "sys2Id":"sys_system2_preamp_b_gain_sw",
         "sys3Id":"sys_system3_preamp_b_gain_sw",
         "id":"preamp_b_gain_sw",
         "page":1,
         "row":1,
         "name":"GAIN SW",
         "min":0,
         "max":2,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_t_comp",
         "sys2Id":"sys_system2_preamp_b_t_comp",
         "sys3Id":"sys_system3_preamp_b_t_comp",
         "id":"preamp_b_t_comp",
         "page":1,
         "row":1,
         "name":"T-COMP",
         "min":-10,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_level",
         "sys2Id":"sys_system2_preamp_b_level",
         "sys3Id":"sys_system3_preamp_b_level",
         "id":"preamp_b_level",
         "page":1,
         "row":1,
         "name":"LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_bright",
         "sys2Id":"sys_system2_preamp_b_bright",
         "sys3Id":"sys_system3_preamp_b_bright",
         "id":"preamp_b_bright",
         "page":1,
         "row":2,
         "name":"BRIGHT",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_bass",
         "sys2Id":"sys_system2_preamp_b_bass",
         "sys3Id":"sys_system3_preamp_b_bass",
         "id":"preamp_b_bass",
         "page":1,
         "row":2,
         "name":"BASS",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_middle",
         "sys2Id":"sys_system2_preamp_b_middle",
         "sys3Id":"sys_system3_preamp_b_middle",
         "id":"preamp_b_middle",
         "page":1,
         "row":2,
         "name":"MIDDLE",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_treble",
         "sys2Id":"sys_system2_preamp_b_treble",
         "sys3Id":"sys_system3_preamp_b_treble",
         "id":"preamp_b_treble",
         "page":1,
         "row":2,
         "name":"TREBLE",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_presence",
         "sys2Id":"sys_system2_preamp_b_presence",
         "sys3Id":"sys_system3_preamp_b_presence",
         "id":"preamp_b_presence",
         "page":1,
         "row":2,
         "name":"PRESENCE",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_solo_sw",
         "sys2Id":"sys_system2_preamp_b_solo_sw",
         "sys3Id":"sys_system3_preamp_b_solo_sw",
         "id":"preamp_b_solo_sw",
         "page":2,
         "row":1,
         "name":"SOLO SW",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_solo_level",
         "sys2Id":"sys_system2_preamp_b_solo_level",
         "sys3Id":"sys_system3_preamp_b_solo_level",
         "id":"preamp_b_solo_level",
         "page":2,
         "row":1,
         "name":"SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_char",
         "sys2Id":"sys_system2_preamp_b_custom_char",
         "sys3Id":"sys_system3_preamp_b_custom_char",
         "id":"preamp_b_custom_char",
         "page":3,
         "row":1,
         "name":"CUSTOM CHARACTER",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_bottom",
         "sys2Id":"sys_system2_preamp_b_custom_bottom",
         "sys3Id":"sys_system3_preamp_b_custom_bottom",
         "id":"preamp_b_custom_bottom",
         "page":3,
         "row":1,
         "name":"CUSTOM BOTTOM",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_edge",
         "sys2Id":"sys_system2_preamp_b_custom_edge",
         "sys3Id":"sys_system3_preamp_b_custom_edge",
         "id":"preamp_b_custom_edge",
         "page":3,
         "row":1,
         "name":"CUSTOM EDGE",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_preamp_low",
         "sys2Id":"sys_system2_preamp_b_custom_preamp_low",
         "sys3Id":"sys_system3_preamp_b_custom_preamp_low",
         "id":"preamp_b_custom_preamp_low",
         "page":3,
         "row":2,
         "name":"CUSTOM PREAMP LOW",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_preamp_high",
         "sys2Id":"sys_system2_preamp_b_custom_preamp_high",
         "sys3Id":"sys_system3_preamp_b_custom_preamp_high",
         "id":"preamp_b_custom_preamp_high",
         "page":3,
         "row":2,
         "name":"CUSTOM PREAMP HIGH",
         "min":-50,
         "max":50,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_sp_type",
         "sys2Id":"sys_system2_preamp_b_sp_type",
         "sys3Id":"sys_system3_preamp_b_sp_type",
         "id":"preamp_b_sp_type",
         "page":4,
         "row":1,
         "name":"SP TYPE",
         "min":0,
         "max":9,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_mic_type",
         "sys2Id":"sys_system2_preamp_b_mic_type",
         "sys3Id":"sys_system3_preamp_b_mic_type",
         "id":"preamp_b_mic_type",
         "page":4,
         "row":1,
         "name":"MIC TYPE",
         "min":0,
         "max":4,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_mic_dis",
         "sys2Id":"sys_system2_preamp_b_mic_dis",
         "sys3Id":"sys_system3_preamp_b_mic_dis",
         "id":"preamp_b_mic_dis",
         "page":4,
         "row":1,
         "name":"MIC DISTANCE",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_mic_pos",
         "sys2Id":"sys_system2_preamp_b_mic_pos",
         "sys3Id":"sys_system3_preamp_b_mic_pos",
         "id":"preamp_b_mic_pos",
         "page":4,
         "row":1,
         "name":"MIC POSITION",
         "min":0,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_mic_level",
         "sys2Id":"sys_system2_preamp_b_mic_level",
         "sys3Id":"sys_system3_preamp_b_mic_level",
         "id":"preamp_b_mic_level",
         "page":4,
         "row":1,
         "name":"MIC LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_direct_mix",
         "sys2Id":"sys_system2_preamp_b_direct_mix",
         "sys3Id":"sys_system3_preamp_b_direct_mix",
         "id":"preamp_b_direct_mix",
         "page":4,
         "row":2,
         "name":"DIRECT MIX",
         "min":0,
         "max":100,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_sp_size",
         "sys2Id":"sys_system2_preamp_b_custom_sp_size",
         "sys3Id":"sys_system3_preamp_b_custom_sp_size",
         "id":"preamp_b_custom_sp_size",
         "page":5,
         "row":1,
         "name":"CUSTOM SPEAKER SIZE",
         "min":0,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_sp_num",
         "sys2Id":"sys_system2_preamp_b_custom_sp_num",
         "sys3Id":"sys_system3_preamp_b_custom_sp_num",
         "id":"preamp_b_custom_sp_num",
         "page":5,
         "row":1,
         "name":"CUSTOM SPEAKER NUMBER",
         "min":0,
         "max":3,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_sp_cabinet",
         "sys2Id":"sys_system2_preamp_b_custom_sp_cabinet",
         "sys3Id":"sys_system3_preamp_b_custom_sp_cabinet",
         "id":"preamp_b_custom_sp_cabinet",
         "page":5,
         "row":1,
         "name":"CUSTOM CABINET",
         "min":0,
         "max":1,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_sp_color_low",
         "sys2Id":"sys_system2_preamp_b_custom_sp_color_low",
         "sys3Id":"sys_system3_preamp_b_custom_sp_color_low",
         "id":"preamp_b_custom_sp_color_low",
         "page":5,
         "row":2,
         "name":"CUSTOM COLOR LOW",
         "min":-10,
         "max":10,
         "step":1
      },{
         "sys1Id":"sys_system1_preamp_b_custom_sp_color_high",
         "sys2Id":"sys_system2_preamp_b_custom_sp_color_high",
         "sys3Id":"sys_system3_preamp_b_custom_sp_color_high",
         "id":"preamp_b_custom_sp_color_high",
         "page":5,
         "row":2,
         "name":"CUSTOM COLOR HIGH",
         "min":-10,
         "max":10,
         "step":1
      }]};
      
      public static const EQ_TYPE:Array = [{
         "val":0,
         "name":"PARAMETRIC EQ"
      },{
         "val":1,
         "name":"GE-10"
      }];
      
      public static const EQ_PARAMS_LIST:Object = {
         "DEFAULT":[{
            "id":"eq_low_gain",
            "page":1,
            "row":1,
            "name":"LOW GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"eq_low_mid_gain",
            "page":1,
            "row":1,
            "name":"LOW-MID GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"eq_high_mid_gain",
            "page":1,
            "row":1,
            "name":"HIGH-MID GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"eq_high_gain",
            "page":1,
            "row":1,
            "name":"HIGH GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"eq_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"eq_low_mid_freq",
            "page":1,
            "row":2,
            "name":"LOW-MID FREQ",
            "min":0,
            "max":27,
            "step":1
         },{
            "id":"eq_low_mid_q",
            "page":1,
            "row":2,
            "name":"LOW-MID Q",
            "min":0,
            "max":5,
            "step":1
         },{
            "id":"eq_high_mid_freq",
            "page":1,
            "row":2,
            "name":"HIGH-MID FREQ",
            "min":0,
            "max":27,
            "step":1
         },{
            "id":"eq_high_mid_q",
            "page":1,
            "row":2,
            "name":"HIGH-MID Q",
            "min":0,
            "max":5,
            "step":1
         },{
            "id":"eq_low_cut",
            "page":2,
            "row":1,
            "name":"LOW CUT",
            "min":0,
            "max":17,
            "step":1
         },{
            "id":"eq_high_cut",
            "page":2,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"eq_position",
            "page":2,
            "row":2,
            "name":"POSITION",
            "min":0,
            "max":1,
            "step":1
         }],
         "GE-10":[{
            "id":"eq_geq_31hz",
            "page":1,
            "row":1,
            "name":"31Hz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_62hz",
            "page":1,
            "row":1,
            "name":"62Hz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_125hz",
            "page":1,
            "row":1,
            "name":"125Hz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_250hz",
            "page":1,
            "row":1,
            "name":"250Hz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_500hz",
            "page":1,
            "row":1,
            "name":"500Hz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_1khz",
            "page":1,
            "row":1,
            "name":"1KHz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_2khz",
            "page":1,
            "row":1,
            "name":"2KHz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_4khz",
            "page":1,
            "row":1,
            "name":"4KHz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_8khz",
            "page":1,
            "row":1,
            "name":"8KHz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_16khz",
            "page":1,
            "row":1,
            "name":"16KHz",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_geq_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":-12,
            "max":12,
            "step":0.5,
            "precision":1
         },{
            "id":"eq_position",
            "page":2,
            "row":1,
            "name":"POSITION",
            "min":0,
            "max":1,
            "step":1
         }]
      };
      
      public static const FX2_TYPE:Array = [{
         "val":29,
         "name":"CHORUS"
      },{
         "val":20,
         "name":"FLANGER"
      },{
         "val":19,
         "name":"PHASER"
      },{
         "val":23,
         "name":"UNI-V"
      },{
         "val":21,
         "name":"TREMOLO"
      },{
         "val":26,
         "name":"VIBRATO"
      },{
         "val":22,
         "name":"ROTARY"
      },{
         "val":27,
         "name":"RING MOD"
      },{
         "val":10,
         "name":"SLOW GEAR"
      },{
         "val":25,
         "name":"SLICER"
      },{
         "val":3,
         "name":"COMP"
      },{
         "val":4,
         "name":"LIMITER"
      },{
         "val":0,
         "name":"T.WAH"
      },{
         "val":1,
         "name":"AUTO WAH"
      },{
         "val":2,
         "name":"PEDAL WAH"
      },{
         "val":6,
         "name":"GRAPHIC EQ"
      },{
         "val":7,
         "name":"PARAMETRIC EQ"
      },{
         "val":9,
         "name":"GUITAR SIM"
      },{
         "val":31,
         "name":"AC.GUITAR SIM"
      },{
         "val":18,
         "name":"AC.PROCESSOR"
      },{
         "val":12,
         "name":"WAVE SYNTH"
      },{
         "val":14,
         "name":"OCTAVE"
      },{
         "val":39,
         "name":"HEAVY OCTAVE"
      },{
         "val":15,
         "name":"PITCH SHIFTER"
      },{
         "val":16,
         "name":"HARMONIST"
      },{
         "val":28,
         "name":"HUMANIZER"
      },{
         "val":35,
         "name":"PHASER 90E"
      },{
         "val":36,
         "name":"FLANGER 117E"
      },{
         "val":37,
         "name":"WAH 95E"
      },{
         "val":38,
         "name":"DC-30"
      }];
      
      public static const FX1_TYPE:Array = [{
         "val":29,
         "name":"CHORUS"
      },{
         "val":20,
         "name":"FLANGER"
      },{
         "val":19,
         "name":"PHASER"
      },{
         "val":23,
         "name":"UNI-V"
      },{
         "val":21,
         "name":"TREMOLO"
      },{
         "val":26,
         "name":"VIBRATO"
      },{
         "val":22,
         "name":"ROTARY"
      },{
         "val":27,
         "name":"RING MOD"
      },{
         "val":10,
         "name":"SLOW GEAR"
      },{
         "val":25,
         "name":"SLICER"
      },{
         "val":3,
         "name":"COMP"
      },{
         "val":4,
         "name":"LIMITER"
      },{
         "val":0,
         "name":"T.WAH"
      },{
         "val":1,
         "name":"AUTO WAH"
      },{
         "val":2,
         "name":"PEDAL WAH"
      },{
         "val":6,
         "name":"GRAPHIC EQ"
      },{
         "val":7,
         "name":"PARAMETRIC EQ"
      },{
         "val":9,
         "name":"GUITAR SIM"
      },{
         "val":31,
         "name":"AC.GUITAR SIM"
      },{
         "val":18,
         "name":"AC.PROCESSOR"
      },{
         "val":12,
         "name":"WAVE SYNTH"
      },{
         "val":14,
         "name":"OCTAVE"
      },{
         "val":39,
         "name":"HEAVY OCTAVE"
      },{
         "val":15,
         "name":"PITCH SHIFTER"
      },{
         "val":16,
         "name":"HARMONIST"
      },{
         "val":28,
         "name":"HUMANIZER"
      },{
         "val":35,
         "name":"PHASER 90E"
      },{
         "val":36,
         "name":"FLANGER 117E"
      },{
         "val":37,
         "name":"WAH 95E"
      },{
         "val":38,
         "name":"DC-30"
      }];
      
      public static const FX1_SUB_TYPE_LIST:Object = {
         "PEDAL WAH":[{
            "val":0,
            "name":"CRY WAH"
         },{
            "val":1,
            "name":"VO WAH"
         },{
            "val":2,
            "name":"FAT WAH"
         },{
            "val":3,
            "name":"LIGHT WAH"
         },{
            "val":4,
            "name":"7STRING WAH"
         },{
            "val":5,
            "name":"RESO WAH"
         }],
         "COMP":[{
            "val":0,
            "name":"BOSS COMP"
         },{
            "val":1,
            "name":"HI-BAND"
         },{
            "val":2,
            "name":"LIGHT"
         },{
            "val":3,
            "name":"D-COMP"
         },{
            "val":4,
            "name":"ORANGE"
         },{
            "val":5,
            "name":"FAT"
         },{
            "val":6,
            "name":"MILD"
         }],
         "LIMITER":[{
            "val":0,
            "name":"BOSS LIMITER"
         },{
            "val":1,
            "name":"RACK 160D"
         },{
            "val":2,
            "name":"VTG RACK U"
         }],
         "SUB OD/DS":[{
            "val":0,
            "name":"MID BOOST"
         },{
            "val":1,
            "name":"CLEAN BOOST"
         },{
            "val":2,
            "name":"TREBLE BOOST"
         },{
            "val":3,
            "name":"CRUNCH"
         },{
            "val":4,
            "name":"NATURAL OD"
         },{
            "val":5,
            "name":"WARM OD"
         },{
            "val":6,
            "name":"FAT DS"
         },{
            "val":7,
            "name":"LEAD DS"
         },{
            "val":8,
            "name":"METAL DS"
         },{
            "val":9,
            "name":"OCT FUZZ"
         },{
            "val":10,
            "name":"BLUES OD"
         },{
            "val":11,
            "name":"OD-1"
         },{
            "val":12,
            "name":"T-SCREAM"
         },{
            "val":13,
            "name":"TURBO OD"
         },{
            "val":14,
            "name":"DISTORTION"
         },{
            "val":15,
            "name":"RAT"
         },{
            "val":16,
            "name":"GUV DS"
         },{
            "val":17,
            "name":"DST+"
         },{
            "val":18,
            "name":"METAL ZONE"
         },{
            "val":19,
            "name":"\'60S FUZZ"
         },{
            "val":20,
            "name":"MUFF FUZZ"
         }],
         "TONE MODIFY":[{
            "val":0,
            "name":"FAT"
         },{
            "val":1,
            "name":"PRESENCE"
         },{
            "val":2,
            "name":"MILD"
         },{
            "val":3,
            "name":"TIGHT"
         },{
            "val":4,
            "name":"ENHANCE"
         },{
            "val":5,
            "name":"RESONATOR1"
         },{
            "val":6,
            "name":"RESONATOR2"
         },{
            "val":7,
            "name":"RESONATOR3"
         }],
         "GUITAR SIM":[{
            "val":0,
            "name":"S->H"
         },{
            "val":1,
            "name":"H->S"
         },{
            "val":2,
            "name":"H->HF"
         },{
            "val":3,
            "name":"S->HOLLOW"
         },{
            "val":4,
            "name":"H->HOLLOW"
         },{
            "val":5,
            "name":"S->AC"
         },{
            "val":6,
            "name":"H->AC"
         },{
            "val":7,
            "name":"P->AC"
         }],
         "WAVE SYNTH":[{
            "val":0,
            "name":"SAW"
         },{
            "val":1,
            "name":"SQUARE"
         }],
         "PITCH SHIFTER":[{
            "val":0,
            "name":"1VOICE"
         },{
            "val":1,
            "name":"2VOICE"
         }],
         "HARMONIST":[{
            "val":0,
            "name":"1VOICE"
         },{
            "val":1,
            "name":"2VOICE"
         }],
         "AC.PROCESSOR":[{
            "val":0,
            "name":"SMALL"
         },{
            "val":1,
            "name":"MEDIUM"
         },{
            "val":2,
            "name":"BRIGHT"
         },{
            "val":3,
            "name":"POWER"
         }],
         "PHASER":[{
            "val":0,
            "name":"4STAGE"
         },{
            "val":1,
            "name":"8STAGE"
         },{
            "val":2,
            "name":"12STAGE"
         },{
            "val":3,
            "name":"BiPHASE"
         }],
         "PAN":[{
            "val":0,
            "name":"AUTO"
         },{
            "val":1,
            "name":"MANUAL"
         }],
         "RING MOD":[{
            "val":0,
            "name":"NORMAL"
         },{
            "val":1,
            "name":"INTELLIGENT"
         }],
         "HUMANIZER":[{
            "val":0,
            "name":"PICKING"
         },{
            "val":1,
            "name":"AUTO"
         }],
         "SUB DELAY":[{
            "val":0,
            "name":"MONO"
         },{
            "val":1,
            "name":"PAN"
         }],
         "TERA ECHO":[{
            "val":0,
            "name":"MONO"
         },{
            "val":1,
            "name":"STEREO1"
         },{
            "val":2,
            "name":"STEREO2"
         }],
         "DC-30":[{
            "val":0,
            "name":"CHORUS"
         },{
            "val":1,
            "name":"ECHO"
         }]
      };
      
      public static const FX2_SUB_TYPE_LIST:Object = {
         "PEDAL WAH":[{
            "val":0,
            "name":"CRY WAH"
         },{
            "val":1,
            "name":"VO WAH"
         },{
            "val":2,
            "name":"FAT WAH"
         },{
            "val":3,
            "name":"LIGHT WAH"
         },{
            "val":4,
            "name":"7STRING WAH"
         },{
            "val":5,
            "name":"RESO WAH"
         }],
         "COMP":[{
            "val":0,
            "name":"BOSS COMP"
         },{
            "val":1,
            "name":"HI-BAND"
         },{
            "val":2,
            "name":"LIGHT"
         },{
            "val":3,
            "name":"D-COMP"
         },{
            "val":4,
            "name":"ORANGE"
         },{
            "val":5,
            "name":"FAT"
         },{
            "val":6,
            "name":"MILD"
         }],
         "LIMITER":[{
            "val":0,
            "name":"BOSS LIMITER"
         },{
            "val":1,
            "name":"RACK 160D"
         },{
            "val":2,
            "name":"VTG RACK U"
         }],
         "SUB OD/DS":[{
            "val":0,
            "name":"MID BOOST"
         },{
            "val":1,
            "name":"CLEAN BOOST"
         },{
            "val":2,
            "name":"TREBLE BOOST"
         },{
            "val":3,
            "name":"CRUNCH"
         },{
            "val":4,
            "name":"NATURAL OD"
         },{
            "val":5,
            "name":"WARM OD"
         },{
            "val":6,
            "name":"FAT DS"
         },{
            "val":7,
            "name":"LEAD DS"
         },{
            "val":8,
            "name":"METAL DS"
         },{
            "val":9,
            "name":"OCT FUZZ"
         },{
            "val":21,
            "name":"A-DIST"
         },{
            "val":10,
            "name":"BLUES OD"
         },{
            "val":11,
            "name":"OD-1"
         },{
            "val":12,
            "name":"T-SCREAM"
         },{
            "val":13,
            "name":"TURBO OD"
         },{
            "val":14,
            "name":"DISTORTION"
         },{
            "val":15,
            "name":"RAT"
         },{
            "val":16,
            "name":"GUV DS"
         },{
            "val":17,
            "name":"DST+"
         },{
            "val":18,
            "name":"METAL ZONE"
         },{
            "val":19,
            "name":"\'60S FUZZ"
         },{
            "val":20,
            "name":"MUFF FUZZ"
         }],
         "TONE MODIFY":[{
            "val":0,
            "name":"FAT"
         },{
            "val":1,
            "name":"PRESENCE"
         },{
            "val":2,
            "name":"MILD"
         },{
            "val":3,
            "name":"TIGHT"
         },{
            "val":4,
            "name":"ENHANCE"
         },{
            "val":5,
            "name":"RESONATOR1"
         },{
            "val":6,
            "name":"RESONATOR2"
         },{
            "val":7,
            "name":"RESONATOR3"
         }],
         "GUITAR SIM":[{
            "val":0,
            "name":"S->H"
         },{
            "val":1,
            "name":"H->S"
         },{
            "val":2,
            "name":"H->HF"
         },{
            "val":3,
            "name":"S->HOLLOW"
         },{
            "val":4,
            "name":"H->HOLLOW"
         },{
            "val":5,
            "name":"S->AC"
         },{
            "val":6,
            "name":"H->AC"
         },{
            "val":7,
            "name":"P->AC"
         }],
         "WAVE SYNTH":[{
            "val":0,
            "name":"SAW"
         },{
            "val":1,
            "name":"SQUARE"
         }],
         "PITCH SHIFTER":[{
            "val":0,
            "name":"1VOICE"
         },{
            "val":1,
            "name":"2VOICE"
         }],
         "HARMONIST":[{
            "val":0,
            "name":"1VOICE"
         },{
            "val":1,
            "name":"2VOICE"
         }],
         "AC.PROCESSOR":[{
            "val":0,
            "name":"SMALL"
         },{
            "val":1,
            "name":"MEDIUM"
         },{
            "val":2,
            "name":"BRIGHT"
         },{
            "val":3,
            "name":"POWER"
         }],
         "PHASER":[{
            "val":0,
            "name":"4STAGE"
         },{
            "val":1,
            "name":"8STAGE"
         },{
            "val":2,
            "name":"12STAGE"
         },{
            "val":3,
            "name":"BiPHASE"
         }],
         "PAN":[{
            "val":0,
            "name":"AUTO"
         },{
            "val":1,
            "name":"MANUAL"
         }],
         "RING MOD":[{
            "val":0,
            "name":"NORMAL"
         },{
            "val":1,
            "name":"INTELLIGENT"
         }],
         "HUMANIZER":[{
            "val":0,
            "name":"PICKING"
         },{
            "val":1,
            "name":"AUTO"
         }],
         "SUB DELAY":[{
            "val":0,
            "name":"MONO"
         },{
            "val":1,
            "name":"PAN"
         }],
         "TERA ECHO":[{
            "val":0,
            "name":"MONO"
         },{
            "val":1,
            "name":"STEREO1"
         },{
            "val":2,
            "name":"STEREO2"
         }],
         "DC-30":[{
            "val":0,
            "name":"CHORUS"
         },{
            "val":1,
            "name":"ECHO"
         }]
      };
      
      public static const FX1_PARAMS_LIST:Object = {
         "T.WAH":[{
            "id":"fx1_t_wah_mode",
            "page":1,
            "row":1,
            "name":"MODE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx1_t_wah_polar",
            "page":1,
            "row":1,
            "name":"POLAR",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx1_t_wah_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_t_wah_freq",
            "page":1,
            "row":1,
            "name":"FREQ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_t_wah_peak",
            "page":1,
            "row":1,
            "name":"PEAK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_t_wah_effect_level",
            "page":1,
            "row":2,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_t_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "AUTO WAH":[{
            "id":"fx1_auto_wah_mode",
            "page":1,
            "row":1,
            "name":"MODE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx1_auto_wah_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_auto_wah_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_auto_wah_freq",
            "page":1,
            "row":1,
            "name":"FREQ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_auto_wah_peak",
            "page":1,
            "row":1,
            "name":"PEAK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_auto_wah_effect_level",
            "page":1,
            "row":2,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_auto_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PEDAL WAH":[{
            "id":"fx1_sub_wah_pedal_pos",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_wah_pedal_min",
            "page":1,
            "row":1,
            "name":"PEDAL MIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_wah_pedal_max",
            "page":1,
            "row":1,
            "name":"PEDAL MAX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_wah_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "COMP":[{
            "id":"fx1_adv_comp_sustain",
            "page":1,
            "row":1,
            "name":"SUSTAIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_adv_comp_attack",
            "page":1,
            "row":1,
            "name":"ATTACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_adv_comp_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_adv_comp_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "LIMITER":[{
            "id":"fx1_limiter_thresh",
            "page":1,
            "row":1,
            "name":"THRESHOLD",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_limiter_ratio",
            "page":1,
            "row":1,
            "name":"RATIO",
            "min":0,
            "max":17,
            "step":1
         },{
            "id":"fx1_limiter_attack",
            "page":1,
            "row":1,
            "name":"ATTACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_limiter_release",
            "page":1,
            "row":1,
            "name":"RELEASE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_limiter_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "SUB OD/DS":[{
            "id":"fx1_sub_od_ds_drive",
            "page":1,
            "row":1,
            "name":"DRIVE",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"fx1_sub_od_ds_bottom",
            "page":1,
            "row":1,
            "name":"BOTTOM",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_sub_od_ds_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_sub_od_ds_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_od_ds_solo_sw",
            "page":1,
            "row":2,
            "name":"SOLO SW",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx1_sub_od_ds_solo_level",
            "page":1,
            "row":2,
            "name":"SOLO LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_od_ds_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "GRAPHIC EQ":[{
            "id":"fx1_graphic_eq_31hz",
            "page":1,
            "row":1,
            "name":"31Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_62hz",
            "page":1,
            "row":1,
            "name":"62Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_125hz",
            "page":1,
            "row":1,
            "name":"125Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_250hz",
            "page":1,
            "row":1,
            "name":"250Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_500hz",
            "page":1,
            "row":1,
            "name":"500Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_1khz",
            "page":1,
            "row":1,
            "name":"1kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_2khz",
            "page":1,
            "row":1,
            "name":"2kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_4khz",
            "page":1,
            "row":1,
            "name":"4kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_8khz",
            "page":1,
            "row":1,
            "name":"8kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_16khz",
            "page":1,
            "row":1,
            "name":"16kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_graphic_eq_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":-20,
            "max":20,
            "step":1
         }],
         "PARAMETRIC EQ":[{
            "id":"fx1_parametric_eq_low_gain",
            "page":1,
            "row":1,
            "name":"LOW GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_parametric_eq_low_mid_gain",
            "page":1,
            "row":1,
            "name":"LOW-MID GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_parametric_eq_high_mid_gain",
            "page":1,
            "row":1,
            "name":"HIGH-MID GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_parametric_eq_high_gain",
            "page":1,
            "row":1,
            "name":"HIGH GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_parametric_eq_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx1_parametric_eq_low_mid_freq",
            "page":1,
            "row":2,
            "name":"LOW-MID FREQ",
            "min":0,
            "max":27,
            "step":1
         },{
            "id":"fx1_parametric_eq_low_mid_q",
            "page":1,
            "row":2,
            "name":"LOW-MID Q",
            "min":0,
            "max":5,
            "step":1
         },{
            "id":"fx1_parametric_eq_high_mid_freq",
            "page":1,
            "row":2,
            "name":"HIGH-MID FREQ",
            "min":0,
            "max":27,
            "step":1
         },{
            "id":"fx1_parametric_eq_high_mid_q",
            "page":1,
            "row":2,
            "name":"HIGH-MID Q",
            "min":0,
            "max":5,
            "step":1
         },{
            "id":"fx1_parametric_eq_low_cut",
            "page":2,
            "row":1,
            "name":"LOW CUT",
            "min":0,
            "max":17,
            "step":1
         },{
            "id":"fx1_parametric_eq_high_cut",
            "page":2,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         }],
         "TONE MODIFY":[{
            "id":"fx1_tone_modify_low",
            "page":1,
            "row":1,
            "name":"LOW",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_tone_modify_high",
            "page":1,
            "row":1,
            "name":"HIGH",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_tone_modify_reso",
            "page":1,
            "row":1,
            "name":"RESONANCE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_tone_modify_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "GUITAR SIM":[{
            "id":"fx1_guitar_sim_low",
            "page":1,
            "row":1,
            "name":"LOW",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_guitar_sim_high",
            "page":1,
            "row":1,
            "name":"HIGH",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_guitar_sim_body",
            "page":1,
            "row":1,
            "name":"BODY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_guitar_sim_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "AC.GUITAR SIM":[{
            "id":"fx1_acsim_body",
            "page":1,
            "row":1,
            "name":"BODY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_acsim_low",
            "page":1,
            "row":1,
            "name":"LOW",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_acsim_high",
            "page":1,
            "row":1,
            "name":"HIGH",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_acsim_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "SLOW GEAR":[{
            "id":"fx1_slow_gear_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_slow_gear_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_slow_gear_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "DEFRETTER":[{
            "id":"fx1_defretter_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_defretter_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_defretter_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_defretter_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_defretter_attack",
            "page":1,
            "row":2,
            "name":"ATTACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_defretter_reso",
            "page":1,
            "row":2,
            "name":"RESONANCE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_defretter_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "WAVE SYNTH":[{
            "id":"fx1_wave_synth_cutoff",
            "page":1,
            "row":1,
            "name":"CUTOFF",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wave_synth_reso",
            "page":1,
            "row":1,
            "name":"RESONANCE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wave_synth_synth_level",
            "page":1,
            "row":1,
            "name":"SYNTH LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wave_synth_filter_sens",
            "page":1,
            "row":2,
            "name":"FILTER SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wave_synth_filter_decay",
            "page":1,
            "row":2,
            "name":"FILTER DECAY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wave_synth_filter_depth",
            "page":1,
            "row":2,
            "name":"FILTER DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wave_synth_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "SITAR SIM":[{
            "id":"fx1_sitar_sim_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sitar_sim_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sitar_sim_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_sitar_sim_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sitar_sim_reso",
            "page":1,
            "row":2,
            "name":"RESO",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sitar_sim_buzz",
            "page":1,
            "row":2,
            "name":"BUZZ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sitar_sim_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "OCTAVE":[{
            "id":"fx1_octave_range",
            "page":1,
            "row":1,
            "name":"RANGE",
            "min":0,
            "max":3,
            "step":1
         },{
            "id":"fx1_octave_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_octave_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PITCH SHIFTER":[{
            "id":"fx1_pitch_shifter_ps1pitch",
            "page":1,
            "row":1,
            "name":"PS1:PITCH",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps1level",
            "page":1,
            "row":1,
            "name":"PS1:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps2pitch",
            "page":1,
            "row":1,
            "name":"PS2:PITCH",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps2level",
            "page":1,
            "row":1,
            "name":"PS2:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pitch_shifter_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps1mode",
            "page":2,
            "row":1,
            "name":"PS1:MODE",
            "min":0,
            "max":3,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps1fine",
            "page":2,
            "row":1,
            "name":"PS1:FINE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps1pre_dly",
            "page":2,
            "row":1,
            "name":"PS1:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps1f_back",
            "page":2,
            "row":1,
            "name":"PS1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps2mode",
            "page":2,
            "row":2,
            "name":"PS2:MODE",
            "min":0,
            "max":3,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps2fine",
            "page":2,
            "row":2,
            "name":"PS2:FINE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_pitch_shifter_ps2pre_dly",
            "page":2,
            "row":2,
            "name":"PS2:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         }],
         "HARMONIST":[{
            "id":"fx1_harmonist_hr1harm",
            "page":1,
            "row":1,
            "name":"HR1:HARMONY",
            "min":0,
            "max":29,
            "step":1
         },{
            "id":"fx1_harmonist_hr2harm",
            "page":1,
            "row":1,
            "name":"HR2:HARMONY",
            "min":0,
            "max":29,
            "step":1
         },{
            "id":"master_key",
            "page":1,
            "row":1,
            "name":"MASTER KEY",
            "min":0,
            "max":11,
            "step":1
         },{
            "id":"fx1_harmonist_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_harmonist_hr1pre_dly",
            "page":2,
            "row":1,
            "name":"HR1:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         },{
            "id":"fx1_harmonist_hr1f_back",
            "page":2,
            "row":1,
            "name":"HR1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_harmonist_hr1level",
            "page":2,
            "row":1,
            "name":"HR1:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_harmonist_hr2pre_dly",
            "page":2,
            "row":2,
            "name":"HR2:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         },{
            "id":"fx1_harmonist_hr2level",
            "page":2,
            "row":2,
            "name":"HR2:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_harmonist_hr1c",
            "page":3,
            "row":1,
            "name":"HR1:C",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1db",
            "page":3,
            "row":1,
            "name":"HR1:Db",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1d",
            "page":3,
            "row":1,
            "name":"HR1:D",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1eb",
            "page":3,
            "row":1,
            "name":"HR1:Eb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1e",
            "page":3,
            "row":2,
            "name":"HR1:E",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1f",
            "page":3,
            "row":2,
            "name":"HR1:F",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1f_s",
            "page":3,
            "row":2,
            "name":"HR1:F#",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1g",
            "page":3,
            "row":2,
            "name":"HR1:G",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1ab",
            "page":4,
            "row":1,
            "name":"HR1:Ab",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1a",
            "page":4,
            "row":1,
            "name":"HR1:A",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1bb",
            "page":4,
            "row":1,
            "name":"HR1:Bb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr1b",
            "page":4,
            "row":1,
            "name":"HR1:B",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2c",
            "page":5,
            "row":1,
            "name":"HR2:C",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2db",
            "page":5,
            "row":1,
            "name":"HR2:Db",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2d",
            "page":5,
            "row":1,
            "name":"HR2:D",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2eb",
            "page":5,
            "row":1,
            "name":"HR2:Eb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2e",
            "page":5,
            "row":2,
            "name":"HR2:E",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2f",
            "page":5,
            "row":2,
            "name":"HR2:F",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2f_s",
            "page":5,
            "row":2,
            "name":"HR2:F#",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2g",
            "page":5,
            "row":2,
            "name":"HR2:G",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2ab",
            "page":6,
            "row":1,
            "name":"HR2:Ab",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2a",
            "page":6,
            "row":1,
            "name":"HR2:A",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2bb",
            "page":6,
            "row":1,
            "name":"HR2:Bb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx1_harmonist_hr2b",
            "page":6,
            "row":1,
            "name":"HR2:B",
            "min":-24,
            "max":24,
            "step":1
         }],
         "SOUND HOLD":[{
            "id":"fx1_sound_hold_hold",
            "page":1,
            "row":1,
            "name":"HOLD",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx1_sound_hold_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sound_hold_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "AC.PROCESSOR":[{
            "id":"fx1_ac_processor_bass",
            "page":1,
            "row":1,
            "name":"BASS",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_ac_processor_middle",
            "page":1,
            "row":1,
            "name":"MIDDLE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_ac_processor_treble",
            "page":1,
            "row":1,
            "name":"TREBLE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_ac_processor_presence",
            "page":1,
            "row":1,
            "name":"PRESENCE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx1_ac_processor_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_ac_processor_middle_freq",
            "page":1,
            "row":2,
            "name":"MIDDLE FREQ",
            "min":0,
            "max":27,
            "step":1
         }],
         "PHASER":[{
            "id":"fx1_phaser_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_phaser_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_phaser_reso",
            "page":1,
            "row":1,
            "name":"RESO",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_phaser_manual",
            "page":1,
            "row":1,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_phaser_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_phaser_step_rate",
            "page":1,
            "row":2,
            "name":"STEP RATE",
            "min":0,
            "max":101,
            "step":1
         },{
            "id":"fx1_phaser_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "FLANGER":[{
            "id":"fx1_flanger_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger_reso",
            "page":1,
            "row":1,
            "name":"RESO",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger_manual",
            "page":1,
            "row":1,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger_low_cut",
            "page":1,
            "row":2,
            "name":"LOW CUT",
            "min":0,
            "max":10,
            "step":1
         },{
            "id":"fx1_flanger_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "TREMOLO":[{
            "id":"fx1_tremolo_wave_shape",
            "page":1,
            "row":1,
            "name":"WAVE SHAPE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_tremolo_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_tremolo_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_tremolo_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "ROTARY":[{
            "id":"fx1_rotary_rate_fast",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_rotary_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_rotary_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "UNI-V":[{
            "id":"fx1_uni_v_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_uni_v_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_uni_v_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "PAN":[{
            "id":"fx1_pan_wave_shape",
            "page":1,
            "row":1,
            "name":"WAVE SHAPE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pan_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pan_pos",
            "page":1,
            "row":1,
            "name":"POSITION",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pan_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_pan_level",
            "page":1,
            "row":2,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "SLICER":[{
            "id":"fx1_slicer_pattern",
            "page":1,
            "row":1,
            "name":"PATTERN",
            "min":0,
            "max":19,
            "step":1
         },{
            "id":"fx1_slicer_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_slicer_trigger_sens",
            "page":1,
            "row":1,
            "name":"TRIGGER SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_slicer_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_slicer_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "VIBRATO":[{
            "id":"fx1_vibrato_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_vibrato_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_vibrato_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "RING MOD":[{
            "id":"fx1_ring_mod_freq",
            "page":1,
            "row":1,
            "name":"FREQUENCY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_ring_mod_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_ring_mod_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "HUMANIZER":[{
            "id":"fx1_humanizer_vowel1",
            "page":1,
            "row":1,
            "name":"VOWEL1",
            "min":0,
            "max":4,
            "step":1
         },{
            "id":"fx1_humanizer_vowel2",
            "page":1,
            "row":1,
            "name":"VOWEL2",
            "min":0,
            "max":4,
            "step":1
         },{
            "id":"fx1_humanizer_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_humanizer_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_humanizer_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_humanizer_sens",
            "page":1,
            "row":2,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_humanizer_manual",
            "page":1,
            "row":2,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         }],
         "CHORUS":[{
            "id":"fx1_2x2_chorus_low_rate",
            "page":1,
            "row":1,
            "name":"LOW RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_low_depth",
            "page":1,
            "row":1,
            "name":"LOW DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_low_pre_delay",
            "page":1,
            "row":1,
            "name":"LOW PRE DELAY",
            "min":0,
            "max":80,
            "step":1
         },{
            "id":"fx1_2x2_chorus_low_level",
            "page":1,
            "row":1,
            "name":"LOW LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_direct_level",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_high_rate",
            "page":1,
            "row":2,
            "name":"HIGH RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_high_depth",
            "page":1,
            "row":2,
            "name":"HIGH DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_high_pre_delay",
            "page":1,
            "row":2,
            "name":"HIGH PRE DELAY",
            "min":0,
            "max":80,
            "step":1
         },{
            "id":"fx1_2x2_chorus_high_level",
            "page":1,
            "row":2,
            "name":"HIGH LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_2x2_chorus_xover_freq",
            "page":1,
            "row":2,
            "name":"XOVER FREQUENCY",
            "min":0,
            "max":16,
            "step":1
         }],
         "SUB DELAY":[{
            "id":"fx1_sub_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"fx1_sub_delay_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_delay_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"fx1_sub_delay_tap_time",
            "page":1,
            "row":2,
            "name":"TAP TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_sub_delay_high_cut",
            "page":1,
            "row":2,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"fx1_sub_delay_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PHASER 90E":[{
            "id":"fx1_phaser90e_script",
            "page":1,
            "row":1,
            "name":"SCRIPT",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx1_phaser90e_speed",
            "page":1,
            "row":1,
            "name":"SPEED",
            "min":0,
            "max":100,
            "step":1
         }],
         "FLANGER 117E":[{
            "id":"fx1_flanger117e_manual",
            "page":1,
            "row":1,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger117e_width",
            "page":1,
            "row":1,
            "name":"WIDTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger117e_speed",
            "page":1,
            "row":1,
            "name":"SPEED",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_flanger117e_regen",
            "page":1,
            "row":1,
            "name":"REGEN.",
            "min":0,
            "max":100,
            "step":1
         }],
         "WAH 95E":[{
            "id":"fx1_wah95e_pedal_pos",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wah95e_pedal_min",
            "page":1,
            "row":1,
            "name":"PEDAL MIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wah95e_pedal_max",
            "page":1,
            "row":1,
            "name":"PEDAL MAX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wah95e_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_wah95e_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "DC-30":[{
            "id":"fx1_dc30_chorus_intensity",
            "page":1,
            "row":1,
            "name":"CHORUS INTENSITY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_dc30_echo_repeat_rate",
            "page":1,
            "row":1,
            "name":"ECHO REPEAT RATE",
            "min":40,
            "max":600,
            "step":1
         },{
            "id":"fx1_dc30_echo_intensity",
            "page":1,
            "row":1,
            "name":"ECHO INTENSITY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_dc30_echo_volume",
            "page":1,
            "row":1,
            "name":"ECHO VOLUME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_dc30_input_volume",
            "page":1,
            "row":2,
            "name":"INPUT VOLUME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_dc30_tone",
            "page":1,
            "row":2,
            "name":"TONE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_dc30_output",
            "page":1,
            "row":2,
            "name":"OUTPUT",
            "min":0,
            "max":1,
            "step":1
         }],
         "HEAVY OCTAVE":[{
            "id":"fx1_heavy_oct_1oct_level",
            "page":1,
            "row":1,
            "name":"1OCT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_heavy_oct_2oct_level",
            "page":1,
            "row":1,
            "name":"2OCT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx1_heavy_oct_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }]
      };
      
      public static const FX2_PARAMS_LIST:Object = {
         "T.WAH":[{
            "id":"fx2_t_wah_mode",
            "page":1,
            "row":1,
            "name":"MODE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx2_t_wah_polar",
            "page":1,
            "row":1,
            "name":"POLAR",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx2_t_wah_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_t_wah_freq",
            "page":1,
            "row":1,
            "name":"FREQ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_t_wah_peak",
            "page":1,
            "row":1,
            "name":"PEAK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_t_wah_effect_level",
            "page":1,
            "row":2,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_t_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "AUTO WAH":[{
            "id":"fx2_auto_wah_mode",
            "page":1,
            "row":1,
            "name":"MODE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx2_auto_wah_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_auto_wah_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_auto_wah_freq",
            "page":1,
            "row":1,
            "name":"FREQ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_auto_wah_peak",
            "page":1,
            "row":1,
            "name":"PEAK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_auto_wah_effect_level",
            "page":1,
            "row":2,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_auto_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PEDAL WAH":[{
            "id":"fx2_sub_wah_pedal_pos",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_wah_pedal_min",
            "page":1,
            "row":1,
            "name":"PEDAL MIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_wah_pedal_max",
            "page":1,
            "row":1,
            "name":"PEDAL MAX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_wah_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "COMP":[{
            "id":"fx2_adv_comp_sustain",
            "page":1,
            "row":1,
            "name":"SUSTAIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_adv_comp_attack",
            "page":1,
            "row":1,
            "name":"ATTACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_adv_comp_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_adv_comp_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "LIMITER":[{
            "id":"fx2_limiter_thresh",
            "page":1,
            "row":1,
            "name":"THRESHOLD",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_limiter_ratio",
            "page":1,
            "row":1,
            "name":"RATIO",
            "min":0,
            "max":17,
            "step":1
         },{
            "id":"fx2_limiter_attack",
            "page":1,
            "row":1,
            "name":"ATTACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_limiter_release",
            "page":1,
            "row":1,
            "name":"RELEASE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_limiter_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "SUB OD/DS":[{
            "id":"fx2_sub_od_ds_drive",
            "page":1,
            "row":1,
            "name":"DRIVE",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"fx2_sub_od_ds_bottom",
            "page":1,
            "row":1,
            "name":"BOTTOM",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_sub_od_ds_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_sub_od_ds_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_od_ds_solo_sw",
            "page":1,
            "row":2,
            "name":"SOLO SW",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx2_sub_od_ds_solo_level",
            "page":1,
            "row":2,
            "name":"SOLO LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_od_ds_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "GRAPHIC EQ":[{
            "id":"fx2_graphic_eq_31hz",
            "page":1,
            "row":1,
            "name":"31Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_62hz",
            "page":1,
            "row":1,
            "name":"62Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_125hz",
            "page":1,
            "row":1,
            "name":"125Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_250hz",
            "page":1,
            "row":1,
            "name":"250Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_500hz",
            "page":1,
            "row":1,
            "name":"500Hz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_1khz",
            "page":1,
            "row":1,
            "name":"1kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_2khz",
            "page":1,
            "row":1,
            "name":"2kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_4khz",
            "page":1,
            "row":1,
            "name":"4kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_8khz",
            "page":1,
            "row":1,
            "name":"8kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_16khz",
            "page":1,
            "row":1,
            "name":"16kHz",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_graphic_eq_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":-20,
            "max":20,
            "step":1
         }],
         "PARAMETRIC EQ":[{
            "id":"fx2_parametric_eq_low_gain",
            "page":1,
            "row":1,
            "name":"LOW GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_parametric_eq_low_mid_gain",
            "page":1,
            "row":1,
            "name":"LOW-MID GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_parametric_eq_high_mid_gain",
            "page":1,
            "row":1,
            "name":"HIGH-MID GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_parametric_eq_high_gain",
            "page":1,
            "row":1,
            "name":"HIGH GAIN",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_parametric_eq_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":-20,
            "max":20,
            "step":1
         },{
            "id":"fx2_parametric_eq_low_mid_freq",
            "page":1,
            "row":2,
            "name":"LOW-MID FREQ",
            "min":0,
            "max":27,
            "step":1
         },{
            "id":"fx2_parametric_eq_low_mid_q",
            "page":1,
            "row":2,
            "name":"LOW-MID Q",
            "min":0,
            "max":5,
            "step":1
         },{
            "id":"fx2_parametric_eq_high_mid_freq",
            "page":1,
            "row":2,
            "name":"HIGH-MID FREQ",
            "min":0,
            "max":27,
            "step":1
         },{
            "id":"fx2_parametric_eq_high_mid_q",
            "page":1,
            "row":2,
            "name":"HIGH-MID Q",
            "min":0,
            "max":5,
            "step":1
         },{
            "id":"fx2_parametric_eq_low_cut",
            "page":2,
            "row":1,
            "name":"LOW CUT",
            "min":0,
            "max":17,
            "step":1
         },{
            "id":"fx2_parametric_eq_high_cut",
            "page":2,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         }],
         "TONE MODIFY":[{
            "id":"fx2_tone_modify_low",
            "page":1,
            "row":1,
            "name":"LOW",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_tone_modify_high",
            "page":1,
            "row":1,
            "name":"HIGH",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_tone_modify_reso",
            "page":1,
            "row":1,
            "name":"RESONANCE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_tone_modify_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "GUITAR SIM":[{
            "id":"fx2_guitar_sim_low",
            "page":1,
            "row":1,
            "name":"LOW",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_guitar_sim_high",
            "page":1,
            "row":1,
            "name":"HIGH",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_guitar_sim_body",
            "page":1,
            "row":1,
            "name":"BODY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_guitar_sim_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "AC.GUITAR SIM":[{
            "id":"fx2_acsim_body",
            "page":1,
            "row":1,
            "name":"BODY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_acsim_low",
            "page":1,
            "row":1,
            "name":"LOW",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_acsim_high",
            "page":1,
            "row":1,
            "name":"HIGH",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_acsim_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "SLOW GEAR":[{
            "id":"fx2_slow_gear_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_slow_gear_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_slow_gear_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "DEFRETTER":[{
            "id":"fx2_defretter_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_defretter_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_defretter_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_defretter_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_defretter_attack",
            "page":1,
            "row":2,
            "name":"ATTACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_defretter_reso",
            "page":1,
            "row":2,
            "name":"RESONANCE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_defretter_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "WAVE SYNTH":[{
            "id":"fx2_wave_synth_cutoff",
            "page":1,
            "row":1,
            "name":"CUTOFF",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wave_synth_reso",
            "page":1,
            "row":1,
            "name":"RESONANCE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wave_synth_synth_level",
            "page":1,
            "row":1,
            "name":"SYNTH LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wave_synth_filter_sens",
            "page":1,
            "row":2,
            "name":"FILTER SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wave_synth_filter_decay",
            "page":1,
            "row":2,
            "name":"FILTER DECAY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wave_synth_filter_depth",
            "page":1,
            "row":2,
            "name":"FILTER DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wave_synth_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "SITAR SIM":[{
            "id":"fx2_sitar_sim_sens",
            "page":1,
            "row":1,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sitar_sim_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sitar_sim_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_sitar_sim_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sitar_sim_reso",
            "page":1,
            "row":2,
            "name":"RESO",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sitar_sim_buzz",
            "page":1,
            "row":2,
            "name":"BUZZ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sitar_sim_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "OCTAVE":[{
            "id":"fx2_octave_range",
            "page":1,
            "row":1,
            "name":"RANGE",
            "min":0,
            "max":3,
            "step":1
         },{
            "id":"fx2_octave_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_octave_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PITCH SHIFTER":[{
            "id":"fx2_pitch_shifter_ps1pitch",
            "page":1,
            "row":1,
            "name":"PS1:PITCH",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps1level",
            "page":1,
            "row":1,
            "name":"PS1:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps2pitch",
            "page":1,
            "row":1,
            "name":"PS2:PITCH",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps2level",
            "page":1,
            "row":1,
            "name":"PS2:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pitch_shifter_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps1mode",
            "page":2,
            "row":1,
            "name":"PS1:MODE",
            "min":0,
            "max":3,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps1fine",
            "page":2,
            "row":1,
            "name":"PS1:FINE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps1pre_dly",
            "page":2,
            "row":1,
            "name":"PS1:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps1f_back",
            "page":2,
            "row":1,
            "name":"PS1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps2mode",
            "page":2,
            "row":2,
            "name":"PS2:MODE",
            "min":0,
            "max":3,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps2fine",
            "page":2,
            "row":2,
            "name":"PS2:FINE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_pitch_shifter_ps2pre_dly",
            "page":2,
            "row":2,
            "name":"PS2:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         }],
         "HARMONIST":[{
            "id":"fx2_harmonist_hr1harm",
            "page":1,
            "row":1,
            "name":"HR1:HARMONY",
            "min":0,
            "max":29,
            "step":1
         },{
            "id":"fx2_harmonist_hr2harm",
            "page":1,
            "row":1,
            "name":"HR2:HARMONY",
            "min":0,
            "max":29,
            "step":1
         },{
            "id":"master_key",
            "page":1,
            "row":1,
            "name":"MASTER KEY",
            "min":0,
            "max":11,
            "step":1
         },{
            "id":"fx2_harmonist_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_harmonist_hr1pre_dly",
            "page":2,
            "row":1,
            "name":"HR1:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         },{
            "id":"fx2_harmonist_hr1f_back",
            "page":2,
            "row":1,
            "name":"HR1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_harmonist_hr1level",
            "page":2,
            "row":1,
            "name":"HR1:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_harmonist_hr2pre_dly",
            "page":2,
            "row":2,
            "name":"HR2:PRE DELAY",
            "min":0,
            "max":300,
            "step":1
         },{
            "id":"fx2_harmonist_hr2level",
            "page":2,
            "row":2,
            "name":"HR2:LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_harmonist_hr1c",
            "page":3,
            "row":1,
            "name":"HR1:C",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1db",
            "page":3,
            "row":1,
            "name":"HR1:Db",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1d",
            "page":3,
            "row":1,
            "name":"HR1:D",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1eb",
            "page":3,
            "row":1,
            "name":"HR1:Eb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1e",
            "page":3,
            "row":2,
            "name":"HR1:E",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1f",
            "page":3,
            "row":2,
            "name":"HR1:F",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1f_s",
            "page":3,
            "row":2,
            "name":"HR1:F#",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1g",
            "page":3,
            "row":2,
            "name":"HR1:G",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1ab",
            "page":4,
            "row":1,
            "name":"HR1:Ab",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1a",
            "page":4,
            "row":1,
            "name":"HR1:A",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1bb",
            "page":4,
            "row":1,
            "name":"HR1:Bb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr1b",
            "page":4,
            "row":1,
            "name":"HR1:B",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2c",
            "page":5,
            "row":1,
            "name":"HR2:C",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2db",
            "page":5,
            "row":1,
            "name":"HR2:Db",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2d",
            "page":5,
            "row":1,
            "name":"HR2:D",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2eb",
            "page":5,
            "row":1,
            "name":"HR2:Eb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2e",
            "page":5,
            "row":2,
            "name":"HR2:E",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2f",
            "page":5,
            "row":2,
            "name":"HR2:F",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2f_s",
            "page":5,
            "row":2,
            "name":"HR2:F#",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2g",
            "page":5,
            "row":2,
            "name":"HR2:G",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2ab",
            "page":6,
            "row":1,
            "name":"HR2:Ab",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2a",
            "page":6,
            "row":1,
            "name":"HR2:A",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2bb",
            "page":6,
            "row":1,
            "name":"HR2:Bb",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"fx2_harmonist_hr2b",
            "page":6,
            "row":1,
            "name":"HR2:B",
            "min":-24,
            "max":24,
            "step":1
         }],
         "OVERTONE":[{
            "id":"prm_fx2_overtone_upper_level",
            "page":1,
            "row":1,
            "name":"UPPER LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_overtone_lower_level",
            "page":1,
            "row":1,
            "name":"LOWER LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_overtone_direct_level",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_overtone_detune",
            "page":1,
            "row":2,
            "name":"DETUNE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_overtone_tone",
            "page":1,
            "row":2,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         }],
         "SOUND HOLD":[{
            "id":"fx2_sound_hold_hold",
            "page":1,
            "row":1,
            "name":"HOLD",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx2_sound_hold_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sound_hold_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "AC.PROCESSOR":[{
            "id":"fx2_ac_processor_bass",
            "page":1,
            "row":1,
            "name":"BASS",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_ac_processor_middle",
            "page":1,
            "row":1,
            "name":"MIDDLE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_ac_processor_treble",
            "page":1,
            "row":1,
            "name":"TREBLE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_ac_processor_presence",
            "page":1,
            "row":1,
            "name":"PRESENCE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"fx2_ac_processor_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_ac_processor_middle_freq",
            "page":1,
            "row":2,
            "name":"MIDDLE FREQ",
            "min":0,
            "max":27,
            "step":1
         }],
         "PHASER":[{
            "id":"fx2_phaser_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_phaser_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_phaser_reso",
            "page":1,
            "row":1,
            "name":"RESO",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_phaser_manual",
            "page":1,
            "row":1,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_phaser_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_phaser_step_rate",
            "page":1,
            "row":2,
            "name":"STEP RATE",
            "min":0,
            "max":101,
            "step":1
         },{
            "id":"fx2_phaser_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "FLANGER":[{
            "id":"fx2_flanger_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger_reso",
            "page":1,
            "row":1,
            "name":"RESO",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger_manual",
            "page":1,
            "row":1,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger_low_cut",
            "page":1,
            "row":2,
            "name":"LOW CUT",
            "min":0,
            "max":10,
            "step":1
         },{
            "id":"fx2_flanger_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "TREMOLO":[{
            "id":"fx2_tremolo_wave_shape",
            "page":1,
            "row":1,
            "name":"WAVE SHAPE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_tremolo_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_tremolo_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_tremolo_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "ROTARY":[{
            "id":"fx2_rotary_rate_fast",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_rotary_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_rotary_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "UNI-V":[{
            "id":"fx2_uni_v_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_uni_v_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_uni_v_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "PAN":[{
            "id":"fx2_pan_wave_shape",
            "page":1,
            "row":1,
            "name":"WAVE SHAPE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pan_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pan_pos",
            "page":1,
            "row":1,
            "name":"POSITION",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pan_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_pan_level",
            "page":1,
            "row":2,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "SLICER":[{
            "id":"fx2_slicer_pattern",
            "page":1,
            "row":1,
            "name":"PATTERN",
            "min":0,
            "max":19,
            "step":1
         },{
            "id":"fx2_slicer_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_slicer_trigger_sens",
            "page":1,
            "row":1,
            "name":"TRIGGER SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_slicer_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_slicer_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "VIBRATO":[{
            "id":"fx2_vibrato_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_vibrato_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_vibrato_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "RING MOD":[{
            "id":"fx2_ring_mod_freq",
            "page":1,
            "row":1,
            "name":"FREQUENCY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_ring_mod_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_ring_mod_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "HUMANIZER":[{
            "id":"fx2_humanizer_vowel1",
            "page":1,
            "row":1,
            "name":"VOWEL1",
            "min":0,
            "max":4,
            "step":1
         },{
            "id":"fx2_humanizer_vowel2",
            "page":1,
            "row":1,
            "name":"VOWEL2",
            "min":0,
            "max":4,
            "step":1
         },{
            "id":"fx2_humanizer_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_humanizer_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_humanizer_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_humanizer_sens",
            "page":1,
            "row":2,
            "name":"SENS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_humanizer_manual",
            "page":1,
            "row":2,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         }],
         "CHORUS":[{
            "id":"fx2_2x2_chorus_low_rate",
            "page":1,
            "row":1,
            "name":"LOW RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_low_depth",
            "page":1,
            "row":1,
            "name":"LOW DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_low_pre_delay",
            "page":1,
            "row":1,
            "name":"LOW PRE DELAY",
            "min":0,
            "max":80,
            "step":1
         },{
            "id":"fx2_2x2_chorus_low_level",
            "page":1,
            "row":1,
            "name":"LOW LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_direct_level",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_high_rate",
            "page":1,
            "row":2,
            "name":"HIGH RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_high_depth",
            "page":1,
            "row":2,
            "name":"HIGH DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_high_pre_delay",
            "page":1,
            "row":2,
            "name":"HIGH PRE DELAY",
            "min":0,
            "max":80,
            "step":1
         },{
            "id":"fx2_2x2_chorus_high_level",
            "page":1,
            "row":2,
            "name":"HIGH LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_2x2_chorus_xover_freq",
            "page":1,
            "row":2,
            "name":"XOVER FREQUENCY",
            "min":0,
            "max":16,
            "step":1
         }],
         "SUB DELAY":[{
            "id":"fx2_sub_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"fx2_sub_delay_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_delay_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"fx2_sub_delay_tap_time",
            "page":1,
            "row":2,
            "name":"TAP TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_sub_delay_high_cut",
            "page":1,
            "row":2,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"fx2_sub_delay_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "TERA ECHO":[{
            "id":"prm_fx2_teraecho_time",
            "page":1,
            "row":1,
            "name":"S.TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_teraecho_feedback",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_teraecho_tone",
            "page":1,
            "row":1,
            "name":"TONE",
            "min":-50,
            "max":50,
            "step":1
         },{
            "id":"prm_fx2_teraecho_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"prm_fx2_teraecho_hold",
            "page":1,
            "row":2,
            "name":"HOLD",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"prm_fx2_teraecho_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PHASER 90E":[{
            "id":"fx2_phaser90e_script",
            "page":1,
            "row":1,
            "name":"SCRIPT",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"fx2_phaser90e_speed",
            "page":1,
            "row":1,
            "name":"SPEED",
            "min":0,
            "max":100,
            "step":1
         }],
         "FLANGER 117E":[{
            "id":"fx2_flanger117e_manual",
            "page":1,
            "row":1,
            "name":"MANUAL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger117e_width",
            "page":1,
            "row":1,
            "name":"WIDTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger117e_speed",
            "page":1,
            "row":1,
            "name":"SPEED",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_flanger117e_regen",
            "page":1,
            "row":1,
            "name":"REGEN.",
            "min":0,
            "max":100,
            "step":1
         }],
         "WAH 95E":[{
            "id":"fx2_wah95e_pedal_pos",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wah95e_pedal_min",
            "page":1,
            "row":1,
            "name":"PEDAL MIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wah95e_pedal_max",
            "page":1,
            "row":1,
            "name":"PEDAL MAX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wah95e_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_wah95e_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "DC-30":[{
            "id":"fx2_dc30_chorus_intensity",
            "page":1,
            "row":1,
            "name":"CHORUS INTENSITY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_dc30_echo_repeat_rate",
            "page":1,
            "row":1,
            "name":"ECHO REPEAT RATE",
            "min":40,
            "max":600,
            "step":1
         },{
            "id":"fx2_dc30_echo_intensity",
            "page":1,
            "row":1,
            "name":"ECHO INTENSITY",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_dc30_echo_volume",
            "page":1,
            "row":1,
            "name":"ECHO VOLUME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_dc30_input_volume",
            "page":1,
            "row":2,
            "name":"INPUT VOLUME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_dc30_tone",
            "page":1,
            "row":2,
            "name":"TONE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_dc30_output",
            "page":1,
            "row":2,
            "name":"OUTPUT",
            "min":0,
            "max":1,
            "step":1
         }],
         "HEAVY OCTAVE":[{
            "id":"fx2_heavy_oct_1oct_level",
            "page":1,
            "row":1,
            "name":"1OCT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_heavy_oct_2oct_level",
            "page":1,
            "row":1,
            "name":"2OCT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"fx2_heavy_oct_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }]
      };
      
      public static const DELAY_TYPE:Array = [{
         "val":0,
         "name":"DIGITAL"
      },{
         "val":1,
         "name":"PAN"
      },{
         "val":2,
         "name":"STEREO"
      },{
         "val":7,
         "name":"ANALOG"
      },{
         "val":8,
         "name":"TAPE ECHO"
      },{
         "val":6,
         "name":"REVERSE"
      },{
         "val":9,
         "name":"MODULATE"
      },{
         "val":10,
         "name":"SDE-3000"
      }];
      
      public static const DELAY_PARAMS_LIST:Object = {
         "DEFAULT":[{
            "id":"delay_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_high_cut",
            "page":1,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PAN":[{
            "id":"delay_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_high_cut",
            "page":1,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_tap_time",
            "page":1,
            "row":2,
            "name":"TAP TIME",
            "min":0,
            "max":100,
            "step":1
         }],
         "DUAL-S":[{
            "id":"delay_d1_time",
            "page":1,
            "row":1,
            "name":"D1:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay_d1_f_back",
            "page":1,
            "row":1,
            "name":"D1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d1_hi_cut",
            "page":1,
            "row":1,
            "name":"D1:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_d1_level",
            "page":1,
            "row":1,
            "name":"D1:LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d2_time",
            "page":1,
            "row":2,
            "name":"D2:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay_d2_f_back",
            "page":1,
            "row":2,
            "name":"D2:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d2_hi_cut",
            "page":1,
            "row":2,
            "name":"D2:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_d2_level",
            "page":1,
            "row":2,
            "name":"D2:LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "DUAL-P":[{
            "id":"delay_d1_time",
            "page":1,
            "row":1,
            "name":"D1:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay_d1_f_back",
            "page":1,
            "row":1,
            "name":"D1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d1_hi_cut",
            "page":1,
            "row":1,
            "name":"D1:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_d1_level",
            "page":1,
            "row":1,
            "name":"D1:LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d2_time",
            "page":1,
            "row":2,
            "name":"D2:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay_d2_f_back",
            "page":1,
            "row":2,
            "name":"D2:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d2_hi_cut",
            "page":1,
            "row":2,
            "name":"D2:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_d2_level",
            "page":1,
            "row":2,
            "name":"D2:LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "DUAL-L/R":[{
            "id":"delay_d1_time",
            "page":1,
            "row":1,
            "name":"D1:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay_d1_f_back",
            "page":1,
            "row":1,
            "name":"D1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d1_hi_cut",
            "page":1,
            "row":1,
            "name":"D1:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_d1_level",
            "page":1,
            "row":1,
            "name":"D1:LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d2_time",
            "page":1,
            "row":2,
            "name":"D2:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay_d2_f_back",
            "page":1,
            "row":2,
            "name":"D2:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_d2_hi_cut",
            "page":1,
            "row":2,
            "name":"D2:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_d2_level",
            "page":1,
            "row":2,
            "name":"D2:LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "MODULATE":[{
            "id":"delay_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_high_cut",
            "page":1,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_mod_rate",
            "page":1,
            "row":2,
            "name":"MOD RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_mod_depth",
            "page":1,
            "row":2,
            "name":"MOD DEPTH",
            "min":0,
            "max":100,
            "step":1
         }],
         "SDE-3000":[{
            "id":"delay_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_vtg_mod_sw",
            "page":1,
            "row":2,
            "name":"MOD SW",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay_mod_rate",
            "page":1,
            "row":2,
            "name":"MOD RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_mod_depth",
            "page":1,
            "row":2,
            "name":"MOD DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay_vtg_filter",
            "page":2,
            "row":1,
            "name":"FILTER",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay_vtg_lpf",
            "page":2,
            "row":1,
            "name":"RANGE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay_vtg_effect_phase",
            "page":2,
            "row":1,
            "name":"DELAY PHASE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay_vtg_feedback_phase",
            "page":2,
            "row":1,
            "name":"FEEDBACK PHASE",
            "min":0,
            "max":1,
            "step":1
         }]
      };
      
      public static const DELAY2_PARAMS_LIST:Object = {
         "DEFAULT":[{
            "id":"delay2_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay2_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_high_cut",
            "page":1,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "PAN":[{
            "id":"delay2_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay2_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_high_cut",
            "page":1,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_tap_time",
            "page":1,
            "row":2,
            "name":"TAP TIME",
            "min":0,
            "max":100,
            "step":1
         }],
         "DUAL-S":[{
            "id":"delay2_d1_time",
            "page":1,
            "row":1,
            "name":"D1:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay2_d1_f_back",
            "page":1,
            "row":1,
            "name":"D1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d1_hi_cut",
            "page":1,
            "row":1,
            "name":"D1:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_d1_level",
            "page":1,
            "row":1,
            "name":"D1:LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d2_time",
            "page":1,
            "row":2,
            "name":"D2:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay2_d2_f_back",
            "page":1,
            "row":2,
            "name":"D2:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d2_hi_cut",
            "page":1,
            "row":2,
            "name":"D2:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_d2_level",
            "page":1,
            "row":2,
            "name":"D2:LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "DUAL-P":[{
            "id":"delay2_d1_time",
            "page":1,
            "row":1,
            "name":"D1:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay2_d1_f_back",
            "page":1,
            "row":1,
            "name":"D1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d1_hi_cut",
            "page":1,
            "row":1,
            "name":"D1:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_d1_level",
            "page":1,
            "row":1,
            "name":"D1:LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d2_time",
            "page":1,
            "row":2,
            "name":"D2:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay2_d2_f_back",
            "page":1,
            "row":2,
            "name":"D2:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d2_hi_cut",
            "page":1,
            "row":2,
            "name":"D2:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_d2_level",
            "page":1,
            "row":2,
            "name":"D2:LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "DUAL-L/R":[{
            "id":"delay2_d1_time",
            "page":1,
            "row":1,
            "name":"D1:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay2_d1_f_back",
            "page":1,
            "row":1,
            "name":"D1:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d1_hi_cut",
            "page":1,
            "row":1,
            "name":"D1:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_d1_level",
            "page":1,
            "row":1,
            "name":"D1:LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d2_time",
            "page":1,
            "row":2,
            "name":"D2:TIME",
            "min":1,
            "max":1000,
            "step":1
         },{
            "id":"delay2_d2_f_back",
            "page":1,
            "row":2,
            "name":"D2:FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_d2_hi_cut",
            "page":1,
            "row":2,
            "name":"D2:HI CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_d2_level",
            "page":1,
            "row":2,
            "name":"D2:LEVEL",
            "min":0,
            "max":120,
            "step":1
         }],
         "MODULATE":[{
            "id":"delay2_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay2_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_high_cut",
            "page":1,
            "row":1,
            "name":"HIGH CUT",
            "min":0,
            "max":14,
            "step":1
         },{
            "id":"delay2_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_mod_rate",
            "page":1,
            "row":2,
            "name":"MOD RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_mod_depth",
            "page":1,
            "row":2,
            "name":"MOD DEPTH",
            "min":0,
            "max":100,
            "step":1
         }],
         "SDE-3000":[{
            "id":"delay2_delay_time",
            "page":1,
            "row":1,
            "name":"DELAY TIME",
            "min":1,
            "max":2000,
            "step":1
         },{
            "id":"delay2_f_back",
            "page":1,
            "row":1,
            "name":"FEEDBACK",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":120,
            "step":1
         },{
            "id":"delay2_direct_mix",
            "page":1,
            "row":1,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_vtg_mod_sw",
            "page":1,
            "row":2,
            "name":"MOD SW",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay2_mod_rate",
            "page":1,
            "row":2,
            "name":"MOD RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_mod_depth",
            "page":1,
            "row":2,
            "name":"MOD DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"delay2_vtg_filter",
            "page":2,
            "row":1,
            "name":"FILTER",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay2_vtg_lpf",
            "page":2,
            "row":1,
            "name":"RANGE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay2_vtg_effect_phase",
            "page":2,
            "row":1,
            "name":"DELAY PHASE",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"delay2_vtg_feedback_phase",
            "page":2,
            "row":1,
            "name":"FEEDBACK PHASE",
            "min":0,
            "max":1,
            "step":1
         }]
      };
      
      public static const CHORUS_TYPE:Array = [{
         "val":0,
         "name":"MONO"
      },{
         "val":1,
         "name":"STEREO1"
      },{
         "val":2,
         "name":"STEREO2"
      }];
      
      public static const CHORUS_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"chorus_rate",
         "page":1,
         "row":1,
         "name":"RATE",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"chorus_depth",
         "page":1,
         "row":1,
         "name":"DEPTH",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"chorus_effect_level",
         "page":1,
         "row":1,
         "name":"EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"chorus_direct_level",
         "page":1,
         "row":1,
         "name":"DIRECT MIX",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"chorus_pre_delay",
         "page":1,
         "row":2,
         "name":"PRE DELAY",
         "min":0,
         "max":80,
         "step":1
      },{
         "id":"chorus_low_cut",
         "page":1,
         "row":2,
         "name":"LOW CUT",
         "min":0,
         "max":17,
         "step":1
      },{
         "id":"chorus_high_cut",
         "page":1,
         "row":2,
         "name":"HIGH CUT",
         "min":0,
         "max":14,
         "step":1
      }]};
      
      public static const REVERB_TYPE:Array = [{
         "val":4,
         "name":"PLATE"
      },{
         "val":1,
         "name":"ROOM"
      },{
         "val":3,
         "name":"HALL"
      },{
         "val":5,
         "name":"SPRING"
      },{
         "val":6,
         "name":"MODULATE"
      }];
      
      public static const REVERB_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"reverb_time",
         "page":1,
         "row":1,
         "name":"REVERB TIME",
         "min":0,
         "max":99,
         "step":1
      },{
         "id":"reverb_pre_delay",
         "page":1,
         "row":1,
         "name":"PRE DELAY",
         "min":0,
         "max":500,
         "step":1
      },{
         "id":"reverb_effect_level",
         "page":1,
         "row":1,
         "name":"EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"reverb_direct_mix",
         "page":1,
         "row":1,
         "name":"DIRECT MIX",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"reverb_low_cut",
         "page":1,
         "row":2,
         "name":"LOW CUT",
         "min":0,
         "max":17,
         "step":1
      },{
         "id":"reverb_high_cut",
         "page":1,
         "row":2,
         "name":"HIGH CUT",
         "min":0,
         "max":14,
         "step":1
      },{
         "id":"reverb_density",
         "page":1,
         "row":2,
         "name":"DENSITY",
         "min":0,
         "max":10,
         "step":1
      },{
         "id":"reverb_spring_sens",
         "page":1,
         "row":2,
         "name":"SPRING SENS",
         "min":0,
         "max":100,
         "step":1
      }]};
      
      public static const PEDAL_FX_TYPE:Array = [{
         "val":0,
         "name":"PEDAL WAH"
      },{
         "val":1,
         "name":"PEDAL BEND"
      },{
         "val":2,
         "name":"WAH 95E"
      }];
      
      public static const PEDAL_FX_PARAMS_LIST:Object = {
         "DEFAULT":[{
            "id":"pedal_fx_wah_position",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_wah_pedal_min",
            "page":1,
            "row":1,
            "name":"PEDAL MIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_wah_pedal_max",
            "page":1,
            "row":1,
            "name":"PEDAL MAX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_wah_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_wah_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_position",
            "page":1,
            "row":2,
            "name":"POSITION",
            "min":0,
            "max":1,
            "step":1
         }],
         "PEDAL BEND":[{
            "id":"pedal_fx_pedal_bend_position",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_pedal_bend_pitch",
            "page":1,
            "row":1,
            "name":"PITCH",
            "min":-24,
            "max":24,
            "step":1
         },{
            "id":"pedal_fx_pedal_bend_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_pedal_bend_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_position",
            "page":1,
            "row":2,
            "name":"POSITION",
            "min":0,
            "max":1,
            "step":1
         }],
         "WAH 95E":[{
            "id":"pedal_fx_evh95_position",
            "page":1,
            "row":1,
            "name":"PEDAL POS",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_evh95_pedal_min",
            "page":1,
            "row":1,
            "name":"PEDAL MIN",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_evh95_pedal_max",
            "page":1,
            "row":1,
            "name":"PEDAL MAX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_evh95_effect_level",
            "page":1,
            "row":1,
            "name":"EFFECT LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_evh95_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"pedal_fx_position",
            "page":1,
            "row":2,
            "name":"POSITION",
            "min":0,
            "max":1,
            "step":1
         }]
      };
      
      public static const PEDAL_FX_SUB_TYPE_LIST:Object = {"PEDAL WAH":[{
         "val":0,
         "name":"CRY WAH"
      },{
         "val":1,
         "name":"VO WAH"
      },{
         "val":2,
         "name":"FAT WAH"
      },{
         "val":3,
         "name":"LIGHT WAH"
      },{
         "val":4,
         "name":"7STRING WAH"
      },{
         "val":5,
         "name":"RESO WAH"
      }]};
      
      public static const FOOT_VOLUME_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"foot_volume_volume_min",
         "page":1,
         "row":1,
         "name":"VOLUME MIN",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"foot_volume_volume_max",
         "page":1,
         "row":1,
         "name":"VOLUME MAX",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"foot_volume_volume_curve",
         "page":1,
         "row":1,
         "name":"VOLUME CURVE",
         "min":0,
         "max":3,
         "step":1
      },{
         "id":"foot_volume_level",
         "page":1,
         "row":1,
         "name":"LEVEL",
         "min":0,
         "max":100,
         "step":1
      }]};
      
      public static const DIVIDER_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"divider_mode",
         "page":1,
         "row":1,
         "name":"MODE",
         "min":0,
         "max":1,
         "step":1
      },{
         "id":"divider_ch_select",
         "page":1,
         "row":1,
         "name":"CH SELECT",
         "min":0,
         "max":1,
         "step":1
      },{
         "id":"divider_ch_a_dynamic",
         "page":2,
         "row":1,
         "name":"Ch A DYNAMIC",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"divider_ch_a_dynamic_sens",
         "page":2,
         "row":1,
         "name":"Ch A DYNAMIC SENS",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"divider_ch_a_filter",
         "page":2,
         "row":1,
         "name":"Ch A FILTER",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"divider_ch_a_cutoff_freq",
         "page":2,
         "row":1,
         "name":"Ch A CUTOFF FREQUENCY",
         "min":0,
         "max":16,
         "step":1
      },{
         "id":"divider_ch_b_dynamic",
         "page":2,
         "row":2,
         "name":"Ch B DYNAMIC",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"divider_ch_b_dynamic_sens",
         "page":2,
         "row":2,
         "name":"Ch B DYNAMIC SENS",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"divider_ch_b_filter",
         "page":2,
         "row":2,
         "name":"Ch B FILTER",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"divider_ch_b_cutoff_freq",
         "page":2,
         "row":2,
         "name":"Ch B CUTOFF FREQUENCY",
         "min":0,
         "max":16,
         "step":1
      }]};
      
      public static const MIXER_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"mixer_mode",
         "page":1,
         "row":1,
         "name":"MODE",
         "min":0,
         "max":1,
         "step":1
      },{
         "id":"mixer_ch_a_b_balance",
         "page":1,
         "row":1,
         "name":"CH A/B BALANCE",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"mixer_spread",
         "page":1,
         "row":1,
         "name":"SPREAD",
         "min":0,
         "max":100,
         "step":1
      }]};
      
      public static const SEND_RETURN_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"send_return_position",
         "page":1,
         "row":1,
         "name":"POSITION",
         "min":0,
         "max":1,
         "step":1
      },{
         "id":"send_return_mode",
         "page":1,
         "row":1,
         "name":"MODE",
         "min":0,
         "max":1,
         "step":1
      },{
         "id":"send_return_send_level",
         "page":1,
         "row":1,
         "name":"SEND LEVEL",
         "min":0,
         "max":200,
         "step":2
      },{
         "id":"send_return_return_level",
         "page":1,
         "row":1,
         "name":"RETURN LEVEL",
         "min":0,
         "max":200,
         "step":2
      }]};
      
      public static const NS1_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"ns1_threshold",
         "page":1,
         "row":1,
         "name":"THRESH",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"ns1_release",
         "page":1,
         "row":1,
         "name":"RELEASE",
         "min":0,
         "max":100,
         "step":1
      }]};
      
      public static const NS2_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"ns2_threshold",
         "page":1,
         "row":1,
         "name":"THRESH",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"ns2_release",
         "page":1,
         "row":1,
         "name":"RELEASE",
         "min":0,
         "max":100,
         "step":1
      },{
         "id":"ns2_detect",
         "page":1,
         "row":1,
         "name":"DETECT",
         "min":0,
         "max":2,
         "step":1
      }]};
      
      public static const ACCEL_FX_TYPE:Array = [{
         "val":0,
         "name":"S-BEND"
      },{
         "val":1,
         "name":"LASER BEAM"
      },{
         "val":2,
         "name":"RING MOD"
      },{
         "val":3,
         "name":"TWIST"
      },{
         "val":4,
         "name":"WARP"
      },{
         "val":5,
         "name":"FEEDBACKER"
      }];
      
      public static const ACCEL_FX_PARAMS_LIST:Object = {
         "S-BEND":[{
            "id":"accel_fx_s_bend_pitch",
            "page":1,
            "row":1,
            "name":"PITCH",
            "min":0,
            "max":6,
            "step":1
         },{
            "id":"accel_fx_s_bend_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_s_bend_fall_time",
            "page":1,
            "row":1,
            "name":"FALL TIME",
            "min":0,
            "max":100,
            "step":1
         }],
         "LASER BEAM":[{
            "id":"accel_fx_laser_beam_rate",
            "page":1,
            "row":1,
            "name":"RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_laser_beam_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_laser_beam_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_laser_beam_fall_time",
            "page":1,
            "row":1,
            "name":"FALL TIME",
            "min":0,
            "max":100,
            "step":1
         }],
         "RING MOD":[{
            "id":"accel_fx_ring_mod_freq",
            "page":1,
            "row":1,
            "name":"FREQ",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_ring_mod_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_ring_mod_fall_time",
            "page":1,
            "row":1,
            "name":"FALL TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_ring_mod_ring_level",
            "page":1,
            "row":2,
            "name":"RING LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_ring_mod_octave_level",
            "page":1,
            "row":2,
            "name":"OCTAVE LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_ring_mod_direct_mix",
            "page":1,
            "row":2,
            "name":"DIRECT MIX",
            "min":0,
            "max":100,
            "step":1
         }],
         "TWIST":[{
            "id":"accel_fx_twist_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_twist_fall_time",
            "page":1,
            "row":1,
            "name":"FALL TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_twist_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "WARP":[{
            "id":"accel_fx_warp_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_warp_fall_time",
            "page":1,
            "row":1,
            "name":"FALL TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_warp_level",
            "page":1,
            "row":1,
            "name":"LEVEL",
            "min":0,
            "max":100,
            "step":1
         }],
         "FEEDBACKER":[{
            "id":"accel_fx_feedbacker_depth",
            "page":1,
            "row":1,
            "name":"DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_feedbacker_rise_time",
            "page":1,
            "row":1,
            "name":"RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_feedbacker_f_back_level",
            "page":1,
            "row":1,
            "name":"FEEDBACK LEVEL",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_feedbacker_vib_rate",
            "page":1,
            "row":1,
            "name":"VIBRATO RATE",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_feedbacker_vib_depth",
            "page":1,
            "row":1,
            "name":"VIBRATO DEPTH",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_feedbacker_octave_rise_time",
            "page":1,
            "row":2,
            "name":"OCTAVE RISE TIME",
            "min":0,
            "max":100,
            "step":1
         },{
            "id":"accel_fx_feedbacker_octave_f_back_level",
            "page":1,
            "row":2,
            "name":"OCTAVE F BACK LEVEL",
            "min":0,
            "max":100,
            "step":1
         }]
      };
      
      public static const ACCEL_FX_SUB_TYPE_LIST:Object = {"FEEDBACKER":[{
         "val":0,
         "name":"NORMAL"
      },{
         "val":1,
         "name":"OSC"
      }]};
      
      public static const MASTER_SETTING_PARAMS_LIST:Object = {"DEFAULT":[{
         "id":"patch_level",
         "page":1,
         "row":1,
         "name":"PATCH LEVEL",
         "min":0,
         "max":200,
         "step":2
      },{
         "id":"master_bpm",
         "page":1,
         "row":1,
         "name":"MASTER BPM",
         "min":40,
         "max":250,
         "step":1
      },{
         "id":"master_key",
         "page":1,
         "row":1,
         "name":"MASTER KEY",
         "min":0,
         "max":11,
         "step":1
      },{
         "id":"master_eq_high_gain",
         "page":2,
         "row":1,
         "name":"MASTER HIGH GAIN",
         "min":-20,
         "max":20,
         "step":1
      },{
         "id":"master_eq_mid_gain",
         "page":2,
         "row":1,
         "name":"MASTER MID GAIN",
         "min":-20,
         "max":20,
         "step":1
      },{
         "id":"master_eq_low_gain",
         "page":2,
         "row":1,
         "name":"MASTER LOW GAIN",
         "min":-20,
         "max":20,
         "step":1
      },{
         "id":"master_eq_mid_freq",
         "page":2,
         "row":2,
         "name":"MASTER MID FREQ",
         "min":0,
         "max":27,
         "step":1
      },{
         "id":"master_eq_mid_q",
         "page":2,
         "row":2,
         "name":"MASTER MID Q",
         "min":0,
         "max":5,
         "step":1
      },{
         "id":"amp_control",
         "page":3,
         "row":1,
         "name":"AMP CONTROL",
         "min":0,
         "max":1,
         "step":1
      }]};
      
      public static const EFFECT_TYPE:String = "EFFECT_TYPE";
      
      public static const SUB_TYPE:String = "SUB_TYPE";
      
      public static const PRE_AMP_A_SP_TYPE:String = "PRE_AMP_A_SP_TYPE";
      
      public static const PRE_AMP_B_SP_TYPE:String = "PRE_AMP_B_SP_TYPE";
      
      public static const FX1_HR1_HARM:String = "FX1_HR1:HARM";
      
      public static const FX1_HR2_HARM:String = "FX1_HR2:HARM";
      
      public static const FX2_HR1_HARM:String = "FX2_HR1:HARM";
      
      public static const FX2_HR2_HARM:String = "FX2_HR2:HARM";
      
      public static const DIVIDER_MODE:String = "DIVIDER_MODE";
      
      public static const SEND_RETURN_MODE:String = "SEND_RETURN_MODE";
      
      public static const OUTPUT:String = "OUTPUT_SELECT";
      
      public static const ENABLE_PATTERN_LIST:Object = {
         "od_ds_custom_character":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "od_ds_custom_bottom":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "od_ds_custom_top":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "od_ds_custom_low":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "od_ds_custom_high":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_bright":{
            "key":EFFECT_TYPE,
            "value":["NATURAL CLEAN","COMBO CRUNCH","JC-120","CLEAN TWIN","PRO CRUNCH","TWEED","BG LEAD","BG DRIVE"]
         },
         "preamp_a_custom_char":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_bottom":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_edge":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_preamp_low":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_preamp_high":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_sp_size":{
            "key":PRE_AMP_A_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_sp_num":{
            "key":PRE_AMP_A_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_sp_cabinet":{
            "key":PRE_AMP_A_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_sp_color_low":{
            "key":PRE_AMP_A_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_custom_sp_color_high":{
            "key":PRE_AMP_A_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_a_sp_type":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_a_mic_type":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_a_mic_dis":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_a_mic_pos":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_a_mic_level":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_a_direct_mix":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_b_bright":{
            "key":EFFECT_TYPE,
            "value":["NATURAL CLEAN","COMBO CRUNCH","JC-120","CLEAN TWIN","PRO CRUNCH","TWEED","BG LEAD","BG DRIVE"]
         },
         "preamp_b_custom_char":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_bottom":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_edge":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_preamp_low":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_preamp_high":{
            "key":EFFECT_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_sp_size":{
            "key":PRE_AMP_B_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_sp_num":{
            "key":PRE_AMP_B_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_sp_cabinet":{
            "key":PRE_AMP_B_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_sp_color_low":{
            "key":PRE_AMP_B_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_custom_sp_color_high":{
            "key":PRE_AMP_B_SP_TYPE,
            "value":["CUSTOM"]
         },
         "preamp_b_sp_type":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_b_mic_type":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_b_mic_dis":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_b_mic_pos":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_b_mic_level":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "preamp_b_direct_mix":{
            "key":OUTPUT,
            "value":["LINE/PHONES"]
         },
         "fx1_tone_modify_reso":{
            "key":SUB_TYPE,
            "value":["RESONATOR1","RESONATOR2","RESONATOR3"]
         },
         "fx1_guitar_sim_body":{
            "key":SUB_TYPE,
            "value":["S->HOLLOW","H->HOLLOW","S->AC","H->AC","P->AC"]
         },
         "fx1_pitch_shifter_ps2pitch":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_pitch_shifter_ps2level":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_pitch_shifter_ps2mode":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_pitch_shifter_ps2fine":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_pitch_shifter_ps2pre_dly":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_harmonist_hr2harm":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_harmonist_hr2pre_dly":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_harmonist_hr2level":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx1_harmonist_hr1c":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1db":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1d":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1eb":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1e":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1f":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1f_s":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1g":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1ab":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1a":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1bb":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr1b":{
            "key":FX1_HR1_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2c":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2db":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2d":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2eb":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2e":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2f":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2f_s":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2g":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2ab":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2a":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2bb":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_harmonist_hr2b":{
            "key":FX1_HR2_HARM,
            "value":["USER"]
         },
         "fx1_pan_wave_shape":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx1_pan_rate":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx1_pan_pos":{
            "key":SUB_TYPE,
            "value":["MANUAL"]
         },
         "fx1_pan_depth":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx1_humanizer_sens":{
            "key":SUB_TYPE,
            "value":["PICKING"]
         },
         "fx1_humanizer_manual":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx1_sub_delay_tap_time":{
            "key":SUB_TYPE,
            "value":["PAN"]
         },
         "fx1_dc30_chorus_intensity":{
            "key":SUB_TYPE,
            "value":["CHORUS"]
         },
         "fx1_dc30_echo_repeat_rate":{
            "key":SUB_TYPE,
            "value":["ECHO"]
         },
         "fx1_dc30_echo_intensity":{
            "key":SUB_TYPE,
            "value":["ECHO"]
         },
         "fx1_dc30_echo_volume":{
            "key":SUB_TYPE,
            "value":["ECHO"]
         },
         "fx2_tone_modify_reso":{
            "key":SUB_TYPE,
            "value":["RESONATOR1","RESONATOR2","RESONATOR3"]
         },
         "fx2_guitar_sim_body":{
            "key":SUB_TYPE,
            "value":["S->HOLLOW","H->HOLLOW","S->AC","H->AC","P->AC"]
         },
         "fx2_pitch_shifter_ps2pitch":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_pitch_shifter_ps2level":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_pitch_shifter_ps2mode":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_pitch_shifter_ps2fine":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_pitch_shifter_ps2pre_dly":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_harmonist_hr2harm":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_harmonist_hr2pre_dly":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_harmonist_hr2level":{
            "key":SUB_TYPE,
            "value":["2VOICE","2STEREO"]
         },
         "fx2_harmonist_hr1c":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1db":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1d":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1eb":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1e":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1f":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1f_s":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1g":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1ab":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1a":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1bb":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr1b":{
            "key":FX2_HR1_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2c":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2db":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2d":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2eb":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2e":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2f":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2f_s":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2g":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2ab":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2a":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2bb":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_harmonist_hr2b":{
            "key":FX2_HR2_HARM,
            "value":["USER"]
         },
         "fx2_pan_wave_shape":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx2_pan_rate":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx2_pan_pos":{
            "key":SUB_TYPE,
            "value":["MANUAL"]
         },
         "fx2_pan_depth":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx2_humanizer_sens":{
            "key":SUB_TYPE,
            "value":["PICKING"]
         },
         "fx2_humanizer_manual":{
            "key":SUB_TYPE,
            "value":["AUTO"]
         },
         "fx2_sub_delay_tap_time":{
            "key":SUB_TYPE,
            "value":["PAN"]
         },
         "fx2_dc30_chorus_intensity":{
            "key":SUB_TYPE,
            "value":["CHORUS"]
         },
         "fx2_dc30_echo_repeat_rate":{
            "key":SUB_TYPE,
            "value":["ECHO"]
         },
         "fx2_dc30_echo_intensity":{
            "key":SUB_TYPE,
            "value":["ECHO"]
         },
         "fx2_dc30_echo_volume":{
            "key":SUB_TYPE,
            "value":["ECHO"]
         },
         "reverb_spring_sens":{
            "key":EFFECT_TYPE,
            "value":["SPRING"]
         },
         "divider_ch_select":{
            "key":DIVIDER_MODE,
            "value":["SINGLE"]
         },
         "divider_ch_a_dynamic":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_a_dynamic_sens":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_a_filter":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_a_cutoff_freq":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_b_dynamic":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_b_dynamic_sens":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_b_filter":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "divider_ch_b_cutoff_freq":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "mixer_ch_a_b_balance":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "mixer_spread":{
            "key":DIVIDER_MODE,
            "value":["DUAL"]
         },
         "accel_fx_feedbacker_depth":{
            "key":SUB_TYPE,
            "value":["NORMAL"]
         },
         "accel_fx_feedbacker_rise_time":{
            "key":SUB_TYPE,
            "value":["OSC"]
         },
         "accel_fx_feedbacker_f_back_level":{
            "key":SUB_TYPE,
            "value":["OSC"]
         },
         "accel_fx_feedbacker_vib_rate":{
            "key":SUB_TYPE,
            "value":["OSC"]
         },
         "accel_fx_feedbacker_vib_depth":{
            "key":SUB_TYPE,
            "value":["OSC"]
         },
         "accel_fx_feedbacker_octave_rise_time":{
            "key":SUB_TYPE,
            "value":["OSC"]
         },
         "accel_fx_feedbacker_octave_f_back_level":{
            "key":SUB_TYPE,
            "value":["OSC"]
         },
         "send_return_adjust":{
            "key":SEND_RETURN_MODE,
            "value":["NORMAL","DIRECT MIX"]
         }
      };
      
      public static const DROPDOWN_LIST:Object = {
         "od_ds_solo_sw":["OFF","ON"],
         "preamp_a_bright":["OFF","ON"],
         "preamp_a_gain_sw":["LOW","MIDDLE","HIGH"],
         "preamp_b_bright":["OFF","ON"],
         "preamp_b_gain_sw":["LOW","MIDDLE","HIGH"],
         "preamp_a_solo_sw":["OFF","ON"],
         "preamp_b_solo_sw":["OFF","ON"],
         "preamp_a_sp_type":["OFF","ORIGIN","1x8\"","1x10\"","1x12\"","2x12\"","4x10\"","4x12\"","8x12\"","CUSTOM"],
         "preamp_b_sp_type":["OFF","ORIGIN","1x8\"","1x10\"","1x12\"","2x12\"","4x10\"","4x12\"","8x12\"","CUSTOM"],
         "preamp_a_mic_type":["DYN57","DYN421","CND451","CND87","FLAT"],
         "preamp_b_mic_type":["DYN57","DYN421","CND451","CND87","FLAT"],
         "preamp_a_mic_dis":["OFF MIC","ON MIC"],
         "preamp_b_mic_dis":["OFF MIC","ON MIC"],
         "preamp_a_mic_pos":["CENTER","1cm","2cm","3cm","4cm","5cm","6cm","7cm","8cm","9cm","10cm"],
         "preamp_b_mic_pos":["CENTER","1cm","2cm","3cm","4cm","5cm","6cm","7cm","8cm","9cm","10cm"],
         "preamp_a_custom_sp_num":["x1","x2","x4","x8"],
         "preamp_b_custom_sp_num":["x1","x2","x4","x8"],
         "preamp_a_custom_sp_cabinet":["OPEN","CLOSE"],
         "preamp_b_custom_sp_cabinet":["OPEN","CLOSE"],
         "preamp_a_custom_sp_size":["5\"","6\"","7\"","8\"","9\"","10\"","11\"","12\"","13\"","14\"","15\""],
         "preamp_b_custom_sp_size":["5\"","6\"","7\"","8\"","9\"","10\"","11\"","12\"","13\"","14\"","15\""],
         "eq_low_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "eq_high_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "eq_low_cut":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "eq_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "eq_low_mid_q":["0.5","1","2","4","8","16"],
         "eq_high_mid_q":["0.5","1","2","4","8","16"],
         "fx1_tone_modify_type":["FAT","PRESENCE","MILD","TIGHT","ENHANCE","RESONATOR1","RESONATOR2","RESONATOR3"],
         "fx2_tone_modify_type":["FAT","PRESENCE","MILD","TIGHT","ENHANCE","RESONATOR1","RESONATOR2","RESONATOR3"],
         "fx1_guitar_sim_type":["S->H","H->S","H->HF","S->HOLLOW","H->HOLLOW","S->AC","H->AC","P->AC"],
         "fx2_guitar_sim_type":["S->H","H->S","H->HF","S->HOLLOW","H->HOLLOW","S->AC","H->AC","P->AC"],
         "fx1_t_wah_mode":["LPF","BPF"],
         "fx2_t_wah_mode":["LPF","BPF"],
         "fx1_t_wah_polar":["DOWN","UP"],
         "fx2_t_wah_polar":["DOWN","UP"],
         "fx1_auto_wah_mode":["LPF","BPF"],
         "fx2_auto_wah_mode":["LPF","BPF"],
         "fx1_phaser_type":["4STAGE","8STAGE","12STAGE","BiPHASE"],
         "fx2_phaser_type":["4STAGE","8STAGE","12STAGE","BiPHASE"],
         "fx1_limiter_ratio":["1:1","1.2:1","1.4:1","1.6:1","1.8:1","2:1","2.3:1","2.6:1","3:1","3.5:1","4:1","5:1","6:1","8:1","10:1","12:1","20:1","INF:1"],
         "fx2_limiter_ratio":["1:1","1.2:1","1.4:1","1.6:1","1.8:1","2:1","2.3:1","2.6:1","3:1","3.5:1","4:1","5:1","6:1","8:1","10:1","12:1","20:1","INF:1"],
         "fx1_sub_od_ds_solo_sw":["OFF","ON"],
         "fx2_sub_od_ds_solo_sw":["OFF","ON"],
         "fx1_parametric_eq_low_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "fx2_parametric_eq_low_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "fx1_parametric_eq_high_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "fx2_parametric_eq_high_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "fx1_parametric_eq_low_mid_q":["0.5","1","2","4","8","16"],
         "fx2_parametric_eq_low_mid_q":["0.5","1","2","4","8","16"],
         "fx1_parametric_eq_high_mid_q":["0.5","1","2","4","8","16"],
         "fx2_parametric_eq_high_mid_q":["0.5","1","2","4","8","16"],
         "fx1_parametric_eq_low_cut":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "fx2_parametric_eq_low_cut":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "fx1_parametric_eq_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "fx2_parametric_eq_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "fx1_sound_hold_hold":["OFF","ON"],
         "fx2_sound_hold_hold":["OFF","ON"],
         "fx1_octave_range":["RANGE1","RANGE2","RANGE3","RANGE4"],
         "fx2_octave_range":["RANGE1","RANGE2","RANGE3","RANGE4"],
         "fx1_ac_processor_middle_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "fx2_ac_processor_middle_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "fx1_flanger_low_cut":["FLAT","55Hz","110Hz","165Hz","200Hz","280Hz","340Hz","400Hz","500Hz","630Hz","800Hz"],
         "fx2_flanger_low_cut":["FLAT","55Hz","110Hz","165Hz","200Hz","280Hz","340Hz","400Hz","500Hz","630Hz","800Hz"],
         "fx1_pan_pos":["L100","L98","L96","L94","L92","L90","L88","L86","L84","L82","L80","L78","L76","L74","L72","L70","L68","L66","L64","L62","L60","L58","L56","L54","L52","L50","L48","L46","L44","L42","L40","L38","L36","L34","L32","L30","L28","L26","L24","L22","L20","L18","L16","L14","L12","L10","L8","L6","L4","L2","CENTER","R2","R4","R6","R8","R10","R12","R14","R16","R18","R20","R22","R24","R26","R28","R30","R32","R34","R36","R38","R40","R42","R44","R46","R48","R50","R52","R54","R56","R58","R60","R62","R64","R66","R68","R70","R72","R74","R76","R78","R80","R82","R84","R86","R88","R90","R92","R94","R96","R98","R100"],
         "fx2_pan_pos":["L100","L98","L96","L94","L92","L90","L88","L86","L84","L82","L80","L78","L76","L74","L72","L70","L68","L66","L64","L62","L60","L58","L56","L54","L52","L50","L48","L46","L44","L42","L40","L38","L36","L34","L32","L30","L28","L26","L24","L22","L20","L18","L16","L14","L12","L10","L8","L6","L4","L2","CENTER","R2","R4","R6","R8","R10","R12","R14","R16","R18","R20","R22","R24","R26","R28","R30","R32","R34","R36","R38","R40","R42","R44","R46","R48","R50","R52","R54","R56","R58","R60","R62","R64","R66","R68","R70","R72","R74","R76","R78","R80","R82","R84","R86","R88","R90","R92","R94","R96","R98","R100"],
         "fx1_slicer_pattern":["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12","P13","P14","P15","P16","P17","P18","P19","P20"],
         "fx2_slicer_pattern":["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12","P13","P14","P15","P16","P17","P18","P19","P20"],
         "fx1_vibrato_trigger":["OFF","ON"],
         "fx2_vibrato_trigger":["OFF","ON"],
         "fx1_humanizer_vowel1":["a","e","i","o","u"],
         "fx2_humanizer_vowel1":["a","e","i","o","u"],
         "fx1_humanizer_vowel2":["a","e","i","o","u"],
         "fx2_humanizer_vowel2":["a","e","i","o","u"],
         "fx1_2x2_chorus_xover_freq":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "fx2_2x2_chorus_xover_freq":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "fx1_rotary_speed_select":["SLOW","FAST"],
         "fx2_rotary_speed_select":["SLOW","FAST"],
         "fx1_rotary2_speed_sel":["SLOW","FAST"],
         "fx2_rotary2_speed_sel":["SLOW","FAST"],
         "fx1_rotary2_balance":createMixerChBalanceList(),
         "fx2_rotary2_balance":createMixerChBalanceList(),
         "fx1_2x2_chorus_low_pre_delay":createChorusPreDelayList(),
         "fx1_2x2_chorus_high_pre_delay":createChorusPreDelayList(),
         "fx2_2x2_chorus_low_pre_delay":createChorusPreDelayList(),
         "fx2_2x2_chorus_high_pre_delay":createChorusPreDelayList(),
         "fx1_sub_delay_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "fx2_sub_delay_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "fx1_harmonist_hr1harm":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "fx1_harmonist_hr2harm":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "fx2_harmonist_hr1harm":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "fx2_harmonist_hr2harm":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "prm_fx2_teraecho_hold":["OFF","ON"],
         "fx1_pitch_shifter_ps1mode":["FAST","MEDIUM","SLOW","MONO"],
         "fx2_pitch_shifter_ps1mode":["FAST","MEDIUM","SLOW","MONO"],
         "fx1_pitch_shifter_ps2mode":["FAST","MEDIUM","SLOW","MONO"],
         "fx2_pitch_shifter_ps2mode":["FAST","MEDIUM","SLOW","MONO"],
         "fx1_phaser90e_script":["OFF","ON"],
         "fx2_phaser90e_script":["OFF","ON"],
         "fx1_dc30_selector":["CHORUS","ECHO"],
         "fx2_dc30_selector":["CHORUS","ECHO"],
         "fx1_dc30_output":["D+E","D/E"],
         "fx2_dc30_output":["D+E","D/E"],
         "reverb_type":["AMBIENCE","ROOM","HALL1","HALL2","PLATE","SPRING","MODULATE"],
         "reverb_time":createReverbTimeList(),
         "reverb_low_cut":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "reverb_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "chorus_pre_delay":createChorusPreDelayList(),
         "chorus_low_cut":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "chorus_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "accel_fx_s_bend_pitch":["-3oct","-2oct","-1oct","+1oct","+2oct","+3oct","+4oct"],
         "divider_mode":["SINGLE","DUAL"],
         "divider_ch_select":["Ch A","Ch B"],
         "divider_ch_a_dynamic":["OFF","POLAR +","POLAR -"],
         "divider_ch_a_filter":["OFF","LPF","HPF"],
         "divider_ch_a_cutoff_freq":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "divider_ch_b_dynamic":["OFF","POLAR +","POLAR -"],
         "divider_ch_b_filter":["OFF","LPF","HPF"],
         "divider_ch_b_cutoff_freq":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "ns1_detect":["INPUT","NS INPUT","FV OUT"],
         "ns2_detect":["INPUT","NS INPUT","FV OUT"],
         "mixer_mode":["STEREO","PAN L/R"],
         "mixer_ch_a_b_balance":createMixerChBalanceList(),
         "foot_volume_volume_curve":["SLOW 1","SLOW 2","NORMAL","FAST"],
         "delay_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "delay_d1_hi_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "delay_d2_hi_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "delay_vtg_lpf":["8kHz","17kHz"],
         "delay_vtg_filter":["OFF","ON"],
         "delay_vtg_feedback_phase":["NORMAL","INVERSE"],
         "delay_vtg_effect_phase":["NORMAL","INVERSE"],
         "delay_vtg_mod_sw":["OFF","ON"],
         "delay2_high_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "delay2_d1_hi_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "delay2_d2_hi_cut":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "delay2_vtg_lpf":["8kHz","17kHz"],
         "delay2_vtg_filter":["OFF","ON"],
         "delay2_vtg_feedback_phase":["NORMAL","INVERSE"],
         "delay2_vtg_effect_phase":["NORMAL","INVERSE"],
         "delay2_vtg_mod_sw":["OFF","ON"],
         "master_key":["C(Am)","Db(Bbm)","D(Bm)","Eb(Cm)","E(C#m)","F(Dm)","F#(D#m)","G(Em)","Ab(Fm)","A(F#m)","Bb(Gm)","B(G#m)"],
         "master_eq_mid_freq":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "master_eq_mid_q":["0.5","1","2","4","8","16"],
         "amp_control":["OFF","ON"],
         "send_return_position":["POST AMP","POST REV"],
         "send_return_mode":["SERIES","PARALLEL"],
         "eq_position":["AMP IN","AMP OUT"],
         "pedal_fx_position":["INPUT","POST AMP"],
         "sys_knob_pos_type":AMP_TYPE_LIST,
         "sys_knob_pos_fx1":createKnobFXList(),
         "sys_knob_pos_fx2":createKnobFXList(),
         "sys_knob_pos_fx3":createKnobFX3List(),
         "knob_assign_booster":CTLDefinitionGT.CTL_DROPDOWN_LIST["BOOSTER"],
         "exp_pedal_assign_booster":CTLDefinitionGT.CTL_DROPDOWN_LIST["BOOSTER"],
         "gafc_exp1_assign_booster":CTLDefinitionGT.CTL_DROPDOWN_LIST["BOOSTER"],
         "gafc_exp2_assign_booster":CTLDefinitionGT.CTL_DROPDOWN_LIST["BOOSTER"],
         "knob_assign_delay":CTLDefinitionGT.CTL_DROPDOWN_LIST["DELAY/DELAY2"],
         "exp_pedal_assign_delay":CTLDefinitionGT.CTL_DROPDOWN_LIST["DELAY/DELAY2"],
         "gafc_exp1_assign_delay":CTLDefinitionGT.CTL_DROPDOWN_LIST["DELAY/DELAY2"],
         "gafc_exp2_assign_delay":CTLDefinitionGT.CTL_DROPDOWN_LIST["DELAY/DELAY2"],
         "knob_assign_reverb":CTLDefinitionGT.CTL_DROPDOWN_LIST["REVERB"],
         "exp_pedal_assign_reverb":CTLDefinitionGT.CTL_DROPDOWN_LIST["REVERB"],
         "gafc_exp1_assign_reverb":CTLDefinitionGT.CTL_DROPDOWN_LIST["REVERB"],
         "gafc_exp2_assign_reverb":CTLDefinitionGT.CTL_DROPDOWN_LIST["REVERB"],
         "knob_assign_chorus":CTLDefinitionGT.CTL_DROPDOWN_LIST["CHORUS"],
         "exp_pedal_assign_chorus":CTLDefinitionGT.CTL_DROPDOWN_LIST["CHORUS"],
         "gafc_exp1_assign_chorus":CTLDefinitionGT.CTL_DROPDOWN_LIST["CHORUS"],
         "gafc_exp2_assign_chorus":CTLDefinitionGT.CTL_DROPDOWN_LIST["CHORUS"],
         "knob_assign_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER"],
         "exp_pedal_assign_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER"],
         "gafc_exp1_assign_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER"],
         "gafc_exp2_assign_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER"],
         "knob_assign_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER"],
         "exp_pedal_assign_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER"],
         "gafc_exp1_assign_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER"],
         "gafc_exp2_assign_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER"],
         "knob_assign_uni_v":CTLDefinitionGT.CTL_DROPDOWN_LIST["UNI-V"],
         "exp_pedal_assign_uni_v":CTLDefinitionGT.CTL_DROPDOWN_LIST["UNI-V"],
         "gafc_exp1_assign_uni_v":CTLDefinitionGT.CTL_DROPDOWN_LIST["UNI-V"],
         "gafc_exp2_assign_uni_v":CTLDefinitionGT.CTL_DROPDOWN_LIST["UNI-V"],
         "knob_assign_tremolo":CTLDefinitionGT.CTL_DROPDOWN_LIST["TREMOLO"],
         "exp_pedal_assign_tremolo":CTLDefinitionGT.CTL_DROPDOWN_LIST["TREMOLO"],
         "gafc_exp1_assign_tremolo":CTLDefinitionGT.CTL_DROPDOWN_LIST["TREMOLO"],
         "gafc_exp2_assign_tremolo":CTLDefinitionGT.CTL_DROPDOWN_LIST["TREMOLO"],
         "knob_assign_vibrato":CTLDefinitionGT.CTL_DROPDOWN_LIST["VIBRATO"],
         "exp_pedal_assign_vibrato":CTLDefinitionGT.CTL_DROPDOWN_LIST["VIBRATO"],
         "gafc_exp1_assign_vibrato":CTLDefinitionGT.CTL_DROPDOWN_LIST["VIBRATO"],
         "gafc_exp2_assign_vibrato":CTLDefinitionGT.CTL_DROPDOWN_LIST["VIBRATO"],
         "knob_assign_rotary":CTLDefinitionGT.CTL_DROPDOWN_LIST["ROTARY"],
         "exp_pedal_assign_rotary":CTLDefinitionGT.CTL_DROPDOWN_LIST["ROTARY"],
         "gafc_exp1_assign_rotary":CTLDefinitionGT.CTL_DROPDOWN_LIST["ROTARY"],
         "gafc_exp2_assign_rotary":CTLDefinitionGT.CTL_DROPDOWN_LIST["ROTARY"],
         "knob_assign_ring_mod":CTLDefinitionGT.CTL_DROPDOWN_LIST["RING MOD"],
         "exp_pedal_assign_ring_mod":CTLDefinitionGT.CTL_DROPDOWN_LIST["RING MOD"],
         "gafc_exp1_assign_ring_mod":CTLDefinitionGT.CTL_DROPDOWN_LIST["RING MOD"],
         "gafc_exp2_assign_ring_mod":CTLDefinitionGT.CTL_DROPDOWN_LIST["RING MOD"],
         "knob_assign_slow_gear":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLOW GEAR"],
         "exp_pedal_assign_slow_gear":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLOW GEAR"],
         "gafc_exp1_assign_slow_gear":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLOW GEAR"],
         "gafc_exp2_assign_slow_gear":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLOW GEAR"],
         "knob_assign_slicer":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLICER"],
         "exp_pedal_assign_slicer":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLICER"],
         "gafc_exp1_assign_slicer":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLICER"],
         "gafc_exp2_assign_slicer":CTLDefinitionGT.CTL_DROPDOWN_LIST["SLICER"],
         "knob_assign_comp":CTLDefinitionGT.CTL_DROPDOWN_LIST["COMP"],
         "exp_pedal_assign_comp":CTLDefinitionGT.CTL_DROPDOWN_LIST["COMP"],
         "gafc_exp1_assign_comp":CTLDefinitionGT.CTL_DROPDOWN_LIST["COMP"],
         "gafc_exp2_assign_comp":CTLDefinitionGT.CTL_DROPDOWN_LIST["COMP"],
         "knob_assign_limiter":CTLDefinitionGT.CTL_DROPDOWN_LIST["LIMITER"],
         "exp_pedal_assign_limiter":CTLDefinitionGT.CTL_DROPDOWN_LIST["LIMITER"],
         "gafc_exp1_assign_limiter":CTLDefinitionGT.CTL_DROPDOWN_LIST["LIMITER"],
         "gafc_exp2_assign_limiter":CTLDefinitionGT.CTL_DROPDOWN_LIST["LIMITER"],
         "knob_assign_t_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["T.WAH"],
         "exp_pedal_assign_t_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["T.WAH"],
         "gafc_exp1_assign_t_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["T.WAH"],
         "gafc_exp2_assign_t_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["T.WAH"],
         "knob_assign_auto_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["AUTO WAH"],
         "exp_pedal_assign_auto_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["AUTO WAH"],
         "gafc_exp1_assign_auto_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["AUTO WAH"],
         "gafc_exp2_assign_auto_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["AUTO WAH"],
         "knob_assign_pedal_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["PEDAL WAH"],
         "exp_pedal_assign_pedal_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["PEDAL WAH"],
         "gafc_exp1_assign_pedal_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["PEDAL WAH"],
         "gafc_exp2_assign_pedal_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["PEDAL WAH"],
         "knob_assign_geq":CTLDefinitionGT.CTL_DROPDOWN_LIST["GRAPHIC EQ"],
         "exp_pedal_assign_geq":CTLDefinitionGT.CTL_DROPDOWN_LIST["GRAPHIC EQ"],
         "gafc_exp1_assign_geq":CTLDefinitionGT.CTL_DROPDOWN_LIST["GRAPHIC EQ"],
         "gafc_exp2_assign_geq":CTLDefinitionGT.CTL_DROPDOWN_LIST["GRAPHIC EQ"],
         "knob_assign_peq":CTLDefinitionGT.CTL_DROPDOWN_LIST["PARAMETRIC EQ"],
         "exp_pedal_assign_peq":CTLDefinitionGT.CTL_DROPDOWN_LIST["PARAMETRIC EQ"],
         "gafc_exp1_assign_peq":CTLDefinitionGT.CTL_DROPDOWN_LIST["PARAMETRIC EQ"],
         "gafc_exp2_assign_peq":CTLDefinitionGT.CTL_DROPDOWN_LIST["PARAMETRIC EQ"],
         "knob_assign_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["GUITAR SIM"],
         "exp_pedal_assign_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["GUITAR SIM"],
         "gafc_exp1_assign_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["GUITAR SIM"],
         "gafc_exp2_assign_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["GUITAR SIM"],
         "knob_assign_ac_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.GUITAR SIM"],
         "exp_pedal_assign_ac_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.GUITAR SIM"],
         "gafc_exp1_assign_ac_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.GUITAR SIM"],
         "gafc_exp2_assign_ac_guitar_sim":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.GUITAR SIM"],
         "knob_assign_ac_processor":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.PROCESSOR"],
         "exp_pedal_assign_ac_processor":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.PROCESSOR"],
         "gafc_exp1_assign_ac_processor":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.PROCESSOR"],
         "gafc_exp2_assign_ac_processor":CTLDefinitionGT.CTL_DROPDOWN_LIST["AC.PROCESSOR"],
         "knob_assign_wave_synth":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAVE SYNTH"],
         "exp_pedal_assign_wave_synth":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAVE SYNTH"],
         "gafc_exp1_assign_wave_synth":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAVE SYNTH"],
         "gafc_exp2_assign_wave_synth":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAVE SYNTH"],
         "knob_assign_octave":CTLDefinitionGT.CTL_DROPDOWN_LIST["OCTAVE"],
         "exp_pedal_assign_octave":CTLDefinitionGT.CTL_DROPDOWN_LIST["OCTAVE"],
         "gafc_exp1_assign_octave":CTLDefinitionGT.CTL_DROPDOWN_LIST["OCTAVE"],
         "gafc_exp2_assign_octave":CTLDefinitionGT.CTL_DROPDOWN_LIST["OCTAVE"],
         "knob_assign_pitch_shifter":CTLDefinitionGT.CTL_DROPDOWN_LIST["PITCH SHIFTER"],
         "exp_pedal_assign_pitch_shifter":CTLDefinitionGT.CTL_DROPDOWN_LIST["PITCH SHIFTER"],
         "gafc_exp1_assign_pitch_shifter":CTLDefinitionGT.CTL_DROPDOWN_LIST["PITCH SHIFTER"],
         "gafc_exp2_assign_pitch_shifter":CTLDefinitionGT.CTL_DROPDOWN_LIST["PITCH SHIFTER"],
         "knob_assign_harmonist":CTLDefinitionGT.CTL_DROPDOWN_LIST["HARMONIST"],
         "exp_pedal_assign_harmonist":CTLDefinitionGT.CTL_DROPDOWN_LIST["HARMONIST"],
         "gafc_exp1_assign_harmonist":CTLDefinitionGT.CTL_DROPDOWN_LIST["HARMONIST"],
         "gafc_exp2_assign_harmonist":CTLDefinitionGT.CTL_DROPDOWN_LIST["HARMONIST"],
         "knob_assign_humanizer":CTLDefinitionGT.CTL_DROPDOWN_LIST["HUMANIZER"],
         "exp_pedal_assign_humanizer":CTLDefinitionGT.CTL_DROPDOWN_LIST["HUMANIZER"],
         "gafc_exp1_assign_humanizer":CTLDefinitionGT.CTL_DROPDOWN_LIST["HUMANIZER"],
         "gafc_exp2_assign_humanizer":CTLDefinitionGT.CTL_DROPDOWN_LIST["HUMANIZER"],
         "knob_assign_evh_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER 90E"],
         "exp_pedal_assign_evh_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER 90E"],
         "gafc_exp1_assign_evh_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER 90E"],
         "gafc_exp2_assign_evh_phaser":CTLDefinitionGT.CTL_DROPDOWN_LIST["PHASER 90E"],
         "knob_assign_evh_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER 117E"],
         "exp_pedal_assign_evh_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER 117E"],
         "gafc_exp1_assign_evh_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER 117E"],
         "gafc_exp2_assign_evh_flanger":CTLDefinitionGT.CTL_DROPDOWN_LIST["FLANGER 117E"],
         "knob_assign_evh_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAH 95E"],
         "exp_pedal_assign_evh_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAH 95E"],
         "gafc_exp1_assign_evh_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAH 95E"],
         "gafc_exp2_assign_evh_wah":CTLDefinitionGT.CTL_DROPDOWN_LIST["WAH 95E"],
         "knob_assign_dc30":CTLDefinitionGT.CTL_DROPDOWN_LIST["DC-30"],
         "exp_pedal_assign_dc30":CTLDefinitionGT.CTL_DROPDOWN_LIST["DC-30"],
         "gafc_exp1_assign_dc30":CTLDefinitionGT.CTL_DROPDOWN_LIST["DC-30"],
         "gafc_exp2_assign_dc30":CTLDefinitionGT.CTL_DROPDOWN_LIST["DC-30"],
         "knob_assign_heavy_oct":CTLDefinitionGT.CTL_DROPDOWN_LIST["HEAVY OCTAVE"],
         "exp_pedal_assign_heavy_oct":CTLDefinitionGT.CTL_DROPDOWN_LIST["HEAVY OCTAVE"],
         "gafc_exp1_assign_heavy_oct":CTLDefinitionGT.CTL_DROPDOWN_LIST["HEAVY OCTAVE"],
         "gafc_exp2_assign_heavy_oct":CTLDefinitionGT.CTL_DROPDOWN_LIST["HEAVY OCTAVE"]
      };
      
      public static const PRE_DELAY_DROPDOWN_LIST:Array = [{
         "name":"0 - 300",
         "val":0
      },{
         "name":"16th Note",
         "val":301
      },{
         "name":"Triplet of 8th Note",
         "val":302
      },{
         "name":"Dotted 16th Note",
         "val":303
      },{
         "name":"8th Note",
         "val":304
      },{
         "name":"Triplet of Quarter Note",
         "val":305
      },{
         "name":"Dotted 8th Note",
         "val":306
      },{
         "name":"Quarter Note",
         "val":307
      }];
      
      public static const RATE_DROPDOWN_LIST:Array = [{
         "name":"0 - 100",
         "val":0
      },{
         "name":"Whole Note",
         "val":101
      },{
         "name":"Dotted Half Note",
         "val":102
      },{
         "name":"Triplet of Whole Note",
         "val":103
      },{
         "name":"Half Note",
         "val":104
      },{
         "name":"Dotted Quarter Note",
         "val":105
      },{
         "name":"Triplet of Half Note",
         "val":106
      },{
         "name":"Quarter Note",
         "val":107
      },{
         "name":"Dotted 8th Note",
         "val":108
      },{
         "name":"Triplet of Quarter Note",
         "val":109
      },{
         "name":"8th Note",
         "val":110
      },{
         "name":"Dotted 16th Note",
         "val":111
      },{
         "name":"Triplet of 8th Note",
         "val":112
      },{
         "name":"16th Note",
         "val":113
      }];
      
      public static const STEP_RATE_DROPDOWN_LIST:Array = [{
         "name":"OFF",
         "val":0
      },{
         "name":"0 - 100",
         "val":1
      }];
      
      public static const DELAY_TIME_DROPDOWN_LIST:Array = [{
         "name":"1ms - 1000ms",
         "val":0
      },{
         "name":"16th Note",
         "val":1001
      },{
         "name":"Triplet of 8th Note",
         "val":1002
      },{
         "name":"Dotted 16th Note",
         "val":1003
      },{
         "name":"8th Note",
         "val":1004
      },{
         "name":"Triplet of Quarter Note",
         "val":1005
      },{
         "name":"Dotted 8th Note",
         "val":1006
      },{
         "name":"Quarter Note",
         "val":1007
      },{
         "name":"Triplet of Half Note",
         "val":1008
      },{
         "name":"Dotted Quarter Note",
         "val":1009
      },{
         "name":"Half Note",
         "val":1010
      },{
         "name":"Triplet of Whole Note",
         "val":1011
      },{
         "name":"Dotted Half Note",
         "val":1012
      },{
         "name":"Whole Note",
         "val":1013
      }];
      
      public static const FX_DELAY_TIME_DROPDOWN_LIST:Array = [{
         "name":"1ms - 1000ms",
         "val":0
      },{
         "name":"16th Note",
         "val":1001
      },{
         "name":"Triplet of 8th Note",
         "val":1002
      },{
         "name":"Dotted 16th Note",
         "val":1003
      },{
         "name":"8th Note",
         "val":1004
      },{
         "name":"Triplet of Quarter Note",
         "val":1005
      },{
         "name":"Dotted 8th Note",
         "val":1006
      },{
         "name":"Quarter Note",
         "val":1007
      }];
      
      public static const DELAY_DELAY_TIME_DROPDOWN_LIST:Array = [{
         "name":"1ms - 2000ms",
         "val":0
      },{
         "name":"16th Note",
         "val":2001
      },{
         "name":"Triplet of 8th Note",
         "val":2002
      },{
         "name":"Dotted 16th Note",
         "val":2003
      },{
         "name":"8th Note",
         "val":2004
      },{
         "name":"Triplet of Quarter Note",
         "val":2005
      },{
         "name":"Dotted 8th Note",
         "val":2006
      },{
         "name":"Quarter Note",
         "val":2007
      },{
         "name":"Triplet of Half Note",
         "val":2008
      },{
         "name":"Dotted Quarter Note",
         "val":2009
      },{
         "name":"Half Note",
         "val":2010
      },{
         "name":"Triplet of Whole Note",
         "val":2011
      },{
         "name":"Dotted Half Note",
         "val":2012
      },{
         "name":"Whole Note",
         "val":2013
      }];
      
      public static const STEPPER_AND_DROPDOWN_LIST:Object = {
         "fx1_phaser_step_rate":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":1,
            "dropdown":STEP_RATE_DROPDOWN_LIST
         },
         "fx2_phaser_step_rate":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":1,
            "dropdown":STEP_RATE_DROPDOWN_LIST
         }
      };
      
      public static var QUICK_SETTING_WRITE_SOURCE_GT100:Array = [{
         "name":"PREAMP A",
         "val":0
      },{
         "name":"PREAMP B",
         "val":1
      },{
         "name":"OD/DS",
         "val":2
      },{
         "name":"DELAY",
         "val":3
      },{
         "name":"CHORUS",
         "val":4
      },{
         "name":"REVERB",
         "val":5
      },{
         "name":"COMP",
         "val":6
      },{
         "name":"EQ",
         "val":7
      },{
         "name":"PEDAL BEND",
         "val":8
      },{
         "name":"WAH",
         "val":9
      },{
         "name":"SEND/RETURN",
         "val":10
      },{
         "name":"DIVIDER",
         "val":11
      },{
         "name":"FX1",
         "val":12
      },{
         "name":"FX2",
         "val":13
      },{
         "name":"ASSIGN1",
         "val":14
      },{
         "name":"ASSIGN2",
         "val":15
      },{
         "name":"ASSIGN3",
         "val":16
      },{
         "name":"ASSIGN4",
         "val":17
      },{
         "name":"ASSIGN5",
         "val":18
      },{
         "name":"ASSIGN6",
         "val":19
      },{
         "name":"ASSIGN7",
         "val":20
      },{
         "name":"ASSIGN8",
         "val":21
      }];
      
      public static var QUICK_SETTING_WRITE_SOURCE_GT001:Array = [{
         "name":"PREAMP A",
         "val":0
      },{
         "name":"PREAMP B",
         "val":1
      },{
         "name":"OD/DS",
         "val":2
      },{
         "name":"DELAY",
         "val":3
      },{
         "name":"CHORUS",
         "val":4
      },{
         "name":"REVERB",
         "val":5
      },{
         "name":"COMP",
         "val":6
      },{
         "name":"EQ",
         "val":7
      },{
         "name":"PEDAL BEND",
         "val":8
      },{
         "name":"WAH",
         "val":9
      },{
         "name":"DIVIDER",
         "val":11
      },{
         "name":"FX1",
         "val":12
      },{
         "name":"FX2",
         "val":13
      },{
         "name":"ASSIGN1",
         "val":14
      },{
         "name":"ASSIGN2",
         "val":15
      },{
         "name":"ASSIGN3",
         "val":16
      },{
         "name":"ASSIGN4",
         "val":17
      },{
         "name":"ASSIGN5",
         "val":18
      },{
         "name":"ASSIGN6",
         "val":19
      },{
         "name":"ASSIGN7",
         "val":20
      },{
         "name":"ASSIGN8",
         "val":21
      }];
      
      public static var FX_BOOSTER_LIST:Array = [{
         "val":1,
         "label":"CLEAN BST"
      },{
         "val":2,
         "label":"TREBLE BST"
      },{
         "val":0,
         "label":"MID BST"
      },{
         "val":3,
         "label":"CRUNCH OD"
      },{
         "val":10,
         "label":"BLUES DRIVE"
      },{
         "val":11,
         "label":"OVERDRIVE"
      },{
         "val":4,
         "label":"NATURAL OD"
      },{
         "val":5,
         "label":"WARM OD"
      },{
         "val":13,
         "label":"TURBO OD"
      },{
         "val":12,
         "label":"T-SCREAM"
      },{
         "val":14,
         "label":"DISTORTION"
      },{
         "val":6,
         "label":"FAT DS"
      },{
         "val":17,
         "label":"DST+"
      },{
         "val":16,
         "label":"GUV DS"
      },{
         "val":15,
         "label":"RAT"
      },{
         "val":18,
         "label":"METAL ZONE"
      },{
         "val":8,
         "label":"METAL DS"
      },{
         "val":19,
         "label":"\'60S FUZZ"
      },{
         "val":20,
         "label":"MUFF FUZZ"
      },{
         "val":9,
         "label":"OCT FUZZ"
      }];
      
      public static var FX_DELAY_LIST:Array = [{
         "val":0,
         "label":"DIGITAL"
      },{
         "val":1,
         "label":"PAN"
      },{
         "val":2,
         "label":"STEREO"
      },{
         "val":7,
         "label":"ANALOG"
      },{
         "val":8,
         "label":"TAPE ECHO"
      },{
         "val":6,
         "label":"REVERSE"
      },{
         "val":9,
         "label":"MODULATE"
      },{
         "val":10,
         "label":"SDE-3000"
      }];
      
      public static var FX_REVERB_LIST:Array = [{
         "val":4,
         "label":"PLATE"
      },{
         "val":1,
         "label":"ROOM"
      },{
         "val":3,
         "label":"HALL"
      },{
         "val":5,
         "label":"SPRING"
      },{
         "val":6,
         "label":"MODULATE"
      }];
      
      public static var FX_DLY_REV_LAYER_LIST:Array = [{
         "val":0,
         "label":"DELAY"
      },{
         "val":1,
         "label":"DLY+REV"
      },{
         "val":2,
         "label":"REVERB"
      }];
      
      public static var FX_MOD_LIST:Array = [{
         "val":29,
         "label":"CHORUS"
      },{
         "val":20,
         "label":"FLANGER"
      },{
         "val":19,
         "label":"PHASER"
      },{
         "val":23,
         "label":"UNI-V"
      },{
         "val":21,
         "label":"TREMOLO"
      },{
         "val":26,
         "label":"VIBRATO"
      },{
         "val":22,
         "label":"ROTARY"
      },{
         "val":27,
         "label":"RING MOD"
      },{
         "val":10,
         "label":"SLOW GEAR"
      },{
         "val":25,
         "label":"SLICER"
      },{
         "val":3,
         "label":"COMP"
      },{
         "val":4,
         "label":"LIMITER"
      },{
         "val":0,
         "label":"T.WAH"
      },{
         "val":1,
         "label":"AUTO WAH"
      },{
         "val":2,
         "label":"PEDAL WAH"
      },{
         "val":6,
         "label":"GEQ"
      },{
         "val":7,
         "label":"PEQ"
      },{
         "val":9,
         "label":"GUITAR SIM"
      },{
         "val":31,
         "label":"AC.GTR SIM"
      },{
         "val":18,
         "label":"AC.PROCESS"
      },{
         "val":12,
         "label":"WAVE SYNTH"
      },{
         "val":14,
         "label":"OCTAVE"
      },{
         "val":39,
         "label":"HEAVY OCT"
      },{
         "val":15,
         "label":"PITCH SHIFT"
      },{
         "val":16,
         "label":"HARMONIST"
      },{
         "val":28,
         "label":"HUMANIZER"
      },{
         "val":35,
         "label":"PHASER 90E"
      },{
         "val":36,
         "label":"FLNGR 117E"
      },{
         "val":37,
         "label":"WAH 95E"
      },{
         "val":38,
         "label":"DC-30"
      }];
      
      public static var EFFECT_BOX_ASSIGN:Array = [{
         "id":"fxbox_asgn_fx1a_g",
         "name":"FXBOX_ASGN_FX1A_G",
         "min":0,
         "max":20,
         "step":1
      },{
         "id":"fxbox_asgn_fx1a_r",
         "name":"FXBOX_ASGN_FX1A_R",
         "min":0,
         "max":20,
         "step":1
      },{
         "id":"fxbox_asgn_fx1a_y",
         "name":"FXBOX_ASGN_FX1A_Y",
         "min":0,
         "max":20,
         "step":1
      },{
         "id":"fxbox_asgn_fx1b_g",
         "name":"FXBOX_ASGN_FX1B_G",
         "min":0,
         "max":31,
         "step":1
      },{
         "id":"fxbox_asgn_fx1b_r",
         "name":"FXBOX_ASGN_FX1B_R",
         "min":0,
         "max":31,
         "step":1
      },{
         "id":"fxbox_asgn_fx1b_y",
         "name":"FXBOX_ASGN_FX1B_Y",
         "min":0,
         "max":31,
         "step":1
      },{
         "id":"fxbox_asgn_fx2a_g",
         "name":"FXBOX_ASGN_FX2A_G",
         "min":0,
         "max":9,
         "step":1
      },{
         "id":"fxbox_asgn_fx2a_r",
         "name":"FXBOX_ASGN_FX2A_R",
         "min":0,
         "max":9,
         "step":1
      },{
         "id":"fxbox_asgn_fx2a_y",
         "name":"FXBOX_ASGN_FX2A_Y",
         "min":0,
         "max":9,
         "step":1
      },{
         "id":"fxbox_asgn_fx2b_g",
         "name":"FXBOX_ASGN_FX2B_G",
         "min":0,
         "max":31,
         "step":1
      },{
         "id":"fxbox_asgn_fx2b_r",
         "name":"FXBOX_ASGN_FX2B_R",
         "min":0,
         "max":31,
         "step":1
      },{
         "id":"fxbox_asgn_fx2b_y",
         "name":"FXBOX_ASGN_FX2B_Y",
         "min":0,
         "max":31,
         "step":1
      },{
         "id":"fxbox_layer_fx3_g",
         "name":"FXBOX_LAYER_FX3_G",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"fxbox_layer_fx3_r",
         "name":"FXBOX_LAYER_FX3_R",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"fxbox_layer_fx3_y",
         "name":"FXBOX_LAYER_FX3_Y",
         "min":0,
         "max":2,
         "step":1
      },{
         "id":"fxbox_asgn_fx3b_g",
         "name":"FXBOX_ASGN_FX3B_G",
         "min":0,
         "max":9,
         "step":1
      },{
         "id":"fxbox_asgn_fx3b_r",
         "name":"FXBOX_ASGN_FX3B_R",
         "min":0,
         "max":9,
         "step":1
      },{
         "id":"fxbox_asgn_fx3b_y",
         "name":"FXBOX_ASGN_FX3B_Y",
         "min":0,
         "max":9,
         "step":1
      },{
         "id":"fxbox_asgn_fx3_g",
         "name":"FXBOX_ASGN_FX3_G",
         "min":0,
         "max":6,
         "step":1
      },{
         "id":"fxbox_asgn_fx3_r",
         "name":"FXBOX_ASGN_FX3_R",
         "min":0,
         "max":6,
         "step":1
      },{
         "id":"fxbox_asgn_fx3_y",
         "name":"FXBOX_ASGN_FX3_Y",
         "min":0,
         "max":6,
         "step":1
      }];
      
      public function ParameterDefinitionGT()
      {
         super();
      }
      
      public static function createParamNoList() : void
      {
         if(ToneCentralMediator.getInstance().ampModel == 0)
         {
            PARAM_NO_LIST = ["PANEL","A: CH1","A: CH2","B: CH1","B: CH2"];
         }
         else
         {
            PARAM_NO_LIST = ["PANEL","A: CH1","A: CH2","A: CH3","A: CH4","B: CH1","B: CH2","B: CH3","B: CH4"];
         }
      }
      
      private static function getPatchNo(param1:int, param2:int) : String
      {
         var _loc3_:int = param1.toString().length;
         var _loc4_:String = "";
         var _loc5_:int = _loc3_;
         while(_loc5_ < param2)
         {
            _loc4_ += "0";
            _loc5_++;
         }
         return _loc4_ + param1.toString();
      }
      
      public static function isPreAMP(param1:String) : Boolean
      {
         var _loc2_:Array = ["PREAMP A","PREAMP B"];
         return _loc2_.indexOf(param1) != -1;
      }
      
      private static function createMixerChBalanceList() : Array
      {
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 50)
         {
            _loc1_.push("100:" + _loc2_);
            _loc2_ += 2;
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ <= 50)
         {
            _loc1_.push(_loc2_ + ":100");
            _loc2_ -= 2;
            _loc3_++;
         }
         return _loc1_;
      }
      
      private static function createReverbTimeList() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         var _loc3_:NumberFormatter = new NumberFormatter();
         _loc3_.precision = 1;
         _loc2_ = 1;
         while(_loc2_ <= 100)
         {
            _loc1_.push(_loc3_.format(_loc2_ / 10) + "s");
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function createChorusPreDelayList() : Array
      {
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc4_:NumberFormatter = new NumberFormatter();
         _loc4_.precision = 1;
         _loc3_ = 0;
         while(_loc3_ <= 80)
         {
            _loc1_.push(_loc4_.format(_loc2_ / 10) + "ms");
            _loc2_ += 5;
            _loc3_++;
         }
         return _loc1_;
      }
      
      private static function createKnobFXList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < 104)
         {
            if(_loc2_ == 0 || _loc2_ == 52)
            {
               _loc1_.push("OFF");
            }
            else if(_loc2_ > 52)
            {
               _loc1_.push((_loc2_ - 53).toString());
            }
            else
            {
               _loc1_.push((_loc2_ - 1).toString());
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function createKnobFX3List() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < 102)
         {
            if(_loc2_ == 0)
            {
               _loc1_.push("OFF");
            }
            else
            {
               _loc1_.push((_loc2_ - 1).toString());
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function getHarmonistCodeName(param1:Number) : String
      {
         var _loc2_:int = ToneCentralMediator.getInstance().sysex.params.temporaryParams.master_key;
         var _loc3_:Array = ParameterDefinitionGT.CODE_LIST.concat();
         param1 += _loc2_;
         while(param1 >= _loc3_.length)
         {
            _loc3_ = _loc3_.concat(_loc3_);
         }
         return _loc3_[param1];
      }
      
      public static function getHarmonistCodeIndex(param1:String) : Number
      {
         switch(param1)
         {
            case "fx1_harmonist_hr1c":
            case "fx1_harmonist_hr2c":
            case "fx2_harmonist_hr1c":
            case "fx2_harmonist_hr2c":
               return 0;
            case "fx1_harmonist_hr1db":
            case "fx1_harmonist_hr2db":
            case "fx2_harmonist_hr1db":
            case "fx2_harmonist_hr2db":
               return 1;
            case "fx1_harmonist_hr1d":
            case "fx1_harmonist_hr2d":
            case "fx2_harmonist_hr1d":
            case "fx2_harmonist_hr2d":
               return 2;
            case "fx1_harmonist_hr1eb":
            case "fx1_harmonist_hr2eb":
            case "fx2_harmonist_hr1eb":
            case "fx2_harmonist_hr2eb":
               return 3;
            case "fx1_harmonist_hr1e":
            case "fx1_harmonist_hr2e":
            case "fx2_harmonist_hr1e":
            case "fx2_harmonist_hr2e":
               return 4;
            case "fx1_harmonist_hr1f":
            case "fx1_harmonist_hr2f":
            case "fx2_harmonist_hr1f":
            case "fx2_harmonist_hr2f":
               return 5;
            case "fx1_harmonist_hr1f_s":
            case "fx1_harmonist_hr2f_s":
            case "fx2_harmonist_hr1f_s":
            case "fx2_harmonist_hr2f_s":
               return 6;
            case "fx1_harmonist_hr1g":
            case "fx1_harmonist_hr2g":
            case "fx2_harmonist_hr1g":
            case "fx2_harmonist_hr2g":
               return 7;
            case "fx1_harmonist_hr1ab":
            case "fx1_harmonist_hr2ab":
            case "fx2_harmonist_hr1ab":
            case "fx2_harmonist_hr2ab":
               return 8;
            case "fx1_harmonist_hr1a":
            case "fx1_harmonist_hr2a":
            case "fx2_harmonist_hr1a":
            case "fx2_harmonist_hr2a":
               return 9;
            case "fx1_harmonist_hr1bb":
            case "fx1_harmonist_hr2bb":
            case "fx2_harmonist_hr1bb":
            case "fx2_harmonist_hr2bb":
               return 10;
            case "fx1_harmonist_hr1b":
            case "fx1_harmonist_hr2b":
            case "fx2_harmonist_hr1b":
            case "fx2_harmonist_hr2b":
               return 11;
            default:
               return NaN;
         }
      }
   }
}

