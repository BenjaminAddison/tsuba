package jp.co.site4d.skin.desktop
{
   import flash.display.Graphics;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import jp.co.site4d.events.ComponentEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.events.StateChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.RadioButton;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   
   public class ImageRadioButtonSkin extends SparkSkin implements IStateClient2
   {
      
      private static const FLASH_COLOR:uint = 16777215;
      
      private var _1779941047buttonImage:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var upImage:Class;
      
      private var overImage:Class;
      
      private var downImage:Class;
      
      private var disabledImage:Class;
      
      private var selectedImage:Class;
      
      private var flashTimer:Timer;
      
      private var flashMask:UIComponent;
      
      private var _213507019hostComponent:RadioButton;
      
      public function ImageRadioButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ImageRadioButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates"],
            "overrides":[]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
      
      override protected function childrenCreated() : void
      {
         this.upImage = this.hostComponent.getStyle("upImage");
         this.overImage = this.hostComponent.getStyle("overImage");
         this.downImage = this.hostComponent.getStyle("downImage");
         this.disabledImage = this.hostComponent.getStyle("disabledImage");
         this.selectedImage = this.hostComponent.getStyle("selectedImage");
         addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.stateChangeHandler,false,0,true);
         this.hostComponent.addEventListener(ComponentEvent.STYLE_CHANGE,this.styleChangeHandler,false,0,true);
         this.flashMask = new UIComponent();
         addElement(this.flashMask);
      }
      
      private function stateChangeHandler(param1:StateChangeEvent) : void
      {
         this.alpha = 1;
         if(currentState == "over")
         {
            this.buttonImage.source = this.overImage;
         }
         else if(currentState == "down")
         {
            this.buttonImage.source = this.downImage;
         }
         else if(currentState == "disabled")
         {
            if(this.disabledImage)
            {
               this.buttonImage.source = this.disabledImage;
            }
            else
            {
               this.buttonImage.source = this.upImage;
               this.alpha = 0.5;
            }
         }
         else if(currentState == "upAndSelected" || currentState == "overAndSelected" || currentState == "downAndSelected" || currentState == "disabledAndSelected")
         {
            this.buttonImage.source = this.selectedImage;
         }
         else
         {
            this.buttonImage.source = this.upImage;
         }
      }
      
      private function styleChangeHandler(param1:ComponentEvent) : void
      {
         this.upImage = this.hostComponent.getStyle("upImage");
         this.overImage = this.hostComponent.getStyle("overImage");
         this.downImage = this.hostComponent.getStyle("downImage");
         this.disabledImage = this.hostComponent.getStyle("disabledImage");
         this.selectedImage = this.hostComponent.getStyle("selectedImage");
         this.stateChangeHandler(null);
      }
      
      public function flash() : void
      {
         var _loc1_:Graphics = this.flashMask.graphics;
         _loc1_.beginFill(FLASH_COLOR,0.3);
         _loc1_.drawRect(0,0,this.width,this.height);
         _loc1_.endFill();
         this.flashTimer = new Timer(200,1);
         this.flashTimer.addEventListener(TimerEvent.TIMER,this.onFlashEnd,false,0,true);
         this.flashTimer.start();
      }
      
      private function onFlashEnd(param1:TimerEvent) : void
      {
         this.flashTimer.reset();
         this.flashTimer.removeEventListener(TimerEvent.TIMER,this.onFlashEnd);
         this.flashTimer = null;
         this.flashMask.graphics.clear();
      }
      
      private function _ImageRadioButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.scaleMode = "letterbox";
         _loc1_.fillMode = "scale";
         _loc1_.initialized(this,"buttonImage");
         this.buttonImage = _loc1_;
         BindingManager.executeBindings(this,"buttonImage",this.buttonImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonImage() : BitmapImage
      {
         return this._1779941047buttonImage;
      }
      
      public function set buttonImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1779941047buttonImage;
         if(_loc2_ !== param1)
         {
            this._1779941047buttonImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : RadioButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:RadioButton) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

