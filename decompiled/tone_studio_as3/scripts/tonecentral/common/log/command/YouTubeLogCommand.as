package tonecentral.common.log.command
{
   import flash.events.IEventDispatcher;
   import tonecentral.common.define.URLDefinition;
   
   public class YouTubeLogCommand extends AbstractCommand
   {
      
      public function YouTubeLogCommand(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      override protected function get url() : String
      {
         return URLDefinition.API_DOMAIN + URLDefinition.API_YOUTUBE_LOGS;
      }
   }
}

