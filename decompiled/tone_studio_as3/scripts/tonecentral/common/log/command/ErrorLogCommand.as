package tonecentral.common.log.command
{
   import flash.events.IEventDispatcher;
   import tonecentral.common.define.URLDefinition;
   
   public class ErrorLogCommand extends AbstractCommand
   {
      
      public function ErrorLogCommand(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      override protected function get url() : String
      {
         return URLDefinition.API_DOMAIN + URLDefinition.API_ERROR_LOGS;
      }
   }
}

