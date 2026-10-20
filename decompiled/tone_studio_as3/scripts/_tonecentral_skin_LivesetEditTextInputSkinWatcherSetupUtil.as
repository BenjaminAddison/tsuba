package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import tonecentral.skin.LivesetEditTextInputSkin;
   
   public class _tonecentral_skin_LivesetEditTextInputSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_skin_LivesetEditTextInputSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LivesetEditTextInputSkin.watcherSetupUtil = new _tonecentral_skin_LivesetEditTextInputSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[0],bindings[1]],propertyGetter);
         watchers[2] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["labelStyle"];
         },null,[bindings[1]],null,true);
         watchers[1] = new PropertyWatcher("height",{"heightChanged":true},[bindings[0]],null);
         watchers[0].updateParent(target);
         watchers[2].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[2]);
         watchers[0].addChild(watchers[1]);
      }
   }
}

