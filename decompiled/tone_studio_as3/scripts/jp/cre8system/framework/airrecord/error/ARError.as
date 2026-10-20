package jp.cre8system.framework.airrecord.error
{
   public class ARError extends Error
   {
      
      public static const SINGLETON_INSTANCE_ERROR:String = "Singleton instance error.";
      
      public function ARError(param1:String = "", param2:int = 0)
      {
         super(param1,param2);
      }
   }
}

