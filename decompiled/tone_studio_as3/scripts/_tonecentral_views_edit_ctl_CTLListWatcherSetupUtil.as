package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import tonecentral.views.edit.ctl.CTLList;
   
   public class _tonecentral_views_edit_ctl_CTLListWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_views_edit_ctl_CTLListWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CTLList.watcherSetupUtil = new _tonecentral_views_edit_ctl_CTLListWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("ctlList",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

