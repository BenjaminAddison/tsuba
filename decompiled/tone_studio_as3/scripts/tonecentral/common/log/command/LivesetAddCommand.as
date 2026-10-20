package tonecentral.common.log.command
{
   import flash.events.IEventDispatcher;
   import tonecentral.common.define.URLDefinition;
   
   public class LivesetAddCommand extends AbstractCommand
   {
      
      public function LivesetAddCommand(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      override protected function get url() : String
      {
         return URLDefinition.API_DOMAIN + URLDefinition.API_LIVESET_ADD_LOGS;
      }
   }
}

