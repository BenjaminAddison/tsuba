package tonecentral.events
{
   import flash.events.Event;
   
   public class ViewStatusEvent extends Event
   {
      
      public static const VIEW_STATUS_CHANGE:String = "viewStatusChange";
      
      public static const EDIT_DETAIL_STATE_CHANGE:String = "editDetailStateChange";
      
      public static const EFFECT_CATEGORY_CHANGE:String = "effectCategoryChange";
      
      public static const PAGE_CHANGE:String = "pageChange";
      
      public var data:Object;
      
      public var state:String;
      
      public var page:int;
      
      public function ViewStatusEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

