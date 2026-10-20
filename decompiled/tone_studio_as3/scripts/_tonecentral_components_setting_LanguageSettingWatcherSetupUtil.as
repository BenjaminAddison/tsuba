package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.resources.ResourceManager;
   import tonecentral.components.setting.LanguageSetting;
   
   public class _tonecentral_components_setting_LanguageSettingWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_components_setting_LanguageSettingWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LanguageSetting.watcherSetupUtil = new _tonecentral_components_setting_LanguageSettingWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[0]],null);
         watchers[1] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","setting.dropdown.style"];
         },{"change":true},[bindings[0]],null);
         watchers[0].updateParent(ResourceManager);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
      }
   }
}

