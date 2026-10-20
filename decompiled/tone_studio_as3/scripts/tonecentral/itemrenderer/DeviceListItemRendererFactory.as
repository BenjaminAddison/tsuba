package tonecentral.itemrenderer
{
   import mx.core.IFactory;
   
   public class DeviceListItemRendererFactory implements IFactory
   {
      
      public function DeviceListItemRendererFactory()
      {
         super();
      }
      
      public function newInstance() : *
      {
         return new DeviceListItemRenderer();
      }
   }
}

