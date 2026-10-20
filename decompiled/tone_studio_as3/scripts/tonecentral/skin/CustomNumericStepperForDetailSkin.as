package tonecentral.skin
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.TextInput;
   import spark.primitives.Line;
   import spark.skins.SparkSkin;
   import tonecentral.components.NumericStepper;
   
   public class CustomNumericStepperForDetailSkin extends SparkSkin implements IStateClient2
   {
      
      private var _853009829decrementButton:Button;
      
      private var _454226047incrementButton:Button;
      
      private var _831827669textDisplay:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:NumericStepper;
      
      public function CustomNumericStepperForDetailSkin()
      {
         super();
         mx_internal::_document = this;
         this.minHeight = 30;
         this.minWidth = 37;
         this.mxmlContent = [this._CustomNumericStepperForDetailSkin_Button1_i(),this._CustomNumericStepperForDetailSkin_Line1_c(),this._CustomNumericStepperForDetailSkin_Button2_i(),this._CustomNumericStepperForDetailSkin_TextInput1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
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
      
      private function _CustomNumericStepperForDetailSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.width = 37;
         _loc1_.height = 16;
         _loc1_.tabEnabled = false;
         _loc1_.styleName = "numericStepperUpDetail";
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",CustomButtonSkin);
         _loc1_.id = "incrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.incrementButton = _loc1_;
         BindingManager.executeBindings(this,"incrementButton",this.incrementButton);
         return _loc1_;
      }
      
      private function _CustomNumericStepperForDetailSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.y = 16;
         _loc1_.width = 36;
         _loc1_.stroke = this._CustomNumericStepperForDetailSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CustomNumericStepperForDetailSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         _loc1_.alpha = 1;
         return _loc1_;
      }
      
      private function _CustomNumericStepperForDetailSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 0;
         _loc1_.top = 15;
         _loc1_.width = 37;
         _loc1_.height = 15;
         _loc1_.tabEnabled = false;
         _loc1_.styleName = "numericStepperDownDetail";
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",CustomButtonSkin);
         _loc1_.id = "decrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.decrementButton = _loc1_;
         BindingManager.executeBindings(this,"decrementButton",this.decrementButton);
         return _loc1_;
      }
      
      private function _CustomNumericStepperForDetailSkin_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.percentHeight = 100;
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get decrementButton() : Button
      {
         return this._853009829decrementButton;
      }
      
      public function set decrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._853009829decrementButton;
         if(_loc2_ !== param1)
         {
            this._853009829decrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"decrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get incrementButton() : Button
      {
         return this._454226047incrementButton;
      }
      
      public function set incrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._454226047incrementButton;
         if(_loc2_ !== param1)
         {
            this._454226047incrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : TextInput
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:TextInput) : void
      {
         var _loc2_:Object = this._831827669textDisplay;
         if(_loc2_ !== param1)
         {
            this._831827669textDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : NumericStepper
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:NumericStepper) : void
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

