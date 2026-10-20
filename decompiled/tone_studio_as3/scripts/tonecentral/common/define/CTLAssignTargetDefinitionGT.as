package tonecentral.common.define
{
   public class CTLAssignTargetDefinitionGT
   {
      
      public static const ASSIGN_TARGET_MASTER_LIST:Array = [{
         "val":"00,00",
         "name":"COMP: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,01",
         "name":"COMP: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"00,02",
         "name":"COMP: SUSTAIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,03",
         "name":"COMP: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,04",
         "name":"COMP: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,05",
         "name":"COMP: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,06",
         "name":"OD/DS: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,07",
         "name":"OD/DS: TYPE",
         "min":0,
         "max":22,
         "step":1,
         "minDef":0,
         "maxDef":21
      },{
         "val":"00,08",
         "name":"OD/DS: DRIVE",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":120
      },{
         "val":"00,09",
         "name":"OD/DS: BOTTOM",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,0A",
         "name":"OD/DS: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,0B",
         "name":"OD/DS: SOLO SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,0C",
         "name":"OD/DS: SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,0D",
         "name":"OD/DS: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,0E",
         "name":"OD/DS: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,0F",
         "name":"OD/DS: CUSTOM TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"00,10",
         "name":"OD/DS: CUSTOM BOTTOM",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,11",
         "name":"OD/DS: CUSTOM TOP",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,12",
         "name":"OD/DS: CUSTOM LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,13",
         "name":"OD/DS: CUSTOM HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,14",
         "name":"OD/DS: CUSTOM CHARACTER",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,15",
         "name":"PREAMP: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,16",
         "name":"PREAMP A: TYPE",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":25
      },{
         "val":"00,17",
         "name":"PREAMP A: GAIN",
         "min":0,
         "max":120,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,18",
         "name":"PREAMP A: T-COMP",
         "min":-10,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,19",
         "name":"PREAMP A: BASS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,1A",
         "name":"PREAMP A: MIDDLE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,1B",
         "name":"PREAMP A: TREBLE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,1C",
         "name":"PREAMP A: PRESENCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,1D",
         "name":"PREAMP A: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,1E",
         "name":"PREAMP A: BRIGHT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,1F",
         "name":"PREAMP A: GAIN SW",
         "min":0,
         "max":2,
         "step":1,
         "minDef":1,
         "maxDef":2
      },{
         "val":"00,20",
         "name":"PREAMP A: SOLO SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,21",
         "name":"PREAMP A: SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,22",
         "name":"PREAMP A: SPEAKER TYPE",
         "min":0,
         "max":9,
         "step":1,
         "minDef":0,
         "maxDef":9
      },{
         "val":"00,23",
         "name":"PREAMP A: MIC TYPE",
         "min":0,
         "max":4,
         "step":1,
         "minDef":0,
         "maxDef":4
      },{
         "val":"00,24",
         "name":"PREAMP A: MIC DISTANCE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,25",
         "name":"PREAMP A: MIC POSITION",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,26",
         "name":"PREAMP A: MIC LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,27",
         "name":"PREAMP A: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,28",
         "name":"PREAMP A: CUSTOM TYPE",
         "min":0,
         "max":6,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,29",
         "name":"PREAMP A: CUSTOM BOTTOM",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,2A",
         "name":"PREAMP A: CUSTOM EDGE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,2D",
         "name":"PREAMP A: CUSTOM LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,2E",
         "name":"PREAMP A: CUSTOM HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,2F",
         "name":"PREAMP A: CUSTOM CHARACTER",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,30",
         "name":"PREAMP A: CUSTOM SPEAKER SIZE",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,31",
         "name":"PREAMP A: CUSTOM SPEAKER COLOR LOW",
         "min":-10,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,32",
         "name":"PREAMP A: CUSTOM SPEAKER COLOR HIGH",
         "min":-10,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,33",
         "name":"PREAMP A: CUSTOM SPEAKER NUMBER",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"00,34",
         "name":"PREAMP A: CUSTOM SPEAKER CABINET",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,35",
         "name":"PREAMP B: TYPE",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":25
      },{
         "val":"00,36",
         "name":"PREAMP B: GAIN",
         "min":0,
         "max":120,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,37",
         "name":"PREAMP B: T-COMP",
         "min":-10,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,38",
         "name":"PREAMP B: BASS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,39",
         "name":"PREAMP B: MIDDLE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,3A",
         "name":"PREAMP B: TREBLE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,3B",
         "name":"PREAMP B: PRESENCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,3C",
         "name":"PREAMP B: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,3D",
         "name":"PREAMP B: BRIGHT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,3E",
         "name":"PREAMP B: GAIN SW",
         "min":0,
         "max":2,
         "step":1,
         "minDef":1,
         "maxDef":2
      },{
         "val":"00,3F",
         "name":"PREAMP B: SOLO SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,40",
         "name":"PREAMP B: SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"00,41",
         "name":"PREAMP B: SPEAKER TYPE",
         "min":0,
         "max":9,
         "step":1,
         "minDef":0,
         "maxDef":9
      },{
         "val":"00,42",
         "name":"PREAMP B: MIC TYPE",
         "min":0,
         "max":4,
         "step":1,
         "minDef":0,
         "maxDef":4
      },{
         "val":"00,43",
         "name":"PREAMP B: MIC DISTANCE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,44",
         "name":"PREAMP B: MIC POSITION",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,45",
         "name":"PREAMP B: MIC LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,46",
         "name":"PREAMP B: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,47",
         "name":"PREAMP B: CUSTOM TYPE",
         "min":0,
         "max":6,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,48",
         "name":"PREAMP B: CUSTOM BOTTOM",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,49",
         "name":"PREAMP B: CUSTOM EDGE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,4C",
         "name":"PREAMP B: CUSTOM LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,4D",
         "name":"PREAMP B: CUSTOM HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,4E",
         "name":"PREAMP B: CUSTOM CHARACTER",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,4F",
         "name":"PREAMP B: CUSTOM SPEAKER SIZE",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,50",
         "name":"PREAMP B: CUSTOM SPEAKER COLOR LOW",
         "min":-10,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,51",
         "name":"PREAMP B: CUSTOM SPEAKER COLOR HIGH",
         "min":-10,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"00,52",
         "name":"PREAMP B: CUSTOM SPEAKER NUMBER",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"00,53",
         "name":"PREAMP B: CUSTOM SPEAKER CABINET",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,54",
         "name":"EQ: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,55",
         "name":"EQ: LOW CUT",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"00,56",
         "name":"EQ: LOW GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,57",
         "name":"EQ: LOW-MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"00,58",
         "name":"EQ: LOW-MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"00,59",
         "name":"EQ: LOW-MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,5A",
         "name":"EQ: HI-MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"00,5B",
         "name":"EQ: HI-MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"00,5C",
         "name":"EQ: HI-MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,5D",
         "name":"EQ: HIGH GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,5E",
         "name":"EQ: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"00,5F",
         "name":"EQ: LEVEL",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"00,60",
         "name":"FX1: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,61",
         "name":"FX1: TYPE",
         "min":0,
         "max":32,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,62",
         "name":"FX1 T.WAH: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,63",
         "name":"FX1 T.WAH: POLARITY",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,64",
         "name":"FX1 T.WAH: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,65",
         "name":"FX1 T.WAH: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,66",
         "name":"FX1 T.WAH: PEAK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,67",
         "name":"FX1 T.WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,68",
         "name":"FX1 T.WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,69",
         "name":"FX1 AUTO WAH: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"00,6A",
         "name":"FX1 AUTO WAH: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,6B",
         "name":"FX1 AUTO WAH: PEAK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,6C",
         "name":"FX1 AUTO WAH: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,6D",
         "name":"FX1 AUTO WAH: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,6E",
         "name":"FX1 AUTO WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,6F",
         "name":"FX1 AUTO WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,70",
         "name":"FX1 SUB WAH: TYPE",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"00,71",
         "name":"FX1 SUB WAH: PEDAL POSITION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,72",
         "name":"FX1 SUB WAH: PEDAL MIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,73",
         "name":"FX1 SUB WAH: PEDAL MAX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,74",
         "name":"FX1 SUB WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,75",
         "name":"FX1 SUB WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,76",
         "name":"FX1 ADV.COMP: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"00,77",
         "name":"FX1 ADV.COMP: SUSTAIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,78",
         "name":"FX1 ADV.COMP: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,79",
         "name":"FX1 ADV.COMP: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"00,7A",
         "name":"FX1 ADV.COMP: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,7B",
         "name":"FX1 LIMITER: TYPE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"00,7C",
         "name":"FX1 LIMITER: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,7D",
         "name":"FX1 LIMITER: THRESHOLD",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"00,7E",
         "name":"FX1 LIMITER: RATIO",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"00,7F",
         "name":"FX1 LIMITER: RELEASE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,00",
         "name":"FX1 LIMITER: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,01",
         "name":"FX1 OD/DS: TYPE",
         "min":0,
         "max":22,
         "step":1,
         "minDef":0,
         "maxDef":20
      },{
         "val":"01,02",
         "name":"FX1 OD/DS: DRIVE",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":120
      },{
         "val":"01,03",
         "name":"FX1 OD/DS: BOTTOM",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,04",
         "name":"FX1 OD/DS: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,05",
         "name":"FX1 OD/DS: SOLO SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"01,06",
         "name":"FX1 OD/DS: SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,07",
         "name":"FX1 OD/DS: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,08",
         "name":"FX1 OD/DS: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,09",
         "name":"FX1 GRAPHIC EQ: 31Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,0A",
         "name":"FX1 GRAPHIC EQ: 62Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,0B",
         "name":"FX1 GRAPHIC EQ: 125Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,0C",
         "name":"FX1 GRAPHIC EQ: 250Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,0D",
         "name":"FX1 GRAPHIC EQ: 500Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,0E",
         "name":"FX1 GRAPHIC EQ: 1kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,0F",
         "name":"FX1 GRAPHIC EQ: 2kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,10",
         "name":"FX1 GRAPHIC EQ: 4kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,11",
         "name":"FX1 GRAPHIC EQ: 8kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,12",
         "name":"FX1 GRAPHIC EQ: 16kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,13",
         "name":"FX1 GRAPHIC EQ: LEVEL",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,14",
         "name":"FX1 PARAMETRIC EQ: LOW CUT",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"01,15",
         "name":"FX1 PARAMETRIC EQ: LOW GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,16",
         "name":"FX1 PARAMETRIC EQ: LOW-MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"01,17",
         "name":"FX1 PARAMETRIC EQ: LOW-MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"01,18",
         "name":"FX1 PARAMETRIC EQ: LOW-MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,19",
         "name":"FX1 PARAMETRIC EQ: HI-MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"01,1A",
         "name":"FX1 PARAMETRIC EQ: HI-MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"01,1B",
         "name":"FX1 PARAMETRIC EQ: HI-MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"01,1C",
         "name":"FX1 PARAMETRIC EQ: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"01,1D",
         "name":"FX1 PARAMETRIC EQ: HIGH GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,1E",
         "name":"FX1 PARAMETRIC EQ: LEVEL",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"01,1F",
         "name":"FX1 TONE MODIFY: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"01,20",
         "name":"FX1 TONE MODIFY: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,21",
         "name":"FX1 TONE MODIFY: LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,22",
         "name":"FX1 TONE MODIFY: HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,23",
         "name":"FX1 TONE MODIFY: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,24",
         "name":"FX1 GUITAR SIMULATOR: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"01,25",
         "name":"FX1 GUITAR SIMULATOR: LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,26",
         "name":"FX1 GUITAR SIMULATOR: HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,27",
         "name":"FX1 GUITAR SIMULATOR: BODY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,28",
         "name":"FX1 GUITAR SIMULATOR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,29",
         "name":"FX1 SLOW GEAR: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,2A",
         "name":"FX1 SLOW GEAR: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,2B",
         "name":"FX1 SLOW GEAR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,2C",
         "name":"FX1 DEFRETTER: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,2D",
         "name":"FX1 DEFRETTER: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,2E",
         "name":"FX1 DEFRETTER: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,2F",
         "name":"FX1 DEFRETTER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,30",
         "name":"FX1 DEFRETTER: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,31",
         "name":"FX1 DEFRETTER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,32",
         "name":"FX1 DEFRETTER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,33",
         "name":"FX1 WAVE SYNTH: WAVE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"01,34",
         "name":"FX1 WAVE SYNTH: CUTOFF",
         "min":0,
         "max":100,
         "step":1,
         "minDef":40,
         "maxDef":80
      },{
         "val":"01,35",
         "name":"FX1 WAVE SYNTH: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":30,
         "maxDef":100
      },{
         "val":"01,36",
         "name":"FX1 WAVE SYNTH: FILTER SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":40,
         "maxDef":100
      },{
         "val":"01,37",
         "name":"FX1 WAVE SYNTH: FILTER DECAY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":100
      },{
         "val":"01,38",
         "name":"FX1 WAVE SYNTH: FILTER DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":100
      },{
         "val":"01,39",
         "name":"FX1 WAVE SYNTH: SYNTH LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":25
      },{
         "val":"01,3A",
         "name":"FX1 WAVE SYNTH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,3B",
         "name":"FX1 SITAR SIMULATOR: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"01,3C",
         "name":"FX1 SITAR SIMULATOR: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"01,3D",
         "name":"FX1 SITAR SIMULATOR: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":100
      },{
         "val":"01,3E",
         "name":"FX1 SITAR SIMULATOR: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":32,
         "maxDef":70
      },{
         "val":"01,3F",
         "name":"FX1 SITAR SIMULATOR: BUZZ",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"01,40",
         "name":"FX1 SITAR SIMULATOR: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,41",
         "name":"FX1 SITAR SIMULATOR: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,42",
         "name":"FX1 OCTAVE: RANGE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"01,43",
         "name":"FX1 OCTAVE: OCTAVE LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,44",
         "name":"FX1 OCTAVE: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,45",
         "name":"FX1 PITCH SHIFTER: VOICE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"01,46",
         "name":"FX1 PITCH SHIFTER: PS1 MODE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"01,47",
         "name":"FX1 PITCH SHIFTER: PS1 PITCH",
         "min":-24,
         "max":24,
         "step":1,
         "minDef":0,
         "maxDef":12
      },{
         "val":"01,48",
         "name":"FX1 PITCH SHIFTER: PS1 FINE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"01,49",
         "name":"FX1 PITCH SHIFTER: PS1 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"01,4A",
         "name":"FX1 PITCH SHIFTER: PS1 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,4B",
         "name":"FX1 PITCH SHIFTER: PS2 MODE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"01,4C",
         "name":"FX1 PITCH SHIFTER: PS2 PITCH",
         "min":-24,
         "max":24,
         "step":1,
         "minDef":0,
         "maxDef":12
      },{
         "val":"01,4D",
         "name":"FX1 PITCH SHIFTER: PS2 FINE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"01,4E",
         "name":"FX1 PITCH SHIFTER: PS2 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"01,4F",
         "name":"FX1 PITCH SHIFTER: PS2 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,50",
         "name":"FX1 PITCH SHIFTER: PS1 FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,51",
         "name":"FX1 PITCH SHIFTER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,52",
         "name":"FX1 HARMONIST: VOICE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"01,53",
         "name":"FX1 HARMONIST: HR1 HARMONY",
         "min":0,
         "max":29,
         "step":1,
         "minDef":14,
         "maxDef":21
      },{
         "val":"01,54",
         "name":"FX1 HARMONIST: HR1 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"01,55",
         "name":"FX1 HARMONIST: HR1 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,56",
         "name":"FX1 HARMONIST: HR2 HARMONY",
         "min":0,
         "max":29,
         "step":1,
         "minDef":14,
         "maxDef":21
      },{
         "val":"01,57",
         "name":"FX1 HARMONIST: HR2 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"01,58",
         "name":"FX1 HARMONIST: HR2 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,59",
         "name":"FX1 HARMONIST: HR1 FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,5A",
         "name":"FX1 HARMONIST: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,5B",
         "name":"FX1 SOUND HOLD: HOLD",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"01,5C",
         "name":"FX1 SOUND HOLD: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,5D",
         "name":"FX1 SOUND HOLD: EFFECT LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"01,5E",
         "name":"FX1 ACOUSTIC PROCESSOR: TYPE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"01,5F",
         "name":"FX1 ACOUSTIC PROCESSOR: BASS",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"01,60",
         "name":"FX1 ACOUSTIC PROCESSOR: MIDDLE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"01,61",
         "name":"FX1 ACOUSTIC PROCESSOR: MIDDLE FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":16,
         "maxDef":20
      },{
         "val":"01,62",
         "name":"FX1 ACOUSTIC PROCESSOR: TREBLE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"01,63",
         "name":"FX1 ACOUSTIC PROCESSOR: PRESENCE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"01,64",
         "name":"FX1 ACOUSTIC PROCESSOR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":80
      },{
         "val":"01,65",
         "name":"FX1 PHASER: TYPE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"01,66",
         "name":"FX1 PHASER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,67",
         "name":"FX1 PHASER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,68",
         "name":"FX1 PHASER: MANUAL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,69",
         "name":"FX1 PHASER: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,6A",
         "name":"FX1 PHASER: STEP RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":1,
         "maxDef":101
      },{
         "val":"01,6B",
         "name":"FX1 PHASER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,6C",
         "name":"FX1 PHASER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,6D",
         "name":"FX1 FLANGER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,6E",
         "name":"FX1 FLANGER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,6F",
         "name":"FX1 FLANGER: MANUAL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,70",
         "name":"FX1 FLANGER: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,71",
         "name":"FX1 FLANGER: SEPARATION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,72",
         "name":"FX1 FLANGER: LOW CUT",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"01,73",
         "name":"FX1 FLANGER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,74",
         "name":"FX1 FLANGER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,75",
         "name":"FX1 TREMOLO: WAVE SHAPE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,76",
         "name":"FX1 TREMOLO: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,77",
         "name":"FX1 TREMOLO: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,78",
         "name":"FX1 TREMOLO: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,79",
         "name":"FX1 ROTARY1: SPEED SELECT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"01,7A",
         "name":"FX1 ROTARY1: RATE SLOW",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,7B",
         "name":"FX1 ROTARY1: RATE FAST",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,7C",
         "name":"FX1 ROTARY1: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,7D",
         "name":"FX1 ROTARY1: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,7E",
         "name":"FX1 ROTARY1: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"01,7F",
         "name":"FX1 ROTARY1: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,00",
         "name":"FX1 UNIV: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,01",
         "name":"FX1 UNIV: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,02",
         "name":"FX1 UNIV: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,03",
         "name":"FX1 PAN: TYPE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,04",
         "name":"FX1 PAN: WAVE SHAPE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,05",
         "name":"FX1 PAN: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,06",
         "name":"FX1 PAN: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,07",
         "name":"FX1 PAN: POSITION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,08",
         "name":"FX1 PAN: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,09",
         "name":"FX1 SLICER: PATTERN",
         "min":0,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":19
      },{
         "val":"02,0A",
         "name":"FX1 SLICER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,0B",
         "name":"FX1 SLICER: TRIGGER SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,0C",
         "name":"FX1 SLICER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,0D",
         "name":"FX1 SLICER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,0E",
         "name":"FX1 VIBRATO: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,0F",
         "name":"FX1 VIBRATO: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,10",
         "name":"FX1 VIBRATO: TRIGGER",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,11",
         "name":"FX1 VIBRATO: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,12",
         "name":"FX1 VIBRATO: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,13",
         "name":"FX1 RINGMOD: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,14",
         "name":"FX1 RINGMOD: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,15",
         "name":"FX1 RINGMOD: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,16",
         "name":"FX1 RINGMOD: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,17",
         "name":"FX1 HUMANIZER: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,18",
         "name":"FX1 HUMANIZER: VOWEL 1",
         "min":0,
         "max":4,
         "step":1,
         "minDef":0,
         "maxDef":4
      },{
         "val":"02,19",
         "name":"FX1 HUMANIZER: VOWEL 2",
         "min":0,
         "max":4,
         "step":1,
         "minDef":0,
         "maxDef":4
      },{
         "val":"02,1A",
         "name":"FX1 HUMANIZER: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,1B",
         "name":"FX1 HUMANIZER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,1C",
         "name":"FX1 HUMANIZER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,1D",
         "name":"FX1 HUMANIZER: MANUAL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,1E",
         "name":"FX1 HUMANIZER: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,1F",
         "name":"FX1 2X2 CHORUS: CROSSOVER FREQUENCY",
         "min":0,
         "max":16,
         "step":1,
         "minDef":0,
         "maxDef":16
      },{
         "val":"02,20",
         "name":"FX1 2X2 CHORUS: LOW RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,21",
         "name":"FX1 2X2 CHORUS: LOW DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,22",
         "name":"FX1 2X2 CHORUS: LOW PRE DELAY",
         "min":0,
         "max":80,
         "step":1,
         "minDef":0,
         "maxDef":80
      },{
         "val":"02,23",
         "name":"FX1 2X2 CHORUS: LOW LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,24",
         "name":"FX1 2X2 CHORUS: HIGH RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,25",
         "name":"FX1 2X2 CHORUS: HIGH DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,26",
         "name":"FX1 2X2 CHORUS: HIGH PRE DELAY",
         "min":0,
         "max":80,
         "step":1,
         "minDef":0,
         "maxDef":80
      },{
         "val":"02,27",
         "name":"FX1 2X2 CHORUS: HIGH LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,28",
         "name":"FX1 SUB DELAY: TYPE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,29",
         "name":"FX1 SUB DELAY: DELAY TIME",
         "min":0,
         "max":1007,
         "step":1,
         "minDef":100,
         "maxDef":700
      },{
         "val":"02,2A",
         "name":"FX1 SUB DELAY: FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,2B",
         "name":"FX1 SUB DELAY: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"02,2C",
         "name":"FX1 SUB DELAY: EFFECT LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":120
      },{
         "val":"02,2D",
         "name":"FX1 SUB DELAY: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,2E",
         "name":"FX1 SUB DELAY: TAP TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,2F",
         "name":"FX2: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,30",
         "name":"FX2: TYPE",
         "min":0,
         "max":33,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,31",
         "name":"FX2 T.WAH: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,32",
         "name":"FX2 T.WAH: POLARITY",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,33",
         "name":"FX2 T.WAH: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,34",
         "name":"FX2 T.WAH: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,35",
         "name":"FX2 T.WAH: PEAK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,36",
         "name":"FX2 T.WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,37",
         "name":"FX2 T.WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,38",
         "name":"FX2 AUTO WAH: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,39",
         "name":"FX2 AUTO WAH: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,3A",
         "name":"FX2 AUTO WAH: PEAK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,3B",
         "name":"FX2 AUTO WAH: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,3C",
         "name":"FX2 AUTO WAH: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,3D",
         "name":"FX2 AUTO WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,3E",
         "name":"FX2 AUTO WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,3F",
         "name":"FX2 SUB WAH: TYPE",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"02,40",
         "name":"FX2 SUB WAH: PEDAL POSITION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,41",
         "name":"FX2 SUB WAH: PEDAL MIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,42",
         "name":"FX2 SUB WAH: PEDAL MAX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,43",
         "name":"FX2 SUB WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,44",
         "name":"FX2 SUB WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,45",
         "name":"FX2 ADV.COMP: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"02,46",
         "name":"FX2 ADV.COMP: SUSTAIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,47",
         "name":"FX2 ADV.COMP: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,48",
         "name":"FX2 ADV.COMP: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,49",
         "name":"FX2 ADV.COMP: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,4A",
         "name":"FX2 LIMITER: TYPE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"02,4B",
         "name":"FX2 LIMITER: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,4C",
         "name":"FX2 LIMITER: THRESHOLD",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,4D",
         "name":"FX2 LIMITER: RATIO",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"02,4E",
         "name":"FX2 LIMITER: RELEASE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,4F",
         "name":"FX2 LIMITER: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,50",
         "name":"FX2 OD/DS: TYPE",
         "min":0,
         "max":22,
         "step":1,
         "minDef":0,
         "maxDef":20
      },{
         "val":"02,51",
         "name":"FX2 OD/DS: DRIVE",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":120
      },{
         "val":"02,52",
         "name":"FX2 OD/DS: BOTTOM",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,53",
         "name":"FX2 OD/DS: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,54",
         "name":"FX2 OD/DS: SOLO SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"02,55",
         "name":"FX2 OD/DS: SOLO LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,56",
         "name":"FX2 OD/DS: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,57",
         "name":"FX2 OD/DS: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,58",
         "name":"FX2 GRAPHIC EQ: 31Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,59",
         "name":"FX2 GRAPHIC EQ: 62Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,5A",
         "name":"FX2 GRAPHIC EQ: 125Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,5B",
         "name":"FX2 GRAPHIC EQ: 250Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,5C",
         "name":"FX2 GRAPHIC EQ: 500Hz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,5D",
         "name":"FX2 GRAPHIC EQ: 1kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,5E",
         "name":"FX2 GRAPHIC EQ: 2kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,5F",
         "name":"FX2 GRAPHIC EQ: 4kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,60",
         "name":"FX2 GRAPHIC EQ: 8kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,61",
         "name":"FX2 GRAPHIC EQ: 16kHz",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,62",
         "name":"FX2 GRAPHIC EQ: LEVEL",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,63",
         "name":"FX2 PARAMETRIC EQ: LOW CUT",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"02,64",
         "name":"FX2 PARAMETRIC EQ: LOW GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,65",
         "name":"FX2 PARAMETRIC EQ: LOW-MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"02,66",
         "name":"FX2 PARAMETRIC EQ: LOW-MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"02,67",
         "name":"FX2 PARAMETRIC EQ: LOW-MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,68",
         "name":"FX2 PARAMETRIC EQ: HI-MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"02,69",
         "name":"FX2 PARAMETRIC EQ: HI-MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"02,6A",
         "name":"FX2 PARAMETRIC EQ: HI-MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,6B",
         "name":"FX2 PARAMETRIC EQ: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"02,6C",
         "name":"FX2 PARAMETRIC EQ: HIGH GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,6D",
         "name":"FX2 PARAMETRIC EQ: LEVEL",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"02,6E",
         "name":"FX2 TONE MODIFY: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"02,6F",
         "name":"FX2 TONE MODIFY: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,70",
         "name":"FX2 TONE MODIFY: LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,71",
         "name":"FX2 TONE MODIFY: HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,72",
         "name":"FX2 TONE MODIFY: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,73",
         "name":"FX2 GUITAR SIMULATOR: TYPE",
         "min":0,
         "max":7,
         "step":1,
         "minDef":0,
         "maxDef":7
      },{
         "val":"02,74",
         "name":"FX2 GUITAR SIMULATOR: LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,75",
         "name":"FX2 GUITAR SIMULATOR: HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,76",
         "name":"FX2 GUITAR SIMULATOR: BODY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,77",
         "name":"FX2 GUITAR SIMULATOR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,78",
         "name":"FX2 SLOW GEAR: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,79",
         "name":"FX2 SLOW GEAR: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,7A",
         "name":"FX2 SLOW GEAR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,7B",
         "name":"FX2 DEFRETTER: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"02,7C",
         "name":"FX2 DEFRETTER: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,7D",
         "name":"FX2 DEFRETTER: ATTACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,7E",
         "name":"FX2 DEFRETTER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"02,7F",
         "name":"FX2 DEFRETTER: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,00",
         "name":"FX2 DEFRETTER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,01",
         "name":"FX2 DEFRETTER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,02",
         "name":"FX2 WAVE SYNTH: WAVE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,03",
         "name":"FX2 WAVE SYNTH: CUTOFF",
         "min":0,
         "max":100,
         "step":1,
         "minDef":40,
         "maxDef":80
      },{
         "val":"03,04",
         "name":"FX2 WAVE SYNTH: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":30,
         "maxDef":100
      },{
         "val":"03,05",
         "name":"FX2 WAVE SYNTH: FILTER SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":40,
         "maxDef":100
      },{
         "val":"03,06",
         "name":"FX2 WAVE SYNTH: FILTER DECAY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":100
      },{
         "val":"03,07",
         "name":"FX2 WAVE SYNTH: FILTER DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":100
      },{
         "val":"03,08",
         "name":"FX2 WAVE SYNTH: SYNTH LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":25
      },{
         "val":"03,09",
         "name":"FX2 WAVE SYNTH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,0A",
         "name":"FX2 SITAR SIMULATOR: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"03,0B",
         "name":"FX2 SITAR SIMULATOR: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"03,0C",
         "name":"FX2 SITAR SIMULATOR: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":50,
         "maxDef":100
      },{
         "val":"03,0D",
         "name":"FX2 SITAR SIMULATOR: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":32,
         "maxDef":70
      },{
         "val":"03,0E",
         "name":"FX2 SITAR SIMULATOR: BUZZ",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"03,0F",
         "name":"FX2 SITAR SIMULATOR: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,10",
         "name":"FX2 SITAR SIMULATOR: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,11",
         "name":"FX2 OCTAVE: RANGE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"03,12",
         "name":"FX2 OCTAVE: OCTAVE LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,13",
         "name":"FX2 OCTAVE: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,14",
         "name":"FX2 PITCH SHIFTER: VOICE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"03,15",
         "name":"FX2 PITCH SHIFTER: PS1 MODE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"03,16",
         "name":"FX2 PITCH SHIFTER: PS1 PITCH",
         "min":-24,
         "max":24,
         "step":1,
         "minDef":0,
         "maxDef":12
      },{
         "val":"03,17",
         "name":"FX2 PITCH SHIFTER: PS1 FINE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"03,18",
         "name":"FX2 PITCH SHIFTER: PS1 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"03,19",
         "name":"FX2 PITCH SHIFTER: PS1 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,1A",
         "name":"FX2 PITCH SHIFTER: PS2 MODE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"03,1B",
         "name":"FX2 PITCH SHIFTER: PS2 PITCH",
         "min":-24,
         "max":24,
         "step":1,
         "minDef":0,
         "maxDef":12
      },{
         "val":"03,1C",
         "name":"FX2 PITCH SHIFTER: PS2 FINE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"03,1D",
         "name":"FX2 PITCH SHIFTER: PS2 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"03,1E",
         "name":"FX2 PITCH SHIFTER: PS2 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,1F",
         "name":"FX2 PITCH SHIFTER: PS1 FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,20",
         "name":"FX2 PITCH SHIFTER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,21",
         "name":"FX2 HARMONIST: VOICE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"03,22",
         "name":"FX2 HARMONIST: HR1 HARMONY",
         "min":0,
         "max":29,
         "step":1,
         "minDef":14,
         "maxDef":21
      },{
         "val":"03,23",
         "name":"FX2 HARMONIST: HR1 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"03,24",
         "name":"FX2 HARMONIST: HR1 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,25",
         "name":"FX2 HARMONIST: HR2 HARMONY",
         "min":0,
         "max":29,
         "step":1,
         "minDef":14,
         "maxDef":21
      },{
         "val":"03,26",
         "name":"FX2 HARMONIST: HR2 PRE DELAY",
         "min":0,
         "max":307,
         "step":1,
         "minDef":0,
         "maxDef":300
      },{
         "val":"03,27",
         "name":"FX2 HARMONIST: HR2 LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,28",
         "name":"FX2 HARMONIST: HR1 FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,29",
         "name":"FX2 HARMONIST: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,2A",
         "name":"FX2 SOUND HOLD: HOLD",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,2B",
         "name":"FX2 SOUND HOLD: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"03,2C",
         "name":"FX2 SOUND HOLD: EFFECT LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"03,2D",
         "name":"FX2 ACOUSTIC PROCESSOR: TYPE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"03,2E",
         "name":"FX2 ACOUSTIC PROCESSOR: BASS",
         "min":0,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"03,2F",
         "name":"FX2 ACOUSTIC PROCESSOR: MIDDLE",
         "min":0,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"03,30",
         "name":"FX2 ACOUSTIC PROCESSOR: MIDDLE FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":16,
         "maxDef":20
      },{
         "val":"03,31",
         "name":"FX2 ACOUSTIC PROCESSOR: TREBLE",
         "min":0,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"03,32",
         "name":"FX2 ACOUSTIC PROCESSOR: PRESENCE",
         "min":0,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"03,33",
         "name":"FX2 ACOUSTIC PROCESSOR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":30
      },{
         "val":"03,34",
         "name":"FX2 PHASER: TYPE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"03,35",
         "name":"FX2 PHASER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,36",
         "name":"FX2 PHASER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,37",
         "name":"FX2 PHASER: MANUAL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,38",
         "name":"FX2 PHASER: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,39",
         "name":"FX2 PHASER: STEP RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":1,
         "maxDef":101
      },{
         "val":"03,3A",
         "name":"FX2 PHASER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,3B",
         "name":"FX2 PHASER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,3C",
         "name":"FX2 FLANGER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,3D",
         "name":"FX2 FLANGER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,3E",
         "name":"FX2 FLANGER: MANUAL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,3F",
         "name":"FX2 FLANGER: RESONANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,40",
         "name":"FX2 FLANGER: SEPARATION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,41",
         "name":"FX2 FLANGER: LOW CUT",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"03,42",
         "name":"FX2 FLANGER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,43",
         "name":"FX2 FLANGER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,44",
         "name":"FX2 TREMOLO: WAVE SHAPE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,45",
         "name":"FX2 TREMOLO: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,46",
         "name":"FX2 TREMOLO: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,47",
         "name":"FX2 TREMOLO: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,48",
         "name":"FX2 ROTARY1: SPEED SELECT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,49",
         "name":"FX2 ROTARY1: RATE SLOW",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,4A",
         "name":"FX2 ROTARY1: RATE FAST",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,4B",
         "name":"FX2 ROTARY1: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,4C",
         "name":"FX2 ROTARY1: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,4D",
         "name":"FX2 ROTARY1: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,4E",
         "name":"FX2 ROTARY1: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,4F",
         "name":"FX2 UNIV: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,50",
         "name":"FX2 UNIV: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,51",
         "name":"FX2 UNIV: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,52",
         "name":"FX2 PAN: TYPE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,53",
         "name":"FX2 PAN: WAVE SHAPE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,54",
         "name":"FX2 PAN: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,55",
         "name":"FX2 PAN: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,56",
         "name":"FX2 PAN: POS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,57",
         "name":"FX2 PAN: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,58",
         "name":"FX2 SLICER: PATTERN",
         "min":0,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":19
      },{
         "val":"03,59",
         "name":"FX2 SLICER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,5A",
         "name":"FX2 SLICER: TRIGGER SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,5B",
         "name":"FX2 SLICER: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,5C",
         "name":"FX2 SLICER: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,5D",
         "name":"FX2 VIBRATO: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,5E",
         "name":"FX2 VIBRATO: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,5F",
         "name":"FX2 VIBRATO: TRIGGER",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,60",
         "name":"FX2 VIBRATO: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,61",
         "name":"FX2 VIBRATO: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,62",
         "name":"FX2 RINGMOD: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,63",
         "name":"FX2 RINGMOD: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,64",
         "name":"FX2 RINGMOD: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,65",
         "name":"FX2 RINGMOD: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,66",
         "name":"FX2 HUMANIZER: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,67",
         "name":"FX2 HUMANIZER: VOWEL 1",
         "min":0,
         "max":4,
         "step":1,
         "minDef":0,
         "maxDef":4
      },{
         "val":"03,68",
         "name":"FX2 HUMANIZER: VOWEL 2",
         "min":0,
         "max":4,
         "step":1,
         "minDef":0,
         "maxDef":4
      },{
         "val":"03,69",
         "name":"FX2 HUMANIZER: SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,6A",
         "name":"FX2 HUMANIZER: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,6B",
         "name":"FX2 HUMANIZER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,6C",
         "name":"FX2 HUMANIZER: MANUAL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,6D",
         "name":"FX2 HUMANIZER: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,6E",
         "name":"FX2 2X2 CHORUS: CROSSOVER FREQUENCY",
         "min":0,
         "max":16,
         "step":1,
         "minDef":0,
         "maxDef":16
      },{
         "val":"03,6F",
         "name":"FX2 2X2 CHORUS: LOW RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,70",
         "name":"FX2 2X2 CHORUS: LOW DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,71",
         "name":"FX2 2X2 CHORUS: LOW PRE DELAY",
         "min":0,
         "max":80,
         "step":1,
         "minDef":0,
         "maxDef":80
      },{
         "val":"03,72",
         "name":"FX2 2X2 CHORUS: LOW LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,73",
         "name":"FX2 2X2 CHORUS: HIGH RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,74",
         "name":"FX2 2X2 CHORUS: HIGH DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,75",
         "name":"FX2 2X2 CHORUS: HIGH PRE DELAY",
         "min":0,
         "max":80,
         "step":1,
         "minDef":0,
         "maxDef":80
      },{
         "val":"03,76",
         "name":"FX2 2X2 CHORUS: HIGH LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,77",
         "name":"FX2 SUB DELAY: TYPE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,78",
         "name":"FX2 SUB DELAY: DELAY TIME",
         "min":0,
         "max":1007,
         "step":1,
         "minDef":100,
         "maxDef":700
      },{
         "val":"03,79",
         "name":"FX2 SUB DELAY: FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,7A",
         "name":"FX2 SUB DELAY: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"03,7B",
         "name":"FX2 SUB DELAY: EFFECT LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":120
      },{
         "val":"03,7C",
         "name":"FX2 SUB DELAY: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,7D",
         "name":"FX2 SUB DELAY: TAP TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"03,7E",
         "name":"DELAY: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"03,7F",
         "name":"DELAY: TYPE",
         "min":0,
         "max":9,
         "step":1,
         "minDef":0,
         "maxDef":9
      },{
         "val":"04,00",
         "name":"DELAY: DELAY TIME",
         "min":1,
         "max":2013,
         "step":1,
         "minDef":100,
         "maxDef":700
      },{
         "val":"04,01",
         "name":"DELAY: FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,02",
         "name":"DELAY: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"04,03",
         "name":"DELAY: EFFECT LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"04,04",
         "name":"DELAY: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,05",
         "name":"DELAY: PAN TAP TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,06",
         "name":"DELAY D1: TIME",
         "min":1,
         "max":1013,
         "step":1,
         "minDef":100,
         "maxDef":700
      },{
         "val":"04,07",
         "name":"DELAY D1: FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,08",
         "name":"DELAY D1: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"04,09",
         "name":"DELAY D1: LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"04,0A",
         "name":"DELAY D2: TIME",
         "min":1,
         "max":1013,
         "step":1,
         "minDef":100,
         "maxDef":700
      },{
         "val":"04,0B",
         "name":"DELAY D2: FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,0C",
         "name":"DELAY D2: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"04,0D",
         "name":"DELAY D2: LEVEL",
         "min":0,
         "max":120,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"04,0E",
         "name":"DELAY MOD: MOD RATE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,0F",
         "name":"DELAY MOD: MOD DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,10",
         "name":"CHORUS: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,11",
         "name":"CHORUS: MODE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,12",
         "name":"CHORUS: RATE",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,13",
         "name":"CHORUS: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,14",
         "name":"CHORUS: PRE DELAY",
         "min":0,
         "max":80,
         "step":1,
         "minDef":0,
         "maxDef":80
      },{
         "val":"04,15",
         "name":"CHORUS: LOW CUT",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"04,16",
         "name":"CHORUS: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"04,17",
         "name":"CHORUS: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,18",
         "name":"REVERB: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,19",
         "name":"REVERB: TYPE",
         "min":0,
         "max":6,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"04,1A",
         "name":"REVERB: REVERB TIME",
         "min":0,
         "max":99,
         "step":1,
         "minDef":0,
         "maxDef":99
      },{
         "val":"04,1B",
         "name":"REVERB: PRE DELAY",
         "min":0,
         "max":500,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,1C",
         "name":"REVERB: LOW CUT",
         "min":0,
         "max":17,
         "step":1,
         "minDef":0,
         "maxDef":17
      },{
         "val":"04,1D",
         "name":"REVERB: HIGH CUT",
         "min":0,
         "max":14,
         "step":1,
         "minDef":0,
         "maxDef":14
      },{
         "val":"04,1E",
         "name":"REVERB: DENSITY",
         "min":0,
         "max":10,
         "step":1,
         "minDef":0,
         "maxDef":10
      },{
         "val":"04,1F",
         "name":"REVERB: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,20",
         "name":"REVERB: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,21",
         "name":"REVERB: SPRING SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,22",
         "name":"PEDAL FX: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,23",
         "name":"PEDAL PITCH BEND: PITCH",
         "min":-24,
         "max":24,
         "step":1,
         "minDef":0,
         "maxDef":12
      },{
         "val":"04,24",
         "name":"PEDAL PITCH BEND: PEDAL POSITION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,25",
         "name":"PEDAL PITCH BEND: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,26",
         "name":"PEDAL PITCH BEND: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,27",
         "name":"PEDAL WAH: TYPE",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"04,28",
         "name":"PEDAL WAH: PEDAL POSITION",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,29",
         "name":"PEDAL WAH: PEDAL MIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,2A",
         "name":"PEDAL WAH: PEDAL MAX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,2B",
         "name":"PEDAL WAH: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,2C",
         "name":"PEDAL WAH: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,2D",
         "name":"FOOT VOLUME: VOLUME CURVE",
         "min":0,
         "max":3,
         "step":1,
         "minDef":0,
         "maxDef":3
      },{
         "val":"04,2E",
         "name":"FOOT VOLUME: VOLUME MIN",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,2F",
         "name":"FOOT VOLUME: VOLUME MAX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,30",
         "name":"FOOT VOLUME: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,31",
         "name":"DIVIDER: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,32",
         "name":"DIVIDER: CHANNEL SELECT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,33",
         "name":"DIVIDER: ChA DYNAMIC",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,34",
         "name":"DIVIDER: ChA DYNAMIC SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,35",
         "name":"DIVIDER: ChA FILTER",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,36",
         "name":"DIVIDER: ChA CUTOFF",
         "min":0,
         "max":16,
         "step":1,
         "minDef":0,
         "maxDef":16
      },{
         "val":"04,37",
         "name":"DIVIDER: ChB DYNAMIC",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,38",
         "name":"DIVIDER: ChB DYNAMIC SENS",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,39",
         "name":"DIVIDER: ChB FILTER",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,3A",
         "name":"DIVIDER: ChB CUTOFF",
         "min":0,
         "max":16,
         "step":1,
         "minDef":0,
         "maxDef":16
      },{
         "val":"04,3B",
         "name":"MIXER: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,3C",
         "name":"MIXER: ChA/B BALANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"04,3D",
         "name":"MIXER: SPREAD",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,3E",
         "name":"SEND/RETURN: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":0
      },{
         "val":"04,3F",
         "name":"SEND/RETURN: MODE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,40",
         "name":"SEND/RETURN: SEND LEVEL",
         "min":0,
         "max":200,
         "step":2,
         "minDef":50,
         "maxDef":70
      },{
         "val":"04,41",
         "name":"SEND/RETURN: RETURN LEVEL",
         "min":0,
         "max":200,
         "step":2,
         "minDef":50,
         "maxDef":70
      },{
         "val":"04,42",
         "name":"AMP CONTROL: AMP CONTROL SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,43",
         "name":"NS1: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,44",
         "name":"NS1: THRESHOLD",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"04,45",
         "name":"NS1: RELEASE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"04,46",
         "name":"NS1: DETECT",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,47",
         "name":"NS2: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,48",
         "name":"NS2: THRESHOLD",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"04,49",
         "name":"NS2: RELEASE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":20,
         "maxDef":60
      },{
         "val":"04,4A",
         "name":"NS2: DETECT",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2
      },{
         "val":"04,4B",
         "name":"ACCEL: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,4C",
         "name":"ACCEL: TYPE",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"04,4D",
         "name":"ACCEL S-BEND: PITCH",
         "min":0,
         "max":6,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"04,4E",
         "name":"ACCEL S-BEND: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,4F",
         "name":"ACCEL S-BEND: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,50",
         "name":"ACCEL LASER: RATE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,51",
         "name":"ACCEL LASER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,52",
         "name":"ACCEL LASER: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,53",
         "name":"ACCEL LASER: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,54",
         "name":"ACCEL RING MOD: FREQUENCY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,55",
         "name":"ACCEL RING MOD: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,56",
         "name":"ACCEL RING MOD: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,57",
         "name":"ACCEL RING MOD: RING LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,58",
         "name":"ACCEL RING MOD: OCTAVE LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,59",
         "name":"ACCEL RING MOD: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,5A",
         "name":"ACCEL TWIST: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,5B",
         "name":"ACCEL TWIST: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,5C",
         "name":"ACCEL TWIST: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,5D",
         "name":"ACCEL WARP: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,5E",
         "name":"ACCEL WARP: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,5F",
         "name":"ACCEL WARP: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,60",
         "name":"ACCEL FEEDBACKER: MODE",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,61",
         "name":"ACCEL FEEDBACKER: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,62",
         "name":"ACCEL FEEDBACKER: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,63",
         "name":"ACCEL FEEDBACKER: OCTAVE RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,64",
         "name":"ACCEL FEEDBACKER: FEEDBACK LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,65",
         "name":"ACCEL FEEDBACKER: OCTAVE FEEDBACK LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,66",
         "name":"ACCEL FEEDBACKER: VIBRATO RATE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,67",
         "name":"ACCEL FEEDBACKER: VIBRATO DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"04,68",
         "name":"MASTER: PATCH LEVEL",
         "min":0,
         "max":200,
         "step":2,
         "minDef":0,
         "maxDef":50
      },{
         "val":"04,69",
         "name":"MASTER: MASTER LOW",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"04,6A",
         "name":"MASTER: MASTER MID FREQUENCY",
         "min":0,
         "max":27,
         "step":1,
         "minDef":0,
         "maxDef":27
      },{
         "val":"04,6B",
         "name":"MASTER: MASTER MID Q",
         "min":0,
         "max":5,
         "step":1,
         "minDef":0,
         "maxDef":5
      },{
         "val":"04,6C",
         "name":"MASTER: MASTER MID GAIN",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"04,6D",
         "name":"MASTER: MASTER HIGH",
         "min":-20,
         "max":20,
         "step":1,
         "minDef":0,
         "maxDef":6
      },{
         "val":"04,6E",
         "name":"BPM/KEY: MASTER BPM",
         "min":40,
         "max":250,
         "step":1,
         "minDef":120,
         "maxDef":250
      },{
         "val":"04,6F",
         "name":"BPM/KEY: MASTER KEY",
         "min":0,
         "max":11,
         "step":1,
         "minDef":0,
         "maxDef":11
      },{
         "val":"04,70",
         "name":"TUNER: TUNER SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,71",
         "name":"MANUAL: MANUAL MODE SW",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,72",
         "name":"PHRASE LOOP: ON/OFF",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,73",
         "name":"PHRASE LOOP: REC/PLAY",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,74",
         "name":"PHRASE LOOP: STOP/PLAY",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,75",
         "name":"PHRASE LOOP: CLEAR",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,76",
         "name":"TAP: BPM TAP",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,77",
         "name":"TAP: DELAY TAP",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,78",
         "name":"MIDI: START/STOP",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,79",
         "name":"MIDI: MMC PLAY/STOP",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,7A",
         "name":"PATCH: LEVEL +10",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,7B",
         "name":"PATCH: LEVEL +20",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,7C",
         "name":"PATCH: LEVEL -10",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,7D",
         "name":"PATCH: LEVEL -20",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,7E",
         "name":"PATCH: NUMBER INC",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"04,7F",
         "name":"PATCH: NUMBER DEC",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,00",
         "name":"PATCH: BANK INC",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,01",
         "name":"PATCH: BANK DEC",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,02",
         "name":"PATCH: FAVORITE INC",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,03",
         "name":"PATCH: FAVORITE DEC",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,04",
         "name":"FX1 AC.GUITAR SIMULATOR: BODY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,05",
         "name":"FX1 AC.GUITAR SIMULATOR: LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,06",
         "name":"FX1 AC.GUITAR SIMULATOR: HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,07",
         "name":"FX1 AC.GUITAR SIMULATOR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,08",
         "name":"FX1 ROTARY2: SPEED SELECT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,09",
         "name":"FX1 ROTARY2: RATE SLOW",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,0A",
         "name":"FX1 ROTARY2: RATE FAST",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,0B",
         "name":"FX1 ROTARY2: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,0C",
         "name":"FX1 ROTARY2: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,0D",
         "name":"FX1 ROTARY2: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,0E",
         "name":"FX1 ROTARY2: BALANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,0F",
         "name":"FX1 ROTARY2: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,10",
         "name":"FX1 ROTARY2: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,11",
         "name":"FX2 AC.GUITAR SIMULATOR: BODY",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,12",
         "name":"FX2 AC.GUITAR SIMULATOR: LOW",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,13",
         "name":"FX2 AC.GUITAR SIMULATOR: HIGH",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,14",
         "name":"FX2 AC.GUITAR SIMULATOR: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,15",
         "name":"FX2 ROTARY2: SPEED SELECT",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,16",
         "name":"FX2 ROTARY2: RATE SLOW",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,17",
         "name":"FX2 ROTARY2: RATE FAST",
         "min":0,
         "max":113,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,18",
         "name":"FX2 ROTARY2: DEPTH",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,19",
         "name":"FX2 ROTARY2: RISE TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,1A",
         "name":"FX2 ROTARY2: FALL TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,1B",
         "name":"FX2 ROTARY2: BALANCE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,1C",
         "name":"FX2 ROTARY2: LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,1D",
         "name":"FX2 ROTARY2: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,1E",
         "name":"FX2 TERAECHO: MODE",
         "min":0,
         "max":2,
         "step":1,
         "minDef":0,
         "maxDef":2,
         "minDef":0,
         "maxDef":2
      },{
         "val":"05,1F",
         "name":"FX2 TERAECHO: DELAY TIME",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,20",
         "name":"FX2 TERAECHO: FEEDBACK",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,21",
         "name":"FX2 TERAECHO: EFFECT LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,22",
         "name":"FX2 TERAECHO: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,23",
         "name":"FX2 TERAECHO: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,24",
         "name":"FX2 TERAECHO: HOLD",
         "min":0,
         "max":1,
         "step":1,
         "minDef":0,
         "maxDef":1
      },{
         "val":"05,25",
         "name":"FX2 OVERTONE: UPPER LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,26",
         "name":"FX2 OVERTONE: LOWER LEVEL",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,27",
         "name":"FX2 OVERTONE: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,28",
         "name":"FX2 OVERTONE: DETUNE",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,29",
         "name":"FX2 OVERTONE: TONE",
         "min":-50,
         "max":50,
         "step":1,
         "minDef":0,
         "maxDef":50
      },{
         "val":"05,2A",
         "name":"CHORUS: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,2B",
         "name":"FX1 2X2 CHORUS: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      },{
         "val":"05,2C",
         "name":"FX2 2X2 CHORUS: DIRECT MIX",
         "min":0,
         "max":100,
         "step":1,
         "minDef":0,
         "maxDef":100
      }];
      
      public static const ASSIGN_TARGET_CATEGORY_LIST:Array = ["COMP","OD/DS","PREAMP","PREAMP A","PREAMP B","EQ","FX1","FX1 T.WAH","FX1 AUTO WAH","FX1 SUB WAH","FX1 ADV.COMP","FX1 LIMITER","FX1 OD/DS","FX1 GRAPHIC EQ","FX1 PARAMETRIC EQ","FX1 TONE MODIFY","FX1 GUITAR SIMULATOR","FX1 AC.GUITAR SIMULATOR","FX1 SLOW GEAR","FX1 DEFRETTER","FX1 WAVE SYNTH","FX1 SITAR SIMULATOR","FX1 OCTAVE","FX1 PITCH SHIFTER","FX1 HARMONIST","FX1 SOUND HOLD","FX1 ACOUSTIC PROCESSOR","FX1 PHASER","FX1 FLANGER","FX1 TREMOLO","FX1 ROTARY1","FX1 ROTARY2","FX1 UNIV","FX1 PAN","FX1 SLICER","FX1 VIBRATO","FX1 RINGMOD","FX1 HUMANIZER","FX1 2X2 CHORUS","FX1 SUB DELAY","FX2","FX2 T.WAH","FX2 AUTO WAH","FX2 SUB WAH","FX2 ADV.COMP","FX2 LIMITER","FX2 OD/DS","FX2 GRAPHIC EQ","FX2 PARAMETRIC EQ","FX2 TONE MODIFY","FX2 GUITAR SIMULATOR","FX2 AC.GUITAR SIMULATOR","FX2 SLOW GEAR","FX2 DEFRETTER","FX2 WAVE SYNTH","FX2 SITAR SIMULATOR","FX2 OCTAVE","FX2 PITCH SHIFTER","FX2 HARMONIST","FX2 OVERTONE","FX2 SOUND HOLD","FX2 ACOUSTIC PROCESSOR"
      ,"FX2 PHASER","FX2 FLANGER","FX2 TREMOLO","FX2 ROTARY1","FX2 ROTARY2","FX2 UNIV","FX2 PAN","FX2 SLICER","FX2 VIBRATO","FX2 RINGMOD","FX2 HUMANIZER","FX2 2X2 CHORUS","FX2 SUB DELAY","FX2 TERAECHO","DELAY","DELAY D1","DELAY D2","DELAY MOD","CHORUS","REVERB","PEDAL FX","PEDAL PITCH BEND","PEDAL WAH","FOOT VOLUME","DIVIDER","MIXER","SEND/RETURN","AMP CONTROL","NS1","NS2","ACCEL","ACCEL S-BEND","ACCEL LASER","ACCEL RING MOD","ACCEL TWIST","ACCEL WARP","ACCEL FEEDBACKER","MASTER","BPM/KEY","TUNER","MANUAL","PHRASE LOOP","TAP","MIDI","PATCH"];
      
      public static const ASSIGN_TARGET_LIST:Object = {
         "COMP":["ON/OFF","TYPE","SUSTAIN","ATTACK","TONE","LEVEL"],
         "OD/DS":["ON/OFF","TYPE","DRIVE","BOTTOM","TONE","SOLO SW","SOLO LEVEL","EFFECT LEVEL","DIRECT MIX","CUSTOM TYPE","CUSTOM BOTTOM","CUSTOM TOP","CUSTOM LOW","CUSTOM HIGH","CUSTOM CHARACTER"],
         "PREAMP":["ON/OFF"],
         "PREAMP A":["TYPE","GAIN","T-COMP","BASS","MIDDLE","TREBLE","PRESENCE","LEVEL","BRIGHT","GAIN SW","SOLO SW","SOLO LEVEL","SPEAKER TYPE","MIC TYPE","MIC DISTANCE","MIC POSITION","MIC LEVEL","DIRECT MIX","CUSTOM TYPE","CUSTOM BOTTOM","CUSTOM EDGE","CUSTOM LOW","CUSTOM HIGH","CUSTOM CHARACTER","CUSTOM SPEAKER SIZE","CUSTOM SPEAKER COLOR LOW","CUSTOM SPEAKER COLOR HIGH","CUSTOM SPEAKER NUMBER","CUSTOM SPEAKER CABINET"],
         "PREAMP B":["TYPE","GAIN","T-COMP","BASS","MIDDLE","TREBLE","PRESENCE","LEVEL","BRIGHT","GAIN SW","SOLO SW","SOLO LEVEL","SPEAKER TYPE","MIC TYPE","MIC DISTANCE","MIC POSITION","MIC LEVEL","DIRECT MIX","CUSTOM TYPE","CUSTOM BOTTOM","CUSTOM EDGE","CUSTOM LOW","CUSTOM HIGH","CUSTOM CHARACTER","CUSTOM SPEAKER SIZE","CUSTOM SPEAKER COLOR LOW","CUSTOM SPEAKER COLOR HIGH","CUSTOM SPEAKER NUMBER","CUSTOM SPEAKER CABINET"],
         "EQ":["ON/OFF","LOW CUT","LOW GAIN","LOW-MID FREQUENCY","LOW-MID Q","LOW-MID GAIN","HI-MID FREQUENCY","HI-MID Q","HI-MID GAIN","HIGH GAIN","HIGH CUT","LEVEL"],
         "FX1":["ON/OFF","TYPE"],
         "FX1 T.WAH":["MODE","POLARITY","SENS","FREQUENCY","PEAK","EFFECT LEVEL","DIRECT MIX"],
         "FX1 AUTO WAH":["MODE","FREQUENCY","PEAK","RATE","DEPTH","EFFECT LEVEL","DIRECT MIX"],
         "FX1 SUB WAH":["TYPE","PEDAL POSITION","PEDAL MIN","PEDAL MAX","EFFECT LEVEL","DIRECT MIX"],
         "FX1 ADV.COMP":["TYPE","SUSTAIN","ATTACK","TONE","LEVEL"],
         "FX1 LIMITER":["TYPE","ATTACK","THRESHOLD","RATIO","RELEASE","LEVEL"],
         "FX1 OD/DS":["TYPE","DRIVE","BOTTOM","TONE","SOLO SW","SOLO LEVEL","EFFECT LEVEL","DIRECT MIX"],
         "FX1 GRAPHIC EQ":["31Hz","62Hz","125Hz","250Hz","500Hz","1kHz","2kHz","4kHz","8kHz","16kHz","LEVEL"],
         "FX1 PARAMETRIC EQ":["LOW CUT","LOW GAIN","LOW-MID FREQUENCY","LOW-MID Q","LOW-MID GAIN","HI-MID FREQUENCY","HI-MID Q","HI-MID GAIN","HIGH CUT","HIGH GAIN","LEVEL"],
         "FX1 TONE MODIFY":["TYPE","RESONANCE","LOW","HIGH","LEVEL"],
         "FX1 GUITAR SIMULATOR":["TYPE","LOW","HIGH","BODY","LEVEL"],
         "FX1 AC.GUITAR SIMULATOR":["BODY","LOW","HIGH","LEVEL"],
         "FX1 SLOW GEAR":["SENS","RISE TIME","LEVEL"],
         "FX1 DEFRETTER":["TONE","SENS","ATTACK","DEPTH","RESONANCE","EFFECT LEVEL","DIRECT MIX"],
         "FX1 WAVE SYNTH":["WAVE","CUTOFF","RESONANCE","FILTER SENS","FILTER DECAY","FILTER DEPTH","SYNTH LEVEL","DIRECT MIX"],
         "FX1 SITAR SIMULATOR":["TONE","SENS","DEPTH","RESONANCE","BUZZ","EFFECT LEVEL","DIRECT MIX"],
         "FX1 OCTAVE":["RANGE","OCTAVE LEVEL","DIRECT MIX"],
         "FX1 PITCH SHIFTER":["VOICE","PS1 MODE","PS1 PITCH","PS1 FINE","PS1 PRE DELAY","PS1 LEVEL","PS2 MODE","PS2 PITCH","PS2 FINE","PS2 PRE DELAY","PS2 LEVEL","PS1 FEEDBACK","DIRECT MIX"],
         "FX1 HARMONIST":["VOICE","HR1 HARMONY","HR1 PRE DELAY","HR1 LEVEL","HR2 HARMONY","HR2 PRE DELAY","HR2 LEVEL","HR1 FEEDBACK","DIRECT MIX"],
         "FX1 SOUND HOLD":["HOLD","RISE TIME","EFFECT LEVEL"],
         "FX1 ACOUSTIC PROCESSOR":["TYPE","BASS","MIDDLE","MIDDLE FREQUENCY","TREBLE","PRESENCE","LEVEL"],
         "FX1 PHASER":["TYPE","RATE","DEPTH","MANUAL","RESONANCE","STEP RATE","EFFECT LEVEL","DIRECT MIX"],
         "FX1 FLANGER":["RATE","DEPTH","MANUAL","RESONANCE","SEPARATION","LOW CUT","EFFECT LEVEL","DIRECT MIX"],
         "FX1 TREMOLO":["WAVE SHAPE","RATE","DEPTH","LEVEL"],
         "FX1 ROTARY1":["SPEED SELECT","RATE SLOW","RATE FAST","RISE TIME","FALL TIME","DEPTH","LEVEL"],
         "FX1 ROTARY2":["SPEED SELECT","RATE SLOW","RATE FAST","DEPTH","RISE TIME","FALL TIME","BALANCE","LEVEL","DIRECT MIX"],
         "FX1 UNIV":["RATE","DEPTH","LEVEL"],
         "FX1 PAN":["TYPE","WAVE SHAPE","RATE","DEPTH","POSITION","LEVEL"],
         "FX1 SLICER":["PATTERN","RATE","TRIGGER SENS","EFFECT LEVEL","DIRECT MIX"],
         "FX1 VIBRATO":["RATE","DEPTH","TRIGGER","RISE TIME","LEVEL"],
         "FX1 RINGMOD":["MODE","FREQUENCY","EFFECT LEVEL","DIRECT MIX"],
         "FX1 HUMANIZER":["MODE","VOWEL 1","VOWEL 2","SENS","RATE","DEPTH","MANUAL","LEVEL"],
         "FX1 2X2 CHORUS":["CROSSOVER FREQUENCY","LOW RATE","LOW DEPTH","LOW PRE DELAY","LOW LEVEL","HIGH RATE","HIGH DEPTH","HIGH PRE DELAY","HIGH LEVEL","DIRECT MIX"],
         "FX1 SUB DELAY":["TYPE","DELAY TIME","FEEDBACK","HIGH CUT","EFFECT LEVEL","DIRECT MIX","TAP TIME"],
         "FX2":["ON/OFF","TYPE"],
         "FX2 T.WAH":["MODE","POLARITY","SENS","FREQUENCY","PEAK","EFFECT LEVEL","DIRECT MIX"],
         "FX2 AUTO WAH":["MODE","FREQUENCY","PEAK","RATE","DEPTH","EFFECT LEVEL","DIRECT MIX"],
         "FX2 SUB WAH":["TYPE","PEDAL POSITION","PEDAL MIN","PEDAL MAX","EFFECT LEVEL","DIRECT MIX"],
         "FX2 ADV.COMP":["TYPE","SUSTAIN","ATTACK","TONE","LEVEL"],
         "FX2 LIMITER":["TYPE","ATTACK","THRESHOLD","RATIO","RELEASE","LEVEL"],
         "FX2 OD/DS":["TYPE","DRIVE","BOTTOM","TONE","SOLO SW","SOLO LEVEL","EFFECT LEVEL","DIRECT MIX"],
         "FX2 GRAPHIC EQ":["31Hz","62Hz","125Hz","250Hz","500Hz","1kHz","2kHz","4kHz","8kHz","16kHz","LEVEL"],
         "FX2 PARAMETRIC EQ":["LOW CUT","LOW GAIN","LOW-MID FREQUENCY","LOW-MID Q","LOW-MID GAIN","HI-MID FREQUENCY","HI-MID Q","HI-MID GAIN","HIGH CUT","HIGH GAIN","LEVEL"],
         "FX2 TONE MODIFY":["TYPE","RESONANCE","LOW","HIGH","LEVEL"],
         "FX2 GUITAR SIMULATOR":["TYPE","LOW","HIGH","BODY","LEVEL"],
         "FX2 AC.GUITAR SIMULATOR":["BODY","LOW","HIGH","LEVEL"],
         "FX2 SLOW GEAR":["SENS","RISE TIME","LEVEL"],
         "FX2 DEFRETTER":["TONE","SENS","ATTACK","DEPTH","RESONANCE","EFFECT LEVEL","DIRECT MIX"],
         "FX2 WAVE SYNTH":["WAVE","CUTOFF","RESONANCE","FILTER SENS","FILTER DECAY","FILTER DEPTH","SYNTH LEVEL","DIRECT MIX"],
         "FX2 SITAR SIMULATOR":["TONE","SENS","DEPTH","RESONANCE","BUZZ","EFFECT LEVEL","DIRECT MIX"],
         "FX2 OCTAVE":["RANGE","OCTAVE LEVEL","DIRECT MIX"],
         "FX2 PITCH SHIFTER":["VOICE","PS1 MODE","PS1 PITCH","PS1 FINE","PS1 PRE DELAY","PS1 LEVEL","PS2 MODE","PS2 PITCH","PS2 FINE","PS2 PRE DELAY","PS2 LEVEL","PS1 FEEDBACK","DIRECT MIX"],
         "FX2 HARMONIST":["VOICE","HR1 HARMONY","HR1 PRE DELAY","HR1 LEVEL","HR2 HARMONY","HR2 PRE DELAY","HR2 LEVEL","HR1 FEEDBACK","DIRECT MIX"],
         "FX2 OVERTONE":["LOWER LEVEL","UPPER LEVEL","DIRECT MIX","DETUNE","TONE"],
         "FX2 SOUND HOLD":["HOLD","RISE TIME","EFFECT LEVEL"],
         "FX2 ACOUSTIC PROCESSOR":["TYPE","BASS","MIDDLE","MIDDLE FREQUENCY","TREBLE","PRESENCE","LEVEL"],
         "FX2 PHASER":["TYPE","RATE","DEPTH","MANUAL","RESONANCE","STEP RATE","EFFECT LEVEL","DIRECT MIX"],
         "FX2 FLANGER":["RATE","DEPTH","MANUAL","RESONANCE","SEPARATION","LOW CUT","EFFECT LEVEL","DIRECT MIX"],
         "FX2 TREMOLO":["WAVE SHAPE","RATE","DEPTH","LEVEL"],
         "FX2 ROTARY1":["SPEED SELECT","RATE SLOW","RATE FAST","RISE TIME","FALL TIME","DEPTH","LEVEL"],
         "FX2 ROTARY2":["SPEED SELECT","RATE SLOW","RATE FAST","DEPTH","RISE TIME","FALL TIME","BALANCE","LEVEL","DIRECT MIX"],
         "FX2 UNIV":["RATE","DEPTH","LEVEL"],
         "FX2 PAN":["TYPE","WAVE SHAPE","RATE","DEPTH","POS","LEVEL"],
         "FX2 SLICER":["PATTERN","RATE","TRIGGER SENS","EFFECT LEVEL","DIRECT MIX"],
         "FX2 VIBRATO":["RATE","DEPTH","TRIGGER","RISE TIME","LEVEL"],
         "FX2 RINGMOD":["MODE","FREQUENCY","EFFECT LEVEL","DIRECT MIX"],
         "FX2 HUMANIZER":["MODE","VOWEL 1","VOWEL 2","SENS","RATE","DEPTH","MANUAL","LEVEL"],
         "FX2 2X2 CHORUS":["CROSSOVER FREQUENCY","LOW RATE","LOW DEPTH","LOW PRE DELAY","LOW LEVEL","HIGH RATE","HIGH DEPTH","HIGH PRE DELAY","HIGH LEVEL","DIRECT MIX"],
         "FX2 SUB DELAY":["TYPE","DELAY TIME","FEEDBACK","HIGH CUT","EFFECT LEVEL","DIRECT MIX","TAP TIME"],
         "FX2 TERAECHO":["MODE","DELAY TIME","FEEDBACK","EFFECT LEVEL","TONE","DIRECT MIX","HOLD"],
         "DELAY":["ON/OFF","TYPE","DELAY TIME","FEEDBACK","HIGH CUT","EFFECT LEVEL","DIRECT MIX","PAN TAP TIME"],
         "DELAY D1":["TIME","FEEDBACK","HIGH CUT","LEVEL"],
         "DELAY D2":["TIME","FEEDBACK","HIGH CUT","LEVEL"],
         "DELAY MOD":["MOD RATE","MOD DEPTH"],
         "CHORUS":["ON/OFF","MODE","RATE","DEPTH","PRE DELAY","LOW CUT","HIGH CUT","EFFECT LEVEL","DIRECT MIX"],
         "REVERB":["ON/OFF","TYPE","REVERB TIME","PRE DELAY","LOW CUT","HIGH CUT","DENSITY","EFFECT LEVEL","DIRECT MIX","SPRING SENS"],
         "PEDAL FX":["ON/OFF"],
         "PEDAL PITCH BEND":["PITCH","PEDAL POSITION","EFFECT LEVEL","DIRECT MIX"],
         "PEDAL WAH":["TYPE","PEDAL POSITION","PEDAL MIN","PEDAL MAX","EFFECT LEVEL","DIRECT MIX"],
         "FOOT VOLUME":["VOLUME CURVE","VOLUME MIN","VOLUME MAX","LEVEL"],
         "DIVIDER":["MODE","CHANNEL SELECT","ChA DYNAMIC","ChA DYNAMIC SENS","ChA FILTER","ChA CUTOFF","ChB DYNAMIC","ChB DYNAMIC SENS","ChB FILTER","ChB CUTOFF"],
         "MIXER":["MODE","ChA/B BALANCE","SPREAD"],
         "SEND/RETURN":["ON/OFF","MODE","SEND LEVEL","RETURN LEVEL"],
         "AMP CONTROL":["AMP CONTROL SW"],
         "NS1":["ON/OFF","THRESHOLD","RELEASE","DETECT"],
         "NS2":["ON/OFF","THRESHOLD","RELEASE","DETECT"],
         "ACCEL":["ON/OFF","TYPE"],
         "ACCEL S-BEND":["PITCH","RISE TIME","FALL TIME"],
         "ACCEL LASER":["RATE","DEPTH","RISE TIME","FALL TIME"],
         "ACCEL RING MOD":["FREQUENCY","RISE TIME","FALL TIME","RING LEVEL","OCTAVE LEVEL","DIRECT MIX"],
         "ACCEL TWIST":["LEVEL","RISE TIME","FALL TIME"],
         "ACCEL WARP":["LEVEL","RISE TIME","FALL TIME"],
         "ACCEL FEEDBACKER":["MODE","DEPTH","RISE TIME","OCTAVE RISE TIME","FEEDBACK LEVEL","OCTAVE FEEDBACK LEVEL","VIBRATO RATE","VIBRATO DEPTH"],
         "MASTER":["PATCH LEVEL","MASTER LOW","MASTER MID FREQUENCY","MASTER MID Q","MASTER MID GAIN","MASTER HIGH"],
         "BPM/KEY":["MASTER BPM","MASTER KEY"],
         "TUNER":["TUNER SW"],
         "MANUAL":["MANUAL MODE SW"],
         "PHRASE LOOP":["ON/OFF","REC/PLAY","STOP/PLAY","CLEAR"],
         "TAP":["BPM TAP","DELAY TAP"],
         "MIDI":["START/STOP","MMC PLAY/STOP"],
         "PATCH":["LEVEL +10","LEVEL +20","LEVEL -10","LEVEL -20","NUMBER INC","NUMBER DEC","BANK INC","BANK DEC","FAVORITE INC","FAVORITE DEC"]
      };
      
      public static const DROPDOWN_LIST:Object = {
         "ctl_exp_accel_ctl_min":["OFF","ON"],
         "ctl_exp_accel_ctl_max":["OFF","ON"],
         "ctl_exp_accel_ctl_src_mode":["MOMENT","TOGGLE"],
         "ctl_exp_sub_ctl1_min":["OFF","ON"],
         "ctl_exp_sub_ctl1_max":["OFF","ON"],
         "ctl_exp_sub_ctl1_src_mode":["MOMENT","TOGGLE"],
         "ctl_exp_sub_ctl2_min":["OFF","ON"],
         "ctl_exp_sub_ctl2_max":["OFF","ON"],
         "ctl_exp_sub_ctl2_src_mode":["MOMENT","TOGGLE"],
         "ctl_exp_exp_sw_min":["OFF","ON"],
         "ctl_exp_exp_sw_max":["OFF","ON"],
         "ctl_exp_exp_sw_src_mode":["MOMENT","TOGGLE"],
         "INT PDL TRIGGER":[{
            "gt001":true,
            "gt100":true,
            "val":0,
            "name":"PATCH CHANGE"
         },{
            "gt001":true,
            "gt100":true,
            "val":1,
            "name":"EXP PDL-LO"
         },{
            "gt001":true,
            "gt100":true,
            "val":2,
            "name":"EXP PDL-MID"
         },{
            "gt001":true,
            "gt100":true,
            "val":3,
            "name":"EXP PDL-HI"
         },{
            "gt001":false,
            "gt100":true,
            "val":4,
            "name":"EXP PDL SW"
         },{
            "gt001":false,
            "gt100":true,
            "val":5,
            "name":"P.LOOP PEDAL"
         },{
            "gt001":false,
            "gt100":true,
            "val":6,
            "name":"ACC/CTL PDL"
         },{
            "gt001":false,
            "gt100":true,
            "val":7,
            "name":"SUB EXP PDL"
         },{
            "gt001":true,
            "gt100":true,
            "val":8,
            "name":"SUB CTL1 PDL"
         },{
            "gt001":true,
            "gt100":true,
            "val":9,
            "name":"SUB CTL2 PDL"
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
         }],
         "INT PDL CURVE":["LINEAR","SLOW RISE","FAST RISE"],
         "WAVE-FORM":["SAW","TRI","SINE"],
         "COMP: ON/OFF":["OFF","ON"],
         "COMP: TYPE":ParameterDefinitionGT.COMP_TYPE,
         "OD/DS: ON/OFF":["OFF","ON"],
         "OD/DS: TYPE":ParameterDefinitionGT.ODDS_TYPE,
         "OD/DS: SOLO SW":["OFF","ON"],
         "OD/DS: CUSTOM TYPE":ParameterDefinitionGT.ODDS_SUB_TYPE_LIST["CUSTOM"],
         "PREAMP: ON/OFF":["OFF","ON"],
         "PREAMP A: TYPE":ParameterDefinitionGT.PREAMP_TYPE,
         "PREAMP A: BRIGHT":["OFF","ON"],
         "PREAMP A: GAIN SW":["LOW","MIDDLE","HIGH"],
         "PREAMP A: SOLO SW":["OFF","ON"],
         "PREAMP A: SPEAKER TYPE":["OFF","ORIGIN","1x8\"","1x10\"","1x12\"","2x12\"","4x10\"","4x12\"","8x12\"","CUSTOM"],
         "PREAMP A: MIC TYPE":["DYN57","DYN421","CND451","CND87","FLAT"],
         "PREAMP A: MIC DISTANCE":["OFF MIC","ON MIC"],
         "PREAMP A: MIC POSITION":["CENTER","1cm","2cm","3cm","4cm","5cm","6cm","7cm","8cm","9cm","10cm"],
         "PREAMP A: CUSTOM TYPE":ParameterDefinitionGT.PREAMP_SUB_TYPE_LIST["CUSTOM"],
         "PREAMP A: CUSTOM SPEAKER SIZE":["5\"","6\"","7\"","8\"","9\"","10\"","11\"","12\"","13\"","14\"","15\""],
         "PREAMP A: CUSTOM SPEAKER NUMBER":["x1","x2","x4","x8"],
         "PREAMP A: CUSTOM SPEAKER CABINET":["OPEN","CLOSE"],
         "PREAMP B: TYPE":ParameterDefinitionGT.PREAMP_TYPE,
         "PREAMP B: BRIGHT":["OFF","ON"],
         "PREAMP B: GAIN SW":["LOW","MIDDLE","HIGH"],
         "PREAMP B: SOLO SW":["OFF","ON"],
         "PREAMP B: SPEAKER TYPE":["OFF","ORIGIN","1x8\"","1x10\"","1x12\"","2x12\"","4x10\"","4x12\"","8x12\"","CUSTOM"],
         "PREAMP B: MIC TYPE":["DYN57","DYN421","CND451","CND87","FLAT"],
         "PREAMP B: MIC DISTANCE":["OFF MIC","ON MIC"],
         "PREAMP B: MIC POSITION":["CENTER","1cm","2cm","3cm","4cm","5cm","6cm","7cm","8cm","9cm","10cm"],
         "PREAMP B: CUSTOM TYPE":ParameterDefinitionGT.PREAMP_SUB_TYPE_LIST["CUSTOM"],
         "PREAMP B: CUSTOM SPEAKER SIZE":["5\"","6\"","7\"","8\"","9\"","10\"","11\"","12\"","13\"","14\"","15\""],
         "PREAMP B: CUSTOM SPEAKER NUMBER":["x1","x2","x4","x8"],
         "PREAMP B: CUSTOM SPEAKER CABINET":["OPEN","CLOSE"],
         "EQ: ON/OFF":["OFF","ON"],
         "EQ: LOW CUT":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "EQ: LOW-MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "EQ: LOW-MID Q":["0.5","1","2","4","8","16"],
         "EQ: HI-MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "EQ: HI-MID Q":["0.5","1","2","4","8","16"],
         "EQ: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "FX1: ON/OFF":["OFF","ON"],
         "FX1: TYPE":ParameterDefinitionGT.FX1_TYPE,
         "FX1 T.WAH: MODE":["LPF","BPF"],
         "FX1 T.WAH: POLARITY":["DOWN","UP"],
         "FX1 AUTO WAH: MODE":["LPF","BPF"],
         "FX1 SUB WAH: TYPE":["CRY WAH","VO WAH","FAT WAH","LIGHT WAH","7STRING WAH","RESO WAH"],
         "FX1 ADV.COMP: TYPE":["BOSS COMP","HI-BAND","LIGHT","D-COMP","ORANGE","FAT","MILD","STEREO COMP"],
         "FX1 LIMITER: TYPE":["BOSS LIMITER","RACK 160D","VTG RACK U"],
         "FX1 LIMITER: RATIO":["1:1","1.2:1","1.4:1","1.6:1","1.8:1","2:1","2.3:1","2.6:1","3:1","3.5:1","4:1","5:1","6:1","8:1","10:1","12:1","20:1","INF:1"],
         "FX1 OD/DS: TYPE":ParameterDefinitionGT.FX1_SUB_TYPE_LIST["SUB OD/DS"],
         "FX1 OD/DS: SOLO SW":["OFF","ON"],
         "FX1 PARAMETRIC EQ: LOW CUT":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "FX1 PARAMETRIC EQ: LOW-MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "FX1 PARAMETRIC EQ: LOW-MID Q":["0.5","1","2","4","8","16"],
         "FX1 PARAMETRIC EQ: HI-MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "FX1 PARAMETRIC EQ: HI-MID Q":["0.5","1","2","4","8","16"],
         "FX1 PARAMETRIC EQ: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "FX1 TONE MODIFY: TYPE":["FAT","PRESENCEENCE","MILD","TIGHT","ENHANCE","RESONATOR1","RESONATOR2","RESONATOR3"],
         "FX1 GUITAR SIMULATOR: TYPE":["S->H","H->S","H->HF","S->HOLLOW","H->HOLLOW","S->AC","H->AC","P->AC"],
         "FX1 WAVE SYNTH: WAVE":["SAW","SQUARE"],
         "FX1 OCTAVE: RANGE":["RANGE1","RANGE2","RANGE3","RANGE4"],
         "FX1 PITCH SHIFTER: VOICE":["1-VOICE","2-MONO","2-STEREO"],
         "FX1 PITCH SHIFTER: PS1 MODE":["FAST","MEDIUM","SLOW","MONO"],
         "FX1 PITCH SHIFTER: PS2 MODE":["FAST","MEDIUM","SLOW","MONO"],
         "FX1 HARMONIST: VOICE":["1-VOICE","2-MONO","2-STEREO"],
         "FX1 HARMONIST: HR1 HARMONY":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "FX1 HARMONIST: HR2 HARMONY":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "FX1 SOUND HOLD: HOLD":["OFF","ON"],
         "FX1 ACOUSTIC PROCESSOR: TYPE":["SMALL","MEDIUM","BRIGHT","POWER"],
         "FX1 ACOUSTIC PROCESSOR: MIDDLE FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "FX1 PHASER: TYPE":["4STAGE","8STAGE","12STAGE","BiPHASE"],
         "FX1 FLANGER: LOW CUT":["FLAT","55Hz","110Hz","165Hz","200Hz","280Hz","340Hz","400Hz","500Hz","630Hz","800Hz"],
         "FX1 ROTARY1: SPEED SELECT":["SLOW","FAST"],
         "FX1 PAN: TYPE":["AUTO","MANUAL"],
         "FX1 SLICER: PATTERN":["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12","P13","P14","P15","P16","P17","P18","P19","P20"],
         "FX1 VIBRATO: TRIGGER":["OFF","ON"],
         "FX1 RINGMOD: MODE":["NORMAL","INTELLIGENT"],
         "FX1 HUMANIZER: MODE":["PICKING","AUTO"],
         "FX1 HUMANIZER: VOWEL 1":["a","e","i","o","u"],
         "FX1 HUMANIZER: VOWEL 2":["a","e","i","o","u"],
         "FX1 2X2 CHORUS: CROSSOVER FREQUENCY":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "FX1 HUMANIZER: VOWEL 2":["a","e","i","o","u"],
         "FX1 SUB DELAY: TYPE":["MONO","PAN"],
         "FX1 SUB DELAY: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "FX2: ON/OFF":["OFF","ON"],
         "FX2: TYPE":ParameterDefinitionGT.FX2_TYPE,
         "FX2 T.WAH: MODE":["LPF","BPF"],
         "FX2 T.WAH: POLARITY":["DOWN","UP"],
         "FX2 AUTO WAH: MODE":["LPF","BPF"],
         "FX2 SUB WAH: TYPE":["CRY WAH","VO WAH","FAT WAH","LIGHT WAH","7STRING WAH","RESO WAH"],
         "FX2 ADV.COMP: TYPE":["BOSS COMP","HI-BAND","LIGHT","D-COMP","ORANGE","FAT","MILD","STEREO COMP"],
         "FX2 LIMITER: TYPE":["BOSS LIMITER","RACK 160D","VTG RACK U"],
         "FX2 LIMITER: RATIO":["1:1","1.2:1","1.4:1","1.6:1","1.8:1","2:1","2.3:1","2.6:1","3:1","3.5:1","4:1","5:1","6:1","8:1","10:1","12:1","20:1","INF:1"],
         "FX2 OD/DS: TYPE":ParameterDefinitionGT.FX2_SUB_TYPE_LIST["SUB OD/DS"],
         "FX2 OD/DS: SOLO SW":["OFF","ON"],
         "FX2 PARAMETRIC EQ: LOW CUT":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "FX2 PARAMETRIC EQ: LOW-MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "FX2 PARAMETRIC EQ: LOW-MID Q":["0.5","1","2","4","8","16"],
         "FX2 PARAMETRIC EQ: HI-MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "FX2 PARAMETRIC EQ: HI-MID Q":["0.5","1","2","4","8","16"],
         "FX2 PARAMETRIC EQ: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "FX2 TONE MODIFY: TYPE":["FAT","PRESENCEENCE","MILD","TIGHT","ENHANCE","RESONATOR1","RESONATOR2","RESONATOR3"],
         "FX2 GUITAR SIMULATOR: TYPE":["S->H","H->S","H->HF","S->HOLLOW","H->HOLLOW","S->AC","H->AC","P->AC"],
         "FX2 WAVE SYNTH: WAVE":["SAW","SQUARE"],
         "FX2 OCTAVE: RANGE":["RANGE1","RANGE2","RANGE3","RANGE4"],
         "FX2 PITCH SHIFTER: VOICE":["1-VOICE","2-MONO","2-STEREO"],
         "FX2 PITCH SHIFTER: PS1 MODE":["FAST","MEDIUM","SLOW","MONO"],
         "FX2 PITCH SHIFTER: PS2 MODE":["FAST","MEDIUM","SLOW","MONO"],
         "FX2 HARMONIST: VOICE":["1-VOICE","2-MONO","2-STEREO"],
         "FX2 HARMONIST: HR1 HARMONY":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "FX2 HARMONIST: HR2 HARMONY":["-2oct","-14th","-13th","-12th","-11th","-10th","-9th","-1oct","-7th","-6th","-5th","-4th","-3rd","-2nd","UNISON","+2nd","+3rd","+4th","+5th","+6th","+7th","+1oct","+9th","+10th","+11th","+12th","+13th","+14th","+2oct","USER"],
         "FX2 SOUND HOLD: HOLD":["OFF","ON"],
         "FX2 ACOUSTIC PROCESSOR: TYPE":["SMALL","MEDIUM","BRIGHT","POWER"],
         "FX2 ACOUSTIC PROCESSOR: MIDDLE FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "FX2 PHASER: TYPE":["4STAGE","8STAGE","12STAGE","BiPHASE"],
         "FX2 FLANGER: LOW CUT":["FLAT","55Hz","110Hz","165Hz","200Hz","280Hz","340Hz","400Hz","500Hz","630Hz","800Hz"],
         "FX2 ROTARY1: SPEED SELECT":["SLOW","FAST"],
         "FX2 PAN: TYPE":["AUTO","MANUAL"],
         "FX2 SLICER: PATTERN":["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12","P13","P14","P15","P16","P17","P18","P19","P20"],
         "FX2 VIBRATO: TRIGGER":["OFF","ON"],
         "FX2 RINGMOD: MODE":["NORMAL","INTELLIGENT"],
         "FX2 HUMANIZER: MODE":["PICKING","AUTO"],
         "FX2 HUMANIZER: VOWEL 1":["a","e","i","o","u"],
         "FX2 HUMANIZER: VOWEL 2":["a","e","i","o","u"],
         "FX2 2X2 CHORUS: CROSSOVER FREQUENCY":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "FX2 HUMANIZER: VOWEL 2":["a","e","i","o","u"],
         "FX2 SUB DELAY: TYPE":["MONO","PAN"],
         "FX2 SUB DELAY: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "DELAY: ON/OFF":["OFF","ON"],
         "DELAY: TYPE":ParameterDefinitionGT.DELAY_TYPE,
         "DELAY: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "DELAY D1: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "DELAY D2: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "CHORUS: ON/OFF":["OFF","ON"],
         "CHORUS: MODE":["MONO","STEREO1","STEREO2"],
         "CHORUS: LOW CUT":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "CHORUS: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "REVERB: ON/OFF":["OFF","ON"],
         "REVERB: TYPE":["AMBIENC","ROOM","HALL1","HALL2","PLATE","SPRING","MODULATE"],
         "REVERB: LOW CUT":["FLAT","20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz"],
         "REVERB: HIGH CUT":["630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz","12.5kHz","FLAT"],
         "PEDAL FX: ON/OFF":["OFF","ON"],
         "PEDAL WAH: TYPE":ParameterDefinitionGT.PEDAL_FX_SUB_TYPE_LIST["WAH"],
         "FOOT VOLUME: VOLUME CURVE":["SLOW 1","SLOW 2","NORMAL","FAST"],
         "DIVIDER: MODE":["SINGLE","DUAL"],
         "DIVIDER: CHANNEL SELECT":["Ch A","Ch B"],
         "DIVIDER: ChA DYNAMIC":["OFF","POLAR +","POLAR -"],
         "DIVIDER: ChA FILTER":["OFF","LPF","HPF"],
         "DIVIDER: ChA CUTOFF":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "DIVIDER: ChB DYNAMIC":["OFF","POLAR +","POLAR -"],
         "DIVIDER: ChB FILTER":["OFF","LPF","HPF"],
         "DIVIDER: ChB CUTOFF":["100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz"],
         "MIXER: MODE":["STEREO","PAN L/R"],
         "SEND/RETURN: ON/OFF":["OFF","ON"],
         "SEND/RETURN: MODE":["NORMAL","DIRECT MIX","BRANCH OUT"],
         "AMP CONTROL: AMP CONTROL SW":["OFF","ON"],
         "NS1: ON/OFF":["OFF","ON"],
         "NS1: DETECT":["INPUT","NS INPUT","FV OUT"],
         "NS2: ON/OFF":["OFF","ON"],
         "NS2: DETECT":["INPUT","NS INPUT","FV OUT"],
         "ACCEL: ON/OFF":["OFF","ON"],
         "ACCEL: TYPE":ParameterDefinitionGT.ACCEL_FX_TYPE,
         "ACCEL S-BEND: PITCH":["-3oct","-2oct","-1oct","+1oct","+2oct","+3oct","+4oct"],
         "ACCEL FEEDBACKER: MODE":ParameterDefinitionGT.ACCEL_FX_SUB_TYPE_LIST["FEEDBACKER"],
         "MASTER: MASTER MID FREQUENCY":["20.0Hz","25.0Hz","31.5Hz","40.0Hz","50.0Hz","63.0Hz","80.0Hz","100Hz","125Hz","160Hz","200Hz","250Hz","315Hz","400Hz","500Hz","630Hz","800Hz","1.00kHz","1.25kHz","1.60kHz","2.00kHz","2.50kHz","3.15kHz","4.00kHz","5.00kHz","6.30kHz","8.00kHz","10.0kHz"],
         "MASTER: MASTER MID Q":["0.5","1","2","4","8","16"],
         "BPM/KEY: MASTER KEY":["C(Am)","Db(Bbm)","D(Bm)","Eb(Cm)","E(C#m)","F(Dm)","F#(D#m)","G(Em)","Ab(Fm)","A(F#m)","Bb(Gm)","B(G#m)"],
         "TUNER: TUNER SW":["OFF","ON"],
         "MANUAL: MANUAL MODE SW":["OFF","ON"],
         "PHRASE LOOP: ON/OFF":["OFF","ON"],
         "PHRASE LOOP: REC/PLAY":["OFF","ON"],
         "PHRASE LOOP: STOP/PLAY":["OFF","ON"],
         "PHRASE LOOP: CLEAR":["OFF","ON"],
         "TAP: BPM TAP":["OFF","ON"],
         "TAP: DELAY TAP":["OFF","ON"],
         "MIDI: START/STOP":["OFF","ON"],
         "MIDI: MMC PLAY/STOP":["OFF","ON"],
         "PATCH: LEVEL +10":["OFF","ON"],
         "PATCH: LEVEL +20":["OFF","ON"],
         "PATCH: LEVEL -10":["OFF","ON"],
         "PATCH: LEVEL -20":["OFF","ON"],
         "PATCH: NUMBER INC":["OFF","ON"],
         "PATCH: NUMBER DEC":["OFF","ON"],
         "PATCH: BANK INC":["OFF","ON"],
         "PATCH: BANK DEC":["OFF","ON"],
         "PATCH: FAVORITE INC":["OFF","ON"],
         "PATCH: FAVORITE DEC":["OFF","ON"],
         "FX1 ROTARY2: SPEED SELECT":["SLOW","FAST"],
         "FX2 ROTARY2: SPEED SELECT":["SLOW","FAST"],
         "FX2 TERAECHO: MODE":["MONO","STEREO1","STEREO2"],
         "FX2 TERAECHO: HOLD":["OFF","ON"]
      };
      
      public static const STEPPER_AND_DROPDOWN_LIST:Object = {
         "FX1 AUTO WAH: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 PITCH SHIFTER: PS1 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX1 PITCH SHIFTER: PS2 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX1 HARMONIST: HR1 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX1 HARMONIST: HR2 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX1 PHASER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 PHASER: STEP RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":1,
            "dropdown":ParameterDefinitionGT.STEP_RATE_DROPDOWN_LIST
         },
         "FX1 FLANGER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 TREMOLO: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 ROTARY1: RATE SLOW":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 ROTARY1: RATE FAST":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 ROTARY2: RATE SLOW":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 ROTARY2: RATE FAST":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 UNIV: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 PAN: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 SLICER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 VIBRATO: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 HUMANIZER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 2X2 CHORUS: LOW RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 2X2 CHORUS: HIGH RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX1 SUB DELAY: DELAY TIME":{
            "min":1,
            "max":1000,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.DELAY_TIME_DROPDOWN_LIST
         },
         "FX2 AUTO WAH: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 PITCH SHIFTER: PS1 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX2 PITCH SHIFTER: PS2 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX2 HARMONIST: HR1 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX2 HARMONIST: HR2 PRE DELAY":{
            "min":0,
            "max":300,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.PRE_DELAY_DROPDOWN_LIST
         },
         "FX2 PHASER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 PHASER: STEP RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":1,
            "dropdown":ParameterDefinitionGT.STEP_RATE_DROPDOWN_LIST
         },
         "FX2 FLANGER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 TREMOLO: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 ROTARY1: RATE SLOW":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 ROTARY1: RATE FAST":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 ROTARY2: RATE SLOW":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 ROTARY2: RATE FAST":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 UNIV: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 PAN: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 SLICER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 VIBRATO: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 HUMANIZER: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 2X2 CHORUS: LOW RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 2X2 CHORUS: HIGH RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "FX2 SUB DELAY: DELAY TIME":{
            "min":1,
            "max":1000,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.DELAY_TIME_DROPDOWN_LIST
         },
         "DELAY: DELAY TIME":{
            "min":1,
            "max":2000,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.DELAY_DELAY_TIME_DROPDOWN_LIST
         },
         "DELAY D1: TIME":{
            "min":1,
            "max":1000,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.DELAY_TIME_DROPDOWN_LIST
         },
         "DELAY D2: TIME":{
            "min":1,
            "max":1000,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.DELAY_TIME_DROPDOWN_LIST
         },
         "CHORUS: RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         },
         "WAVE RATE":{
            "min":0,
            "max":100,
            "step":1,
            "stepperIndex":0,
            "dropdown":ParameterDefinitionGT.RATE_DROPDOWN_LIST
         }
      };
      
      public static const ASSIGN_PARAMETER_LIST:Array = [{"name":"TARGET MIN"},{"name":"TARGET MAX"},{
         "name":"ACT RANGE LO",
         "min":0,
         "max":126,
         "step":1
      },{
         "name":"ACT RANGE HI",
         "min":1,
         "max":127,
         "step":1
      },{
         "name":"WAVE RATE",
         "min":0,
         "max":113,
         "step":1
      },{
         "name":"WAVE-FORM",
         "min":0,
         "max":1,
         "step":1
      },{
         "name":"INT PDL TRIGGER",
         "min":0,
         "max":72,
         "step":1
      },{
         "name":"INT PDL TIME",
         "min":0,
         "max":100,
         "step":1
      },{
         "name":"INT PDL CURVE",
         "min":0,
         "max":2,
         "step":1
      }];
      
      public function CTLAssignTargetDefinitionGT()
      {
         super();
      }
   }
}

