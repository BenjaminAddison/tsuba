package tonecentral.common.define
{
   public class CTLDefinitionGT
   {
      
      public static const ACCEL_CTL:String = "ACCEL/CTL";
      
      public static const EXP:String = "EXP";
      
      public static const SUB_CTL1:String = "SUB CTL1";
      
      public static const SUB_CTL2:String = "SUB CTL2";
      
      public static const SUB_EXP:String = "SUB EXP";
      
      public static const EXP_SW:String = "EXP SW";
      
      public static const ASSIGN1:String = "ASSIGN1";
      
      public static const ASSIGN2:String = "ASSIGN2";
      
      public static const ASSIGN3:String = "ASSIGN3";
      
      public static const ASSIGN4:String = "ASSIGN4";
      
      public static const ASSIGN5:String = "ASSIGN5";
      
      public static const ASSIGN6:String = "ASSIGN6";
      
      public static const ASSIGN7:String = "ASSIGN7";
      
      public static const ASSIGN8:String = "ASSIGN8";
      
      public static const ASSIGN_COMMON:String = "ASSIGN COMMON";
      
      public static const KNOB:String = "KNOB";
      
      public static const EXP_PEDAL:String = "EXP PEDAL";
      
      public static const GAFC_EXP1:String = "GAFC EXP1";
      
      public static const GAFC_EXP2:String = "GAFC EXP2";
      
      public static const EXP_PEDAL_MIN:String = "EXP PEDAL MIN";
      
      public static const EXP_PEDAL_MAX:String = "EXP PEDAL MAX";
      
      public static const GAFC_EXP1_MIN:String = "GAFC EXP1 MIN";
      
      public static const GAFC_EXP1_MAX:String = "GAFC EXP1 MAX";
      
      public static const GAFC_EXP2_MIN:String = "GAFC EXP2 MIN";
      
      public static const GAFC_EXP2_MAX:String = "GAFC EXP2 MAX";
      
      public static const CTL_NAME:Array = [{
         "gt001":true,
         "gt100":true,
         "name":KNOB
      },{
         "gt001":true,
         "gt100":true,
         "name":EXP_PEDAL
      },{
         "gt001":true,
         "gt100":true,
         "name":EXP_PEDAL_MIN
      },{
         "gt001":true,
         "gt100":true,
         "name":EXP_PEDAL_MAX
      },{
         "gt001":true,
         "gt100":true,
         "name":GAFC_EXP1
      },{
         "gt001":true,
         "gt100":true,
         "name":GAFC_EXP1_MIN
      },{
         "gt001":true,
         "gt100":true,
         "name":GAFC_EXP1_MAX
      },{
         "gt001":true,
         "gt100":true,
         "name":GAFC_EXP2
      },{
         "gt001":true,
         "gt100":true,
         "name":GAFC_EXP2_MIN
      },{
         "gt001":true,
         "gt100":true,
         "name":GAFC_EXP2_MAX
      }];
      
      public static const CTL_NAME_50:Array = [{
         "gt001":true,
         "gt100":true,
         "name":KNOB
      },{
         "gt001":true,
         "gt100":true,
         "name":EXP_PEDAL
      },{
         "gt001":true,
         "gt100":true,
         "name":EXP_PEDAL_MIN
      },{
         "gt001":true,
         "gt100":true,
         "name":EXP_PEDAL_MAX
      }];
      
      public static const CTL_PRESET_NAME:Array = [ACCEL_CTL,EXP,SUB_CTL1,SUB_CTL2,SUB_EXP,EXP_SW];
      
      public static const PRESET_PATTERN_1_FUNC:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"OFF"
      },{
         "gt001":true,
         "gt100":true,
         "val":1,
         "name":"ACCEL"
      },{
         "gt001":false,
         "gt100":true,
         "val":2,
         "name":"P.LOOP ON/OFF"
      },{
         "gt001":false,
         "gt100":true,
         "val":3,
         "name":"P.LOOP REC/PLY"
      },{
         "gt001":false,
         "gt100":true,
         "val":4,
         "name":"P.LOOP STP/PLY"
      },{
         "gt001":false,
         "gt100":true,
         "val":5,
         "name":"P.LOOP CLEAR"
      },{
         "gt001":true,
         "gt100":true,
         "val":6,
         "name":"DIV CH SELECT"
      },{
         "gt001":true,
         "gt100":true,
         "val":7,
         "name":"OD/DS SOLO"
      },{
         "gt001":true,
         "gt100":true,
         "val":8,
         "name":"A/B SOLO"
      },{
         "gt001":true,
         "gt100":true,
         "val":9,
         "name":"A&B SOLO"
      },{
         "gt001":true,
         "gt100":true,
         "val":10,
         "name":"COMP"
      },{
         "gt001":true,
         "gt100":true,
         "val":11,
         "name":"OD/DS"
      },{
         "gt001":true,
         "gt100":true,
         "val":12,
         "name":"PREAMP"
      },{
         "gt001":true,
         "gt100":true,
         "val":13,
         "name":"EQ"
      },{
         "gt001":true,
         "gt100":true,
         "val":14,
         "name":"FX1"
      },{
         "gt001":true,
         "gt100":true,
         "val":15,
         "name":"FX2"
      },{
         "gt001":true,
         "gt100":true,
         "val":16,
         "name":"DELAY"
      },{
         "gt001":true,
         "gt100":true,
         "val":17,
         "name":"CHORUS"
      },{
         "gt001":true,
         "gt100":true,
         "val":18,
         "name":"REVERB"
      },{
         "gt001":true,
         "gt100":true,
         "val":19,
         "name":"PEDAL FX"
      },{
         "gt001":false,
         "gt100":true,
         "val":20,
         "name":"SEND/RETURN"
      },{
         "gt001":false,
         "gt100":true,
         "val":21,
         "name":"AMP CTL"
      },{
         "gt001":true,
         "gt100":true,
         "val":22,
         "name":"TUNER"
      },{
         "gt001":false,
         "gt100":true,
         "val":23,
         "name":"MANUAL MODE"
      },{
         "gt001":true,
         "gt100":true,
         "val":24,
         "name":"BPM TAP"
      },{
         "gt001":true,
         "gt100":true,
         "val":25,
         "name":"DELAY TAP"
      },{
         "gt001":true,
         "gt100":true,
         "val":26,
         "name":"MIDI START"
      },{
         "gt001":true,
         "gt100":true,
         "val":27,
         "name":"MMC PLAY"
      },{
         "gt001":true,
         "gt100":true,
         "val":28,
         "name":"LEVEL +10"
      },{
         "gt001":true,
         "gt100":true,
         "val":29,
         "name":"LEVEL +20"
      },{
         "gt001":true,
         "gt100":true,
         "val":30,
         "name":"LEVEL -10"
      },{
         "gt001":true,
         "gt100":true,
         "val":31,
         "name":"LEVEL -20"
      },{
         "gt001":true,
         "gt100":true,
         "val":32,
         "name":"NUMBER INC"
      },{
         "gt001":true,
         "gt100":true,
         "val":33,
         "name":"NUMBER DEC"
      },{
         "gt001":false,
         "gt100":true,
         "val":34,
         "name":"BANK INC"
      },{
         "gt001":false,
         "gt100":true,
         "val":35,
         "name":"BANK DEC"
      },{
         "gt001":false,
         "gt100":true,
         "val":36,
         "name":"LED ON/OFF"
      },{
         "gt001":true,
         "gt100":false,
         "val":37,
         "name":"FAVORITE INC"
      },{
         "gt001":true,
         "gt100":false,
         "val":38,
         "name":"FAVORITE DEC"
      }];
      
      public static const PRESET_PATTERN_2_FUNC_PATCH:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"OFF"
      },{
         "gt001":true,
         "gt100":true,
         "val":1,
         "name":"FOOT VOLUME"
      },{
         "gt001":true,
         "gt100":true,
         "val":2,
         "name":"PEDAL BEND"
      },{
         "gt001":true,
         "gt100":true,
         "val":3,
         "name":"WAH"
      },{
         "gt001":true,
         "gt100":true,
         "val":4,
         "name":"PB/FV"
      },{
         "gt001":true,
         "gt100":true,
         "val":5,
         "name":"WAH/FV"
      }];
      
      public static const PRESET_PATTERN_2_FUNC_SYSTEM:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"OFF"
      },{
         "gt001":true,
         "gt100":true,
         "val":1,
         "name":"FOOT VOLUME"
      },{
         "gt001":true,
         "gt100":true,
         "val":2,
         "name":"PEDAL BEND"
      },{
         "gt001":true,
         "gt100":true,
         "val":3,
         "name":"WAH"
      },{
         "gt001":true,
         "gt100":true,
         "val":4,
         "name":"PB/FV"
      },{
         "gt001":true,
         "gt100":true,
         "val":5,
         "name":"WAH/FV"
      },{
         "gt001":true,
         "gt100":true,
         "val":6,
         "name":"PATCH LEVEL"
      }];
      
      public static const PRESET_PATTERN_3_FUNC:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"OFF"
      },{
         "gt001":true,
         "gt100":true,
         "val":1,
         "name":"FOOT VOLUME"
      }];
      
      public static const PRESET_PATTERN_4_FUNC:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"OFF"
      },{
         "gt001":true,
         "gt100":true,
         "val":1,
         "name":"ACCEL"
      },{
         "gt001":false,
         "gt100":true,
         "val":2,
         "name":"P.LOOP ON/OFF"
      },{
         "gt001":false,
         "gt100":true,
         "val":3,
         "name":"P.LOOP REC/PLY"
      },{
         "gt001":false,
         "gt100":true,
         "val":4,
         "name":"P.LOOP STP/PLY"
      },{
         "gt001":false,
         "gt100":true,
         "val":5,
         "name":"P.LOOP CLEAR"
      },{
         "gt001":true,
         "gt100":true,
         "val":6,
         "name":"DIV CH SELECT"
      },{
         "gt001":true,
         "gt100":true,
         "val":7,
         "name":"OD/DS SOLO"
      },{
         "gt001":true,
         "gt100":true,
         "val":8,
         "name":"A/B SOLO"
      },{
         "gt001":true,
         "gt100":true,
         "val":9,
         "name":"A&B SOLO"
      },{
         "gt001":true,
         "gt100":true,
         "val":10,
         "name":"COMP"
      },{
         "gt001":true,
         "gt100":true,
         "val":11,
         "name":"OD/DS"
      },{
         "gt001":true,
         "gt100":true,
         "val":12,
         "name":"PREAMP"
      },{
         "gt001":true,
         "gt100":true,
         "val":13,
         "name":"EQ"
      },{
         "gt001":true,
         "gt100":true,
         "val":14,
         "name":"FX1"
      },{
         "gt001":true,
         "gt100":true,
         "val":15,
         "name":"FX2"
      },{
         "gt001":true,
         "gt100":true,
         "val":16,
         "name":"DELAY"
      },{
         "gt001":true,
         "gt100":true,
         "val":17,
         "name":"CHORUS"
      },{
         "gt001":true,
         "gt100":true,
         "val":18,
         "name":"REVERB"
      },{
         "gt001":true,
         "gt100":true,
         "val":19,
         "name":"PEDAL FX"
      },{
         "gt001":false,
         "gt100":true,
         "val":20,
         "name":"SEND/RETURN"
      },{
         "gt001":false,
         "gt100":true,
         "val":21,
         "name":"AMP CTL"
      },{
         "gt001":true,
         "gt100":true,
         "val":22,
         "name":"TUNER"
      },{
         "gt001":false,
         "gt100":true,
         "val":23,
         "name":"MANUAL MODE"
      },{
         "gt001":true,
         "gt100":true,
         "val":24,
         "name":"BPM TAP"
      },{
         "gt001":true,
         "gt100":true,
         "val":25,
         "name":"DELAY TAP"
      },{
         "gt001":true,
         "gt100":true,
         "val":26,
         "name":"MIDI START"
      },{
         "gt001":true,
         "gt100":true,
         "val":27,
         "name":"MMC PLAY"
      },{
         "gt001":true,
         "gt100":true,
         "val":28,
         "name":"LEVEL +10"
      },{
         "gt001":true,
         "gt100":true,
         "val":29,
         "name":"LEVEL +20"
      },{
         "gt001":true,
         "gt100":true,
         "val":30,
         "name":"LEVEL -10"
      },{
         "gt001":true,
         "gt100":true,
         "val":31,
         "name":"LEVEL -20"
      },{
         "gt001":true,
         "gt100":true,
         "val":32,
         "name":"NUMBER INC"
      },{
         "gt001":true,
         "gt100":true,
         "val":33,
         "name":"NUMBER DEC"
      },{
         "gt001":false,
         "gt100":true,
         "val":34,
         "name":"BANK INC"
      },{
         "gt001":false,
         "gt100":true,
         "val":35,
         "name":"BANK DEC"
      },{
         "gt001":true,
         "gt100":false,
         "val":37,
         "name":"FAVORITE INC"
      },{
         "gt001":true,
         "gt100":false,
         "val":38,
         "name":"FAVORITE DEC"
      }];
      
      public static const ASSIGN_SOURCE_LIST:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"EXP PEDAL"
      },{
         "gt001":false,
         "gt100":true,
         "val":1,
         "name":"EXP PDL SW"
      },{
         "gt001":false,
         "gt100":true,
         "val":2,
         "name":"P.LOOP PEDAL"
      },{
         "gt001":false,
         "gt100":true,
         "val":3,
         "name":"ACC/CTL PDL"
      },{
         "gt001":false,
         "gt100":true,
         "val":4,
         "name":"SUB EXP PDL"
      },{
         "gt001":true,
         "gt100":true,
         "val":5,
         "name":"SUB CTL1 PDL"
      },{
         "gt001":true,
         "gt100":true,
         "val":6,
         "name":"SUB CTL2 PDL"
      },{
         "gt001":true,
         "gt100":true,
         "val":7,
         "name":"INT PEDAL"
      },{
         "gt001":true,
         "gt100":true,
         "val":8,
         "name":"WAVE PEDAL"
      },{
         "gt001":true,
         "gt100":true,
         "val":9,
         "name":"INPUT LEVEL"
      },{
         "gt001":true,
         "gt100":true,
         "val":10,
         "name":"CC# 1"
      },{
         "gt001":true,
         "gt100":true,
         "val":11,
         "name":"CC# 2"
      },{
         "gt001":true,
         "gt100":true,
         "val":12,
         "name":"CC# 3"
      },{
         "gt001":true,
         "gt100":true,
         "val":13,
         "name":"CC# 4"
      },{
         "gt001":true,
         "gt100":true,
         "val":14,
         "name":"CC# 5"
      },{
         "gt001":true,
         "gt100":true,
         "val":15,
         "name":"CC# 6"
      },{
         "gt001":true,
         "gt100":true,
         "val":16,
         "name":"CC# 7"
      },{
         "gt001":true,
         "gt100":true,
         "val":17,
         "name":"CC# 8"
      },{
         "gt001":true,
         "gt100":true,
         "val":18,
         "name":"CC# 9"
      },{
         "gt001":true,
         "gt100":true,
         "val":19,
         "name":"CC#10"
      },{
         "gt001":true,
         "gt100":true,
         "val":20,
         "name":"CC#11"
      },{
         "gt001":true,
         "gt100":true,
         "val":21,
         "name":"CC#12"
      },{
         "gt001":true,
         "gt100":true,
         "val":22,
         "name":"CC#13"
      },{
         "gt001":true,
         "gt100":true,
         "val":23,
         "name":"CC#14"
      },{
         "gt001":true,
         "gt100":true,
         "val":24,
         "name":"CC#15"
      },{
         "gt001":true,
         "gt100":true,
         "val":25,
         "name":"CC#16"
      },{
         "gt001":true,
         "gt100":true,
         "val":26,
         "name":"CC#17"
      },{
         "gt001":true,
         "gt100":true,
         "val":27,
         "name":"CC#18"
      },{
         "gt001":true,
         "gt100":true,
         "val":28,
         "name":"CC#19"
      },{
         "gt001":true,
         "gt100":true,
         "val":29,
         "name":"CC#20"
      },{
         "gt001":true,
         "gt100":true,
         "val":30,
         "name":"CC#21"
      },{
         "gt001":true,
         "gt100":true,
         "val":31,
         "name":"CC#22"
      },{
         "gt001":true,
         "gt100":true,
         "val":32,
         "name":"CC#23"
      },{
         "gt001":true,
         "gt100":true,
         "val":33,
         "name":"CC#24"
      },{
         "gt001":true,
         "gt100":true,
         "val":34,
         "name":"CC#25"
      },{
         "gt001":true,
         "gt100":true,
         "val":35,
         "name":"CC#26"
      },{
         "gt001":true,
         "gt100":true,
         "val":36,
         "name":"CC#27"
      },{
         "gt001":true,
         "gt100":true,
         "val":37,
         "name":"CC#28"
      },{
         "gt001":true,
         "gt100":true,
         "val":38,
         "name":"CC#29"
      },{
         "gt001":true,
         "gt100":true,
         "val":39,
         "name":"CC#30"
      },{
         "gt001":true,
         "gt100":true,
         "val":40,
         "name":"CC#31"
      },{
         "gt001":true,
         "gt100":true,
         "val":41,
         "name":"CC#64"
      },{
         "gt001":true,
         "gt100":true,
         "val":42,
         "name":"CC#65"
      },{
         "gt001":true,
         "gt100":true,
         "val":43,
         "name":"CC#66"
      },{
         "gt001":true,
         "gt100":true,
         "val":44,
         "name":"CC#67"
      },{
         "gt001":true,
         "gt100":true,
         "val":45,
         "name":"CC#68"
      },{
         "gt001":true,
         "gt100":true,
         "val":46,
         "name":"CC#69"
      },{
         "gt001":true,
         "gt100":true,
         "val":47,
         "name":"CC#70"
      },{
         "gt001":true,
         "gt100":true,
         "val":48,
         "name":"CC#71"
      },{
         "gt001":true,
         "gt100":true,
         "val":49,
         "name":"CC#72"
      },{
         "gt001":true,
         "gt100":true,
         "val":50,
         "name":"CC#73"
      },{
         "gt001":true,
         "gt100":true,
         "val":51,
         "name":"CC#74"
      },{
         "gt001":true,
         "gt100":true,
         "val":52,
         "name":"CC#75"
      },{
         "gt001":true,
         "gt100":true,
         "val":53,
         "name":"CC#76"
      },{
         "gt001":true,
         "gt100":true,
         "val":54,
         "name":"CC#77"
      },{
         "gt001":true,
         "gt100":true,
         "val":55,
         "name":"CC#78"
      },{
         "gt001":true,
         "gt100":true,
         "val":56,
         "name":"CC#79"
      },{
         "gt001":true,
         "gt100":true,
         "val":57,
         "name":"CC#80"
      },{
         "gt001":true,
         "gt100":true,
         "val":58,
         "name":"CC#81"
      },{
         "gt001":true,
         "gt100":true,
         "val":59,
         "name":"CC#82"
      },{
         "gt001":true,
         "gt100":true,
         "val":60,
         "name":"CC#83"
      },{
         "gt001":true,
         "gt100":true,
         "val":61,
         "name":"CC#84"
      },{
         "gt001":true,
         "gt100":true,
         "val":62,
         "name":"CC#85"
      },{
         "gt001":true,
         "gt100":true,
         "val":63,
         "name":"CC#86"
      },{
         "gt001":true,
         "gt100":true,
         "val":64,
         "name":"CC#87"
      },{
         "gt001":true,
         "gt100":true,
         "val":65,
         "name":"CC#88"
      },{
         "gt001":true,
         "gt100":true,
         "val":66,
         "name":"CC#89"
      },{
         "gt001":true,
         "gt100":true,
         "val":67,
         "name":"CC#90"
      },{
         "gt001":true,
         "gt100":true,
         "val":68,
         "name":"CC#91"
      },{
         "gt001":true,
         "gt100":true,
         "val":69,
         "name":"CC#92"
      },{
         "gt001":true,
         "gt100":true,
         "val":70,
         "name":"CC#93"
      },{
         "gt001":true,
         "gt100":true,
         "val":71,
         "name":"CC#94"
      },{
         "gt001":true,
         "gt100":true,
         "val":72,
         "name":"CC#95"
      },{
         "gt001":false,
         "gt100":true,
         "val":73,
         "name":"NUM PEDAL"
      }];
      
      public static const ASSIGN_SOURCE_MODE_LIST:Array = [{
         "val":0,
         "name":"MOMENT"
      },{
         "val":1,
         "name":"TOGGLE"
      }];
      
      public static const PRESET_PARAMS_LIST:Object = {
         "ACCEL/CTL":[{
            "id":"ctl_exp_accel_ctl_min",
            "sysId":"sys_accel_ctl_min",
            "name":"MIN",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_accel_ctl_max",
            "sysId":"sys_accel_ctl_max",
            "name":"MAX",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_accel_ctl_src_mode",
            "sysId":"sys_accel_ctl_source_mode",
            "name":"SOURCE MODE",
            "min":0,
            "max":1,
            "step":1
         }],
         "EXP":[{
            "id":"ctl_exp_exp_patch_level_min",
            "sysId":"sys_exp_patch_level_min",
            "name":"PATCH LEBEL MIN",
            "min":0,
            "max":200,
            "step":2
         },{
            "id":"ctl_exp_exp_patch_level_max",
            "sysId":"sys_exp_patch_level_max",
            "name":"PATCH LEBEL MAX",
            "min":0,
            "max":200,
            "step":2
         }],
         "EXP PEDAL":[{
            "id":"ctl_exp_sub_ctl2_min",
            "sysId":"sys_sub_ctl2_min",
            "name":"MINX",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_sub_ctl2_max",
            "sysId":"sys_sub_ctl2_max",
            "name":"MAXX",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_sub_ctl2_src_mode",
            "sysId":"sys_sub_ctl2_source_mode",
            "name":"SOURCE MODE",
            "min":0,
            "max":1,
            "step":1
         }],
         "SUB CTL1":[{
            "id":"ctl_exp_sub_ctl1_min",
            "sysId":"sys_sub_ctl1_min",
            "name":"MIN",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_sub_ctl1_max",
            "sysId":"sys_sub_ctl1_max",
            "name":"MAX",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_sub_ctl1_src_mode",
            "sysId":"sys_sub_ctl1_source_mode",
            "name":"SOURCE MODE",
            "min":0,
            "max":1,
            "step":1
         }],
         "SUB CTL2":[{
            "id":"ctl_exp_sub_ctl2_min",
            "sysId":"sys_sub_ctl2_min",
            "name":"MIN",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_sub_ctl2_max",
            "sysId":"sys_sub_ctl2_max",
            "name":"MAX",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_sub_ctl2_src_mode",
            "sysId":"sys_sub_ctl2_source_mode",
            "name":"SOURCE MODE",
            "min":0,
            "max":1,
            "step":1
         }],
         "SUB EXP":[],
         "EXP SW":[{
            "id":"ctl_exp_exp_sw_min",
            "sysId":"sys_exp_sw_min",
            "name":"MIN",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_exp_sw_max",
            "sysId":"sys_exp_sw_max",
            "name":"MAX",
            "min":0,
            "max":1,
            "step":1
         },{
            "id":"ctl_exp_exp_sw_src_mode",
            "sysId":"sys_exp_sw_source_mode",
            "name":"SOURCE MODE",
            "min":0,
            "max":1,
            "step":1
         }]
      };
      
      public static const PARAM_CHANGE_RANGE_SYSTEM:Object = {
         "EXP PEDAL":["00,00,02,71","00,00,02,72"],
         "ACCEL/CTL":["00,00,02,61","00,00,02,62","00,00,02,63"],
         "EXP":["00,00,02,71","00,00,02,72"],
         "SUB CTL1":["00,00,02,69","00,00,02,6A","00,00,02,6B"],
         "SUB CTL2":["00,00,02,6D","00,00,02,6E","00,00,02,6F"],
         "SUB EXP":["00,00,02,74","00,00,02,75"],
         "EXP SW":["00,00,02,65","00,00,02,66","00,00,02,67"]
      };
      
      public static const PARAM_CHANGE_RANGE_TEMP:Object = {
         "EXP PEDAL":["60,00,08,11","60,00,08,12"],
         "ACCEL/CTL":["60,00,07,51","60,00,07,52","60,00,07,53"],
         "EXP":["60,00,08,11","60,00,08,12"],
         "SUB CTL1":["60,00,07,71","60,00,07,72","60,00,07,73"],
         "SUB CTL2":["60,00,08,01","60,00,08,02","60,00,08,03"],
         "SUB EXP":["60,00,08,21","60,00,08,22"],
         "EXP SW":["60,00,07,61","60,00,07,62","60,00,07,63"]
      };
      
      public static const ASSIGN_PARAM_CHANGE_RANGE_TEMP:Object = {
         "ASSIGN1":["60,00,08,33","60,00,08,34","60,00,08,35","60,00,08,36","60,00,08,39","60,00,08,3A","60,00,08,3B","60,00,08,3C","60,00,08,3D","60,00,08,3E","60,00,08,3F"],
         "ASSIGN2":["60,00,08,53","60,00,08,54","60,00,08,55","60,00,08,56","60,00,08,59","60,00,08,5A","60,00,08,5B","60,00,08,5C","60,00,08,5D","60,00,08,5E","60,00,08,5F"],
         "ASSIGN3":["60,00,08,73","60,00,08,74","60,00,08,75","60,00,08,76","60,00,08,79","60,00,08,7A","60,00,08,7B","60,00,08,7C","60,00,08,7D","60,00,08,7E","60,00,08,7F"],
         "ASSIGN4":["60,00,09,13","60,00,09,14","60,00,09,15","60,00,09,16","60,00,09,19","60,00,09,1A","60,00,09,1B","60,00,09,1C","60,00,09,1D","60,00,09,1E","60,00,09,1F"],
         "ASSIGN5":["60,00,09,33","60,00,09,34","60,00,09,35","60,00,09,36","60,00,09,39","60,00,09,3A","60,00,09,3B","60,00,09,3C","60,00,09,3D","60,00,09,3E","60,00,09,3F"],
         "ASSIGN6":["60,00,09,53","60,00,09,54","60,00,09,55","60,00,09,56","60,00,09,59","60,00,09,5A","60,00,09,5B","60,00,09,5C","60,00,09,5D","60,00,09,5E","60,00,09,5F"],
         "ASSIGN7":["60,00,09,73","60,00,09,74","60,00,09,75","60,00,09,76","60,00,09,79","60,00,09,7A","60,00,09,7B","60,00,09,7C","60,00,09,7D","60,00,09,7E","60,00,09,7F"],
         "ASSIGN8":["60,00,0A,13","60,00,0A,14","60,00,0A,15","60,00,0A,16","60,00,0A,19","60,00,0A,1A","60,00,0A,1B","60,00,0A,1C","60,00,0A,1D","60,00,0A,1E","60,00,0A,1F"]
      };
      
      public static const CTL_PEDAL_FUNC_LIST:Array = [{
         "gt001":true,
         "gt100":true,
         "val":0,
         "name":"VOLUME"
      },{
         "gt001":true,
         "gt100":true,
         "val":1,
         "name":"FOOT VOLUME"
      },{
         "gt001":true,
         "gt100":true,
         "val":9,
         "name":"PEDAL FX"
      },{
         "gt001":true,
         "gt100":true,
         "val":2,
         "name":"PEDAL FX/FV"
      },{
         "gt001":true,
         "gt100":true,
         "val":3,
         "name":"BOOSTER(assign)"
      },{
         "gt001":true,
         "gt100":true,
         "val":4,
         "name":"MOD(assign)"
      },{
         "gt001":true,
         "gt100":true,
         "val":5,
         "name":"DELAY(assign)"
      },{
         "gt001":true,
         "gt100":true,
         "val":6,
         "name":"FX(assign)"
      },{
         "gt001":true,
         "gt100":true,
         "val":7,
         "name":"DELAY2(assign)"
      },{
         "gt001":true,
         "gt100":true,
         "val":8,
         "name":"REVERB(assign)"
      }];
      
      public static const CTL_PARAMETER_LIST:Array = [{
         "effect":"BOOSTER",
         "min":0,
         "max":7,
         "step":1
      },{
         "effect":"DELAY/DELAY2",
         "min":0,
         "max":7,
         "step":1
      },{
         "effect":"REVERB",
         "min":0,
         "max":8,
         "step":1
      },{
         "effect":"CHORUS",
         "min":0,
         "max":10,
         "step":1
      },{
         "effect":"FLANGER",
         "min":0,
         "max":7,
         "step":1
      },{
         "effect":"PHASER",
         "min":0,
         "max":7,
         "step":1
      },{
         "effect":"UNI-V",
         "min":0,
         "max":3,
         "step":1
      },{
         "effect":"TREMOLO",
         "min":0,
         "max":4,
         "step":1
      },{
         "effect":"VIBRATO",
         "min":0,
         "max":3,
         "step":1
      },{
         "effect":"ROTARY",
         "min":0,
         "max":3,
         "step":1
      },{
         "effect":"RING MOD",
         "min":0,
         "max":3,
         "step":1
      },{
         "effect":"SLOW GEAR",
         "min":0,
         "max":3,
         "step":1
      },{
         "effect":"SLICER",
         "min":0,
         "max":4,
         "step":1
      },{
         "effect":"COMP",
         "min":0,
         "max":4,
         "step":1
      },{
         "effect":"LIMITER",
         "min":0,
         "max":5,
         "step":1
      },{
         "effect":"T.WAH",
         "min":0,
         "max":5,
         "step":1
      },{
         "effect":"AUTO WAH",
         "min":0,
         "max":6,
         "step":1
      },{
         "effect":"PEDAL WAH",
         "min":0,
         "max":5,
         "step":1
      },{
         "effect":"GRAPHIC EQ",
         "min":0,
         "max":11,
         "step":1
      },{
         "effect":"PARAMETRIC EQ",
         "min":0,
         "max":11,
         "step":1
      },{
         "effect":"GUITAR SIM",
         "min":0,
         "max":4,
         "step":1
      },{
         "effect":"AC.GUITAR SIM",
         "min":0,
         "max":4,
         "step":1
      },{
         "effect":"AC.PROCESSOR",
         "min":0,
         "max":6,
         "step":1
      },{
         "effect":"WAVE SYNTH",
         "min":0,
         "max":7,
         "step":1
      },{
         "effect":"OCTAVE",
         "min":0,
         "max":2,
         "step":1
      },{
         "effect":"HEAVY OCTAVE",
         "min":0,
         "max":3,
         "step":1
      },{
         "effect":"PITCH SHIFTER",
         "min":0,
         "max":10,
         "step":1
      },{
         "effect":"HARMONIST",
         "min":0,
         "max":9,
         "step":1
      },{
         "effect":"HUMANIZER",
         "min":0,
         "max":5,
         "step":1
      },{
         "effect":"PHASER 90E",
         "min":0,
         "max":1,
         "step":1
      },{
         "effect":"FLANGER 117E",
         "min":0,
         "max":4,
         "step":1
      },{
         "effect":"WAH 95E",
         "min":0,
         "max":5,
         "step":1
      },{
         "effect":"DC-30",
         "min":0,
         "max":6,
         "step":1
      }];
      
      public static const CTL_DROPDOWN_LIST:Object = {
         "BOOSTER":["PRESET","DRIVE","TONE","BOTTOM","EFFECT LEVEL","SOLO SW","SOLO LEVEL","DIRECT MIX"],
         "DELAY/DELAY2":["PRESET","DELAY TIME","FEEDBACK","HIGH CUT","EFFECT LEVEL","DIRECT MIX","MOD RATE","MOD DEPTH"],
         "REVERB":["PRESET","REVERB TIME","PRE DELAY","EFFECT LEVEL","DIRECT MIX","LOW CUT","HIGH CUT","DENSITY","SPRING SENS"],
         "CHORUS":["PRESET","LOW RATE","LOW DEPTH","LOW PRE DELAY","LOW LEVEL","DIRECT MIX","HIGH RATE","HIGH DEPTH","HIGH PRE DELAY","HIGH LEVEL","XOVER FREQ"],
         "FLANGER":["PRESET","RATE","DEPTH","RESO","MANUAL","EFFECT LEVEL","LOW CUT","DIRECT MIX"],
         "PHASER":["PRESET","RATE","DEPTH","RESO","MANUAL","EFFECT LEVEL","STEP RATE","DIRECT MIX"],
         "UNI-V":["PRESET","RATE","DEPTH","LEVEL"],
         "TREMOLO":["PRESET","WAVE SHAPE","RATE","DEPTH","LEVEL"],
         "VIBRATO":["PRESET","RATE","DEPTH","LEVEL"],
         "ROTARY":["PRESET","RATE","DEPTH","LEVEL"],
         "RING MOD":["PRESET","FREQUENCY","EFFECT LEVEL","DIRECT MIX"],
         "SLOW GEAR":["PRESET","SENS","RISE TIME","LEVEL"],
         "SLICER":["PRESET","RATE","TRIGGER SENS","EFFECT LEVEL","DIRECT MIX"],
         "COMP":["PRESET","SUSTAIN","ATTACK","TONE","LEVEL"],
         "LIMITER":["PRESET","THRESHOLD","RATIO","ATTACK","RELEASE","LEVEL"],
         "T.WAH":["PRESET","SENS","FREQ","PEAK","EFFECT LEVEL","DIRECT MIX"],
         "AUTO WAH":["PRESET","RATE","DEPTH","FREQ","PEAK","EFFECT LEVEL","DIRECT MIX"],
         "PEDAL WAH":["PRESET","PEDAL POS","PEDAL MIN","PEDAL MAX","EFFECT LEVEL","DIRECT MIX"],
         "GRAPHIC EQ":["PRESET","31Hz","62Hz","125Hz","250Hz","500Hz","1kHz","2kHz","4kHz","8kHz","16kHz","LEVEL"],
         "PARAMETRIC EQ":["PRESET","LOW GAIN","LOW-MID GAIN","HIGH-MID GAIN","HIGH GAIN","LEVEL","LOW-MID FREQ","LOW-MID Q","HIGH-MID FREQ","HIGH-MID Q","LOW CUT","HIGH CUT"],
         "GUITAR SIM":["PRESET","LOW","HIGH","BODY","LEVEL"],
         "AC.GUITAR SIM":["PRESET","BODY","LOW","HIGH","LEVEL"],
         "AC.PROCESSOR":["PRESET","BASS","MIDDLE","TREBLE","PRESENCE","LEVEL","MIDDLE FREQ"],
         "WAVE SYNTH":["PRESET","CUTOFF","RESONANCE","SYNTH LEVEL","FILTER SENS","FILTER DECAY","FILTER DEPTH","DIRECT MIX"],
         "OCTAVE":["PRESET","EFFECT LEVEL","DIRECT MIX"],
         "PITCH SHIFTER":["PRESET","PS1:PITCH","PS1:LEVEL","PS2:PITCH","PS2:LEVEL","DIRECT MIX","PS1:FINE","PS1:PRE DELAY","PS1:FEEDBACK","PS2:FINE","PS2:PRE DELAY"],
         "HARMONIST":["PRESET","HR1:HARMONY","HR2:HARMONY","MASTER KEY","DIRECT MIX","HR1:PRE DELAY","HR1:FEEDBACK","HR1:LEVEL","HR2:PRE DELAY","HR2:LEVEL"],
         "HUMANIZER":["PRESET","RATE","DEPTH","LEVEL","SENS","MANUAL"],
         "PHASER 90E":["PRESET","SPEED"],
         "FLANGER 117E":["PRESET","MANUAL","WODTH","SPEED","REGEN."],
         "WAH 95E":["PRESET","PEDAL POS","PEDAL MIN","PEDAL MAX","EFFECT LEVEL","DIRECT MIX"],
         "DC-30":["PRESET","CHORUS INTENSITY","ECHO REPEAT RATE","ECHO INTENSITY","ECHO VOLUME","INPUT VOLUME","TONE"],
         "HEAVY OCTAVE":["PRESET","1OCT LEVEL","2OCT LEVEL","DIRECT MIX"]
      };
      
      public static const CTL_PARAMNAME_LIST:Object = {
         "KNOB":[{
            "effect":"BOOSTER",
            "param":"knob_assign_booster"
         },{
            "effect":"DELAY/DELAY2",
            "param":"knob_assign_delay"
         },{
            "effect":"REVERB",
            "param":"knob_assign_reverb"
         },{
            "effect":"CHORUS",
            "param":"knob_assign_chorus"
         },{
            "effect":"FLANGER",
            "param":"knob_assign_flanger"
         },{
            "effect":"PHASER",
            "param":"knob_assign_phaser"
         },{
            "effect":"UNI-V",
            "param":"knob_assign_uni_v"
         },{
            "effect":"TREMOLO",
            "param":"knob_assign_tremolo"
         },{
            "effect":"VIBRATO",
            "param":"knob_assign_vibrato"
         },{
            "effect":"ROTARY",
            "param":"knob_assign_rotary"
         },{
            "effect":"RING MOD",
            "param":"knob_assign_ring_mod"
         },{
            "effect":"SLOW GEAR",
            "param":"knob_assign_slow_gear"
         },{
            "effect":"SLICER",
            "param":"knob_assign_slicer"
         },{
            "effect":"COMP",
            "param":"knob_assign_comp"
         },{
            "effect":"LIMITER",
            "param":"knob_assign_limiter"
         },{
            "effect":"T.WAH",
            "param":"knob_assign_t_wah"
         },{
            "effect":"AUTO WAH",
            "param":"knob_assign_auto_wah"
         },{
            "effect":"PEDAL WAH",
            "param":"knob_assign_pedal_wah"
         },{
            "effect":"GRAPHIC EQ",
            "param":"knob_assign_geq"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"knob_assign_peq"
         },{
            "effect":"GUITAR SIM",
            "param":"knob_assign_guitar_sim"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"knob_assign_ac_guitar_sim"
         },{
            "effect":"AC.PROCESSOR",
            "param":"knob_assign_ac_processor"
         },{
            "effect":"WAVE SYNTH",
            "param":"knob_assign_wave_synth"
         },{
            "effect":"OCTAVE",
            "param":"knob_assign_octave"
         },{
            "effect":"PITCH SHIFTER",
            "param":"knob_assign_pitch_shifter"
         },{
            "effect":"HARMONIST",
            "param":"knob_assign_harmonist"
         },{
            "effect":"HUMANIZER",
            "param":"knob_assign_humanizer"
         },{
            "effect":"PHASER 90E",
            "param":"knob_assign_evh_phaser"
         },{
            "effect":"FLANGER 117E",
            "param":"knob_assign_evh_flanger"
         },{
            "effect":"WAH 95E",
            "param":"knob_assign_evh_wah"
         },{
            "effect":"DC-30",
            "param":"knob_assign_dc30"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"knob_assign_heavy_oct"
         }],
         "EXP PEDAL":[{
            "effect":"BOOSTER",
            "param":"exp_pedal_assign_booster"
         },{
            "effect":"DELAY/DELAY2",
            "param":"exp_pedal_assign_delay"
         },{
            "effect":"REVERB",
            "param":"exp_pedal_assign_reverb"
         },{
            "effect":"CHORUS",
            "param":"exp_pedal_assign_chorus"
         },{
            "effect":"FLANGER",
            "param":"exp_pedal_assign_flanger"
         },{
            "effect":"PHASER",
            "param":"exp_pedal_assign_phaser"
         },{
            "effect":"UNI-V",
            "param":"exp_pedal_assign_uni_v"
         },{
            "effect":"TREMOLO",
            "param":"exp_pedal_assign_tremolo"
         },{
            "effect":"VIBRATO",
            "param":"exp_pedal_assign_vibrato"
         },{
            "effect":"ROTARY",
            "param":"exp_pedal_assign_rotary"
         },{
            "effect":"RING MOD",
            "param":"exp_pedal_assign_ring_mod"
         },{
            "effect":"SLOW GEAR",
            "param":"exp_pedal_assign_slow_gear"
         },{
            "effect":"SLICER",
            "param":"exp_pedal_assign_slicer"
         },{
            "effect":"COMP",
            "param":"exp_pedal_assign_comp"
         },{
            "effect":"LIMITER",
            "param":"exp_pedal_assign_limiter"
         },{
            "effect":"T.WAH",
            "param":"exp_pedal_assign_t_wah"
         },{
            "effect":"AUTO WAH",
            "param":"exp_pedal_assign_auto_wah"
         },{
            "effect":"PEDAL WAH",
            "param":"exp_pedal_assign_pedal_wah"
         },{
            "effect":"GRAPHIC EQ",
            "param":"exp_pedal_assign_geq"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"exp_pedal_assign_peq"
         },{
            "effect":"GUITAR SIM",
            "param":"exp_pedal_assign_guitar_sim"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"exp_pedal_assign_ac_guitar_sim"
         },{
            "effect":"AC.PROCESSOR",
            "param":"exp_pedal_assign_ac_processor"
         },{
            "effect":"WAVE SYNTH",
            "param":"exp_pedal_assign_wave_synth"
         },{
            "effect":"OCTAVE",
            "param":"exp_pedal_assign_octave"
         },{
            "effect":"PITCH SHIFTER",
            "param":"exp_pedal_assign_pitch_shifter"
         },{
            "effect":"HARMONIST",
            "param":"exp_pedal_assign_harmonist"
         },{
            "effect":"HUMANIZER",
            "param":"exp_pedal_assign_humanizer"
         },{
            "effect":"PHASER 90E",
            "param":"exp_pedal_assign_evh_phaser"
         },{
            "effect":"FLANGER 117E",
            "param":"exp_pedal_assign_evh_flanger"
         },{
            "effect":"WAH 95E",
            "param":"exp_pedal_assign_evh_wah"
         },{
            "effect":"DC-30",
            "param":"exp_pedal_assign_dc30"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"exp_pedal_assign_heavy_oct"
         }],
         "EXP PEDAL MIN":[{
            "effect":"BOOSTER",
            "param":"exp_pedal_assign_booster_min"
         },{
            "effect":"DELAY/DELAY2",
            "param":"exp_pedal_assign_delay_min"
         },{
            "effect":"REVERB",
            "param":"exp_pedal_assign_reverb_min"
         },{
            "effect":"CHORUS",
            "param":"exp_pedal_assign_chorus_min"
         },{
            "effect":"FLANGER",
            "param":"exp_pedal_assign_flanger_min"
         },{
            "effect":"PHASER",
            "param":"exp_pedal_assign_phaser_min"
         },{
            "effect":"UNI-V",
            "param":"exp_pedal_assign_uni_v_min"
         },{
            "effect":"TREMOLO",
            "param":"exp_pedal_assign_tremolo_min"
         },{
            "effect":"VIBRATO",
            "param":"exp_pedal_assign_vibrato_min"
         },{
            "effect":"ROTARY",
            "param":"exp_pedal_assign_rotary_min"
         },{
            "effect":"RING MOD",
            "param":"exp_pedal_assign_ring_mod_min"
         },{
            "effect":"SLOW GEAR",
            "param":"exp_pedal_assign_slow_gear_min"
         },{
            "effect":"SLICER",
            "param":"exp_pedal_assign_slicer_min"
         },{
            "effect":"COMP",
            "param":"exp_pedal_assign_comp_min"
         },{
            "effect":"LIMITER",
            "param":"exp_pedal_assign_limiter_min"
         },{
            "effect":"T.WAH",
            "param":"exp_pedal_assign_t_wah_min"
         },{
            "effect":"AUTO WAH",
            "param":"exp_pedal_assign_auto_wah_min"
         },{
            "effect":"PEDAL WAH",
            "param":"exp_pedal_assign_pedal_wah_min"
         },{
            "effect":"GRAPHIC EQ",
            "param":"exp_pedal_assign_geq_min"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"exp_pedal_assign_peq_min"
         },{
            "effect":"GUITAR SIM",
            "param":"exp_pedal_assign_guitar_sim_min"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"exp_pedal_assign_ac_guitar_sim_min"
         },{
            "effect":"AC.PROCESSOR",
            "param":"exp_pedal_assign_ac_processor_min"
         },{
            "effect":"WAVE SYNTH",
            "param":"exp_pedal_assign_wave_synth_min"
         },{
            "effect":"OCTAVE",
            "param":"exp_pedal_assign_octave_min"
         },{
            "effect":"PITCH SHIFTER",
            "param":"exp_pedal_assign_pitch_shifter_min"
         },{
            "effect":"HARMONIST",
            "param":"exp_pedal_assign_harmonist_min"
         },{
            "effect":"HUMANIZER",
            "param":"exp_pedal_assign_humanizer_min"
         },{
            "effect":"PHASER 90E",
            "param":"exp_pedal_assign_evh_phaser_min"
         },{
            "effect":"FLANGER 117E",
            "param":"exp_pedal_assign_evh_flanger_min"
         },{
            "effect":"WAH 95E",
            "param":"exp_pedal_assign_evh_wah_min"
         },{
            "effect":"DC-30",
            "param":"exp_pedal_assign_dc30_min"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"exp_pedal_assign_heavy_oct_min"
         }],
         "EXP PEDAL MAX":[{
            "effect":"BOOSTER",
            "param":"exp_pedal_assign_booster_max"
         },{
            "effect":"DELAY/DELAY2",
            "param":"exp_pedal_assign_delay_max"
         },{
            "effect":"REVERB",
            "param":"exp_pedal_assign_reverb_max"
         },{
            "effect":"CHORUS",
            "param":"exp_pedal_assign_chorus_max"
         },{
            "effect":"FLANGER",
            "param":"exp_pedal_assign_flanger_max"
         },{
            "effect":"PHASER",
            "param":"exp_pedal_assign_phaser_max"
         },{
            "effect":"UNI-V",
            "param":"exp_pedal_assign_uni_v_max"
         },{
            "effect":"TREMOLO",
            "param":"exp_pedal_assign_tremolo_max"
         },{
            "effect":"VIBRATO",
            "param":"exp_pedal_assign_vibrato_max"
         },{
            "effect":"ROTARY",
            "param":"exp_pedal_assign_rotary_max"
         },{
            "effect":"RING MOD",
            "param":"exp_pedal_assign_ring_mod_max"
         },{
            "effect":"SLOW GEAR",
            "param":"exp_pedal_assign_slow_gear_max"
         },{
            "effect":"SLICER",
            "param":"exp_pedal_assign_slicer_max"
         },{
            "effect":"COMP",
            "param":"exp_pedal_assign_comp_max"
         },{
            "effect":"LIMITER",
            "param":"exp_pedal_assign_limiter_max"
         },{
            "effect":"T.WAH",
            "param":"exp_pedal_assign_t_wah_max"
         },{
            "effect":"AUTO WAH",
            "param":"exp_pedal_assign_auto_wah_max"
         },{
            "effect":"PEDAL WAH",
            "param":"exp_pedal_assign_pedal_wah_max"
         },{
            "effect":"GRAPHIC EQ",
            "param":"exp_pedal_assign_geq_max"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"exp_pedal_assign_peq_max"
         },{
            "effect":"GUITAR SIM",
            "param":"exp_pedal_assign_guitar_sim_max"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"exp_pedal_assign_ac_guitar_sim_max"
         },{
            "effect":"AC.PROCESSOR",
            "param":"exp_pedal_assign_ac_processor_max"
         },{
            "effect":"WAVE SYNTH",
            "param":"exp_pedal_assign_wave_synth_max"
         },{
            "effect":"OCTAVE",
            "param":"exp_pedal_assign_octave_max"
         },{
            "effect":"PITCH SHIFTER",
            "param":"exp_pedal_assign_pitch_shifter_max"
         },{
            "effect":"HARMONIST",
            "param":"exp_pedal_assign_harmonist_max"
         },{
            "effect":"HUMANIZER",
            "param":"exp_pedal_assign_humanizer_max"
         },{
            "effect":"PHASER 90E",
            "param":"exp_pedal_assign_evh_phaser_max"
         },{
            "effect":"FLANGER 117E",
            "param":"exp_pedal_assign_evh_flanger_max"
         },{
            "effect":"WAH 95E",
            "param":"exp_pedal_assign_evh_wah_max"
         },{
            "effect":"DC-30",
            "param":"exp_pedal_assign_dc30_max"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"exp_pedal_assign_heavy_oct_max"
         }],
         "GAFC EXP1":[{
            "effect":"BOOSTER",
            "param":"gafc_exp1_assign_booster"
         },{
            "effect":"DELAY/DELAY2",
            "param":"gafc_exp1_assign_delay"
         },{
            "effect":"REVERB",
            "param":"gafc_exp1_assign_reverb"
         },{
            "effect":"CHORUS",
            "param":"gafc_exp1_assign_chorus"
         },{
            "effect":"FLANGER",
            "param":"gafc_exp1_assign_flanger"
         },{
            "effect":"PHASER",
            "param":"gafc_exp1_assign_phaser"
         },{
            "effect":"UNI-V",
            "param":"gafc_exp1_assign_uni_v"
         },{
            "effect":"TREMOLO",
            "param":"gafc_exp1_assign_tremolo"
         },{
            "effect":"VIBRATO",
            "param":"gafc_exp1_assign_vibrato"
         },{
            "effect":"ROTARY",
            "param":"gafc_exp1_assign_rotary"
         },{
            "effect":"RING MOD",
            "param":"gafc_exp1_assign_ring_mod"
         },{
            "effect":"SLOW GEAR",
            "param":"gafc_exp1_assign_slow_gear"
         },{
            "effect":"SLICER",
            "param":"gafc_exp1_assign_slicer"
         },{
            "effect":"COMP",
            "param":"gafc_exp1_assign_comp"
         },{
            "effect":"LIMITER",
            "param":"gafc_exp1_assign_limiter"
         },{
            "effect":"T.WAH",
            "param":"gafc_exp1_assign_t_wah"
         },{
            "effect":"AUTO WAH",
            "param":"gafc_exp1_assign_auto_wah"
         },{
            "effect":"PEDAL WAH",
            "param":"gafc_exp1_assign_pedal_wah"
         },{
            "effect":"GRAPHIC EQ",
            "param":"gafc_exp1_assign_geq"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"gafc_exp1_assign_peq"
         },{
            "effect":"GUITAR SIM",
            "param":"gafc_exp1_assign_guitar_sim"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"gafc_exp1_assign_ac_guitar_sim"
         },{
            "effect":"AC.PROCESSOR",
            "param":"gafc_exp1_assign_ac_processor"
         },{
            "effect":"WAVE SYNTH",
            "param":"gafc_exp1_assign_wave_synth"
         },{
            "effect":"OCTAVE",
            "param":"gafc_exp1_assign_octave"
         },{
            "effect":"PITCH SHIFTER",
            "param":"gafc_exp1_assign_pitch_shifter"
         },{
            "effect":"HARMONIST",
            "param":"gafc_exp1_assign_harmonist"
         },{
            "effect":"HUMANIZER",
            "param":"gafc_exp1_assign_humanizer"
         },{
            "effect":"PHASER 90E",
            "param":"gafc_exp1_assign_evh_phaser"
         },{
            "effect":"FLANGER 117E",
            "param":"gafc_exp1_assign_evh_flanger"
         },{
            "effect":"WAH 95E",
            "param":"gafc_exp1_assign_evh_wah"
         },{
            "effect":"DC-30",
            "param":"gafc_exp1_assign_dc30"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"gafc_exp1_assign_heavy_oct"
         }],
         "GAFC EXP1 MIN":[{
            "effect":"BOOSTER",
            "param":"gafc_exp1_assign_booster_min"
         },{
            "effect":"DELAY/DELAY2",
            "param":"gafc_exp1_assign_delay_min"
         },{
            "effect":"REVERB",
            "param":"gafc_exp1_assign_reverb_min"
         },{
            "effect":"CHORUS",
            "param":"gafc_exp1_assign_chorus_min"
         },{
            "effect":"FLANGER",
            "param":"gafc_exp1_assign_flanger_min"
         },{
            "effect":"PHASER",
            "param":"gafc_exp1_assign_phaser_min"
         },{
            "effect":"UNI-V",
            "param":"gafc_exp1_assign_uni_v_min"
         },{
            "effect":"TREMOLO",
            "param":"gafc_exp1_assign_tremolo_min"
         },{
            "effect":"VIBRATO",
            "param":"gafc_exp1_assign_vibrato_min"
         },{
            "effect":"ROTARY",
            "param":"gafc_exp1_assign_rotary_min"
         },{
            "effect":"RING MOD",
            "param":"gafc_exp1_assign_ring_mod_min"
         },{
            "effect":"SLOW GEAR",
            "param":"gafc_exp1_assign_slow_gear_min"
         },{
            "effect":"SLICER",
            "param":"gafc_exp1_assign_slicer_min"
         },{
            "effect":"COMP",
            "param":"gafc_exp1_assign_comp_min"
         },{
            "effect":"LIMITER",
            "param":"gafc_exp1_assign_limiter_min"
         },{
            "effect":"T.WAH",
            "param":"gafc_exp1_assign_t_wah_min"
         },{
            "effect":"AUTO WAH",
            "param":"gafc_exp1_assign_auto_wah_min"
         },{
            "effect":"PEDAL WAH",
            "param":"gafc_exp1_assign_pedal_wah_min"
         },{
            "effect":"GRAPHIC EQ",
            "param":"gafc_exp1_assign_geq_min"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"gafc_exp1_assign_peq_min"
         },{
            "effect":"GUITAR SIM",
            "param":"gafc_exp1_assign_guitar_sim_min"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"gafc_exp1_assign_ac_guitar_sim_min"
         },{
            "effect":"AC.PROCESSOR",
            "param":"gafc_exp1_assign_ac_processor_min"
         },{
            "effect":"WAVE SYNTH",
            "param":"gafc_exp1_assign_wave_synth_min"
         },{
            "effect":"OCTAVE",
            "param":"gafc_exp1_assign_octave_min"
         },{
            "effect":"PITCH SHIFTER",
            "param":"gafc_exp1_assign_pitch_shifter_min"
         },{
            "effect":"HARMONIST",
            "param":"gafc_exp1_assign_harmonist_min"
         },{
            "effect":"HUMANIZER",
            "param":"gafc_exp1_assign_humanizer_min"
         },{
            "effect":"PHASER 90E",
            "param":"gafc_exp1_assign_evh_phaser_min"
         },{
            "effect":"FLANGER 117E",
            "param":"gafc_exp1_assign_evh_flanger_min"
         },{
            "effect":"WAH 95E",
            "param":"gafc_exp1_assign_evh_wah_min"
         },{
            "effect":"DC-30",
            "param":"gafc_exp1_assign_dc30_min"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"gafc_exp1_assign_heavy_oct_min"
         }],
         "GAFC EXP1 MAX":[{
            "effect":"BOOSTER",
            "param":"gafc_exp1_assign_booster_max"
         },{
            "effect":"DELAY/DELAY2",
            "param":"gafc_exp1_assign_delay_max"
         },{
            "effect":"REVERB",
            "param":"gafc_exp1_assign_reverb_max"
         },{
            "effect":"CHORUS",
            "param":"gafc_exp1_assign_chorus_max"
         },{
            "effect":"FLANGER",
            "param":"gafc_exp1_assign_flanger_max"
         },{
            "effect":"PHASER",
            "param":"gafc_exp1_assign_phaser_max"
         },{
            "effect":"UNI-V",
            "param":"gafc_exp1_assign_uni_v_max"
         },{
            "effect":"TREMOLO",
            "param":"gafc_exp1_assign_tremolo_max"
         },{
            "effect":"VIBRATO",
            "param":"gafc_exp1_assign_vibrato_max"
         },{
            "effect":"ROTARY",
            "param":"gafc_exp1_assign_rotary_max"
         },{
            "effect":"RING MOD",
            "param":"gafc_exp1_assign_ring_mod_max"
         },{
            "effect":"SLOW GEAR",
            "param":"gafc_exp1_assign_slow_gear_max"
         },{
            "effect":"SLICER",
            "param":"gafc_exp1_assign_slicer_max"
         },{
            "effect":"COMP",
            "param":"gafc_exp1_assign_comp_max"
         },{
            "effect":"LIMITER",
            "param":"gafc_exp1_assign_limiter_max"
         },{
            "effect":"T.WAH",
            "param":"gafc_exp1_assign_t_wah_max"
         },{
            "effect":"AUTO WAH",
            "param":"gafc_exp1_assign_auto_wah_max"
         },{
            "effect":"PEDAL WAH",
            "param":"gafc_exp1_assign_pedal_wah_max"
         },{
            "effect":"GRAPHIC EQ",
            "param":"gafc_exp1_assign_geq_max"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"gafc_exp1_assign_peq_max"
         },{
            "effect":"GUITAR SIM",
            "param":"gafc_exp1_assign_guitar_sim_max"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"gafc_exp1_assign_ac_guitar_sim_max"
         },{
            "effect":"AC.PROCESSOR",
            "param":"gafc_exp1_assign_ac_processor_max"
         },{
            "effect":"WAVE SYNTH",
            "param":"gafc_exp1_assign_wave_synth_max"
         },{
            "effect":"OCTAVE",
            "param":"gafc_exp1_assign_octave_max"
         },{
            "effect":"PITCH SHIFTER",
            "param":"gafc_exp1_assign_pitch_shifter_max"
         },{
            "effect":"HARMONIST",
            "param":"gafc_exp1_assign_harmonist_max"
         },{
            "effect":"HUMANIZER",
            "param":"gafc_exp1_assign_humanizer_max"
         },{
            "effect":"PHASER 90E",
            "param":"gafc_exp1_assign_evh_phaser_max"
         },{
            "effect":"FLANGER 117E",
            "param":"gafc_exp1_assign_evh_flanger_max"
         },{
            "effect":"WAH 95E",
            "param":"gafc_exp1_assign_evh_wah_max"
         },{
            "effect":"DC-30",
            "param":"gafc_exp1_assign_dc30_max"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"gafc_exp1_assign_heavy_oct_max"
         }],
         "GAFC EXP2":[{
            "effect":"BOOSTER",
            "param":"gafc_exp2_assign_booster"
         },{
            "effect":"DELAY/DELAY2",
            "param":"gafc_exp2_assign_delay"
         },{
            "effect":"REVERB",
            "param":"gafc_exp2_assign_reverb"
         },{
            "effect":"CHORUS",
            "param":"gafc_exp2_assign_chorus"
         },{
            "effect":"FLANGER",
            "param":"gafc_exp2_assign_flanger"
         },{
            "effect":"PHASER",
            "param":"gafc_exp2_assign_phaser"
         },{
            "effect":"UNI-V",
            "param":"gafc_exp2_assign_uni_v"
         },{
            "effect":"TREMOLO",
            "param":"gafc_exp2_assign_tremolo"
         },{
            "effect":"VIBRATO",
            "param":"gafc_exp2_assign_vibrato"
         },{
            "effect":"ROTARY",
            "param":"gafc_exp2_assign_rotary"
         },{
            "effect":"RING MOD",
            "param":"gafc_exp2_assign_ring_mod"
         },{
            "effect":"SLOW GEAR",
            "param":"gafc_exp2_assign_slow_gear"
         },{
            "effect":"SLICER",
            "param":"gafc_exp2_assign_slicer"
         },{
            "effect":"COMP",
            "param":"gafc_exp2_assign_comp"
         },{
            "effect":"LIMITER",
            "param":"gafc_exp2_assign_limiter"
         },{
            "effect":"T.WAH",
            "param":"gafc_exp2_assign_t_wah"
         },{
            "effect":"AUTO WAH",
            "param":"gafc_exp2_assign_auto_wah"
         },{
            "effect":"PEDAL WAH",
            "param":"gafc_exp2_assign_pedal_wah"
         },{
            "effect":"GRAPHIC EQ",
            "param":"gafc_exp2_assign_geq"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"gafc_exp2_assign_peq"
         },{
            "effect":"GUITAR SIM",
            "param":"gafc_exp2_assign_guitar_sim"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"gafc_exp2_assign_ac_guitar_sim"
         },{
            "effect":"AC.PROCESSOR",
            "param":"gafc_exp2_assign_ac_processor"
         },{
            "effect":"WAVE SYNTH",
            "param":"gafc_exp2_assign_wave_synth"
         },{
            "effect":"OCTAVE",
            "param":"gafc_exp2_assign_octave"
         },{
            "effect":"PITCH SHIFTER",
            "param":"gafc_exp2_assign_pitch_shifter"
         },{
            "effect":"HARMONIST",
            "param":"gafc_exp2_assign_harmonist"
         },{
            "effect":"HUMANIZER",
            "param":"gafc_exp2_assign_humanizer"
         },{
            "effect":"PHASER 90E",
            "param":"gafc_exp2_assign_evh_phaser"
         },{
            "effect":"FLANGER 117E",
            "param":"gafc_exp2_assign_evh_flanger"
         },{
            "effect":"WAH 95E",
            "param":"gafc_exp2_assign_evh_wah"
         },{
            "effect":"DC-30",
            "param":"gafc_exp2_assign_dc30"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"gafc_exp2_assign_heavy_oct"
         }],
         "GAFC EXP2 MIN":[{
            "effect":"BOOSTER",
            "param":"gafc_exp2_assign_booster_min"
         },{
            "effect":"DELAY/DELAY2",
            "param":"gafc_exp2_assign_delay_min"
         },{
            "effect":"REVERB",
            "param":"gafc_exp2_assign_reverb_min"
         },{
            "effect":"CHORUS",
            "param":"gafc_exp2_assign_chorus_min"
         },{
            "effect":"FLANGER",
            "param":"gafc_exp2_assign_flanger_min"
         },{
            "effect":"PHASER",
            "param":"gafc_exp2_assign_phaser_min"
         },{
            "effect":"UNI-V",
            "param":"gafc_exp2_assign_uni_v_min"
         },{
            "effect":"TREMOLO",
            "param":"gafc_exp2_assign_tremolo_min"
         },{
            "effect":"VIBRATO",
            "param":"gafc_exp2_assign_vibrato_min"
         },{
            "effect":"ROTARY",
            "param":"gafc_exp2_assign_rotary_min"
         },{
            "effect":"RING MOD",
            "param":"gafc_exp2_assign_ring_mod_min"
         },{
            "effect":"SLOW GEAR",
            "param":"gafc_exp2_assign_slow_gear_min"
         },{
            "effect":"SLICER",
            "param":"gafc_exp2_assign_slicer_min"
         },{
            "effect":"COMP",
            "param":"gafc_exp2_assign_comp_min"
         },{
            "effect":"LIMITER",
            "param":"gafc_exp2_assign_limiter_min"
         },{
            "effect":"T.WAH",
            "param":"gafc_exp2_assign_t_wah_min"
         },{
            "effect":"AUTO WAH",
            "param":"gafc_exp2_assign_auto_wah_min"
         },{
            "effect":"PEDAL WAH",
            "param":"gafc_exp2_assign_pedal_wah_min"
         },{
            "effect":"GRAPHIC EQ",
            "param":"gafc_exp2_assign_geq_min"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"gafc_exp2_assign_peq_min"
         },{
            "effect":"GUITAR SIM",
            "param":"gafc_exp2_assign_guitar_sim_min"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"gafc_exp2_assign_ac_guitar_sim_min"
         },{
            "effect":"AC.PROCESSOR",
            "param":"gafc_exp2_assign_ac_processor_min"
         },{
            "effect":"WAVE SYNTH",
            "param":"gafc_exp2_assign_wave_synth_min"
         },{
            "effect":"OCTAVE",
            "param":"gafc_exp2_assign_octave_min"
         },{
            "effect":"PITCH SHIFTER",
            "param":"gafc_exp2_assign_pitch_shifter_min"
         },{
            "effect":"HARMONIST",
            "param":"gafc_exp2_assign_harmonist_min"
         },{
            "effect":"HUMANIZER",
            "param":"gafc_exp2_assign_humanizer_min"
         },{
            "effect":"PHASER 90E",
            "param":"gafc_exp2_assign_evh_phaser_min"
         },{
            "effect":"FLANGER 117E",
            "param":"gafc_exp2_assign_evh_flanger_min"
         },{
            "effect":"WAH 95E",
            "param":"gafc_exp2_assign_evh_wah_min"
         },{
            "effect":"DC-30",
            "param":"gafc_exp2_assign_dc30_min"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"gafc_exp2_assign_heavy_oct_min"
         }],
         "GAFC EXP2 MAX":[{
            "effect":"BOOSTER",
            "param":"gafc_exp2_assign_booster_max"
         },{
            "effect":"DELAY/DELAY2",
            "param":"gafc_exp2_assign_delay_max"
         },{
            "effect":"REVERB",
            "param":"gafc_exp2_assign_reverb_max"
         },{
            "effect":"CHORUS",
            "param":"gafc_exp2_assign_chorus_max"
         },{
            "effect":"FLANGER",
            "param":"gafc_exp2_assign_flanger_max"
         },{
            "effect":"PHASER",
            "param":"gafc_exp2_assign_phaser_max"
         },{
            "effect":"UNI-V",
            "param":"gafc_exp2_assign_uni_v_max"
         },{
            "effect":"TREMOLO",
            "param":"gafc_exp2_assign_tremolo_max"
         },{
            "effect":"VIBRATO",
            "param":"gafc_exp2_assign_vibrato_max"
         },{
            "effect":"ROTARY",
            "param":"gafc_exp2_assign_rotary_max"
         },{
            "effect":"RING MOD",
            "param":"gafc_exp2_assign_ring_mod_max"
         },{
            "effect":"SLOW GEAR",
            "param":"gafc_exp2_assign_slow_gear_max"
         },{
            "effect":"SLICER",
            "param":"gafc_exp2_assign_slicer_max"
         },{
            "effect":"COMP",
            "param":"gafc_exp2_assign_comp_max"
         },{
            "effect":"LIMITER",
            "param":"gafc_exp2_assign_limiter_max"
         },{
            "effect":"T.WAH",
            "param":"gafc_exp2_assign_t_wah_max"
         },{
            "effect":"AUTO WAH",
            "param":"gafc_exp2_assign_auto_wah_max"
         },{
            "effect":"PEDAL WAH",
            "param":"gafc_exp2_assign_pedal_wah_max"
         },{
            "effect":"GRAPHIC EQ",
            "param":"gafc_exp2_assign_geq_max"
         },{
            "effect":"PARAMETRIC EQ",
            "param":"gafc_exp2_assign_peq_max"
         },{
            "effect":"GUITAR SIM",
            "param":"gafc_exp2_assign_guitar_sim_max"
         },{
            "effect":"AC.GUITAR SIM",
            "param":"gafc_exp2_assign_ac_guitar_sim_max"
         },{
            "effect":"AC.PROCESSOR",
            "param":"gafc_exp2_assign_ac_processor_max"
         },{
            "effect":"WAVE SYNTH",
            "param":"gafc_exp2_assign_wave_synth_max"
         },{
            "effect":"OCTAVE",
            "param":"gafc_exp2_assign_octave_max"
         },{
            "effect":"PITCH SHIFTER",
            "param":"gafc_exp2_assign_pitch_shifter_max"
         },{
            "effect":"HARMONIST",
            "param":"gafc_exp2_assign_harmonist_max"
         },{
            "effect":"HUMANIZER",
            "param":"gafc_exp2_assign_humanizer_max"
         },{
            "effect":"PHASER 90E",
            "param":"gafc_exp2_assign_evh_phaser_max"
         },{
            "effect":"FLANGER 117E",
            "param":"gafc_exp2_assign_evh_flanger_max"
         },{
            "effect":"WAH 95E",
            "param":"gafc_exp2_assign_evh_wah_max"
         },{
            "effect":"DC-30",
            "param":"gafc_exp2_assign_dc30_max"
         },{
            "effect":"HEAVY OCTAVE",
            "param":"gafc_exp2_assign_heavy_oct_max"
         }]
      };
      
      public static const CTL_TARGET_LIST:Object = {
         "BOOSTER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"od_ds_drive"
         },{
            "val":2,
            "id":"od_ds_tone"
         },{
            "val":3,
            "id":"od_ds_bottom"
         },{
            "val":4,
            "id":"od_ds_effect_level"
         },{
            "val":5,
            "id":"od_ds_solo_sw"
         },{
            "val":6,
            "id":"od_ds_solo_level"
         },{
            "val":7,
            "id":"od_ds_direct_mix"
         }],
         "DELAY/DELAY2":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"delay_delay_time"
         },{
            "val":2,
            "id":"delay_f_back"
         },{
            "val":3,
            "id":"delay_high_cut"
         },{
            "val":4,
            "id":"delay_effect_level"
         },{
            "val":5,
            "id":"delay_direct_mix"
         },{
            "val":6,
            "id":"delay_mod_rate"
         },{
            "val":7,
            "id":"delay_mod_depth"
         }],
         "REVERB":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"reverb_time"
         },{
            "val":2,
            "id":"reverb_pre_delay"
         },{
            "val":3,
            "id":"reverb_effect_level"
         },{
            "val":4,
            "id":"reverb_direct_mix"
         },{
            "val":5,
            "id":"reverb_low_cut"
         },{
            "val":6,
            "id":"reverb_high_cut"
         },{
            "val":7,
            "id":"reverb_density"
         },{
            "val":8,
            "id":"reverb_spring_sens"
         }],
         "CHORUS":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_2x2_chorus_low_rate"
         },{
            "val":2,
            "id":"fx1_2x2_chorus_low_depth"
         },{
            "val":3,
            "id":"fx1_2x2_chorus_low_pre_delay"
         },{
            "val":4,
            "id":"fx1_2x2_chorus_low_level"
         },{
            "val":5,
            "id":"fx1_2x2_chorus_direct_level"
         },{
            "val":6,
            "id":"fx1_2x2_chorus_high_rate"
         },{
            "val":7,
            "id":"fx1_2x2_chorus_high_depth"
         },{
            "val":8,
            "id":"fx1_2x2_chorus_high_pre_delay"
         },{
            "val":9,
            "id":"fx1_2x2_chorus_high_level"
         },{
            "val":10,
            "id":"fx1_2x2_chorus_xover_freq"
         }],
         "FLANGER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_flanger_rate"
         },{
            "val":2,
            "id":"fx1_flanger_depth"
         },{
            "val":3,
            "id":"fx1_flanger_reso"
         },{
            "val":4,
            "id":"fx1_flanger_manual"
         },{
            "val":5,
            "id":"fx1_flanger_effect_level"
         },{
            "val":6,
            "id":"fx1_flanger_low_cut"
         },{
            "val":7,
            "id":"fx1_flanger_direct_mix"
         }],
         "PHASER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_phaser_rate"
         },{
            "val":2,
            "id":"fx1_phaser_depth"
         },{
            "val":3,
            "id":"fx1_phaser_reso"
         },{
            "val":4,
            "id":"fx1_phaser_manual"
         },{
            "val":5,
            "id":"fx1_phaser_effect_level"
         },{
            "val":6,
            "id":"fx1_phaser_step_rate"
         },{
            "val":7,
            "id":"fx1_phaser_direct_mix"
         }],
         "UNI-V":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_uni_v_rate"
         },{
            "val":2,
            "id":"fx1_uni_v_depth"
         },{
            "val":3,
            "id":"fx1_uni_v_level"
         }],
         "TREMOLO":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_tremolo_wave_shape"
         },{
            "val":2,
            "id":"fx1_tremolo_rate"
         },{
            "val":3,
            "id":"fx1_tremolo_depth"
         },{
            "val":4,
            "id":"fx1_tremolo_level"
         }],
         "VIBRATO":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_vibrato_rate"
         },{
            "val":2,
            "id":"fx1_vibrato_depth"
         },{
            "val":3,
            "id":"fx1_vibrato_level"
         }],
         "ROTARY":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_rotary_rate_fast"
         },{
            "val":2,
            "id":"fx1_rotary_depth"
         },{
            "val":3,
            "id":"fx1_rotary_level"
         }],
         "RING MOD":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_ring_mod_freq"
         },{
            "val":2,
            "id":"fx1_ring_mod_effect_level"
         },{
            "val":3,
            "id":"fx1_ring_mod_direct_mix"
         }],
         "SLOW GEAR":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_slow_gear_sens"
         },{
            "val":2,
            "id":"fx1_slow_gear_rise_time"
         },{
            "val":3,
            "id":"fx1_slow_gear_level"
         }],
         "SLICER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_slicer_rate"
         },{
            "val":2,
            "id":"fx1_slicer_trigger_sens"
         },{
            "val":3,
            "id":"fx1_slicer_effect_level"
         },{
            "val":4,
            "id":"fx1_slicer_direct_mix"
         }],
         "COMP":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_adv_comp_sustain"
         },{
            "val":2,
            "id":"fx1_adv_comp_attack"
         },{
            "val":3,
            "id":"fx1_adv_comp_tone"
         },{
            "val":4,
            "id":"fx1_adv_comp_level"
         }],
         "LIMITER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_limiter_thresh"
         },{
            "val":2,
            "id":"fx1_limiter_ratio"
         },{
            "val":3,
            "id":"fx1_limiter_attack"
         },{
            "val":4,
            "id":"fx1_limiter_release"
         },{
            "val":5,
            "id":"fx1_limiter_level"
         }],
         "T.WAH":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_t_wah_sens"
         },{
            "val":2,
            "id":"fx1_t_wah_freq"
         },{
            "val":3,
            "id":"fx1_t_wah_peak"
         },{
            "val":4,
            "id":"fx1_t_wah_direct_mix"
         },{
            "val":5,
            "id":"fx1_t_wah_effect_level"
         }],
         "AUTO WAH":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_auto_wah_rate"
         },{
            "val":2,
            "id":"fx1_auto_wah_depth"
         },{
            "val":3,
            "id":"fx1_auto_wah_freq"
         },{
            "val":4,
            "id":"fx1_auto_wah_peak"
         },{
            "val":5,
            "id":"fx1_auto_wah_effect_level"
         },{
            "val":6,
            "id":"fx1_auto_wah_direct_mix"
         }],
         "PEDAL WAH":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_sub_wah_pedal_pos"
         },{
            "val":2,
            "id":"fx1_sub_wah_pedal_min"
         },{
            "val":3,
            "id":"fx1_sub_wah_pedal_max"
         },{
            "val":4,
            "id":"fx1_sub_wah_effect_level"
         },{
            "val":5,
            "id":"fx1_sub_wah_direct_mix"
         }],
         "GRAPHIC EQ":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_graphic_eq_31hz"
         },{
            "val":2,
            "id":"fx1_graphic_eq_62hz"
         },{
            "val":3,
            "id":"fx1_graphic_eq_125hz"
         },{
            "val":4,
            "id":"fx1_graphic_eq_250hz"
         },{
            "val":5,
            "id":"fx1_graphic_eq_500hz"
         },{
            "val":6,
            "id":"fx1_graphic_eq_1khz"
         },{
            "val":7,
            "id":"fx1_graphic_eq_2khz"
         },{
            "val":8,
            "id":"fx1_graphic_eq_4khz"
         },{
            "val":9,
            "id":"fx1_graphic_eq_8khz"
         },{
            "val":10,
            "id":"fx1_graphic_eq_16khz"
         },{
            "val":11,
            "id":"fx1_graphic_eq_level"
         }],
         "PARAMETRIC EQ":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_parametric_eq_low_gain"
         },{
            "val":2,
            "id":"fx1_parametric_eq_low_mid_gain"
         },{
            "val":3,
            "id":"fx1_parametric_eq_high_mid_gain"
         },{
            "val":4,
            "id":"fx1_parametric_eq_high_gain"
         },{
            "val":5,
            "id":"fx1_parametric_eq_level"
         },{
            "val":6,
            "id":"fx1_parametric_eq_low_mid_freq"
         },{
            "val":7,
            "id":"fx1_parametric_eq_low_mid_q"
         },{
            "val":8,
            "id":"fx1_parametric_eq_high_mid_freq"
         },{
            "val":9,
            "id":"fx1_parametric_eq_high_mid_q"
         },{
            "val":10,
            "id":"fx1_parametric_eq_low_cut"
         },{
            "val":11,
            "id":"fx1_parametric_eq_high_cut"
         }],
         "GUITAR SIM":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_guitar_sim_low"
         },{
            "val":2,
            "id":"fx1_guitar_sim_high"
         },{
            "val":3,
            "id":"fx1_guitar_sim_body"
         },{
            "val":4,
            "id":"fx1_guitar_sim_level"
         }],
         "AC.GUITAR SIM":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_acsim_body"
         },{
            "val":2,
            "id":"fx1_acsim_low"
         },{
            "val":3,
            "id":"fx1_acsim_high"
         },{
            "val":4,
            "id":"fx1_acsim_level"
         }],
         "AC.PROCESSOR":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_ac_processor_bass"
         },{
            "val":2,
            "id":"fx1_ac_processor_middle"
         },{
            "val":3,
            "id":"fx1_ac_processor_treble"
         },{
            "val":4,
            "id":"fx1_ac_processor_presence"
         },{
            "val":5,
            "id":"fx1_ac_processor_level"
         },{
            "val":6,
            "id":"fx1_ac_processor_middle_freq"
         }],
         "WAVE SYNTH":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_wave_synth_cutoff"
         },{
            "val":2,
            "id":"fx1_wave_synth_reso"
         },{
            "val":3,
            "id":"fx1_wave_synth_synth_level"
         },{
            "val":4,
            "id":"fx1_wave_synth_filter_sens"
         },{
            "val":5,
            "id":"fx1_wave_synth_filter_decay"
         },{
            "val":6,
            "id":"fx1_wave_synth_filter_depth"
         },{
            "val":7,
            "id":"fx1_wave_synth_direct_mix"
         }],
         "OCTAVE":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_octave_level"
         },{
            "val":2,
            "id":"fx1_octave_direct_mix"
         }],
         "PITCH SHIFTER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_pitch_shifter_ps1pitch"
         },{
            "val":2,
            "id":"fx1_pitch_shifter_ps1level"
         },{
            "val":3,
            "id":"fx1_pitch_shifter_ps2pitch"
         },{
            "val":4,
            "id":"fx1_pitch_shifter_ps2level"
         },{
            "val":5,
            "id":"fx1_pitch_shifter_direct_mix"
         },{
            "val":6,
            "id":"fx1_pitch_shifter_ps1fine"
         },{
            "val":7,
            "id":"fx1_pitch_shifter_ps1pre_dly"
         },{
            "val":8,
            "id":"fx1_pitch_shifter_ps1f_back"
         },{
            "val":9,
            "id":"fx1_pitch_shifter_ps2fine"
         },{
            "val":10,
            "id":"fx1_pitch_shifter_ps2pre_dly"
         }],
         "HARMONIST":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_harmonist_hr1harm"
         },{
            "val":2,
            "id":"fx1_harmonist_hr2harm"
         },{
            "val":3,
            "id":"fx1_pitch_shifter_ps2pitch"
         },{
            "val":4,
            "id":"fx1_harmonist_direct_mix"
         },{
            "val":5,
            "id":"fx1_harmonist_hr1pre_dly"
         },{
            "val":6,
            "id":"fx1_harmonist_hr1f_back"
         },{
            "val":7,
            "id":"fx1_harmonist_hr1level"
         },{
            "val":8,
            "id":"fx1_harmonist_hr2pre_dly"
         },{
            "val":9,
            "id":"fx1_harmonist_hr2level"
         }],
         "HUMANIZER":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_humanizer_rate"
         },{
            "val":2,
            "id":"fx1_humanizer_depth"
         },{
            "val":3,
            "id":"fx1_humanizer_level"
         },{
            "val":4,
            "id":"fx1_humanizer_sens"
         },{
            "val":5,
            "id":"fx1_humanizer_manual"
         }],
         "PHASER 90E":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_phaser90e_speed"
         }],
         "FLANGER 117E":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_flanger117e_manual"
         },{
            "val":2,
            "id":"fx1_flanger117e_width"
         },{
            "val":3,
            "id":"fx1_flanger117e_speed"
         },{
            "val":4,
            "id":"fx1_flanger117e_regen"
         }],
         "WAH 95E":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_wah95e_pedal_pos"
         },{
            "val":2,
            "id":"fx1_wah95e_pedal_min"
         },{
            "val":3,
            "id":"fx1_wah95e_pedal_max"
         },{
            "val":4,
            "id":"fx1_wah95e_effect_level"
         },{
            "val":5,
            "id":"fx1_wah95e_direct_mix"
         }],
         "DC-30":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_dc30_chorus_intensity"
         },{
            "val":2,
            "id":"fx1_dc30_echo_repeat_rate"
         },{
            "val":3,
            "id":"fx1_dc30_echo_intensity"
         },{
            "val":4,
            "id":"fx1_dc30_echo_volume"
         },{
            "val":5,
            "id":"fx1_dc30_input_volume"
         },{
            "val":6,
            "id":"fx1_dc30_tone"
         }],
         "HEAVY OCTAVE":[{
            "val":0,
            "id":"PRESET",
            "min":0,
            "max":100,
            "step":1
         },{
            "val":1,
            "id":"fx1_heavy_oct_1oct_level"
         },{
            "val":2,
            "id":"fx1_heavy_oct_2oct_level"
         },{
            "val":3,
            "id":"fx1_heavy_oct_direct_mix"
         }]
      };
      
      public function CTLDefinitionGT()
      {
         super();
      }
      
      public static function isPreset(param1:String) : Boolean
      {
         return CTL_PRESET_NAME.indexOf(param1) != -1;
      }
   }
}

