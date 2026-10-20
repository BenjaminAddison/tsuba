package tonecentral.components.setting
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
   import mx.graphics.SolidColorStroke;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.Rect;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.setting.detail.AbstractSettingDetail;
   
   use namespace mx_internal;
   
   public class ManualSetting extends AbstractSettingDetail implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _103149406logic:ManualSettingLogic;
      
      private var _925155509reference:ImageLabelButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ManualSetting()
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
         bindings = this._ManualSetting_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_components_setting_ManualSettingWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ManualSetting[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 450;
         this.height = 330;
         this.mxmlContent = [this._ManualSetting_Rect1_c(),this._ManualSetting_Group1_c()];
         this._ManualSetting_ManualSettingLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ManualSetting._watcherSetupUtil = param1;
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
      
      private function _ManualSetting_ManualSettingLogic1_i() : ManualSettingLogic
      {
         var _loc1_:ManualSettingLogic = new ManualSettingLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ManualSetting_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 25;
         _loc1_.right = 20;
         _loc1_.y = 10;
         _loc1_.height = 90;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._ManualSetting_SolidColor1_c();
         _loc1_.stroke = this._ManualSetting_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ManualSetting_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4802889;
         return _loc1_;
      }
      
      private function _ManualSetting_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 1973790;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _ManualSetting_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 25;
         _loc1_.right = 20;
         _loc1_.y = 10;
         _loc1_.height = 90;
         _loc1_.mxmlContent = [this._ManualSetting_ImageLabelButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ManualSetting_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 22;
         _loc1_.height = 45;
         _loc1_.width = 180;
         _loc1_.id = "reference";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.reference = _loc1_;
         BindingManager.executeBindings(this,"reference",this.reference);
         return _loc1_;
      }
      
      private function _ManualSetting_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","setting.manualButton.style");
         },null,"reference.styleName");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","setting.manual");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"reference.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ManualSettingLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ManualSettingLogic) : void
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
      public function get reference() : ImageLabelButton
      {
         return this._925155509reference;
      }
      
      public function set reference(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._925155509reference;
         if(_loc2_ !== param1)
         {
            this._925155509reference = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reference",_loc2_,param1));
            }
         }
      }
   }
}

