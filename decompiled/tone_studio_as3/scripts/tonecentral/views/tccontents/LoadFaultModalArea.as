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
   import mx.graphics.SolidColor;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Rect;
   import tonecentral.components.ImageLabelButton;
   
   use namespace mx_internal;
   
   public class LoadFaultModalArea extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _954925063message:Label;
      
      private var _321863295refreshBtn:ImageLabelButton;
      
      private var _526691929subMessage:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function LoadFaultModalArea()
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
         bindings = this._LoadFaultModalArea_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_tccontents_LoadFaultModalAreaWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return LoadFaultModalArea[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._LoadFaultModalArea_Rect1_c(),this._LoadFaultModalArea_Group2_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         LoadFaultModalArea._watcherSetupUtil = param1;
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
      
      private function _LoadFaultModalArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LoadFaultModalArea_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LoadFaultModalArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.6;
         return _loc1_;
      }
      
      private function _LoadFaultModalArea_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.width = 700;
         _loc1_.height = 150;
         _loc1_.mxmlContent = [this._LoadFaultModalArea_Label1_i(),this._LoadFaultModalArea_Label2_i(),this._LoadFaultModalArea_ImageLabelButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LoadFaultModalArea_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _LoadFaultModalArea_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "subMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMessage = _loc1_;
         BindingManager.executeBindings(this,"subMessage",this.subMessage);
         return _loc1_;
      }
      
      private function _LoadFaultModalArea_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.horizontalCenter = 0;
         _loc1_.height = 45;
         _loc1_.width = 180;
         _loc1_.buttonMode = true;
         _loc1_.id = "refreshBtn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.refreshBtn = _loc1_;
         BindingManager.executeBindings(this,"refreshBtn",this.refreshBtn);
         return _loc1_;
      }
      
      private function _LoadFaultModalArea_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","modal.loadfault.tc.msg");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"message.text");
         result[1] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","modal.loadfault.tc.msgStyle");
         },null,"message.styleName");
         result[2] = new Binding(this,function():Number
         {
            return message.height + message.y + 20;
         },null,"subMessage.y");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","modal.loadfault.tc.subMsg");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"subMessage.text");
         result[4] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","modal.loadfault.tc.subMsgStyle");
         },null,"subMessage.styleName");
         result[5] = new Binding(this,function():Number
         {
            return subMessage.height + subMessage.y + 20;
         },null,"refreshBtn.y");
         result[6] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","modal.loadfault.tc.buttonStyle");
         },null,"refreshBtn.styleName");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","modal.loadfault.tc.buttonLabel");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"refreshBtn.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : Label
      {
         return this._954925063message;
      }
      
      public function set message(param1:Label) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get refreshBtn() : ImageLabelButton
      {
         return this._321863295refreshBtn;
      }
      
      public function set refreshBtn(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._321863295refreshBtn;
         if(_loc2_ !== param1)
         {
            this._321863295refreshBtn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"refreshBtn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMessage() : Label
      {
         return this._526691929subMessage;
      }
      
      public function set subMessage(param1:Label) : void
      {
         var _loc2_:Object = this._526691929subMessage;
         if(_loc2_ !== param1)
         {
            this._526691929subMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMessage",_loc2_,param1));
            }
         }
      }
   }
}

