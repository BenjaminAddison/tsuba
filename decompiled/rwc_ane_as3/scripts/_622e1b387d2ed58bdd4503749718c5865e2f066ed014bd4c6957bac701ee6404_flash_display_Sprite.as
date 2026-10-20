package
{
   import flash.display.Sprite;
   import flash.system.Security;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   [ExcludeClass]
   public class _622e1b387d2ed58bdd4503749718c5865e2f066ed014bd4c6957bac701ee6404_flash_display_Sprite extends Sprite
   {
      
      public function _622e1b387d2ed58bdd4503749718c5865e2f066ed014bd4c6957bac701ee6404_flash_display_Sprite()
      {
         super();
      }
      
      public function allowDomainInRSL(... rest) : void
      {
         Security.allowDomain.apply(null,rest);
      }
      
      public function allowInsecureDomainInRSL(... rest) : void
      {
         Security.allowInsecureDomain.apply(null,rest);
      }
   }
}

