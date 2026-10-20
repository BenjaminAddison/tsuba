package tonecentral.events
{
   import flash.events.Event;
   
   public class EditorEvent extends Event
   {
      
      public static const PARAM_CHANGE:String = "paramChange";
      
      public static const EFFECT_SW_CHANGE:String = "effectSwChange";
      
      public static const EFFECT_TYPE_CHANGE:String = "effectTypeChange";
      
      public static const SUB_TYPE_CHANGE:String = "subTypeChange";
      
      public static const CTL_FUNC_CHANGE:String = "ctlFuncChange";
      
      public static const CTL_PARAM_CHANGE:String = "ctlParamChange";
      
      public static const CTL_ASSIGN_ON_OFF_CHANGE:String = "ctlAssignOnOffChange";
      
      public static const CTL_ASSIGN_SRC_CHANGE:String = "ctlAssignSrcChange";
      
      public static const CTL_ASSIGN_SRC_MODE_CHANGE:String = "ctlAssignSrcModeChange";
      
      public static const CTL_ASSIGN_TARGET_CATEGORY_CHANGE:String = "ctlAssignTargetCategoryChange";
      
      public static const CTL_ASSIGN_TARGET_CHANGE:String = "ctlAssignTargetChange";
      
      public static const CTL_ASSIGN_PARAMS_CHANGE:String = "ctlAssignParamsChange";
      
      public static const CTL_PEDAL_FUNC_CHANGE:String = "ctlPedalFuncChange";
      
      public var data:Object;
      
      public function EditorEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

