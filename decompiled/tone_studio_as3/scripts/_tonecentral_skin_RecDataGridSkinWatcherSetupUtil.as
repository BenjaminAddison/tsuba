package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import tonecentral.skin.RecDataGridSkin;
   
   public class _tonecentral_skin_RecDataGridSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_skin_RecDataGridSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RecDataGridSkin.watcherSetupUtil = new _tonecentral_skin_RecDataGridSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("headerRenderer",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}

