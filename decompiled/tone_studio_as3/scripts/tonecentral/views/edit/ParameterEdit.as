package tonecentral.views.edit
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import tonecentral.views.edit.amp.EffectPanel;
   import tonecentral.views.edit.chain.EffectChain;
   import tonecentral.views.edit.ctl.CTLList;
   import tonecentral.views.edit.detail.ParameterDetails;
   
   public class ParameterEdit extends Group implements IStateClient2
   {
      
      private var _1091641689ctlList:CTLList;
      
      private var _1307828273editbg:BitmapImage;
      
      private var _1635024816effectChain:EffectChain;
      
      private var _1646834419effectPanel:EffectPanel;
      
      private var _103149406logic:ParameterEditLogic;
      
      private var _3373990navi:NavigationComponent;
      
      private var _405137831parameterDetails:ParameterDetails;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bgi_edit_png_201981038:Class = ParameterEdit__embed_mxml___assets_images_bgi_edit_png_201981038;
      
      public function ParameterEdit()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._ParameterEdit_BitmapImage1_i(),this._ParameterEdit_NavigationComponent1_i(),this._ParameterEdit_ParameterDetails1_i(),this._ParameterEdit_EffectChain1_i(),this._ParameterEdit_EffectPanel1_i(),this._ParameterEdit_CTLList1_i()];
         this.currentState = "effects";
         this._ParameterEdit_ParameterEditLogic1_i();
         states = [new State({
            "name":"effects",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"effectPanel",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"chain",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"effectChain",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"details",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"parameterDetails",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"ctl_list",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"ctlList",
               "name":"visible",
               "value":true
            })]
         })];
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
      
      private function _ParameterEdit_ParameterEditLogic1_i() : ParameterEditLogic
      {
         var _loc1_:ParameterEditLogic = new ParameterEditLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ParameterEdit_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.source = this._embed_mxml___assets_images_bgi_edit_png_201981038;
         _loc1_.initialized(this,"editbg");
         this.editbg = _loc1_;
         BindingManager.executeBindings(this,"editbg",this.editbg);
         return _loc1_;
      }
      
      private function _ParameterEdit_NavigationComponent1_i() : NavigationComponent
      {
         var _loc1_:NavigationComponent = new NavigationComponent();
         _loc1_.y = 10;
         _loc1_.x = 10;
         _loc1_.id = "navi";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.navi = _loc1_;
         BindingManager.executeBindings(this,"navi",this.navi);
         return _loc1_;
      }
      
      private function _ParameterEdit_ParameterDetails1_i() : ParameterDetails
      {
         var _loc1_:ParameterDetails = new ParameterDetails();
         _loc1_.x = 10;
         _loc1_.y = 50;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "parameterDetails";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.parameterDetails = _loc1_;
         BindingManager.executeBindings(this,"parameterDetails",this.parameterDetails);
         return _loc1_;
      }
      
      private function _ParameterEdit_EffectChain1_i() : EffectChain
      {
         var _loc1_:EffectChain = new EffectChain();
         _loc1_.y = 50;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "effectChain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectChain = _loc1_;
         BindingManager.executeBindings(this,"effectChain",this.effectChain);
         return _loc1_;
      }
      
      private function _ParameterEdit_EffectPanel1_i() : EffectPanel
      {
         var _loc1_:EffectPanel = new EffectPanel();
         _loc1_.y = 50;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "effectPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectPanel = _loc1_;
         BindingManager.executeBindings(this,"effectPanel",this.effectPanel);
         return _loc1_;
      }
      
      private function _ParameterEdit_CTLList1_i() : CTLList
      {
         var _loc1_:CTLList = new CTLList();
         _loc1_.y = 50;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "ctlList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlList = _loc1_;
         BindingManager.executeBindings(this,"ctlList",this.ctlList);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ctlList() : CTLList
      {
         return this._1091641689ctlList;
      }
      
      public function set ctlList(param1:CTLList) : void
      {
         var _loc2_:Object = this._1091641689ctlList;
         if(_loc2_ !== param1)
         {
            this._1091641689ctlList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ctlList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editbg() : BitmapImage
      {
         return this._1307828273editbg;
      }
      
      public function set editbg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1307828273editbg;
         if(_loc2_ !== param1)
         {
            this._1307828273editbg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editbg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectChain() : EffectChain
      {
         return this._1635024816effectChain;
      }
      
      public function set effectChain(param1:EffectChain) : void
      {
         var _loc2_:Object = this._1635024816effectChain;
         if(_loc2_ !== param1)
         {
            this._1635024816effectChain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectChain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectPanel() : EffectPanel
      {
         return this._1646834419effectPanel;
      }
      
      public function set effectPanel(param1:EffectPanel) : void
      {
         var _loc2_:Object = this._1646834419effectPanel;
         if(_loc2_ !== param1)
         {
            this._1646834419effectPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ParameterEditLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ParameterEditLogic) : void
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
      public function get navi() : NavigationComponent
      {
         return this._3373990navi;
      }
      
      public function set navi(param1:NavigationComponent) : void
      {
         var _loc2_:Object = this._3373990navi;
         if(_loc2_ !== param1)
         {
            this._3373990navi = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navi",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get parameterDetails() : ParameterDetails
      {
         return this._405137831parameterDetails;
      }
      
      public function set parameterDetails(param1:ParameterDetails) : void
      {
         var _loc2_:Object = this._405137831parameterDetails;
         if(_loc2_ !== param1)
         {
            this._405137831parameterDetails = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"parameterDetails",_loc2_,param1));
            }
         }
      }
   }
}

