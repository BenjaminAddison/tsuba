package tonecentral.views.tccontents
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
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class PatchDescItem extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1464533731descLabel:Label;
      
      private var _103149406logic:PatchDescItemLogic;
      
      private var _1215755049nameLabel:Label;
      
      private var _1906890994numLabel:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PatchDescItem()
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
         bindings = this._PatchDescItem_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_tccontents_PatchDescItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PatchDescItem[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.mxmlContent = [this._PatchDescItem_Line1_c(),this._PatchDescItem_HGroup1_c()];
         this._PatchDescItem_PatchDescItemLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PatchDescItem._watcherSetupUtil = param1;
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
      
      public function set data(param1:XML) : void
      {
         this.logic.data = param1;
      }
      
      private function _PatchDescItem_PatchDescItemLogic1_i() : PatchDescItemLogic
      {
         var _loc1_:PatchDescItemLogic = new PatchDescItemLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _PatchDescItem_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._PatchDescItem_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PatchDescItem_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2236962;
         return _loc1_;
      }
      
      private function _PatchDescItem_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.verticalAlign = "top";
         _loc1_.mxmlContent = [this._PatchDescItem_Label1_i(),this._PatchDescItem_Label2_i(),this._PatchDescItem_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PatchDescItem_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 30;
         _loc1_.styleName = "patchDescNum";
         _loc1_.id = "numLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.numLabel = _loc1_;
         BindingManager.executeBindings(this,"numLabel",this.numLabel);
         return _loc1_;
      }
      
      private function _PatchDescItem_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 120;
         _loc1_.styleName = "patchDescName";
         _loc1_.id = "nameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameLabel = _loc1_;
         BindingManager.executeBindings(this,"nameLabel",this.nameLabel);
         return _loc1_;
      }
      
      private function _PatchDescItem_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "descLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.descLabel = _loc1_;
         BindingManager.executeBindings(this,"descLabel",this.descLabel);
         return _loc1_;
      }
      
      private function _PatchDescItem_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","tc.patchDescItem.desc.style");
         },null,"descLabel.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get descLabel() : Label
      {
         return this._1464533731descLabel;
      }
      
      public function set descLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1464533731descLabel;
         if(_loc2_ !== param1)
         {
            this._1464533731descLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : PatchDescItemLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:PatchDescItemLogic) : void
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
      public function get nameLabel() : Label
      {
         return this._1215755049nameLabel;
      }
      
      public function set nameLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1215755049nameLabel;
         if(_loc2_ !== param1)
         {
            this._1215755049nameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get numLabel() : Label
      {
         return this._1906890994numLabel;
      }
      
      public function set numLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1906890994numLabel;
         if(_loc2_ !== param1)
         {
            this._1906890994numLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"numLabel",_loc2_,param1));
            }
         }
      }
   }
}

