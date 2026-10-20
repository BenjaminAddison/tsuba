package tonecentral.components.edit
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tonecentral.components.chain.CustomNumericStepper;
   import tonecentral.events.ToneCentralEvents;
   
   public class ParamConvertStepper2 extends CustomNumericStepper
   {
      
      private var effectCategory:String = "";
      
      private var effectType:String = "";
      
      private var knobIndex:int = 0;
      
      private var stepperChanged:Boolean = false;
      
      public var updateFromMe80:Boolean = false;
      
      private var changingTimer:Timer = new Timer(200);
      
      private var textInputStyleName:String;
      
      private var textInputChangingStyleName:String;
      
      private var _isInit:Boolean = true;
      
      public function ParamConvertStepper2(param1:Number, param2:Number, param3:Number)
      {
         super(param1,param2,param3);
         this.changingTimer.addEventListener(TimerEvent.TIMER,this.changingTimerHandler,false,0,true);
      }
      
      public function get isInit() : Boolean
      {
         return this._isInit;
      }
      
      public function set isInit(param1:Boolean) : void
      {
         this._isInit = param1;
      }
      
      private function changingTimerHandler(param1:TimerEvent) : void
      {
         this.changingTimer.reset();
         _textInput.styleName = this.textInputStyleName;
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_END));
      }
      
      public function set textValue(param1:String) : void
      {
         _textInput.text = param1;
         textChangeHandler(null);
      }
      
      public function get textValue() : String
      {
         return _textInput.text;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.textInputStyleName = String(_textInput.styleName);
         this.textInputChangingStyleName = this.textInputStyleName + "Changing";
      }
      
      override protected function textInputFocusOutHandler(param1:FocusEvent) : void
      {
         this.stepperChanged = false;
         this.updateFromMe80 = false;
         super.textInputFocusOutHandler(param1);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
      }
      
      override public function get value() : String
      {
         return _textInput.text;
      }
      
      override public function set value(param1:String) : void
      {
         setText(param1);
         if(!this._isInit)
         {
            _textInput.styleName = this.textInputChangingStyleName;
            this.changingTimer.reset();
            this.changingTimer.start();
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGING));
         }
         this.isInit = false;
      }
      
      public function adjustValue(param1:Number) : void
      {
         prevValue = Number(param1);
         _stepper.value = Number(param1);
         _textInput.text = String(param1);
      }
      
      override protected function setTextAndChange(param1:String) : void
      {
         if(isNaN(Number(param1)))
         {
            this.updateFromMe80 = false;
            return;
         }
         var _loc2_:String = param1;
         if(_loc2_ == ".")
         {
            _loc2_ = "0.";
         }
         if(Number(_loc2_) < _minimum)
         {
            _loc2_ = String(_minimum);
         }
         else if(Number(_loc2_) > _maximum)
         {
            _loc2_ = String(_maximum);
         }
         if(isNaN(Number(_loc2_)) || _loc2_ == "" || param1.charAt(param1.length - 1) == ".")
         {
            _textInput.text = _loc2_;
         }
         else if(!isNaN(_maximum) && !isNaN(_minimum))
         {
            if(decimal)
            {
               _textInput.text = Number(param1).toFixed(_precision);
            }
            else
            {
               _textInput.text = _loc2_;
            }
         }
         else
         {
            _textInput.text = _loc2_;
         }
         _stepper.value = Number(_loc2_);
         if(prevValue != _stepper.value && !this._isInit && !this.updateFromMe80)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
         prevValue = _stepper.value;
         this.updateFromMe80 = false;
      }
      
      override protected function stepperChangeHandler(param1:Event) : void
      {
         setText(_stepper.value.toString());
         if(!this._isInit && !this.updateFromMe80)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
         this.updateFromMe80 = false;
      }
   }
}

