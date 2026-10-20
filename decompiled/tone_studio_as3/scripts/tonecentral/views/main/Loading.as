package tonecentral.views.main
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.primitives.Rect;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class Loading extends Group
   {
      
      private static const LOADING_FILE:Class = Loading_LOADING_FILE;
      
      private var _1187015645movieArea:UIComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var mediator:ToneCentralMediator;
      
      public function Loading()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._Loading_Rect1_c(),this._Loading_UIComponent1_i()];
         this.addEventListener("creationComplete",this.___Loading_Group1_creationComplete);
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
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         var _loc2_:DisplayObject = new LOADING_FILE();
         this.movieArea.addChild(_loc2_);
         this.addEventListener(MouseEvent.MOUSE_UP,this.loadingMouseUpHandler,false,0,true);
      }
      
      private function loadingMouseUpHandler(param1:MouseEvent) : void
      {
         if(this.mediator.selectedMode == Mode.LIBRARY && this.mediator.selectedArea == ToneCentralDefinition.CONTENTS_AREA && this.mediator.isPatchListMouseDown)
         {
            this.mediator.isPatchListMouseDown = false;
            this.mediator.libraryMouseUp();
         }
      }
      
      private function _Loading_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._Loading_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Loading_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.6;
         return _loc1_;
      }
      
      private function _Loading_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.id = "movieArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieArea = _loc1_;
         BindingManager.executeBindings(this,"movieArea",this.movieArea);
         return _loc1_;
      }
      
      public function ___Loading_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get movieArea() : UIComponent
      {
         return this._1187015645movieArea;
      }
      
      public function set movieArea(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1187015645movieArea;
         if(_loc2_ !== param1)
         {
            this._1187015645movieArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieArea",_loc2_,param1));
            }
         }
      }
   }
}

