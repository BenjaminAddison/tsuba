package tonecentral.views.info
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import tonecentral.skin.ScrollerSkin;
   
   public class InfoArea extends Group
   {
      
      private var _177701484infoList:VGroup;
      
      private var _103149406logic:InfoAreaLogic;
      
      private var _2125717286modalArea:UIComponent;
      
      private var _616726695popupArea:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function InfoArea()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._InfoArea_UIComponent1_i(),this._InfoArea_Group2_i()];
         this._InfoArea_InfoAreaLogic1_i();
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
      
      public function get infoCount() : int
      {
         return this.logic.infoCount;
      }
      
      public function loadData() : void
      {
         this.logic.loadData();
      }
      
      private function _InfoArea_InfoAreaLogic1_i() : InfoAreaLogic
      {
         var _loc1_:InfoAreaLogic = new InfoAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _InfoArea_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "modalArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.modalArea = _loc1_;
         BindingManager.executeBindings(this,"modalArea",this.modalArea);
         return _loc1_;
      }
      
      private function _InfoArea_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 180;
         _loc1_.y = 70;
         _loc1_.width = 375;
         _loc1_.mxmlContent = [this._InfoArea_Rect1_c(),this._InfoArea_Path1_c(),this._InfoArea_Scroller1_c()];
         _loc1_.id = "popupArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popupArea = _loc1_;
         BindingManager.executeBindings(this,"popupArea",this.popupArea);
         return _loc1_;
      }
      
      private function _InfoArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 10;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._InfoArea_SolidColor1_c();
         _loc1_.stroke = this._InfoArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _InfoArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3881787;
         return _loc1_;
      }
      
      private function _InfoArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 3;
         return _loc1_;
      }
      
      private function _InfoArea_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 0 30 L 10 20 L 10 40";
         _loc1_.fill = this._InfoArea_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _InfoArea_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _InfoArea_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.left = 13;
         _loc1_.right = 3;
         _loc1_.viewport = this._InfoArea_VGroup1_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _InfoArea_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 360;
         _loc1_.gap = 0;
         _loc1_.id = "infoList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoList = _loc1_;
         BindingManager.executeBindings(this,"infoList",this.infoList);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get infoList() : VGroup
      {
         return this._177701484infoList;
      }
      
      public function set infoList(param1:VGroup) : void
      {
         var _loc2_:Object = this._177701484infoList;
         if(_loc2_ !== param1)
         {
            this._177701484infoList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : InfoAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:InfoAreaLogic) : void
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
      public function get modalArea() : UIComponent
      {
         return this._2125717286modalArea;
      }
      
      public function set modalArea(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2125717286modalArea;
         if(_loc2_ !== param1)
         {
            this._2125717286modalArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modalArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popupArea() : Group
      {
         return this._616726695popupArea;
      }
      
      public function set popupArea(param1:Group) : void
      {
         var _loc2_:Object = this._616726695popupArea;
         if(_loc2_ !== param1)
         {
            this._616726695popupArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popupArea",_loc2_,param1));
            }
         }
      }
   }
}

