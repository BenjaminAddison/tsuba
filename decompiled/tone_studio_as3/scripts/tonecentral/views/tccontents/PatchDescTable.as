package tonecentral.views.tccontents
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   public class PatchDescTable extends Group
   {
      
      private var _410956671container:VGroup;
      
      private var _103149406logic:PatchDescTableLogic;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function PatchDescTable()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._PatchDescTable_Rect1_c(),this._PatchDescTable_VGroup1_i()];
         this._PatchDescTable_PatchDescTableLogic1_i();
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
      
      public function set data(param1:XML) : void
      {
         this.logic.data = param1;
      }
      
      private function _PatchDescTable_PatchDescTableLogic1_i() : PatchDescTableLogic
      {
         var _loc1_:PatchDescTableLogic = new PatchDescTableLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _PatchDescTable_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._PatchDescTable_SolidColor1_c();
         _loc1_.stroke = this._PatchDescTable_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PatchDescTable_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4473924;
         return _loc1_;
      }
      
      private function _PatchDescTable_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _PatchDescTable_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.id = "container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : VGroup
      {
         return this._410956671container;
      }
      
      public function set container(param1:VGroup) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : PatchDescTableLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:PatchDescTableLogic) : void
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

