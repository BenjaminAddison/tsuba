package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import tonecentral.views.edit.detail.ParameterDetails;
   
   public class _tonecentral_views_edit_detail_ParameterDetailsWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_views_edit_detail_ParameterDetailsWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ParameterDetails.watcherSetupUtil = new _tonecentral_views_edit_detail_ParameterDetailsWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("editArea",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("x",{"xChanged":true},[param4[0],param4[1]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

