package tonecentral.views.edit.ctl
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class CTLPedalRangeGroup extends CTLAbstractGroup
   {
      
      private var _1091693382ctlName:Label;
      
      private var _1681409769ctlParameterVGroup:VGroup;
      
      private var _103149406logic:CTLPedalRangeGroupLogic;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CTLPedalRangeGroup()
      {
         super();
         mx_internal::_document = this;
         this.width = 100;
         this.mxmlContent = [this._CTLPedalRangeGroup_Label1_i(),this._CTLPedalRangeGroup_VGroup1_i()];
         this._CTLPedalRangeGroup_CTLPedalRangeGroupLogic1_i();
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
      
      private function _CTLPedalRangeGroup_CTLPedalRangeGroupLogic1_i() : CTLPedalRangeGroupLogic
      {
         var _loc1_:CTLPedalRangeGroupLogic = new CTLPedalRangeGroupLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _CTLPedalRangeGroup_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "ctlTitleName";
         _loc1_.height = 15;
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "ctlName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlName = _loc1_;
         BindingManager.executeBindings(this,"ctlName",this.ctlName);
         return _loc1_;
      }
      
      private function _CTLPedalRangeGroup_VGroup1_i() : VGroup
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
      public function get logic() : CTLPedalRangeGroupLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:CTLPedalRangeGroupLogic) : void
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

