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
   import spark.primitives.Rect;
   import tonecentral.components.setting.detail.AbstractSettingDetail;
   
   use namespace mx_internal;
   
   public class LanguageSetting extends AbstractSettingDetail implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1391644727bgRect:Rect;
      
      private var _1613589672language:SystemDropDownList;
      
      private var _103149406logic:LanguageSettingLogic;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function LanguageSetting()
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
         bindings = this._LanguageSetting_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_components_setting_LanguageSettingWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return LanguageSetting[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 450;
         this.height = 330;
         this.mxmlContent = [this._LanguageSetting_Rect1_i(),this._LanguageSetting_SystemDropDownList1_i()];
         this._LanguageSetting_LanguageSettingLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         LanguageSetting._watcherSetupUtil = param1;
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
      
      private function _LanguageSetting_LanguageSettingLogic1_i() : LanguageSettingLogic
      {
         var _loc1_:LanguageSettingLogic = new LanguageSettingLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LanguageSetting_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 25;
         _loc1_.right = 20;
         _loc1_.y = 0;
         _loc1_.height = 65;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._LanguageSetting_SolidColor1_c();
         _loc1_.stroke = this._LanguageSetting_SolidColorStroke1_c();
         _loc1_.initialized(this,"bgRect");
         this.bgRect = _loc1_;
         BindingManager.executeBindings(this,"bgRect",this.bgRect);
         return _loc1_;
      }
      
      private function _LanguageSetting_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4802889;
         return _loc1_;
      }
      
      private function _LanguageSetting_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 1973790;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _LanguageSetting_SystemDropDownList1_i() : SystemDropDownList
      {
         var _loc1_:SystemDropDownList = new SystemDropDownList();
         _loc1_.x = 45;
         _loc1_.y = 20;
         _loc1_.height = 25;
         _loc1_.width = 150;
         _loc1_.labelField = "name";
         _loc1_.id = "language";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.language = _loc1_;
         BindingManager.executeBindings(this,"language",this.language);
         return _loc1_;
      }
      
      private function _LanguageSetting_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","setting.dropdown.style");
         },null,"language.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bgRect() : Rect
      {
         return this._1391644727bgRect;
      }
      
      public function set bgRect(param1:Rect) : void
      {
         var _loc2_:Object = this._1391644727bgRect;
         if(_loc2_ !== param1)
         {
            this._1391644727bgRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgRect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get language() : SystemDropDownList
      {
         return this._1613589672language;
      }
      
      public function set language(param1:SystemDropDownList) : void
      {
         var _loc2_:Object = this._1613589672language;
         if(_loc2_ !== param1)
         {
            this._1613589672language = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"language",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : LanguageSettingLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LanguageSettingLogic) : void
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
   }
}

