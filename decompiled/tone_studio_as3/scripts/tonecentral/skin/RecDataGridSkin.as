package tonecentral.skin
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.DataGrid;
   import spark.components.Grid;
   import spark.components.GridColumnHeaderGroup;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridLayer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   import spark.skins.spark.DefaultGridItemRenderer;
   
   use namespace mx_internal;
   
   public class RecDataGridSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1482148164columnHeaderGroup:GridColumnHeaderGroup;
      
      private var _1555036382editorIndicator:ClassFactory;
      
      private var _3181382grid:Grid;
      
      private var _1027582576headerRenderer:ClassFactory;
      
      private var _1683467992headerSeparator:Line;
      
      private var _1933789133hoverIndicator:ClassFactory;
      
      private var _1763950123rowSeparator:ClassFactory;
      
      private var _402164678scroller:Scroller;
      
      private var _627206627selectionIndicator:ClassFactory;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DataGrid;
      
      public function RecDataGridSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._RecDataGridSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_skin_RecDataGridSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RecDataGridSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 89;
         this.minHeight = 84;
         this.mxmlContent = [this._RecDataGridSkin_VGroup1_c(),this._RecDataGridSkin_Rect2_c()];
         this.currentState = "normal";
         this._RecDataGridSkin_ClassFactory5_i();
         this._RecDataGridSkin_ClassFactory1_i();
         this._RecDataGridSkin_ClassFactory2_i();
         this._RecDataGridSkin_ClassFactory3_i();
         this._RecDataGridSkin_ClassFactory4_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RecDataGridSkin._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _RecDataGridSkin_ClassFactory5_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridSkinInnerClass4;
         _loc1_.properties = {"outerDocument":this};
         this.editorIndicator = _loc1_;
         BindingManager.executeBindings(this,"editorIndicator",this.editorIndicator);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.headerRenderer = _loc1_;
         BindingManager.executeBindings(this,"headerRenderer",this.headerRenderer);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_ClassFactory2_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridSkinInnerClass1;
         _loc1_.properties = {"outerDocument":this};
         this.hoverIndicator = _loc1_;
         BindingManager.executeBindings(this,"hoverIndicator",this.hoverIndicator);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_ClassFactory3_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridSkinInnerClass2;
         _loc1_.properties = {"outerDocument":this};
         this.rowSeparator = _loc1_;
         BindingManager.executeBindings(this,"rowSeparator",this.rowSeparator);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_ClassFactory4_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridSkinInnerClass3;
         _loc1_.properties = {"outerDocument":this};
         this.selectionIndicator = _loc1_;
         BindingManager.executeBindings(this,"selectionIndicator",this.selectionIndicator);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "justify";
         _loc1_.gap = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._RecDataGridSkin_GridColumnHeaderGroup1_i(),this._RecDataGridSkin_Group1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_GridColumnHeaderGroup1_i() : GridColumnHeaderGroup
      {
         var _loc1_:GridColumnHeaderGroup = new GridColumnHeaderGroup();
         _loc1_.minHeight = 21;
         _loc1_.setStyle("paddingLeft",1);
         _loc1_.setStyle("paddingTop",1);
         _loc1_.setStyle("paddingRight",1);
         _loc1_.id = "columnHeaderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.columnHeaderGroup = _loc1_;
         BindingManager.executeBindings(this,"columnHeaderGroup",this.columnHeaderGroup);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._RecDataGridSkin_Rect1_i(),this._RecDataGridSkin_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._RecDataGridSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "justify";
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.gap = -1;
         _loc1_.mxmlContent = [this._RecDataGridSkin_Line1_i(),this._RecDataGridSkin_Scroller1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.stroke = this._RecDataGridSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"headerSeparator");
         this.headerSeparator = _loc1_;
         BindingManager.executeBindings(this,"headerSeparator",this.headerSeparator);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3355443;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _RecDataGridSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.minViewportInset = 1;
         _loc1_.hasFocusableChildren = false;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._RecDataGridSkin_Grid1_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_Grid1_i() : Grid
      {
         var _loc1_:Grid = new Grid();
         _loc1_.itemRenderer = this._RecDataGridSkin_ClassFactory6_c();
         _loc1_.mxmlContent = [this._RecDataGridSkin_GridLayer1_c(),this._RecDataGridSkin_GridLayer2_c(),this._RecDataGridSkin_GridLayer3_c(),this._RecDataGridSkin_GridLayer4_c(),this._RecDataGridSkin_GridLayer5_c()];
         _loc1_.id = "grid";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.grid = _loc1_;
         BindingManager.executeBindings(this,"grid",this.grid);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_ClassFactory6_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultGridItemRenderer;
         return _loc1_;
      }
      
      private function _RecDataGridSkin_GridLayer1_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "backgroundLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_GridLayer2_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "selectionLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_GridLayer3_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "editorIndicatorLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_GridLayer4_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "rendererLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_GridLayer5_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "overlayLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGridSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._RecDataGridSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RecDataGridSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _RecDataGridSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"columnHeaderGroup.headerRenderer","headerRenderer");
         result[1] = new Binding(this,function():Number
         {
            return hostComponent.width;
         },null,"grid.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnHeaderGroup() : GridColumnHeaderGroup
      {
         return this._1482148164columnHeaderGroup;
      }
      
      public function set columnHeaderGroup(param1:GridColumnHeaderGroup) : void
      {
         var _loc2_:Object = this._1482148164columnHeaderGroup;
         if(_loc2_ !== param1)
         {
            this._1482148164columnHeaderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnHeaderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editorIndicator() : ClassFactory
      {
         return this._1555036382editorIndicator;
      }
      
      public function set editorIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1555036382editorIndicator;
         if(_loc2_ !== param1)
         {
            this._1555036382editorIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editorIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get grid() : Grid
      {
         return this._3181382grid;
      }
      
      public function set grid(param1:Grid) : void
      {
         var _loc2_:Object = this._3181382grid;
         if(_loc2_ !== param1)
         {
            this._3181382grid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"grid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerRenderer() : ClassFactory
      {
         return this._1027582576headerRenderer;
      }
      
      public function set headerRenderer(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1027582576headerRenderer;
         if(_loc2_ !== param1)
         {
            this._1027582576headerRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerSeparator() : Line
      {
         return this._1683467992headerSeparator;
      }
      
      public function set headerSeparator(param1:Line) : void
      {
         var _loc2_:Object = this._1683467992headerSeparator;
         if(_loc2_ !== param1)
         {
            this._1683467992headerSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hoverIndicator() : ClassFactory
      {
         return this._1933789133hoverIndicator;
      }
      
      public function set hoverIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1933789133hoverIndicator;
         if(_loc2_ !== param1)
         {
            this._1933789133hoverIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoverIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowSeparator() : ClassFactory
      {
         return this._1763950123rowSeparator;
      }
      
      public function set rowSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1763950123rowSeparator;
         if(_loc2_ !== param1)
         {
            this._1763950123rowSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionIndicator() : ClassFactory
      {
         return this._627206627selectionIndicator;
      }
      
      public function set selectionIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._627206627selectionIndicator;
         if(_loc2_ !== param1)
         {
            this._627206627selectionIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DataGrid
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DataGrid) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

