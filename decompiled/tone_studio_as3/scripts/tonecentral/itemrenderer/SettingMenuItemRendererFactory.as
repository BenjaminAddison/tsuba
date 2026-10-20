package tonecentral.itemrenderer
{
   import mx.core.IFactory;
   
   public class SettingMenuItemRendererFactory implements IFactory
   {
      
      public function SettingMenuItemRendererFactory()
      {
         super();
      }
      
      public function newInstance() : *
      {
         return new SettingMenuItemRenderer();
      }
   }
}

