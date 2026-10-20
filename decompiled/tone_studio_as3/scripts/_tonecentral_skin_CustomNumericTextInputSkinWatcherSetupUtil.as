package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import tonecentral.skin.CustomNumericTextInputSkin;
   
   public class _tonecentral_skin_CustomNumericTextInputSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_skin_CustomNumericTextInputSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CustomNumericTextInputSkin.watcherSetupUtil = new _tonecentral_skin_CustomNumericTextInputSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[0]],propertyGetter);
         watchers[1] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["image"];
         },null,[bindings[0]],null,true);
         watchers[0].updateParent(target);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
      }
   }
}

