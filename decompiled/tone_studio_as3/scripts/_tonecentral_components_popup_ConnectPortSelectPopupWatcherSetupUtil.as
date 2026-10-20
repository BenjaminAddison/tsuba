package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.resources.ResourceManager;
   import tonecentral.components.popup.ConnectPortSelectPopup;
   
   public class _tonecentral_components_popup_ConnectPortSelectPopupWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_components_popup_ConnectPortSelectPopupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ConnectPortSelectPopup.watcherSetupUtil = new _tonecentral_components_popup_ConnectPortSelectPopupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[2] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[1]],null);
         watchers[3] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","dialog.msg.style"];
         },{"change":true},[bindings[1]],null);
         watchers[0] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[0]],null);
         watchers[1] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","dialog.connectPortMsg"];
         },{"change":true},[bindings[0]],null);
         watchers[2].updateParent(ResourceManager);
         watchers[3].parentWatcher = watchers[2];
         watchers[2].addChild(watchers[3]);
         watchers[0].updateParent(ResourceManager);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
      }
   }
}

