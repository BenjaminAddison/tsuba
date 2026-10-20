package jp.co.site4d.events
{
   import flash.events.Event;
   
   public class NetEvent extends Event
   {
      
      public static const COMPLETE:String = "complete";
      
      public static const PROGRESS:String = "progress";
      
      public static const IO_ERROR:String = "ioError";
      
      public static const SECURITY_ERROR:String = "securityError";
      
      public function NetEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

