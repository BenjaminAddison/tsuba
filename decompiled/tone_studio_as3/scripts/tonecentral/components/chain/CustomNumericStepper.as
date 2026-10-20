package tonecentral.components.chain
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.system.IME;
   import mx.events.FlexEvent;
   import mx.managers.IFocusManagerComponent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.skins.spark.FocusSkin;
   import tonecentral.components.NumericStepper;
   import tonecentral.components.NumericTextInput;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.skin.CustomNumericStepperBlackSkin;
   import tonecentral.skin.CustomNumericStepperForDetailSkin;
   import tonecentral.skin.CustomNumericStepperSkin;
   
   public class CustomNumericStepper extends Group implements IFocusManagerComponent
   {
      
      protected static const INTEGER_RESTRICT:String = "0-9";
      
      protected static const INTEGER_RESTRICT_WITH_MINUS:String = "\\-0-9";
      
      protected static const DECIMAL_RESTRICT:String = "0-9.";
      
      protected static const DECIMAL_RESTRICT_WITH_MINUS:String = "\\-0-9.";
      
      private var bgBlack:Class = CustomNumericStepper_bgBlack;
      
      private var bgImage:BitmapImage;
      
      protected var stepWidth:Number;
      
      protected var _textInput:NumericTextInput = new NumericTextInput();
      
      protected var _stepper:NumericStepper = new NumericStepper();
      
      private var _defaultValue:Number;
      
      protected var _maximum:Number;
      
      protected var _minimum:Number;
      
      private var _stepSize:Number;
      
      protected var _midiOffset:Number;
      
      protected var _decimal:Boolean;
      
      protected var _precision:int = 0;
      
      protected var prevValue:Number;
      
      protected var maxLen:int;
      
      protected var maxLenMinus:int;
      
      protected var prevVal:String;
      
      public function CustomNumericStepper(param1:Number, param2:Number, param3:Number)
      {
         super();
         this.width = param1;
         this.height = param2;
         this.stepWidth = param3;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this._stepper.enabled = param1;
         this._textInput.enabled = param1;
         this._textInput.visible = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this._stepper.x = this.width - this.stepWidth;
         this._textInput.width = this.width - this.stepWidth;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this._stepper.height = this.height;
         this._textInput.height = this.height;
      }
      
      public function get maximum() : Number
      {
         return this._maximum;
      }
      
      public function set maximum(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         this._maximum = param1;
         this._stepper.maximum = param1;
         this._textInput.maxChars = String(param1).length;
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      public function set minimum(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         this._minimum = param1;
         this._stepper.minimum = param1;
         if(this._textInput.maxChars < String(param1).length)
         {
            this._textInput.maxChars = String(param1).length;
         }
         if(param1 < 0)
         {
            this._textInput.restrict = this._decimal ? DECIMAL_RESTRICT_WITH_MINUS : INTEGER_RESTRICT_WITH_MINUS;
         }
         else
         {
            this._textInput.restrict = this._decimal ? DECIMAL_RESTRICT : INTEGER_RESTRICT;
         }
      }
      
      public function get stepSize() : Number
      {
         return this._stepSize;
      }
      
      public function set stepSize(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         this._stepSize = param1;
         this._stepper.stepSize = param1;
         this._stepper.snapInterval = param1;
      }
      
      public function get midiOffset() : Number
      {
         if(isNaN(this._midiOffset))
         {
            return 0;
         }
         return this._midiOffset;
      }
      
      public function set midiOffset(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         this._midiOffset = param1;
         if(this._midiOffset < 0)
         {
            this._midiOffset = 0;
         }
      }
      
      public function get decimal() : Boolean
      {
         return this._decimal;
      }
      
      public function set decimal(param1:Boolean) : void
      {
         this._decimal = param1;
         if(param1)
         {
            this._textInput.restrict = this._minimum < 0 ? DECIMAL_RESTRICT_WITH_MINUS : DECIMAL_RESTRICT;
         }
         else
         {
            this._textInput.restrict = this._minimum < 0 ? INTEGER_RESTRICT_WITH_MINUS : INTEGER_RESTRICT;
         }
      }
      
      public function get value() : String
      {
         return this._textInput.text;
      }
      
      public function set value(param1:String) : void
      {
         this.setText(param1);
      }
      
      public function get precision() : int
      {
         return this._precision;
      }
      
      public function set precision(param1:int) : void
      {
         this._precision = param1;
         this.decimal = param1 > 0;
      }
      
      public function set defaultValue(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         this._defaultValue = param1;
         this._stepper.value = param1;
      }
      
      protected function setText(param1:String) : void
      {
         if(param1 == "")
         {
            return;
         }
         if(Number(this._textInput.text) == Number(param1) && param1 != "0")
         {
            this._textInput.text = Number(param1).toFixed(this._precision);
            return;
         }
         if(Number(param1) > this._maximum || Number(param1) < this._minimum)
         {
            return;
         }
         if(param1 == "-")
         {
            return;
         }
         if(param1 == "" || isNaN(Number(param1)) || param1.charAt(param1.length - 1) == ".")
         {
            this.setTextAndChange(param1);
         }
         else if(this._precision > 0)
         {
            this.setTextAndChange(Number(param1).toFixed(this._precision));
         }
         else
         {
            this.setTextAndChange(param1);
         }
      }
      
      protected function setTextAndChange(param1:String) : void
      {
         if(isNaN(Number(param1)))
         {
            return;
         }
         if(Number(param1) > this._maximum || Number(param1) < this._minimum)
         {
            return;
         }
         var _loc2_:String = param1;
         if(_loc2_ == ".")
         {
            _loc2_ = "0.";
         }
         if(isNaN(Number(_loc2_)) || _loc2_ == "" || param1.charAt(param1.length - 1) == ".")
         {
            this._textInput.text = _loc2_;
         }
         else if(!isNaN(this._maximum) && !isNaN(this._minimum))
         {
            if(this.decimal)
            {
               this._textInput.text = Number(param1).toFixed(this._precision);
            }
            else
            {
               this._textInput.text = _loc2_;
            }
         }
         else
         {
            this._textInput.text = _loc2_;
         }
         this._stepper.value = Number(_loc2_);
         if(this.prevValue != this._stepper.value)
         {
            this.prevValue = this._stepper.value;
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override protected function createChildren() : void
      {
         this.bgImage = new BitmapImage();
         addElement(this.bgImage);
         this._stepper.x = this.width - this.stepWidth;
         this._stepper.y = 0;
         this._stepper.width = this.stepWidth;
         this._stepper.height = this.height;
         this._textInput.y = 2;
         if(this.stepWidth == 27)
         {
            this._stepper.setStyle("skinClass",CustomNumericStepperSkin);
            this._textInput.styleName = "numericStepper";
            this._textInput.x = 0;
            this._textInput.width = this.width - this.stepWidth - 8;
         }
         else if(this.stepWidth == 30)
         {
            this._textInput.y = 0;
            this._stepper.setStyle("skinClass",CustomNumericStepperBlackSkin);
            this.bgImage.width = this.width;
            this.bgImage.height = this.height;
            this.bgImage.source = this.bgBlack;
            this._textInput.styleName = "numericStepperBlack";
            this._textInput.x = 5;
            this._textInput.width = this.width - this.stepWidth - 5;
         }
         else if(this.stepWidth == 35)
         {
            this._stepper.setStyle("skinClass",CustomNumericStepperForDetailSkin);
            this._textInput.styleName = "numericStepperDetail";
            this._textInput.x = 0;
            this._textInput.width = this.width - this.stepWidth - 8;
         }
         this._stepper.focusRect = false;
         this._stepper.drawFocus(false);
         this._stepper.addEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler,false,0,true);
         this._stepper.addEventListener(FocusEvent.FOCUS_IN,this.focusInHandler,false,0,true);
         this._stepper.addEventListener(Event.CHANGE,this.stepperChangeHandler,false,0,true);
         this._stepper.validateNow();
         this._textInput.height = this.height;
         this._textInput.focusRect = false;
         this._textInput.addEventListener(FocusEvent.FOCUS_IN,this.focusInHandler,false,0,true);
         this._textInput.addEventListener(FlexEvent.ENTER,this.textInputEnterHandler,false,0,true);
         this._textInput.addEventListener(FocusEvent.FOCUS_OUT,this.textInputFocusOutHandler,false,0,true);
         this._textInput.validateNow();
         addEventListener(Event.ADDED_TO_STAGE,this.addToStageHandler,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removeFromStageHandler,false,0,true);
         addElement(this._textInput);
         addElement(this._stepper);
      }
      
      protected function textInputFocusOutHandler(param1:FocusEvent) : void
      {
         if(this._textInput.text == "")
         {
            this._textInput.text = this._stepper.value.toString();
         }
         this.textChangeHandler(null);
      }
      
      private function textInputEnterHandler(param1:FlexEvent) : void
      {
         this.textChangeHandler(null);
      }
      
      private function addToStageHandler(param1:Event) : void
      {
         addElement(this._textInput);
         addElement(this._stepper);
      }
      
      private function removeFromStageHandler(param1:Event) : void
      {
         removeElement(this._textInput);
         removeElement(this._stepper);
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         if(param1.currentTarget.getChildAt(0) is FocusSkin)
         {
            param1.currentTarget.getChildAt(0).visible = false;
         }
         IME.enabled = false;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      protected function textChangeHandler(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         if(this._textInput.text == "" || this._textInput.text == "-")
         {
            this.setText(this._textInput.text);
         }
         else
         {
            _loc2_ = this._textInput.text;
            _loc3_ = ".";
            _loc4_ = "-";
            _loc5_ = false;
            _loc6_ = _loc2_;
            _loc7_ = "";
            _loc8_ = false;
            this.maxLen = Math.abs(Math.floor(Number(this._maximum))).toString().length;
            this.maxLenMinus = Math.abs(Math.floor(Number(this._minimum))).toString().length;
            if(_loc2_.indexOf(_loc4_) != -1)
            {
               _loc5_ = true;
               if(_loc2_.indexOf(_loc3_) != -1)
               {
                  _loc6_ = _loc2_.substr(1,_loc2_.indexOf(_loc3_));
                  _loc7_ = _loc2_.substr(_loc2_.indexOf(_loc3_) + 1);
               }
               else
               {
                  _loc6_ = _loc2_.substr(1);
               }
            }
            else
            {
               _loc5_ = false;
               if(_loc2_.indexOf(_loc3_) != -1)
               {
                  _loc6_ = _loc2_.substr(0,_loc2_.indexOf(_loc3_));
                  _loc7_ = _loc2_.substr(_loc2_.indexOf(_loc3_) + 1);
               }
               else
               {
                  _loc6_ = _loc2_.substr(0);
               }
            }
            if(_loc5_)
            {
               if(_loc6_.length > this.maxLenMinus)
               {
                  _loc8_ = true;
                  this._textInput.text = this.prevVal;
               }
            }
            else if(_loc6_.length > this.maxLen)
            {
               _loc8_ = true;
               this._textInput.text = this.prevVal;
            }
            if(this._decimal)
            {
               if(_loc7_.length > this._precision)
               {
                  _loc8_ = true;
                  this._textInput.text = this.prevVal;
               }
            }
            if(!_loc8_)
            {
               this.prevVal = this._textInput.text;
            }
            this.setTextAndChange(this._textInput.text);
         }
      }
      
      protected function stepperChangeHandler(param1:Event) : void
      {
         this.setText(this._stepper.value.toString());
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         var _loc2_:String = this._textInput.text;
         var _loc3_:Number = Number(_loc2_);
         if(_loc2_ == ".")
         {
            _loc3_ = 0;
         }
         var _loc4_:int = _loc2_.indexOf(".");
         if(!this._textInput.text || this._textInput.text == "" || isNaN(_loc3_))
         {
            _loc3_ = isNaN(this._defaultValue) ? this._minimum : this._defaultValue;
            this._stepper.value = _loc3_;
            if(Boolean(this._precision) && _loc4_ == -1)
            {
               if(this.decimal)
               {
                  this._textInput.text = _loc3_.toFixed(this._precision);
               }
               else
               {
                  this._textInput.text = _loc3_.toString();
               }
            }
            else
            {
               this._textInput.text = _loc3_.toString();
            }
         }
         else
         {
            if(Boolean(this._precision) && _loc4_ == -1)
            {
               if(this.decimal)
               {
                  this._textInput.text = _loc3_.toFixed(this._precision);
               }
               else
               {
                  this._textInput.text = _loc3_.toString();
               }
            }
            if(_loc3_ > this._maximum)
            {
               this._stepper.value = this._maximum;
               if(this.decimal)
               {
                  this._textInput.text = this._maximum.toFixed(this._precision);
               }
               else
               {
                  this._textInput.text = this._maximum.toString();
               }
            }
            else if(_loc3_ < this._minimum)
            {
               this._stepper.value = this._minimum;
               if(this.decimal)
               {
                  this._textInput.text = this._minimum.toFixed(this._precision);
               }
               else
               {
                  this._textInput.text = this._minimum.toString();
               }
            }
            else
            {
               this._stepper.value = _loc3_;
               if(this.decimal)
               {
                  this._textInput.text = _loc3_.toFixed(this._precision);
               }
               else
               {
                  this._textInput.text = _loc3_.toString();
               }
            }
         }
         this.setText(this._textInput.text);
         IME.enabled = true;
      }
   }
}

