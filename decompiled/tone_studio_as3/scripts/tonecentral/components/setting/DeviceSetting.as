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
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.primitives.Rect;
   import tonecentral.components.CustomList;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.setting.detail.AbstractSettingDetail;
   import tonecentral.itemrenderer.DeviceListItemRenderer;
   import tonecentral.skin.ScrollerSkin;
   
   use namespace mx_internal;
   
   public class DeviceSetting extends AbstractSettingDetail implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _2098761675backgoundLayer:UIComponent;
      
      private var _43510499detailButton:ImageLabelButton;
      
      private var _780937236deviceList:CustomList;
      
      private var _103149406logic:DeviceSettingLogic;
      
      private var _954925063message:Label;
      
      private var _1641788370okButton:ImageLabelButton;
      
      private var _1085444827refresh:ImageLabelButton;
      
      private var _2043238322scrollGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DeviceSetting()
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
         bindings = this._DeviceSetting_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_components_setting_DeviceSettingWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DeviceSetting[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 450;
         this.height = 330;
         this.mxmlContent = [this._DeviceSetting_Rect1_c(),this._DeviceSetting_UIComponent1_i(),this._DeviceSetting_Label1_i(),this._DeviceSetting_Scroller1_c(),this._DeviceSetting_ImageLabelButton1_i(),this._DeviceSetting_ImageLabelButton2_i(),this._DeviceSetting_ImageLabelButton3_i()];
         this._DeviceSetting_DeviceSettingLogic1_i();
         this.addEventListener("creationComplete",this.___DeviceSetting_AbstractSettingDetail1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DeviceSetting._watcherSetupUtil = param1;
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
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         var _loc2_:Graphics = this.backgoundLayer.graphics;
         _loc2_.beginFill(2299925);
         _loc2_.drawRect(26,30,this.scrollGroup.width,this.scrollGroup.height);
         _loc2_.lineStyle(1,3352871);
         _loc2_.moveTo(26,29 + 30);
         _loc2_.lineTo(this.scrollGroup.width + 26,29 + 30);
         _loc2_.moveTo(26,29 + 30 * 2);
         _loc2_.lineTo(this.scrollGroup.width + 26,29 + 30 * 2);
         _loc2_.moveTo(26,29 + 30 * 3);
         _loc2_.lineTo(this.scrollGroup.width + 26,29 + 30 * 3);
         _loc2_.moveTo(26,34 + 30 * 4);
         _loc2_.lineTo(this.scrollGroup.width + 26,29 + 30 * 4);
         _loc2_.endFill();
      }
      
      private function _DeviceSetting_DeviceSettingLogic1_i() : DeviceSettingLogic
      {
         var _loc1_:DeviceSettingLogic = new DeviceSettingLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _DeviceSetting_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 25;
         _loc1_.right = 20;
         _loc1_.y = 0;
         _loc1_.height = 224;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._DeviceSetting_SolidColor1_c();
         _loc1_.stroke = this._DeviceSetting_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DeviceSetting_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4802889;
         return _loc1_;
      }
      
      private function _DeviceSetting_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 1973790;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _DeviceSetting_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "backgoundLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backgoundLayer = _loc1_;
         BindingManager.executeBindings(this,"backgoundLayer",this.backgoundLayer);
         return _loc1_;
      }
      
      private function _DeviceSetting_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 35;
         _loc1_.y = 10;
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _DeviceSetting_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 26;
         _loc1_.right = 21;
         _loc1_.y = 30;
         _loc1_.height = 150;
         _loc1_.viewport = this._DeviceSetting_Group1_i();
         _loc1_.setStyle("verticalScrollPolicy","auto");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("skinClass",ScrollerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DeviceSetting_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 403;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._DeviceSetting_CustomList1_i()];
         _loc1_.id = "scrollGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollGroup = _loc1_;
         BindingManager.executeBindings(this,"scrollGroup",this.scrollGroup);
         return _loc1_;
      }
      
      private function _DeviceSetting_CustomList1_i() : CustomList
      {
         var _loc1_:CustomList = new CustomList();
         _loc1_.width = 403;
         _loc1_.itemRenderer = this._DeviceSetting_ClassFactory1_c();
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("contentBackgroundAlpha",0);
         _loc1_.id = "deviceList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deviceList = _loc1_;
         BindingManager.executeBindings(this,"deviceList",this.deviceList);
         return _loc1_;
      }
      
      private function _DeviceSetting_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DeviceListItemRenderer;
         return _loc1_;
      }
      
      private function _DeviceSetting_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.y = 190;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 80;
         _loc1_.height = 25;
         _loc1_.label = "OK";
         _loc1_.styleName = "dialogOKButton";
         _loc1_.id = "okButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.okButton = _loc1_;
         BindingManager.executeBindings(this,"okButton",this.okButton);
         return _loc1_;
      }
      
      private function _DeviceSetting_ImageLabelButton2_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.y = 190;
         _loc1_.right = 30;
         _loc1_.width = 80;
         _loc1_.height = 25;
         _loc1_.label = "REFRESH";
         _loc1_.styleName = "dialogOKButton";
         _loc1_.id = "refresh";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.refresh = _loc1_;
         BindingManager.executeBindings(this,"refresh",this.refresh);
         return _loc1_;
      }
      
      private function _DeviceSetting_ImageLabelButton3_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.y = 190;
         _loc1_.left = 30;
         _loc1_.width = 80;
         _loc1_.label = "DETAIL";
         _loc1_.styleName = "dialogOKButton";
         _loc1_.id = "detailButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.detailButton = _loc1_;
         BindingManager.executeBindings(this,"detailButton",this.detailButton);
         return _loc1_;
      }
      
      public function ___DeviceSetting_AbstractSettingDetail1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      private function _DeviceSetting_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","setting.caption.style");
         },null,"message.styleName");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","dialog.deviceListMsg");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"message.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgoundLayer() : UIComponent
      {
         return this._2098761675backgoundLayer;
      }
      
      public function set backgoundLayer(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2098761675backgoundLayer;
         if(_loc2_ !== param1)
         {
            this._2098761675backgoundLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgoundLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get detailButton() : ImageLabelButton
      {
         return this._43510499detailButton;
      }
      
      public function set detailButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._43510499detailButton;
         if(_loc2_ !== param1)
         {
            this._43510499detailButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"detailButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get deviceList() : CustomList
      {
         return this._780937236deviceList;
      }
      
      public function set deviceList(param1:CustomList) : void
      {
         var _loc2_:Object = this._780937236deviceList;
         if(_loc2_ !== param1)
         {
            this._780937236deviceList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deviceList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : DeviceSettingLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:DeviceSettingLogic) : void
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
      public function get okButton() : ImageLabelButton
      {
         return this._1641788370okButton;
      }
      
      public function set okButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1641788370okButton;
         if(_loc2_ !== param1)
         {
            this._1641788370okButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get refresh() : ImageLabelButton
      {
         return this._1085444827refresh;
      }
      
      public function set refresh(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1085444827refresh;
         if(_loc2_ !== param1)
         {
            this._1085444827refresh = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"refresh",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollGroup() : Group
      {
         return this._2043238322scrollGroup;
      }
      
      public function set scrollGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2043238322scrollGroup;
         if(_loc2_ !== param1)
         {
            this._2043238322scrollGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollGroup",_loc2_,param1));
            }
         }
      }
   }
}

