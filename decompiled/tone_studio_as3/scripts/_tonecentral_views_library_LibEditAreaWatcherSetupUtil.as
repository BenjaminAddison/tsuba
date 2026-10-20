package
{
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import mx.resources.ResourceManager;
   import tonecentral.views.library.LibEditArea;
   
   public class _tonecentral_views_library_LibEditAreaWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _tonecentral_views_library_LibEditAreaWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LibEditArea.watcherSetupUtil = new _tonecentral_views_library_LibEditAreaWatcherSetupUtil();
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
         },null,[bindings[8]],null);
         watchers[10] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","editLiveset.livesetName.noteLabelStyle"];
         },{"change":true},[bindings[8]],null);
         watchers[7] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[6]],null);
         watchers[8] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","editLiveset.uploadImage.noteLabel"];
         },{"change":true},[bindings[6]],null);
         watchers[11] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[9]],null);
         watchers[12] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","editLiveset.uploadImage.dragLabel"];
         },{"change":true},[bindings[9]],null);
         watchers[5] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[5]],null);
         watchers[6] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","editLiveset.livesetName.noteLabelStyle"];
         },{"change":true},[bindings[5]],null);
         watchers[3] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[2]],null);
         watchers[4] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","editLiveset.presetImage.noteLabel"];
         },{"change":true},[bindings[2]],null);
         watchers[0] = new PropertyWatcher("width",{"widthChanged":true},[bindings[0],bindings[3],bindings[4],bindings[7]],propertyGetter);
         watchers[1] = new FunctionReturnWatcher("getInstance",target,function():Array
         {
            return [];
         },null,[bindings[1]],null);
         watchers[2] = new FunctionReturnWatcher("getString",target,function():Array
         {
            return ["resource","editLiveset.livesetName.noteLabelStyle"];
         },{"change":true},[bindings[1]],null);
         watchers[9].updateParent(ResourceManager);
         watchers[10].parentWatcher = watchers[9];
         watchers[9].addChild(watchers[10]);
         watchers[7].updateParent(ResourceManager);
         watchers[8].parentWatcher = watchers[7];
         watchers[7].addChild(watchers[8]);
         watchers[11].updateParent(ResourceManager);
         watchers[12].parentWatcher = watchers[11];
         watchers[11].addChild(watchers[12]);
         watchers[5].updateParent(ResourceManager);
         watchers[6].parentWatcher = watchers[5];
         watchers[5].addChild(watchers[6]);
         watchers[3].updateParent(ResourceManager);
         watchers[4].parentWatcher = watchers[3];
         watchers[3].addChild(watchers[4]);
         watchers[0].updateParent(target);
         watchers[1].updateParent(ResourceManager);
         watchers[2].parentWatcher = watchers[1];
         watchers[1].addChild(watchers[2]);
      }
   }
}

