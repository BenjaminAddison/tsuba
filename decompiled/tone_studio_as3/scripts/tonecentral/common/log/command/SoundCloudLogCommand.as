package tonecentral.common.log.command
{
   import flash.events.IEventDispatcher;
   import tonecentral.common.define.URLDefinition;
   
   public class SoundCloudLogCommand extends AbstractCommand
   {
      
      public function SoundCloudLogCommand(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      override protected function get url() : String
      {
         return URLDefinition.API_DOMAIN + URLDefinition.API_SOUND_CLOUD_LOGS;
      }
   }
}

