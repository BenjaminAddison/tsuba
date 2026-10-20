package tonecentral.views.edit.amp
{
   import mx.binding.BindingManager;
   import mx.collections.IList;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Rect;
   import tonecentral.components.CustomDropDownList;
   
   public class EffectTypeSelect extends Group
   {
      
      private var _432061423dropdown:CustomDropDownList;
      
      private var _103149406logic:EffectTypeSelectLogic;
      
      private var _1549573145offLamp:Rect;
      
      private var _584549604offStrokeColor:SolidColorStroke;
      
      private var _2114347251onEffectColor:SolidColor;
      
      private var _1013183401onLamp:Rect;
      
      private var _1910082388onStrokeColor:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function EffectTypeSelect()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._EffectTypeSelect_Rect1_i(),this._EffectTypeSelect_Rect2_i(),this._EffectTypeSelect_CustomDropDownList1_i()];
         this._EffectTypeSelect_EffectTypeSelectLogic1_i();
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
      
      public function set isOn(param1:Boolean) : void
      {
         this.logic.isOn = param1;
      }
      
      public function hideLamp() : void
      {
         this.logic.hideLamp();
      }
      
      public function get data() : Object
      {
         return this.logic.data;
      }
      
      public function set data(param1:Object) : void
      {
         this.logic.data = param1;
      }
      
      public function get selectedItem() : *
      {
         return this.logic.selectedItem;
      }
      
      public function get selectedIndex() : int
      {
         return this.logic.selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this.logic.selectedIndex = param1;
      }
      
      public function set dataProvider(param1:IList) : void
      {
         this.logic.dataProvider = param1;
      }
      
      public function setValue(param1:int) : void
      {
         this.logic.setValue(param1);
      }
      
      public function setColor(param1:uint, param2:uint) : void
      {
         this.logic.setColor(param1,param2);
      }
      
      private function _EffectTypeSelect_EffectTypeSelectLogic1_i() : EffectTypeSelectLogic
      {
         var _loc1_:EffectTypeSelectLogic = new EffectTypeSelectLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _EffectTypeSelect_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.height = 31;
         _loc1_.width = 11;
         _loc1_.visible = false;
         _loc1_.radiusX = 2;
         _loc1_.radiusY = 2;
         _loc1_.fill = this._EffectTypeSelect_SolidColor1_i();
         _loc1_.stroke = this._EffectTypeSelect_SolidColorStroke1_i();
         _loc1_.initialized(this,"onLamp");
         this.onLamp = _loc1_;
         BindingManager.executeBindings(this,"onLamp",this.onLamp);
         return _loc1_;
      }
      
      private function _EffectTypeSelect_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this.onEffectColor = _loc1_;
         BindingManager.executeBindings(this,"onEffectColor",this.onEffectColor);
         return _loc1_;
      }
      
      private function _EffectTypeSelect_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this.onStrokeColor = _loc1_;
         BindingManager.executeBindings(this,"onStrokeColor",this.onStrokeColor);
         return _loc1_;
      }
      
      private function _EffectTypeSelect_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.height = 31;
         _loc1_.width = 11;
         _loc1_.radiusX = 2;
         _loc1_.radiusY = 2;
         _loc1_.stroke = this._EffectTypeSelect_SolidColorStroke2_i();
         _loc1_.initialized(this,"offLamp");
         this.offLamp = _loc1_;
         BindingManager.executeBindings(this,"offLamp",this.offLamp);
         return _loc1_;
      }
      
      private function _EffectTypeSelect_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this.offStrokeColor = _loc1_;
         BindingManager.executeBindings(this,"offStrokeColor",this.offStrokeColor);
         return _loc1_;
      }
      
      private function _EffectTypeSelect_CustomDropDownList1_i() : CustomDropDownList
      {
         var _loc1_:CustomDropDownList = new CustomDropDownList();
         _loc1_.x = 20;
         _loc1_.width = 90;
         _loc1_.styleName = "systemDropDown";
         _loc1_.id = "dropdown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropdown = _loc1_;
         BindingManager.executeBindings(this,"dropdown",this.dropdown);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dropdown() : CustomDropDownList
      {
         return this._432061423dropdown;
      }
      
      public function set dropdown(param1:CustomDropDownList) : void
      {
         var _loc2_:Object = this._432061423dropdown;
         if(_loc2_ !== param1)
         {
            this._432061423dropdown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropdown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : EffectTypeSelectLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:EffectTypeSelectLogic) : void
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
      public function get offLamp() : Rect
      {
         return this._1549573145offLamp;
      }
      
      public function set offLamp(param1:Rect) : void
      {
         var _loc2_:Object = this._1549573145offLamp;
         if(_loc2_ !== param1)
         {
            this._1549573145offLamp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"offLamp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get offStrokeColor() : SolidColorStroke
      {
         return this._584549604offStrokeColor;
      }
      
      public function set offStrokeColor(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._584549604offStrokeColor;
         if(_loc2_ !== param1)
         {
            this._584549604offStrokeColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"offStrokeColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onEffectColor() : SolidColor
      {
         return this._2114347251onEffectColor;
      }
      
      public function set onEffectColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._2114347251onEffectColor;
         if(_loc2_ !== param1)
         {
            this._2114347251onEffectColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onEffectColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onLamp() : Rect
      {
         return this._1013183401onLamp;
      }
      
      public function set onLamp(param1:Rect) : void
      {
         var _loc2_:Object = this._1013183401onLamp;
         if(_loc2_ !== param1)
         {
            this._1013183401onLamp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onLamp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onStrokeColor() : SolidColorStroke
      {
         return this._1910082388onStrokeColor;
      }
      
      public function set onStrokeColor(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1910082388onStrokeColor;
         if(_loc2_ !== param1)
         {
            this._1910082388onStrokeColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onStrokeColor",_loc2_,param1));
            }
         }
      }
   }
}

