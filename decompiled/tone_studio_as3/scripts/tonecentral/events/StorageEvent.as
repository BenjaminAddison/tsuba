package tonecentral.events
{
   import flash.events.Event;
   
   public class StorageEvent extends Event
   {
      
      public static const INSERT_RESULT:String = "insertResult";
      
      public static const SELECT_RESULT:String = "selectResult";
      
      public var data:*;
      
      public var lastInsertRowID:Number;
      
      public function StorageEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

