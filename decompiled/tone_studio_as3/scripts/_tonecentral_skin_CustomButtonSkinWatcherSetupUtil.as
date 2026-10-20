package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import tonecentral.skin.CustomButtonSkin;
   
   public class _tonecentral_skin_CustomButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_skin_CustomButtonSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CustomButtonSkin.watcherSetupUtil = new _tonecentral_skin_CustomButtonSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[0],bindings[1]],propertyGetter);
         watchers[1] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["image"];
         },null,[bindings[0]],null,true);
         watchers[2] = new PropertyWatcher("label",{"contentChange":true},[bindings[1]],null);
         watchers[0].updateParent(target);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
         watchers[0].addChild(watchers[2]);
      }
   }
}

