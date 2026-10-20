package tonecentral.itemrenderer
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
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.IVisualElement;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.DataGrid;
   import spark.components.GridColumnHeaderGroup;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridItemRenderer;
   import spark.components.gridClasses.IGridVisualElement;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.supportClasses.GraphicElement;
   
   public class RecGridHeaderRenderer extends GridItemRenderer implements IStateClient2
   {
      
      private static const DEFAULT_COLOR_VALUE:uint = 204;
      
      private static const DEFAULT_COLOR:uint = 13421772;
      
      private static const DEFAULT_SYMBOL_COLOR:uint = 0;
      
      private static var colorTransform:ColorTransform = new ColorTransform();
      
      private var _1354916807_RecGridHeaderRenderer_GradientEntry1:GradientEntry;
      
      private var _1354916808_RecGridHeaderRenderer_GradientEntry2:GradientEntry;
      
      private var _1354916809_RecGridHeaderRenderer_GradientEntry3:GradientEntry;
      
      private var _1354916810_RecGridHeaderRenderer_GradientEntry4:GradientEntry;
      
      private var _783637168defaultSortIndicator:ClassFactory;
      
      private var _3143043fill:Rect;
      
      private var _175381489labelDisplayGroup:Group;
      
      private var _903579360shadow:Rect;
      
      private var _668643602sortIndicatorGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _maxDisplayedLines:int = 1;
      
      private var _sortIndicator:IFactory;
      
      private var sortIndicatorInstance:IVisualElement;
      
      private var chromeColorChanged:Boolean = false;
      
      private var colorized:Boolean = false;
      
      public function RecGridHeaderRenderer()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.height = 30;
         this.mxmlContent = [this._RecGridHeaderRenderer_Rect1_i(),this._RecGridHeaderRenderer_Rect2_i(),this._RecGridHeaderRenderer_Line1_c(),this._RecGridHeaderRenderer_Line2_c(),this._RecGridHeaderRenderer_Line3_c(),this._RecGridHeaderRenderer_Group1_i(),this._RecGridHeaderRenderer_Group2_i()];
         this.currentState = "normal";
         this._RecGridHeaderRenderer_ClassFactory1_i();
         this._RecGridHeaderRenderer_Label1_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry3",
               "name":"color",
               "value":6710886
            }),new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry4",
               "name":"color",
               "value":4473924
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry1",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry1",
               "name":"alpha",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry2",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry2",
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry3",
               "name":"color",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_RecGridHeaderRenderer_GradientEntry4",
               "name":"color",
               "value":0
            })]
         })];
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
      
      private function dispatchChangeEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      [Bindable("maxDisplayedLinesChanged")]
      public function get maxDisplayedLines() : int
      {
         return this._maxDisplayedLines;
      }
      
      public function set maxDisplayedLines(param1:int) : void
      {
         if(param1 == this._maxDisplayedLines)
         {
            return;
         }
         this._maxDisplayedLines = param1;
         if(labelDisplay)
         {
            labelDisplay.maxDisplayedLines = param1;
         }
         invalidateSize();
         invalidateDisplayList();
         this.dispatchChangeEvent("maxDisplayedLinesChanged");
      }
      
      [Bindable("sortIndicatorChanged")]
      public function get sortIndicator() : IFactory
      {
         return this._sortIndicator ? this._sortIndicator : this.defaultSortIndicator;
      }
      
      public function set sortIndicator(param1:IFactory) : void
      {
         if(this._sortIndicator == param1)
         {
            return;
         }
         this._sortIndicator = param1;
         if(this.sortIndicatorInstance)
         {
            this.sortIndicatorGroup.includeInLayout = false;
            this.sortIndicatorGroup.removeElement(this.sortIndicatorInstance);
            this.sortIndicatorInstance = null;
         }
         invalidateDisplayList();
         this.dispatchChangeEvent("sortIndicatorChanged");
      }
      
      override public function prepare(param1:Boolean) : void
      {
         var _loc3_:DataGrid = null;
         var _loc4_:GridColumnHeaderGroup = null;
         var _loc5_:IGridVisualElement = null;
         super.prepare(param1);
         if(Boolean(labelDisplay) && Boolean(this.labelDisplayGroup) && labelDisplay.parent != this.labelDisplayGroup)
         {
            this.labelDisplayGroup.removeAllElements();
            this.labelDisplayGroup.addElement(labelDisplay);
         }
         var _loc2_:GridColumn = this.column;
         if(Boolean(this.sortIndicator && _loc2_ && _loc2_.grid) && Boolean(_loc2_.grid.dataGrid) && Boolean(_loc2_.grid.dataGrid.columnHeaderGroup))
         {
            _loc3_ = _loc2_.grid.dataGrid;
            _loc4_ = _loc3_.columnHeaderGroup;
            if(_loc4_.isSortIndicatorVisible(_loc2_.columnIndex))
            {
               if(!this.sortIndicatorInstance)
               {
                  this.sortIndicatorInstance = this.sortIndicator.newInstance();
                  this.sortIndicatorGroup.addElement(this.sortIndicatorInstance);
                  this.chromeColorChanged = true;
                  invalidateDisplayList();
               }
               this.sortIndicatorInstance.visible = true;
               _loc5_ = this.sortIndicatorInstance as IGridVisualElement;
               if(_loc5_)
               {
                  _loc5_.prepareGridVisualElement(_loc2_.grid,-1,_loc2_.columnIndex);
               }
               this.sortIndicatorGroup.includeInLayout = true;
               this.sortIndicatorGroup.scaleY = _loc2_.sortDescending ? 1 : -1;
            }
            else if(this.sortIndicatorInstance)
            {
               this.sortIndicatorGroup.removeElement(this.sortIndicatorInstance);
               this.sortIndicatorGroup.includeInLayout = false;
               this.sortIndicatorInstance = null;
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         if(this.chromeColorChanged)
         {
            _loc3_ = getStyle("chromeColor");
            if(_loc3_ != DEFAULT_COLOR || this.colorized)
            {
               colorTransform.redOffset = ((_loc3_ & 255 << 16) >> 16) - DEFAULT_COLOR_VALUE;
               colorTransform.greenOffset = ((_loc3_ & 255 << 8) >> 8) - DEFAULT_COLOR_VALUE;
               colorTransform.blueOffset = (_loc3_ & 0xFF) - DEFAULT_COLOR_VALUE;
               colorTransform.alphaMultiplier = alpha;
               transform.colorTransform = colorTransform;
               _loc4_ = [labelDisplay,this.sortIndicatorInstance];
               if((Boolean(_loc4_)) && _loc4_.length > 0)
               {
                  colorTransform.redOffset = -colorTransform.redOffset;
                  colorTransform.greenOffset = -colorTransform.greenOffset;
                  colorTransform.blueOffset = -colorTransform.blueOffset;
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.length)
                  {
                     _loc6_ = _loc4_[_loc5_];
                     if((Boolean(_loc6_)) && (_loc6_ is DisplayObject || _loc6_ is GraphicElement))
                     {
                        colorTransform.alphaMultiplier = _loc6_.alpha;
                        _loc6_.transform.colorTransform = colorTransform;
                     }
                     _loc5_++;
                  }
               }
               this.colorized = true;
            }
            this.chromeColorChanged = false;
         }
         super.updateDisplayList(param1,param2);
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         super.styleChanged(param1);
         if(_loc2_ || param1 == "chromeColor")
         {
            this.chromeColorChanged = true;
            invalidateDisplayList();
         }
      }
      
      private function _RecGridHeaderRenderer_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecGridHeaderRendererInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.defaultSortIndicator = _loc1_;
         BindingManager.executeBindings(this,"defaultSortIndicator",this.defaultSortIndicator);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.styleName = "dataGridHeader";
         _loc1_.setStyle("textAlign","start");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -1;
         _loc1_.right = -1;
         _loc1_.top = -1;
         _loc1_.bottom = -1;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._RecGridHeaderRenderer_LinearGradient1_c();
         _loc1_.initialized(this,"shadow");
         this.shadow = _loc1_;
         BindingManager.executeBindings(this,"shadow",this.shadow);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._RecGridHeaderRenderer_GradientEntry1_i(),this._RecGridHeaderRenderer_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.01;
         this._RecGridHeaderRenderer_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_RecGridHeaderRenderer_GradientEntry1",this._RecGridHeaderRenderer_GradientEntry1);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         this._RecGridHeaderRenderer_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_RecGridHeaderRenderer_GradientEntry2",this._RecGridHeaderRenderer_GradientEntry2);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._RecGridHeaderRenderer_LinearGradient2_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._RecGridHeaderRenderer_GradientEntry3_i(),this._RecGridHeaderRenderer_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 4737096;
         _loc1_.alpha = 0.85;
         this._RecGridHeaderRenderer_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_RecGridHeaderRenderer_GradientEntry3",this._RecGridHeaderRenderer_GradientEntry3);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 2960685;
         _loc1_.alpha = 0.85;
         this._RecGridHeaderRenderer_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_RecGridHeaderRenderer_GradientEntry4",this._RecGridHeaderRenderer_GradientEntry4);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 0;
         _loc1_.stroke = this._RecGridHeaderRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 1;
         _loc1_.stroke = this._RecGridHeaderRenderer_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7500402;
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._RecGridHeaderRenderer_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.includeInLayout = false;
         _loc1_.verticalCenter = 0;
         _loc1_.x = 7;
         _loc1_.id = "sortIndicatorGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sortIndicatorGroup = _loc1_;
         BindingManager.executeBindings(this,"sortIndicatorGroup",this.sortIndicatorGroup);
         return _loc1_;
      }
      
      private function _RecGridHeaderRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.x = 18;
         _loc1_.id = "labelDisplayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplayGroup = _loc1_;
         BindingManager.executeBindings(this,"labelDisplayGroup",this.labelDisplayGroup);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RecGridHeaderRenderer_GradientEntry1() : GradientEntry
      {
         return this._1354916807_RecGridHeaderRenderer_GradientEntry1;
      }
      
      public function set _RecGridHeaderRenderer_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1354916807_RecGridHeaderRenderer_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._1354916807_RecGridHeaderRenderer_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RecGridHeaderRenderer_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RecGridHeaderRenderer_GradientEntry2() : GradientEntry
      {
         return this._1354916808_RecGridHeaderRenderer_GradientEntry2;
      }
      
      public function set _RecGridHeaderRenderer_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1354916808_RecGridHeaderRenderer_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._1354916808_RecGridHeaderRenderer_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RecGridHeaderRenderer_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RecGridHeaderRenderer_GradientEntry3() : GradientEntry
      {
         return this._1354916809_RecGridHeaderRenderer_GradientEntry3;
      }
      
      public function set _RecGridHeaderRenderer_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1354916809_RecGridHeaderRenderer_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._1354916809_RecGridHeaderRenderer_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RecGridHeaderRenderer_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RecGridHeaderRenderer_GradientEntry4() : GradientEntry
      {
         return this._1354916810_RecGridHeaderRenderer_GradientEntry4;
      }
      
      public function set _RecGridHeaderRenderer_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1354916810_RecGridHeaderRenderer_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._1354916810_RecGridHeaderRenderer_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RecGridHeaderRenderer_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get defaultSortIndicator() : ClassFactory
      {
         return this._783637168defaultSortIndicator;
      }
      
      public function set defaultSortIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._783637168defaultSortIndicator;
         if(_loc2_ !== param1)
         {
            this._783637168defaultSortIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"defaultSortIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fill() : Rect
      {
         return this._3143043fill;
      }
      
      public function set fill(param1:Rect) : void
      {
         var _loc2_:Object = this._3143043fill;
         if(_loc2_ !== param1)
         {
            this._3143043fill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplayGroup() : Group
      {
         return this._175381489labelDisplayGroup;
      }
      
      public function set labelDisplayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._175381489labelDisplayGroup;
         if(_loc2_ !== param1)
         {
            this._175381489labelDisplayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow() : Rect
      {
         return this._903579360shadow;
      }
      
      public function set shadow(param1:Rect) : void
      {
         var _loc2_:Object = this._903579360shadow;
         if(_loc2_ !== param1)
         {
            this._903579360shadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sortIndicatorGroup() : Group
      {
         return this._668643602sortIndicatorGroup;
      }
      
      public function set sortIndicatorGroup(param1:Group) : void
      {
         var _loc2_:Object = this._668643602sortIndicatorGroup;
         if(_loc2_ !== param1)
         {
            this._668643602sortIndicatorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sortIndicatorGroup",_loc2_,param1));
            }
         }
      }
   }
}

