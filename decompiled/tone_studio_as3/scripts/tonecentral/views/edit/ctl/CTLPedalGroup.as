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
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.VGroup;
   import tonecentral.components.CustomDropDownList;
   
   use namespace mx_internal;
   
   public class CTLPedalGroup extends CTLAbstractGroup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1091693382ctlName:Label;
      
      private var _1681409769ctlParameterVGroup:VGroup;
      
      private var _103149406logic:CTLPedalGroupLogic;
      
      private var _687677408modFxLabel:Label;
      
      private var _832085074pedalFuncDDL:CustomDropDownList;
      
      private var _761562570pedalFuncLabel:Label;
      
      private var _1750338424textBoxBgiPedalFunc:UIComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CTLPedalGroup()
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
         bindings = this._CTLPedalGroup_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_edit_ctl_CTLPedalGroupWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CTLPedalGroup[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 100;
         this.mxmlContent = [this._CTLPedalGroup_Label1_i(),this._CTLPedalGroup_Group1_c(),this._CTLPedalGroup_Label3_i(),this._CTLPedalGroup_VGroup1_i()];
         this._CTLPedalGroup_CTLPedalGroupLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CTLPedalGroup._watcherSetupUtil = param1;
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
      
      override public function init(param1:String) : void
      {
         this.logic.init(param1);
      }
      
      override public function updateView() : void
      {
         this.logic.updateView();
      }
      
      private function _CTLPedalGroup_CTLPedalGroupLogic1_i() : CTLPedalGroupLogic
      {
         var _loc1_:CTLPedalGroupLogic = new CTLPedalGroupLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "ctlTitleName";
         _loc1_.height = 15;
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "ctlName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlName = _loc1_;
         BindingManager.executeBindings(this,"ctlName",this.ctlName);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 45;
         _loc1_.y = 10;
         _loc1_.mxmlContent = [this._CTLPedalGroup_Label2_i(),this._CTLPedalGroup_UIComponent1_i(),this._CTLPedalGroup_CustomDropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CTLPedalGroup_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 2;
         _loc1_.styleName = "ctlParamName";
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.height = 15;
         _loc1_.text = "FUNCTION";
         _loc1_.id = "pedalFuncLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pedalFuncLabel = _loc1_;
         BindingManager.executeBindings(this,"pedalFuncLabel",this.pedalFuncLabel);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.y = 15;
         _loc1_.height = 30;
         _loc1_.percentWidth = 100;
         _loc1_.id = "textBoxBgiPedalFunc";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textBoxBgiPedalFunc = _loc1_;
         BindingManager.executeBindings(this,"textBoxBgiPedalFunc",this.textBoxBgiPedalFunc);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_CustomDropDownList1_i() : CustomDropDownList
      {
         var _loc1_:CustomDropDownList = new CustomDropDownList();
         _loc1_.height = 30;
         _loc1_.y = 15;
         _loc1_.labelField = "name";
         _loc1_.styleName = "blueBorderDropDown";
         _loc1_.id = "pedalFuncDDL";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pedalFuncDDL = _loc1_;
         BindingManager.executeBindings(this,"pedalFuncDDL",this.pedalFuncDDL);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 227;
         _loc1_.styleName = "ctlParamName";
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.height = 15;
         _loc1_.text = "MOD/FX :";
         _loc1_.id = "modFxLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.modFxLabel = _loc1_;
         BindingManager.executeBindings(this,"modFxLabel",this.modFxLabel);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.y = 75;
         _loc1_.gap = 5;
         _loc1_.id = "ctlParameterVGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlParameterVGroup = _loc1_;
         BindingManager.executeBindings(this,"ctlParameterVGroup",this.ctlParameterVGroup);
         return _loc1_;
      }
      
      private function _CTLPedalGroup_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return this.width + 5;
         },null,"pedalFuncDDL.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get ctlName() : Label
      {
         return this._1091693382ctlName;
      }
      
      public function set ctlName(param1:Label) : void
      {
         var _loc2_:Object = this._1091693382ctlName;
         if(_loc2_ !== param1)
         {
            this._1091693382ctlName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ctlName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ctlParameterVGroup() : VGroup
      {
         return this._1681409769ctlParameterVGroup;
      }
      
      public function set ctlParameterVGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1681409769ctlParameterVGroup;
         if(_loc2_ !== param1)
         {
            this._1681409769ctlParameterVGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ctlParameterVGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : CTLPedalGroupLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:CTLPedalGroupLogic) : void
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
      public function get modFxLabel() : Label
      {
         return this._687677408modFxLabel;
      }
      
      public function set modFxLabel(param1:Label) : void
      {
         var _loc2_:Object = this._687677408modFxLabel;
         if(_loc2_ !== param1)
         {
            this._687677408modFxLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modFxLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pedalFuncDDL() : CustomDropDownList
      {
         return this._832085074pedalFuncDDL;
      }
      
      public function set pedalFuncDDL(param1:CustomDropDownList) : void
      {
         var _loc2_:Object = this._832085074pedalFuncDDL;
         if(_loc2_ !== param1)
         {
            this._832085074pedalFuncDDL = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pedalFuncDDL",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pedalFuncLabel() : Label
      {
         return this._761562570pedalFuncLabel;
      }
      
      public function set pedalFuncLabel(param1:Label) : void
      {
         var _loc2_:Object = this._761562570pedalFuncLabel;
         if(_loc2_ !== param1)
         {
            this._761562570pedalFuncLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pedalFuncLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBoxBgiPedalFunc() : UIComponent
      {
         return this._1750338424textBoxBgiPedalFunc;
      }
      
      public function set textBoxBgiPedalFunc(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1750338424textBoxBgiPedalFunc;
         if(_loc2_ !== param1)
         {
            this._1750338424textBoxBgiPedalFunc = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBoxBgiPedalFunc",_loc2_,param1));
            }
         }
      }
   }
}

