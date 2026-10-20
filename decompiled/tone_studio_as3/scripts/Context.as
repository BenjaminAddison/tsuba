package
{
   import tonecentral.common.manager.DialogManager;
   
   public class Context
   {
      
      private static var _dialogMng:DialogManager;
      
      public static var isInit:Boolean = false;
      
      public function Context()
      {
         super();
      }
      
      public static function init() : void
      {
         _dialogMng = new DialogManager();
         isInit = true;
      }
      
      public static function get dialogMng() : DialogManager
      {
         return _dialogMng;
      }
   }
}

