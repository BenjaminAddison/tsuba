package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import mx.resources.ResourceManager;
   import tonecentral.views.tccontents.LoadFaultModalArea;
   
   public class _tonecentral_views_tccontents_LoadFaultModalAreaWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_views_tccontents_LoadFaultModalAreaWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LoadFaultModalArea.watcherSetupUtil = new _tonecentral_views_tccontents_LoadFaultModalAreaWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[9] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[4]],null);
         watchers[10] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","modal.loadfault.tc.subMsgStyle"];
         },{"change":true},[bindings[4]],null);
         watchers[4] = new PropertyWatcher("message",{"propertyChange":true},[bindings[2]],propertyGetter);
         watchers[5] = new PropertyWatcher("height",{"heightChanged":true},[bindings[2]],null);
         watchers[6] = new PropertyWatcher("y",{"yChanged":true},[bindings[2]],null);
         watchers[7] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[3]],null);
         watchers[8] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","modal.loadfault.tc.subMsg"];
         },{"change":true},[bindings[3]],null);
         watchers[14] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[6]],null);
         watchers[15] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","modal.loadfault.tc.buttonStyle"];
         },{"change":true},[bindings[6]],null);
         watchers[11] = new PropertyWatcher("subMessage",{"propertyChange":true},[bindings[5]],propertyGetter);
         watchers[12] = new PropertyWatcher("height",{"heightChanged":true},[bindings[5]],null);
         watchers[13] = new PropertyWatcher("y",{"yChanged":true},[bindings[5]],null);
         watchers[16] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[7]],null);
         watchers[17] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","modal.loadfault.tc.buttonLabel"];
         },{"change":true},[bindings[7]],null);
         watchers[2] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[1]],null);
         watchers[3] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","modal.loadfault.tc.msgStyle"];
         },{"change":true},[bindings[1]],null);
         watchers[0] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[0]],null);
         watchers[1] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","modal.loadfault.tc.msg"];
         },{"change":true},[bindings[0]],null);
         watchers[9].updateParent(ResourceManager);
         watchers[10].parentWatcher = watchers[9];
         watchers[9].addChild(watchers[10]);
         watchers[4].updateParent(target);
         watchers[4].addChild(watchers[5]);
         watchers[4].addChild(watchers[6]);
         watchers[7].updateParent(ResourceManager);
         watchers[8].parentWatcher = watchers[7];
         watchers[7].addChild(watchers[8]);
         watchers[14].updateParent(ResourceManager);
         watchers[15].parentWatcher = watchers[14];
         watchers[14].addChild(watchers[15]);
         watchers[11].updateParent(target);
         watchers[11].addChild(watchers[12]);
         watchers[11].addChild(watchers[13]);
         watchers[16].updateParent(ResourceManager);
         watchers[17].parentWatcher = watchers[16];
         watchers[16].addChild(watchers[17]);
         watchers[2].updateParent(ResourceManager);
         watchers[3].parentWatcher = watchers[2];
         watchers[2].addChild(watchers[3]);
         watchers[0].updateParent(ResourceManager);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
      }
   }
}

