package tonecentral.components.setting.detail
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   public class Usb extends AbstractSettingDetail
   {
      
      private var _1391644727bgRect:Rect;
      
      private var _103149406logic:UsbLogic;
      
      private var _474504370parameterVGroup:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function Usb()
      {
         super();
         mx_internal::_document = this;
         this.width = 450;
         this.height = 355;
         this.mxmlContent = [this._Usb_Rect1_i(),this._Usb_VGroup1_i()];
         this._Usb_UsbLogic1_i();
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
      
      private function _Usb_UsbLogic1_i() : UsbLogic
      {
         var _loc1_:UsbLogic = new UsbLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _Usb_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 25;
         _loc1_.right = 20;
         _loc1_.y = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._Usb_SolidColor1_c();
         _loc1_.stroke = this._Usb_SolidColorStroke1_c();
         _loc1_.initialized(this,"bgRect");
         this.bgRect = _loc1_;
         BindingManager.executeBindings(this,"bgRect",this.bgRect);
         return _loc1_;
      }
      
      private function _Usb_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4802889;
         return _loc1_;
      }
      
      private function _Usb_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 1973790;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _Usb_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 45;
         _loc1_.y = 20;
         _loc1_.gap = 10;
         _loc1_.id = "parameterVGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.parameterVGroup = _loc1_;
         BindingManager.executeBindings(this,"parameterVGroup",this.parameterVGroup);
         return _loc1_;
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
      public function get logic() : UsbLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:UsbLogic) : void
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
      public function get parameterVGroup() : VGroup
      {
         return this._474504370parameterVGroup;
      }
      
      public function set parameterVGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._474504370parameterVGroup;
         if(_loc2_ !== param1)
         {
            this._474504370parameterVGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"parameterVGroup",_loc2_,param1));
            }
         }
      }
   }
}

