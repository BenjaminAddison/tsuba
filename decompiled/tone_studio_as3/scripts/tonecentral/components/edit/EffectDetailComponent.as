package tonecentral.components.edit
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.utils.Timer;
   import mx.collections.ArrayCollection;
   import mx.core.UIComponent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.events.IndexChangeEvent;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.CustomDropDownList;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class EffectDetailComponent extends Group
   {
      
      private static const WIDTH:Number = 255;
      
      private static const HEIGHT:Number = 35;
      
      private var _paramName:String;
      
      private var _max:Number;
      
      private var _min:Number;
      
      private var _step:Number;
      
      private var _precision:int;
      
      private var _stepper:ParamConvertStepper2;
      
      private var dropDown:CustomDropDownList;
      
      private var _address:String;
      
      private var _updateFromMe80:Boolean = false;
      
      private var textBoxBgi:UIComponent;
      
      private var textBoxBgi2:UIComponent;
      
      private var paramNameLabel:Label;
      
      private var point:Sprite;
      
      private var _pointX:Number;
      
      private var _pointY:Number;
      
      private var _arrowBgi:BitmapImage;
      
      private var tmpParamVal:Number;
      
      private var _selected:Boolean;
      
      private var changing:Boolean;
      
      private var sysex:SystemExclusive;
      
      public var dropDownDataList:Array;
      
      private var _knobIndex:int;
      
      private var _isConvert:Boolean;
      
      private var effectCategory:String;
      
      private var _stepperEnabeld:Boolean = true;
      
      private var adressMap:AddressMap;
      
      private var _key:String = "";
      
      private var isStepperDropdown:Boolean = false;
      
      private var stepperDropdownData:Object;
      
      private var _data:Object;
      
      public function EffectDetailComponent()
      {
         super();
         this.width = WIDTH;
         this.height = HEIGHT;
         this.includeInLayout = true;
         this.sysex = SystemExclusive.getInstance();
         this.adressMap = AddressMap.getInstance();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.point.visible = param1;
         this.setFieldColor(param1);
      }
      
      public function get knobIndex() : int
      {
         return this._knobIndex;
      }
      
      override public function set tabIndex(param1:int) : void
      {
         this._stepper.tabIndex = param1;
      }
      
      public function setdata(param1:Object) : void
      {
         this.updateFromMe80 = true;
         this._data = param1;
         this._key = param1.id;
         this.tmpParamVal = param1.value;
         this.max = param1.max;
         this.min = param1.min;
         this.step = param1.step;
         this._precision = param1.precision;
         this._address = param1.address;
         this.createView();
         this.paramName = param1.name;
         this.updateFromMe80 = false;
      }
      
      private function createView() : void
      {
         this.addLabel();
         this.addStepper();
      }
      
      public function adjustHarmonistCodeLabel(param1:Object) : void
      {
         var _loc4_:Array = null;
         var _loc2_:String = "";
         var _loc3_:Number = ParameterDefinitionGT.getHarmonistCodeIndex(param1.id);
         if(!isNaN(_loc3_))
         {
            _loc4_ = this.paramNameLabel.text.split(":");
            this.paramNameLabel.text = _loc4_[0] + ":" + ParameterDefinitionGT.getHarmonistCodeName(_loc3_);
         }
      }
      
      private function addLabel() : void
      {
         this.paramNameLabel = new Label();
         this.paramNameLabel.buttonMode = true;
         this.paramNameLabel.styleName = "detailParamName";
         this.paramNameLabel.width = 105;
         this.paramNameLabel.maxDisplayedLines = 1;
         this.paramNameLabel.height = 30;
         this.paramNameLabel.x = 20;
         this.paramNameLabel.y = 10;
         this.paramNameLabel.addEventListener(MouseEvent.CLICK,this.nameLabelClickHandler,false,0,true);
         addElement(this.paramNameLabel);
         var _loc1_:UIComponent = new UIComponent();
         this.point = new Sprite();
         this._pointX = 8;
         this._pointY = 19;
         this.point.graphics.lineStyle(3,9430271,1);
         this.point.graphics.beginFill(9430271,1);
         this.point.graphics.drawCircle(this._pointX,this._pointY,1);
         this.point.graphics.endFill();
         this.point.filters = [new DropShadowFilter(2,90)];
         this.point.visible = false;
         _loc1_.addChild(this.point);
         addElement(_loc1_);
      }
      
      private function nameLabelClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function addStepper() : void
      {
         this.textBoxBgi = new UIComponent();
         this.textBoxBgi.width = 95;
         this.textBoxBgi.height = 30;
         this.textBoxBgi.x = 128;
         this.textBoxBgi.y = 0;
         addElement(this.textBoxBgi);
         this._stepper = new ParamConvertStepper2(135,30,35);
         this._stepper.x = 130;
         this._stepper.y = 0;
         this._stepper.maximum = this.max;
         this._stepper.minimum = this.min;
         this._stepper.stepSize = this.step;
         this._stepper.precision = this.precision;
         this._stepper.addEventListener(Event.CHANGE,this.changeHandler,false,0,true);
         this._stepper.addEventListener(ToneCentralEvents.CHANGING,this.stepperChangingHandler,false,0,true);
         this._stepper.addEventListener(ToneCentralEvents.CHANGE_END,this.stepperChangeEndHandler,false,0,true);
         this._stepper.addEventListener(ToneCentralEvents.SELECT,this.stepperSelectHandler,false,0,true);
         addElement(this._stepper);
      }
      
      private function getDropDownIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.isStepperDropdown)
         {
            _loc2_ = 0;
            while(_loc2_ < this.dropDown.dataProvider.length)
            {
               if(this.dropDown.dataProvider.getItemAt(_loc2_).val == param1)
               {
                  return _loc2_;
               }
               _loc2_++;
            }
            return 0;
         }
         return int(this._stepper.textValue);
      }
      
      private function getStepperVal() : String
      {
         return String(this.dropDown.selectedIndex);
      }
      
      private function stepperSelectHandler(param1:ToneCentralEvents) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function changeHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         if(Boolean(!this.isStepperDropdown) && Boolean(this.dropDown) && this.dropDown.selectedIndex != this.getDropDownIndex(Number(this._stepper.value)))
         {
            this.dropDown.selectedIndex = this.getDropDownIndex(Number(this._stepper.value));
         }
         if(!this.updateFromMe80)
         {
            _loc2_ = Number(this._stepper.value);
            if(this._stepper.minimum < 0)
            {
               _loc2_ -= this._stepper.minimum;
            }
            if(this.isStepperDropdown)
            {
               _loc2_ += this.stepperDropdownData.stepperIndex;
            }
            if(this.step != 0)
            {
               _loc4_ = _loc2_ / this.step;
               if(_loc4_.toString().indexOf(".") != -1)
               {
                  this._stepper.adjustValue(_loc2_ - 1);
               }
            }
            else
            {
               _loc4_ = _loc2_;
            }
            if(!ParameterUtil.isDoubleByteAddress(this.address))
            {
               _loc3_ = ToneCentralUtil.convertHexaDecimal(String(_loc4_),2);
            }
            else
            {
               _loc3_ = this.getDoubleByteValue(_loc4_);
            }
            this.sysex.setDataFunc(this.address,_loc3_);
         }
         this.updateFromMe80 = false;
      }
      
      public function getDoubleByteValue(param1:int) : String
      {
         var _loc2_:Number = Math.floor(param1 / 128);
         var _loc3_:Number = param1 % 128;
         return ToneCentralUtil.convertHexaDecimalArray([_loc2_,_loc3_],2).join(",");
      }
      
      public function setFieldColor(param1:Boolean) : void
      {
         var _loc2_:Class = null;
         if(this.changing)
         {
            return;
         }
         if(this.selected)
         {
            this.drawBgi(this.textBoxBgi,"selected");
            if(this.isStepperDropdown)
            {
               this.drawBgi(this.textBoxBgi2,"selected");
            }
         }
         else
         {
            this.drawBgi(this.textBoxBgi,"normal");
            if(this.isStepperDropdown)
            {
               this.drawBgi(this.textBoxBgi2,"normal");
            }
         }
      }
      
      private function stepperChangeEndHandler(param1:ToneCentralEvents) : void
      {
         if(this.selected)
         {
            this.drawBgi(this.textBoxBgi,"selected");
            if(this.isStepperDropdown)
            {
               this.drawBgi(this.textBoxBgi2,"selected");
            }
         }
         else
         {
            this.drawBgi(this.textBoxBgi,"normal");
            if(this.isStepperDropdown)
            {
               this.drawBgi(this.textBoxBgi2,"normal");
            }
         }
         this.paramNameLabel.styleName = "detailParamName";
         if(this.dropDown)
         {
            this.dropDown.styleName = "effectDetailBlueDropDown";
         }
         this.changing = false;
      }
      
      private function stepperChangingHandler(param1:ToneCentralEvents) : void
      {
         this.drawBgi(this.textBoxBgi,"changing");
         if(this.isStepperDropdown)
         {
            this.drawBgi(this.textBoxBgi2,"changing");
         }
         this.paramNameLabel.styleName = "detailParamNameChanging";
         if(this.dropDown)
         {
            this.dropDown.styleName = "effectDetailRedDropDown";
         }
         this.changing = true;
      }
      
      private function drawBgi(param1:UIComponent, param2:String) : void
      {
         var _loc3_:Graphics = param1.graphics;
         _loc3_.clear();
         if(param2 == "selected")
         {
            _loc3_.lineStyle(1,9495807);
            _loc3_.beginFill(9495807,0.5);
         }
         else if(param2 == "changing")
         {
            _loc3_.lineStyle(1,16729413);
            _loc3_.beginFill(16729413,0.3);
         }
         else
         {
            _loc3_.lineStyle(1,9495807);
         }
         _loc3_.drawRoundRect(0.5,0.5,param1.width,param1.height - 1,6,6);
         _loc3_.endFill();
      }
      
      public function setEffectType(param1:String, param2:String, param3:int, param4:String) : void
      {
         var _loc5_:Object = null;
         if(this.dropDown)
         {
            return;
         }
         this._knobIndex = param3;
         this.effectCategory = param1;
         this._stepper.updateFromMe80 = true;
         if(this._stepper.minimum >= 0)
         {
            this._stepper.value = String(this.tmpParamVal);
         }
         else
         {
            this._stepper.value = String(this.tmpParamVal + this._stepper.minimum);
         }
         if(ParameterDefinitionGT.DROPDOWN_LIST.hasOwnProperty(param4))
         {
            this._stepper.visible = false;
            this.dropDown = new CustomDropDownList();
            this.dropDown.styleName = "effectDetailBlueDropDown";
            this.dropDown.width = 138;
            this.dropDown.height = 30;
            this.dropDown.x = 128;
            addElement(this.dropDown);
            this.textBoxBgi.width = 137;
            this.dropDownDataList = ParameterDefinitionGT.DROPDOWN_LIST[param4];
            this.dropDown.dataProvider = new ArrayCollection(this.dropDownDataList);
            this.dropDown.enabled = this._stepperEnabeld;
            if(this._stepperEnabeld)
            {
               this.dropDown.addEventListener(FocusEvent.FOCUS_IN,this.dropdownFocusInHandler,false,0,true);
               this.dropDown.addEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler,false,0,true);
               this.dropDown.selectedIndex = this.getDropDownIndex(Number(this._stepper.value));
            }
         }
         else if(ParameterDefinitionGT.STEPPER_AND_DROPDOWN_LIST.hasOwnProperty(param4))
         {
            this.isStepperDropdown = true;
            _loc5_ = ParameterDefinitionGT.STEPPER_AND_DROPDOWN_LIST[param4];
            this.stepperDropdownData = _loc5_;
            this.height = 70;
            this.textBoxBgi.y = 35;
            this._stepper.y = 35;
            this._stepper.maximum = _loc5_.max;
            this._stepper.minimum = _loc5_.min;
            this._stepper.stepSize = _loc5_.step;
            this._stepper.precision = _loc5_.precision;
            this.textBoxBgi2 = new UIComponent();
            this.textBoxBgi2.width = 137;
            this.textBoxBgi2.height = 30;
            this.textBoxBgi2.x = 128;
            this.textBoxBgi2.y = 0;
            addElement(this.textBoxBgi2);
            this.dropDown = new CustomDropDownList();
            this.dropDown.styleName = "effectDetailBlueDropDown";
            this.dropDown.width = 138;
            this.dropDown.height = 30;
            this.dropDown.x = 128;
            this.dropDown.addEventListener(IndexChangeEvent.CHANGE,this.stepperDropDownChangeHandler,false,0,true);
            this.dropDown.labelField = "name";
            addElement(this.dropDown);
            this.dropDown.dataProvider = new ArrayCollection(_loc5_.dropdown);
            if(this.tmpParamVal >= this._stepper.minimum + this.stepperDropdownData.stepperIndex && this.tmpParamVal <= this._stepper.maximum + this.stepperDropdownData.stepperIndex)
            {
               this.dropDown.selectedIndex = _loc5_.stepperIndex;
            }
            else
            {
               this.dropDown.selectedIndex = this.getDropDownIndex(this.tmpParamVal);
               this._stepper.enabled = false;
               this.textBoxBgi.alpha = 0.3;
            }
         }
      }
      
      private function stepperDropDownChangeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(this.dropDown.selectedIndex == this.stepperDropdownData.stepperIndex)
         {
            this._stepper.enabled = true;
            this.textBoxBgi.alpha = 1;
            if(int(this._stepper.value) > this._stepper.maximum)
            {
               this._stepper.value = String(this._stepper.maximum);
            }
            if(!ParameterUtil.isDoubleByteAddress(this.address))
            {
               _loc2_ = ToneCentralUtil.convertHexaDecimal(String(int(this._stepper.value) + this.stepperDropdownData.stepperIndex),2);
            }
            else
            {
               _loc2_ = this.getDoubleByteValue(int(this._stepper.value) + this.stepperDropdownData.stepperIndex);
            }
         }
         else
         {
            _loc3_ = int(this.dropDown.selectedItem.val);
            if(!ParameterUtil.isDoubleByteAddress(this.address))
            {
               _loc2_ = ToneCentralUtil.convertHexaDecimal(String(_loc3_),2);
            }
            else
            {
               _loc2_ = this.getDoubleByteValue(_loc3_);
            }
         }
         this.sysex.setDataFunc(this.address,_loc2_);
      }
      
      private function dropdownFocusInHandler(param1:FocusEvent) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function dropDownChangeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:String = null;
         this._stepper.textValue = this.getStepperVal();
         if(!this.updateFromMe80)
         {
            _loc2_ = ToneCentralUtil.convertHexaDecimal(this._stepper.value,2);
            this.sysex.setDataFunc(this.address,_loc2_);
         }
         this.updateFromMe80 = false;
      }
      
      public function get paramName() : String
      {
         return this._paramName;
      }
      
      public function set paramName(param1:String) : void
      {
         this._paramName = param1;
         if(this.paramNameLabel)
         {
            this.paramNameLabel.text = param1;
            ToneCentralUtil.setToolTipData(this.paramNameLabel);
         }
      }
      
      public function get paramVal() : Number
      {
         if(this._stepper)
         {
            return Number(this._stepper.value);
         }
         return NaN;
      }
      
      public function set paramVal(param1:Number) : void
      {
         var _loc2_:Timer = null;
         if(this._stepper)
         {
            if(this.isStepperDropdown)
            {
               if(param1 >= this._stepper.minimum + this.stepperDropdownData.stepperIndex && param1 <= this._stepper.maximum + this.stepperDropdownData.stepperIndex)
               {
                  this.dropDown.selectedIndex = this.stepperDropdownData.stepperIndex;
                  this._stepper.value = String(param1 - this.stepperDropdownData.stepperIndex);
                  this._stepper.enabled = true;
                  this.textBoxBgi.alpha = 1;
               }
               else
               {
                  this.dropDown.selectedIndex = this.getDropDownIndex(int(param1));
                  this._stepper.enabled = false;
                  this.textBoxBgi.alpha = 0.3;
                  if(!this.updateFromMe80)
                  {
                     this.stepperDropDownChangeHandler(null);
                  }
                  _loc2_ = new Timer(200,1);
                  _loc2_.addEventListener(TimerEvent.TIMER,this.stepperDropdownChangingHandler,false,0,true);
                  _loc2_.start();
                  this.drawBgi(this.textBoxBgi2,"changing");
                  this.dropDown.styleName = "effectDetailRedDropDown";
               }
            }
            else
            {
               if(this._stepper.minimum < 0)
               {
                  param1 += this._stepper.minimum;
               }
               this._stepper.value = String(param1);
               if(this.dropDown)
               {
                  this.dropDown.selectedIndex = this.getDropDownIndex(int(this._stepper.value));
               }
            }
         }
      }
      
      private function stepperDropdownChangingHandler(param1:TimerEvent) : void
      {
         this.drawBgi(this.textBoxBgi2,"normal");
         this.dropDown.styleName = "effectDetailBlueDropDown";
      }
      
      public function get max() : Number
      {
         return this._max;
      }
      
      public function set max(param1:Number) : void
      {
         this._max = param1;
         if(this._stepper)
         {
            this._stepper.maximum = this._max;
         }
      }
      
      public function get min() : Number
      {
         return this._min;
      }
      
      public function set min(param1:Number) : void
      {
         this._min = param1;
         if(this._stepper)
         {
            this._stepper.minimum = this._min;
         }
      }
      
      public function get address() : String
      {
         return this._address;
      }
      
      public function get step() : Number
      {
         return this._step;
      }
      
      public function set step(param1:Number) : void
      {
         this._step = param1;
         if(this._stepper)
         {
            this._stepper.stepSize = this._step;
         }
      }
      
      public function get precision() : int
      {
         return this._precision;
      }
      
      public function set presicion(param1:int) : void
      {
         this._precision = param1;
         if(this._stepper)
         {
            this._stepper.precision = this._precision;
         }
      }
      
      public function get updateFromMe80() : Boolean
      {
         return this._updateFromMe80;
      }
      
      public function set updateFromMe80(param1:Boolean) : void
      {
         this._updateFromMe80 = param1;
         if(this._stepper)
         {
            this._stepper.updateFromMe80 = this._updateFromMe80;
         }
      }
      
      public function get arrowBgi() : BitmapImage
      {
         return this._arrowBgi;
      }
      
      public function get pointX() : Number
      {
         return this._pointX;
      }
      
      public function get pointY() : Number
      {
         return this._pointY;
      }
      
      public function get stepperEnabeld() : Boolean
      {
         return this._stepperEnabeld;
      }
      
      public function set stepperEnabeld(param1:Boolean) : void
      {
         if(this._stepperEnabeld == param1)
         {
            return;
         }
         this._stepperEnabeld = param1;
         if(!param1)
         {
            alpha = 0.3;
            this.updateFromMe80 = true;
            this._stepper.updateFromMe80 = true;
            this._stepper.enabled = false;
            if(this.dropDown)
            {
               this.dropDown.removeEventListener(FocusEvent.FOCUS_IN,this.dropdownFocusInHandler);
               this.dropDown.removeEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler);
               this.dropDown.selectedIndex = -1;
               this.dropDown.enabled = false;
            }
            this.updateFromMe80 = false;
            this.paramNameLabel.removeEventListener(MouseEvent.CLICK,this.nameLabelClickHandler);
         }
         else
         {
            alpha = 1;
            this.updateFromMe80 = true;
            this._stepper.updateFromMe80 = true;
            this._stepper.enabled = true;
            if(this.dropDown)
            {
               this.dropDown.addEventListener(FocusEvent.FOCUS_IN,this.dropdownFocusInHandler,false,0,true);
               this.dropDown.addEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler,false,0,true);
               this.dropDown.enabled = true;
               this.dropDown.selectedIndex = this.getDropDownIndex(int(this._stepper.value));
            }
            this.updateFromMe80 = false;
            this.paramNameLabel.addEventListener(MouseEvent.CLICK,this.nameLabelClickHandler,false,0,true);
         }
      }
   }
}

