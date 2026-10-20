package jp.co.site4d.events
{
   import flash.events.Event;
   
   public class ComponentEvent extends Event
   {
      
      public static const STYLE_CHANGE:String = "styleChange";
      
      public function ComponentEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

