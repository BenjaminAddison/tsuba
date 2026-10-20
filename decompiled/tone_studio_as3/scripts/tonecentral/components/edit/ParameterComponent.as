package tonecentral.components.edit
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.collections.ArrayCollection;
   import mx.core.UIComponent;
   import spark.components.Group;
   import spark.events.IndexChangeEvent;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.common.util.CTLParameterUtil;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.CustomDropDownList;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class ParameterComponent extends Group
   {
      
      private var mediator:ToneCentralMediator;
      
      private var _max:Number;
      
      private var _min:Number;
      
      private var _midiOffset:Number;
      
      private var _precision:int;
      
      private var _step:Number;
      
      private var _stepper:ParamConvertStepper2;
      
      public var dropDown:CustomDropDownList;
      
      private var _address:String;
      
      private var _updateFromMe80:Boolean = false;
      
      public var textBoxBgi:UIComponent;
      
      private var textBoxBgi2:UIComponent;
      
      private var tmpParamVal:Number;
      
      private var changing:Boolean;
      
      private var sysex:SystemExclusive;
      
      private var adressMap:AddressMap;
      
      private var dropDownDataList:Array;
      
      private var stepperW:Number;
      
      private var stepperH:Number;
      
      private var stepperBtnW:Number;
      
      private var isDropDownDataObject:Boolean;
      
      public var isSystemSetting:Boolean;
      
      private var dropDownDifineObj:Object;
      
      private var stepperAndDropDownDefineObj:Object;
      
      private var isStepperDropdown:Boolean;
      
      private var enableStepperDropdown:Boolean;
      
      private var stepperDropdownData:Object;
      
      public function ParameterComponent(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.width = param1;
         this.height = param2;
         this.stepperW = param3;
         this.stepperH = param4;
         this.stepperBtnW = param5;
         this.sysex = SystemExclusive.getInstance();
         this.adressMap = AddressMap.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
      }
      
      public function changeEnable(param1:Boolean) : void
      {
         this._stepper.enabled = param1;
         this.textBoxBgi.enabled = param1;
         if(this.isStepperDropdown)
         {
            this.textBoxBgi2.enabled = param1;
            if(!this.enableStepperDropdown)
            {
               this._stepper.enabled = this.enableStepperDropdown;
               this.textBoxBgi.enabled = this.enableStepperDropdown;
            }
         }
         this.drawBgiAll("normal");
         if(this.dropDown)
         {
            this.dropDown.enabled = param1;
         }
      }
      
      private function drawBgiAll(param1:String) : void
      {
         this.drawBgi(this.textBoxBgi,param1);
         if(this.isStepperDropdown)
         {
            this.drawBgi(this.textBoxBgi2,param1);
         }
      }
      
      public function setdata(param1:Object, param2:Object, param3:Object) : void
      {
         this.updateFromMe80 = true;
         if(isNaN(param1.midiOffset))
         {
            this.tmpParamVal = param1.value;
         }
         else
         {
            this.tmpParamVal = param1.value - param1.midiOffset;
         }
         this.max = param1.max;
         this.min = param1.min;
         this.midiOffset = param1.midiOffset;
         this.precision = param1.precision;
         this.step = param1.step;
         this._address = param1.address;
         this.createView();
         this.dropDownDifineObj = param2;
         this.stepperAndDropDownDefineObj = param3;
         this.updateFromMe80 = false;
      }
      
      private function createView() : void
      {
         this.addStepper();
      }
      
      private function addStepper() : void
      {
         this.textBoxBgi = new UIComponent();
         this.textBoxBgi.width = this.stepperW - this.stepperBtnW - 4;
         this.textBoxBgi.height = this.stepperH;
         this.textBoxBgi.x = 0;
         this.textBoxBgi.y = 0;
         addElement(this.textBoxBgi);
         this._stepper = new ParamConvertStepper2(this.stepperW,this.stepperH,this.stepperBtnW);
         this._stepper.x = 0;
         this._stepper.y = 0;
         this._stepper.maximum = this.max;
         this._stepper.minimum = this.min;
         this._stepper.stepSize = this.step;
         this._stepper.midiOffset = this.midiOffset;
         this._stepper.precision = this.precision;
         this._stepper.addEventListener(Event.CHANGE,this.changeHandler,false,0,true);
         this._stepper.addEventListener(ToneCentralEvents.CHANGING,this.stepperChangingHandler,false,0,true);
         this._stepper.addEventListener(ToneCentralEvents.CHANGE_END,this.stepperChangeEndHandler,false,0,true);
         addElement(this._stepper);
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
               _loc4_ = _loc2_ / this.step + this._stepper.midiOffset;
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
      
      private function getDropDownIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.isStepperDropdown || this.isDropDownDataObject)
         {
            _loc2_ = 0;
            while(_loc2_ < this.dropDown.dataProvider.length)
            {
               if(!this.dropDown.dataProvider.getItemAt(_loc2_).hasOwnProperty("val"))
               {
                  return int(this._stepper.textValue);
               }
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
         if(this.isDropDownDataObject)
         {
            return this.dropDown.dataProvider.getItemAt(this.dropDown.selectedIndex).val;
         }
         return String(this.dropDown.selectedIndex);
      }
      
      public function getDoubleByteValue(param1:int) : String
      {
         var _loc2_:Number = Math.floor(param1 / 128);
         var _loc3_:Number = param1 % 128;
         return ToneCentralUtil.convertHexaDecimalArray([_loc2_,_loc3_],2).join(",");
      }
      
      private function stepperChangingHandler(param1:ToneCentralEvents) : void
      {
         if(this.isStepperDropdown && !this.enableStepperDropdown)
         {
            return;
         }
         this.changing = true;
         this.drawBgiAll("changing");
         if(this.dropDown)
         {
            this.dropDown.styleName = this.getDropDownStyle(true);
         }
      }
      
      private function drawBgi(param1:UIComponent, param2:String) : void
      {
         var _loc4_:Number = NaN;
         if(this.changing == true && param2 != "changing")
         {
            return;
         }
         var _loc3_:Graphics = param1.graphics;
         _loc3_.clear();
         if(param1.enabled)
         {
            _loc4_ = 1;
         }
         else
         {
            _loc4_ = 0.5;
         }
         if(param2 == "changing")
         {
            _loc3_.lineStyle(1,16729413,_loc4_);
            _loc3_.beginFill(16729413,0.3);
         }
         else
         {
            _loc3_.lineStyle(1,9495807,_loc4_);
         }
         _loc3_.drawRoundRect(0.5,0.5,param1.width,param1.height,6,6);
         _loc3_.endFill();
      }
      
      private function stepperChangeEndHandler(param1:ToneCentralEvents) : void
      {
         this.changing = false;
         this.drawBgiAll("normal");
         if(this.dropDown)
         {
            this.dropDown.styleName = this.getDropDownStyle(false);
         }
      }
      
      public function setEffectType(param1:String) : void
      {
         if(this.dropDown)
         {
            return;
         }
         if(this._stepper.minimum >= 0)
         {
            this._stepper.value = String(this.tmpParamVal);
         }
         else
         {
            this._stepper.value = String(this.tmpParamVal + this._stepper.minimum);
         }
         if(this.isDropDown(param1))
         {
            this.createDropDown(param1);
            this.setDropDownData(param1);
         }
         if(this.isStepperAndDropDown(param1))
         {
            this.createStepperDropDown(param1);
            this.setStepperDropDown();
         }
         this.drawBgiAll("normal");
      }
      
      public function updateDropDownList(param1:String) : void
      {
         if(this.isDropDown(param1))
         {
            if(!this.dropDown)
            {
               this.createDropDown(param1);
            }
            this._stepper.visible = false;
            this.textBoxBgi.width = this.stepperW - 1;
            this.textBoxBgi.height = this.stepperH - 1;
            this.setDropDownData(param1);
         }
         else if(this.dropDown)
         {
            this.removeDropDown();
            if(this.isStepperAndDropDown(param1))
            {
               this.isStepperDropdown = false;
            }
         }
         if(this.isStepperAndDropDown(param1))
         {
            if(!this.isStepperDropdown)
            {
               this.createStepperDropDown(param1);
            }
            this.setStepperDropDown();
         }
         else if(this.isStepperDropdown)
         {
            this.removeStepperDropDown();
         }
         this.drawBgiAll("normal");
      }
      
      private function isDropDown(param1:String) : Boolean
      {
         if(param1.indexOf("midi_program_chg_map_") != -1)
         {
            return true;
         }
         return this.dropDownDifineObj.hasOwnProperty(param1);
      }
      
      private function getDropDownDataList(param1:String) : Array
      {
         if(param1.indexOf("midi_program_chg_map_") != -1)
         {
            return SystemSettingDefinitionGT.DROPDOWN_LIST_PROGRAM_MAP_GT001;
         }
         return this.dropDownDifineObj[param1];
      }
      
      private function isStepperAndDropDown(param1:String) : Boolean
      {
         return this.stepperAndDropDownDefineObj.hasOwnProperty(param1);
      }
      
      private function getStepperAndDropDownList(param1:String) : Array
      {
         return this.stepperAndDropDownDefineObj[param1];
      }
      
      private function changeDropdownLabelField(param1:String) : void
      {
         if(CTLParameterUtil.isDropDownDataObject(param1))
         {
            this.dropDown.labelField = "name";
            this.isDropDownDataObject = true;
         }
         else
         {
            this.dropDown.labelField = "";
            this.isDropDownDataObject = false;
         }
      }
      
      private function createDropDown(param1:String) : void
      {
         this.dropDown = new CustomDropDownList();
         this.dropDown.isSystemSetting = this.isSystemSetting;
         this.dropDown.styleName = this.getDropDownStyle(false);
         this.dropDown.width = this.stepperW;
         this.dropDown.height = this.stepperH;
         this.dropDown.x = 0;
         addElement(this.dropDown);
         this.dropDown.addEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler,false,0,true);
         this.changeDropdownLabelField(param1);
         if(!this.isStepperAndDropDown(param1))
         {
            this._stepper.visible = false;
            this.textBoxBgi.width = this.stepperW - 1;
            this.textBoxBgi.height = this.stepperH - 1;
         }
      }
      
      private function setDropDownData(param1:String) : void
      {
         this.changeDropdownLabelField(param1);
         this.dropDownDataList = this.getDropDownDataList(param1);
         this.dropDown.dataProvider = new ArrayCollection(CTLParameterUtil.assignDataProviderFilter(this.dropDownDataList,param1));
         this.dropDown.selectedIndex = this.getDropDownIndex(int(this._stepper.value));
      }
      
      private function createStepperDropDown(param1:String) : void
      {
         this.isStepperDropdown = true;
         var _loc2_:Object = this.stepperAndDropDownDefineObj[param1];
         this.stepperDropdownData = _loc2_;
         this.height = this.height + this.stepperH + 10;
         this.textBoxBgi.y = this.stepperH + 10;
         this._stepper.y = this.stepperH + 10;
         this._stepper.maximum = _loc2_.max;
         this._stepper.minimum = _loc2_.min;
         this._stepper.stepSize = _loc2_.step;
         this._stepper.precision = _loc2_.precision;
         if(this.textBoxBgi2)
         {
            removeElement(this.textBoxBgi2);
         }
         this.textBoxBgi2 = new UIComponent();
         this.textBoxBgi2.width = this.stepperW - 1;
         this.textBoxBgi2.height = this.stepperH - 1;
         this.textBoxBgi2.x = 0;
         this.textBoxBgi2.y = 0;
         addElement(this.textBoxBgi2);
         this.createDropDown(param1);
         this.dropDown.removeEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler);
         this.dropDown.addEventListener(IndexChangeEvent.CHANGE,this.stepperDropDownChangeHandler,false,0,true);
      }
      
      private function setStepperDropDown() : void
      {
         this.dropDown.labelField = "name";
         this.isDropDownDataObject = true;
         this.dropDown.dataProvider = new ArrayCollection(this.stepperDropdownData.dropdown);
         if(this.tmpParamVal >= this._stepper.minimum + this.stepperDropdownData.stepperIndex && this.tmpParamVal <= this._stepper.maximum + this.stepperDropdownData.stepperIndex)
         {
            this.enableStepperDropdown = true;
            this.dropDown.selectedIndex = this.stepperDropdownData.stepperIndex;
         }
         else
         {
            this.enableStepperDropdown = false;
            this.dropDown.selectedIndex = this.getDropDownIndex(this.tmpParamVal);
         }
      }
      
      private function removeDropDown() : void
      {
         this._stepper.visible = true;
         removeElement(this.dropDown);
         this.dropDown = null;
         this.isDropDownDataObject = false;
         this.textBoxBgi.width = this.stepperW - this.stepperBtnW - 4;
         this.textBoxBgi.height = this.stepperH;
      }
      
      private function removeStepperDropDown() : void
      {
         this.isStepperDropdown = false;
         this.stepperDropdownData = null;
         this.height = this.height - this.stepperH - 10;
         this.textBoxBgi.y = 0;
         this._stepper.y = 0;
         removeElement(this.textBoxBgi2);
         this.textBoxBgi2 = null;
         if(this.dropDown)
         {
            this.dropDown.removeEventListener(IndexChangeEvent.CHANGE,this.stepperDropDownChangeHandler);
            this.dropDown.addEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler,false,0,true);
         }
      }
      
      private function dropDownChangeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:String = null;
         this._stepper.textValue = this.getStepperVal();
         if(!this.updateFromMe80)
         {
            _loc2_ = ToneCentralUtil.convertHexaDecimal(String(this._stepper.value),2);
         }
         this.updateFromMe80 = false;
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
      
      public function set address(param1:String) : void
      {
         this._address = param1;
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
      
      public function set midiOffset(param1:Number) : void
      {
         this._midiOffset = param1;
         if(this._stepper)
         {
            this._stepper.midiOffset = this._min;
         }
      }
      
      public function get midiOffset() : Number
      {
         return this._midiOffset;
      }
      
      public function set precision(param1:int) : void
      {
         this._precision = param1;
         if(this._stepper)
         {
            this._stepper.precision = this._precision;
         }
      }
      
      public function get precision() : int
      {
         return this._precision;
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
      
      public function set paramVal(param1:Number) : void
      {
         var _loc2_:Timer = null;
         if(this._stepper)
         {
            if(this.isStepperDropdown)
            {
               if(param1 >= this._stepper.minimum + this.stepperDropdownData.stepperIndex && param1 <= this._stepper.maximum + this.stepperDropdownData.stepperIndex)
               {
                  this.enableStepperDropdown = true;
                  this.dropDown.selectedIndex = this.stepperDropdownData.stepperIndex;
                  this._stepper.value = String(param1 - this.stepperDropdownData.stepperIndex);
               }
               else
               {
                  this.enableStepperDropdown = false;
                  this.dropDown.selectedIndex = this.getDropDownIndex(int(param1));
                  if(!this.updateFromMe80)
                  {
                     this.stepperDropDownChangeHandler(null);
                  }
                  if(!this._stepper.isInit)
                  {
                     _loc2_ = new Timer(200,1);
                     _loc2_.addEventListener(TimerEvent.TIMER,this.stepperDropdownChangingHandler,false,0,true);
                     _loc2_.start();
                     this.drawBgi(this.textBoxBgi2,"changing");
                     this.dropDown.styleName = this.getDropDownStyle(true);
                  }
                  this._stepper.value = this._stepper.value;
               }
            }
            else
            {
               if(this._stepper.minimum < 0)
               {
                  param1 += this._stepper.minimum;
               }
               param1 -= this._stepper.midiOffset;
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
         this.dropDown.styleName = this.getDropDownStyle(false);
      }
      
      public function changeStepperIsInit(param1:Boolean) : void
      {
         this._stepper.isInit = param1;
      }
      
      public function dispose() : void
      {
         if(this.dropDown)
         {
            this.dropDown.removeEventListener(IndexChangeEvent.CHANGE,this.dropDownChangeHandler);
            this.dropDown.removeEventListener(IndexChangeEvent.CHANGE,this.stepperDropDownChangeHandler);
         }
         if(this.isStepperDropdown)
         {
            this.stepperDropdownData = null;
            this.textBoxBgi2 = null;
         }
         this._stepper.removeEventListener(Event.CHANGE,this.changeHandler);
         this._stepper.removeEventListener(ToneCentralEvents.CHANGING,this.stepperChangingHandler);
         this._stepper.removeEventListener(ToneCentralEvents.CHANGE_END,this.stepperChangeEndHandler);
         this._stepper = null;
         this.dropDown = null;
         this.textBoxBgi = null;
         this.sysex = null;
         this.adressMap = null;
         this.dropDownDataList = null;
      }
      
      private function getDropDownStyle(param1:Boolean) : String
      {
         if(this.isSystemSetting)
         {
            return "systemDropDown";
         }
         if(param1)
         {
            return "redBorderDropDown";
         }
         return "blueBorderDropDown";
      }
   }
}

