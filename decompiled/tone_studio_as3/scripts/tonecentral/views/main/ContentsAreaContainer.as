package tonecentral.views.main
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.Rect;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.Mode;
   import tonecentral.views.edit.ContentsArea;
   import tonecentral.views.edit.playmenu.PlayMenu;
   import tonecentral.views.library.LibContentsArea;
   import tonecentral.views.tccontents.TCContentsArea;
   
   public class ContentsAreaContainer extends Group implements IStateClient2
   {
      
      public var _ContentsAreaContainer_Rect1:Rect;
      
      private var _848790215contentsArea:ContentsArea;
      
      private var _387176940libContentsArea:LibContentsArea;
      
      private var _103149406logic:ContentsAreaContainerLogic;
      
      private var _1879500435playmenu:PlayMenu;
      
      private var _779241770tcContentsArea:TCContentsArea;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ContentsAreaContainer()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._ContentsAreaContainer_Rect1_i(),this._ContentsAreaContainer_PlayMenu1_i()];
         this.currentState = "editor";
         this._ContentsAreaContainer_ContentsAreaContainerLogic1_i();
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ContentsAreaContainer_ContentsArea1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ContentsAreaContainer_LibContentsArea1_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ContentsAreaContainer_TCContentsArea1_i);
         states = [new State({
            "name":"editor",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ContentsAreaContainer_Rect1"]
            })]
         }),new State({
            "name":"library",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ContentsAreaContainer_Rect1"]
            })]
         }),new State({
            "name":"toneCentral",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ContentsAreaContainer_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"playmenu",
               "name":"visible",
               "value":false
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
      
      public function set mode(param1:Mode) : void
      {
         this.logic.mode = param1;
      }
      
      public function resetSelected() : void
      {
         if(currentState == "library")
         {
            this.libContentsArea.resetSelected();
         }
      }
      
      public function patchCopy() : Vector.<PatchData>
      {
         var _loc1_:Vector.<PatchData> = null;
         if(currentState == "library")
         {
            _loc1_ = this.libContentsArea.patchCopy();
         }
         return _loc1_;
      }
      
      public function patchPaste(param1:Vector.<PatchData>, param2:String) : void
      {
         if(currentState == "library")
         {
            this.libContentsArea.patchPaste(param1,param2);
         }
      }
      
      public function sidePatchDragComplete() : void
      {
         this.logic.sidePatchDragComplete();
      }
      
      public function sidePatchDragStart() : void
      {
         this.logic.sidePatchDragStart();
      }
      
      private function _ContentsAreaContainer_ContentsAreaContainerLogic1_i() : ContentsAreaContainerLogic
      {
         var _loc1_:ContentsAreaContainerLogic = new ContentsAreaContainerLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ContentsAreaContainer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ContentsAreaContainer_SolidColor1_c();
         _loc1_.initialized(this,"_ContentsAreaContainer_Rect1");
         this._ContentsAreaContainer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ContentsAreaContainer_Rect1",this._ContentsAreaContainer_Rect1);
         return _loc1_;
      }
      
      private function _ContentsAreaContainer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6776679;
         return _loc1_;
      }
      
      private function _ContentsAreaContainer_ContentsArea1_i() : ContentsArea
      {
         var _loc1_:ContentsArea = new ContentsArea();
         _loc1_.bottom = 42;
         _loc1_.id = "contentsArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentsArea = _loc1_;
         BindingManager.executeBindings(this,"contentsArea",this.contentsArea);
         return _loc1_;
      }
      
      private function _ContentsAreaContainer_LibContentsArea1_i() : LibContentsArea
      {
         var _loc1_:LibContentsArea = new LibContentsArea();
         _loc1_.bottom = 42;
         _loc1_.id = "libContentsArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.libContentsArea = _loc1_;
         BindingManager.executeBindings(this,"libContentsArea",this.libContentsArea);
         return _loc1_;
      }
      
      private function _ContentsAreaContainer_TCContentsArea1_i() : TCContentsArea
      {
         var _loc1_:TCContentsArea = new TCContentsArea();
         _loc1_.id = "tcContentsArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tcContentsArea = _loc1_;
         BindingManager.executeBindings(this,"tcContentsArea",this.tcContentsArea);
         return _loc1_;
      }
      
      private function _ContentsAreaContainer_PlayMenu1_i() : PlayMenu
      {
         var _loc1_:PlayMenu = new PlayMenu();
         _loc1_.percentWidth = 100;
         _loc1_.height = 42;
         _loc1_.bottom = 0;
         _loc1_.visible = true;
         _loc1_.id = "playmenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playmenu = _loc1_;
         BindingManager.executeBindings(this,"playmenu",this.playmenu);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get contentsArea() : ContentsArea
      {
         return this._848790215contentsArea;
      }
      
      public function set contentsArea(param1:ContentsArea) : void
      {
         var _loc2_:Object = this._848790215contentsArea;
         if(_loc2_ !== param1)
         {
            this._848790215contentsArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentsArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get libContentsArea() : LibContentsArea
      {
         return this._387176940libContentsArea;
      }
      
      public function set libContentsArea(param1:LibContentsArea) : void
      {
         var _loc2_:Object = this._387176940libContentsArea;
         if(_loc2_ !== param1)
         {
            this._387176940libContentsArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"libContentsArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ContentsAreaContainerLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ContentsAreaContainerLogic) : void
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
      public function get playmenu() : PlayMenu
      {
         return this._1879500435playmenu;
      }
      
      public function set playmenu(param1:PlayMenu) : void
      {
         var _loc2_:Object = this._1879500435playmenu;
         if(_loc2_ !== param1)
         {
            this._1879500435playmenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playmenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tcContentsArea() : TCContentsArea
      {
         return this._779241770tcContentsArea;
      }
      
      public function set tcContentsArea(param1:TCContentsArea) : void
      {
         var _loc2_:Object = this._779241770tcContentsArea;
         if(_loc2_ !== param1)
         {
            this._779241770tcContentsArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tcContentsArea",_loc2_,param1));
            }
         }
      }
   }
}

