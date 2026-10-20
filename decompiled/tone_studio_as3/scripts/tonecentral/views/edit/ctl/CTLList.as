package tonecentral.views.edit.ctl
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColorStroke;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.primitives.Line;
   import tonecentral.skin.ScrollerSkin;
   
   use namespace mx_internal;
   
   public class CTLList extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1091641689ctlList:Group;
      
      private var _2020362026ctlTitleArea:Group;
      
      private var _102977214line2:Line;
      
      private var _103149406logic:CTLListLogic;
      
      private var _402164678scroller:Scroller;
      
      private var _226620441scrollerArea:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CTLList()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._CTLList_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_edit_ctl_CTLListWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CTLList[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._CTLList_Group2_c(),this._CTLList_Line1_c(),this._CTLList_Scroller1_i()];
         this._CTLList_CTLListLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CTLList._watcherSetupUtil = param1;
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
      
      public function changeMode() : void
      {
         this.logic.changeMode();
      }
      
      private function _CTLList_CTLListLogic1_i() : CTLListLogic
      {
         var _loc1_:CTLListLogic = new CTLListLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _CTLList_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.top = 10;
         _loc1_.left = 0;
         _loc1_.right = 20;
         _loc1_.mxmlContent = [this._CTLList_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CTLList_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "ctlTitleArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlTitleArea = _loc1_;
         BindingManager.executeBindings(this,"ctlTitleArea",this.ctlTitleArea);
         return _loc1_;
      }
      
      private function _CTLList_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.y = 30;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._CTLList_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CTLList_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _CTLList_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.top = 30;
         _loc1_.bottom = 0;
         _loc1_.viewport = this._CTLList_Group4_i();
         _loc1_.setStyle("verticalScrollPolicy","auto");
         _loc1_.setStyle("horizontalScrollPolicy","auto");
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
      
      private function _CTLList_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CTLList_Group5_i(),this._CTLList_Line2_i()];
         _loc1_.id = "scrollerArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollerArea = _loc1_;
         BindingManager.executeBindings(this,"scrollerArea",this.scrollerArea);
         return _loc1_;
      }
      
      private function _CTLList_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 20;
         _loc1_.left = 20;
         _loc1_.right = 20;
         _loc1_.id = "ctlList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlList = _loc1_;
         BindingManager.executeBindings(this,"ctlList",this.ctlList);
         return _loc1_;
      }
      
      private function _CTLList_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.x = 0;
         _loc1_.y = 65;
         _loc1_.stroke = this._CTLList_SolidColorStroke2_c();
         _loc1_.initialized(this,"line2");
         this.line2 = _loc1_;
         BindingManager.executeBindings(this,"line2",this.line2);
         return _loc1_;
      }
      
      private function _CTLList_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _CTLList_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return ctlList.width + 35;
         },null,"line2.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get ctlList() : Group
      {
         return this._1091641689ctlList;
      }
      
      public function set ctlList(param1:Group) : void
      {
         var _loc2_:Object = this._1091641689ctlList;
         if(_loc2_ !== param1)
         {
            this._1091641689ctlList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ctlList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ctlTitleArea() : Group
      {
         return this._2020362026ctlTitleArea;
      }
      
      public function set ctlTitleArea(param1:Group) : void
      {
         var _loc2_:Object = this._2020362026ctlTitleArea;
         if(_loc2_ !== param1)
         {
            this._2020362026ctlTitleArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ctlTitleArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get line2() : Line
      {
         return this._102977214line2;
      }
      
      public function set line2(param1:Line) : void
      {
         var _loc2_:Object = this._102977214line2;
         if(_loc2_ !== param1)
         {
            this._102977214line2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"line2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : CTLListLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:CTLListLogic) : void
      {
         var _loc2_:Object = this._103149406logic;
         if(_loc2_ !== param1)
         {
            this._103149406logic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logic",_loc2_,param1));
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
      public function get scrollerArea() : Group
      {
         return this._226620441scrollerArea;
      }
      
      public function set scrollerArea(param1:Group) : void
      {
         var _loc2_:Object = this._226620441scrollerArea;
         if(_loc2_ !== param1)
         {
            this._226620441scrollerArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollerArea",_loc2_,param1));
            }
         }
      }
   }
}

