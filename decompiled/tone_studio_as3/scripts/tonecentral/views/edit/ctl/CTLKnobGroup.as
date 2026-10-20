package tonecentral.views.edit.ctl
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class CTLKnobGroup extends CTLAbstractGroup
   {
      
      private var _1091693382ctlName:Label;
      
      private var _1681409769ctlParameterVGroup:VGroup;
      
      private var _103149406logic:CTLKnobGroupLogic;
      
      private var _687677408modFxLabel:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CTLKnobGroup()
      {
         super();
         mx_internal::_document = this;
         this.width = 100;
         this.mxmlContent = [this._CTLKnobGroup_Label1_i(),this._CTLKnobGroup_Label2_i(),this._CTLKnobGroup_VGroup1_i()];
         this._CTLKnobGroup_CTLKnobGroupLogic1_i();
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
      
      private function _CTLKnobGroup_CTLKnobGroupLogic1_i() : CTLKnobGroupLogic
      {
         var _loc1_:CTLKnobGroupLogic = new CTLKnobGroupLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _CTLKnobGroup_Label1_i() : Label
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
      
      private function _CTLKnobGroup_Label2_i() : Label
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
      
      private function _CTLKnobGroup_VGroup1_i() : VGroup
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
      public function get logic() : CTLKnobGroupLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:CTLKnobGroupLogic) : void
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
   }
}

