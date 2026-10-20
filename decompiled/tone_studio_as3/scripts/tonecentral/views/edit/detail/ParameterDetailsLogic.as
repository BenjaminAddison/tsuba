package tonecentral.views.edit.detail
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Timer;
   import mx.collections.ArrayList;
   import mx.events.ResizeEvent;
   import spark.components.Label;
   import spark.events.IndexChangeEvent;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.Mode;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.EditManager;
   import tonecentral.common.manager.SystemManager;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.edit.AbstractKnob;
   import tonecentral.components.edit.EffectDetailComponent;
   import tonecentral.components.edit.GraphicEqSlider;
   import tonecentral.components.edit.KnobComponent;
   import tonecentral.events.EditorEvent;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.TemporaryParams;
   
   public class ParameterDetailsLogic extends ToneCentralViewLogic
   {
      
      private var view:ParameterDetails;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var editMng:EditManager;
      
      private var sysMng:SystemManager;
      
      private var targetEffectTypeName:String;
      
      private var targetEffectSwName:String;
      
      private var targetKnob:AbstractKnob;
      
      private var targetStepper:EffectDetailComponent;
      
      private var selectKnobIndex:Number;
      
      private var scaleH:Number;
      
      private var knobArray:Vector.<AbstractKnob> = new Vector.<AbstractKnob>();
      
      private var stepperArray:Vector.<EffectDetailComponent> = new Vector.<EffectDetailComponent>();
      
      private var isManual:Boolean = false;
      
      private var updateFromMe80:Boolean = false;
      
      private var defaultSelectdObject:Object;
      
      private var lastSelectdEffect:Object;
      
      private var runningMode:String = "0";
      
      private var effectTypeChangeEvent:ViewStatusEvent;
      
      private var effectChangeSkipTimer:Timer;
      
      private var page:int = 0;
      
      private var indexOffset:int;
      
      private var _knobDragging:Boolean;
      
      public function ParameterDetailsLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = ParameterDetails(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.addressMap = AddressMap.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.editMng = new EditManager();
         this.sysMng = SystemManager.getInstance();
         this.editMng.addEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.viewStatusChangeHandler,false,0,true);
         this.editMng.addEventListener(EditorEvent.EFFECT_SW_CHANGE,this.effectSwUpdateHandler,false,0,true);
         this.editMng.addEventListener(EditorEvent.EFFECT_TYPE_CHANGE,this.effectTypeUpdateHandler,false,0,true);
         this.editMng.addEventListener(EditorEvent.SUB_TYPE_CHANGE,this.subTypeUpdateHandler,false,0,true);
         this.editMng.addEventListener(EditorEvent.PARAM_CHANGE,this.paramUpdateHandler,false,0,true);
         this.editMng.addEventListener(SystemEvent.PREFERENCE_CHANGE,this.systemPrefChangeHandler,false,0,true);
         this.editMng.addEventListener(SystemEvent.CTL_EXP_CHANGE,this.ctlExpChangeHandler,false,0,true);
         this.sysMng.addEventListener(SystemEvent.OUTPUT_SELECT_CHANGE,this.systemOutputSelectChangeHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.WINDOW_RESIZE,this.windowResize,false,0,true);
         this.mediator.addEventListener(ViewStatusEvent.PAGE_CHANGE,this.pageChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.CHANGE_MODE,this.changeModeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.RUNNING_MODE,this.runningModeChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.mediator.addEventListener(ViewStatusEvent.EFFECT_CATEGORY_CHANGE,this.effectCategoryChangeHandler,false,0,true);
         this.mediator.addEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.editModeChangeHandler,false,0,true);
         this.mediator.sysex.addUpdateSystemCallback(this.updateTemporaryHandler);
         this.view.addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler,false,0,true);
         this.view.slider.addEventListener(Event.CHANGE,this.sliderThumbDrag,false,0,true);
         this.view.slider.addEventListener(Event.CHANGE,this.sliderChangeHandler,false,0,true);
         this.view.slider.addEventListener(MouseEvent.MOUSE_WHEEL,this.sliderMouseWheelHandler,false,0,true);
         this.view.slider.focusEnabled = false;
         this.view.effectSw.addEventListener(MouseEvent.CLICK,this.switchOnOff,false,0,true);
         this.view.effectTypeDropDownList.addEventListener(IndexChangeEvent.CHANGE,this.effectTypeChangeHandler,false,0,true);
         this.view.subTypeDropDownList.addEventListener(IndexChangeEvent.CHANGE,this.subTypeChangeHandler,false,0,true);
         this.view.addEventListener(ResizeEvent.RESIZE,this.resizeHandler,false,0,true);
         this.view.callLater(this.changeEffectNameX);
         this.drawGraphicEqGrid();
      }
      
      private function updateTemporaryHandler(param1:Object) : void
      {
         this.setFxBoxSelColor();
      }
      
      private function setFxBoxSelColor() : void
      {
         switch(this.editMng.effectCategory)
         {
            case ParameterDefinitionGT.EFECT_NAME[1]:
               this.setSelColor(this.mediator.sysex.params.temporaryParams.fxbox_sel_fx1a);
               break;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               this.setSelColor(3);
               break;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               this.setSelColor(this.mediator.sysex.params.temporaryParams.fxbox_sel_fx1b);
               break;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               this.setSelColor(this.mediator.sysex.params.temporaryParams.fxbox_sel_fx2a);
               break;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               this.setSelColor(this.mediator.sysex.params.temporaryParams.fxbox_sel_fx2b);
               break;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               this.setSelColor(this.mediator.sysex.params.temporaryParams.fxbox_sel_fx3);
               break;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               this.setSelColor(3);
               break;
            case ParameterDefinitionGT.EFECT_NAME[19]:
               this.setSelColor(this.mediator.sysex.params.temporaryParams.fxbox_sel_fx3);
               break;
            case ParameterDefinitionGT.EFECT_NAME[14]:
               this.setSelColor(3);
               break;
            case ParameterDefinitionGT.EFECT_NAME[15]:
               this.setSelColor(3);
         }
      }
      
      private function setSelColor(param1:int) : void
      {
         if(param1 == 0)
         {
            this.view.fxBoxSelColor.color = 65280;
         }
         else if(param1 == 1)
         {
            this.view.fxBoxSelColor.color = 16711680;
         }
         else if(param1 == 2)
         {
            this.view.fxBoxSelColor.color = 16763904;
         }
         else
         {
            this.view.fxBoxSelColor.color = 6710886;
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         this.view.callLater(this.setEffectTypeAndSw);
      }
      
      private function resizeHandler(param1:ResizeEvent) : void
      {
         this.view.callLater(this.changeEffectNameX);
      }
      
      private function changeEffectNameX() : void
      {
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.page = 0;
         this.createView();
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.page = 0;
         this.createView();
      }
      
      private function systemOutputSelectChangeHandler(param1:SystemEvent) : void
      {
         this.setDisabledComponent();
      }
      
      private function editModeChangeHandler(param1:Event) : void
      {
         if(this.mediator.currentViewStatus == ToneCentralDefinition.DETAILS && this.mediator.selectedMode == Mode.EDITOR && this.mediator.contentsAreaMode != Mode.TONE_CENTRAL)
         {
            this.editMng.addEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.viewStatusChangeHandler,false,0,true);
            this.editMng.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.viewStatusChangeHandler,false,0,true);
            this.editMng.addEventListener(EditorEvent.EFFECT_SW_CHANGE,this.effectSwUpdateHandler,false,0,true);
            this.editMng.addEventListener(EditorEvent.EFFECT_TYPE_CHANGE,this.effectTypeUpdateHandler,false,0,true);
            this.editMng.addEventListener(EditorEvent.SUB_TYPE_CHANGE,this.subTypeUpdateHandler,false,0,true);
            this.editMng.addEventListener(EditorEvent.PARAM_CHANGE,this.paramUpdateHandler,false,0,true);
            this.editMng.addEventListener(SystemEvent.PREFERENCE_CHANGE,this.systemPrefChangeHandler,false,0,true);
            this.editMng.addEventListener(SystemEvent.CTL_EXP_CHANGE,this.ctlExpChangeHandler,false,0,true);
            this.page = 0;
            this.createView();
         }
         else
         {
            this.editMng.removeEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.viewStatusChangeHandler);
            this.editMng.removeEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.viewStatusChangeHandler);
            this.editMng.removeEventListener(EditorEvent.EFFECT_SW_CHANGE,this.effectSwUpdateHandler);
            this.editMng.removeEventListener(EditorEvent.EFFECT_TYPE_CHANGE,this.effectTypeUpdateHandler);
            this.editMng.removeEventListener(EditorEvent.SUB_TYPE_CHANGE,this.subTypeUpdateHandler);
            this.editMng.removeEventListener(EditorEvent.PARAM_CHANGE,this.paramUpdateHandler);
            this.editMng.removeEventListener(SystemEvent.PREFERENCE_CHANGE,this.systemPrefChangeHandler);
            this.editMng.removeEventListener(SystemEvent.CTL_EXP_CHANGE,this.ctlExpChangeHandler);
         }
      }
      
      private function effectCategoryChangeHandler(param1:ViewStatusEvent) : void
      {
         this.editMng.effectCategory = param1.data as String;
      }
      
      private function pageChangeHandler(param1:ViewStatusEvent) : void
      {
         this.page = param1.page;
         this.createView();
      }
      
      private function viewStatusChangeHandler(param1:Event) : void
      {
         this.page = 0;
         this.createView();
      }
      
      private function systemPrefChangeHandler(param1:SystemEvent) : void
      {
         if(ParameterDefinitionGT.isPreAMP(this.editMng.effectCategory) || this.editMng.effectCategory == "PEDAL FX")
         {
            this.updateView();
         }
      }
      
      private function ctlExpChangeHandler(param1:SystemEvent) : void
      {
         if(this.editMng.effectCategory == "PEDAL FX")
         {
            this.updateView();
         }
      }
      
      private function createView() : void
      {
         this.view.effectName.text = this.replaceEffectName(this.editMng.effectCategory);
         this.objectClean();
         this.createComponents();
         this.view.editArea.visible = true;
         this.setFxBoxSelColor();
      }
      
      private function replaceEffectName(param1:String) : String
      {
         switch(param1)
         {
            case "OD/DS":
               return "BOOSTER";
            case "FX1":
               return "MOD";
            case "FX2":
               return "FX";
            case "NS1":
               return "NS";
            default:
               return param1;
         }
      }
      
      private function updateView() : void
      {
         if(ParameterDefinitionGT.PARAMETER_LIST_RE_CREATE_LIST.indexOf(this.editMng.effectCategory) != -1)
         {
            this.page = 0;
            this.objectClean();
            this.createComponents();
         }
         else
         {
            this.updateFromMe80 = true;
            this.updateParameter();
            this.updateFromMe80 = false;
         }
      }
      
      private function updateParameter() : void
      {
         var _loc2_:int = 0;
         var _loc1_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         this.setEffectTypeAndSw();
         _loc2_ = 0;
         while(_loc2_ < this.stepperArray.length)
         {
            this.stepperArray[_loc2_].updateFromMe80 = true;
            this.stepperArray[_loc2_].paramVal = _loc1_[this.stepperArray[_loc2_].key];
            this.stepperArray[_loc2_].adjustHarmonistCodeLabel(this.stepperArray[_loc2_].data);
            this.knobArray[_loc2_].parameterVal = _loc1_[this.stepperArray[_loc2_].key] * this.stepperArray[_loc2_].step;
            this.knobArray[_loc2_].adjustHarmonistCodeLabel(this.knobArray[_loc2_].data);
            this.stepperArray[_loc2_].updateFromMe80 = false;
            _loc2_++;
         }
         this.setDisabledComponent();
         this.drawLine();
         this.drawScale();
      }
      
      private function setEffectTypeAndSw() : void
      {
         this.view.effectTypeDropDownList.dataProvider = this.editMng.effectTypeList;
         if(Boolean(this.editMng.effectTypeList) && this.editMng.effectTypeList.length > 0)
         {
            this.view.effectTypeDropDownList.selectedIndex = this.editMng.effectTypeIndex;
            this.view.effectTypeDropDownList.enabled = true;
         }
         else
         {
            this.view.effectTypeDropDownList.enabled = false;
         }
         if(Boolean(this.editMng.subTypeList) && this.editMng.subTypeList.length > 0)
         {
            this.view.subTypeDropDownList.enabled = true;
            this.view.subTypeDropDownList.dataProvider = this.editMng.subTypeList;
            this.view.subTypeDropDownList.selectedIndex = this.editMng.subTypeIndex;
         }
         else
         {
            this.view.subTypeDropDownList.enabled = false;
            this.view.subTypeDropDownList.dataProvider = new ArrayList();
         }
         if(this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[11] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[12] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[13] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[17] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[18])
         {
            this.view.effectSw.visible = false;
            this.view.effectSwInd.visible = false;
         }
         else if(this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[4] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[10] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[14] || this.editMng.effectCategory == ParameterDefinitionGT.EFECT_NAME[15])
         {
            this.view.effectSw.visible = true;
            this.view.effectSw.selected = this.editMng.effectSw;
            this.view.effectSw.mouseEnabled = true;
            this.view.effectSw.alpha = 1;
            this.view.effectSwInd.visible = false;
         }
         else
         {
            this.view.effectSw.visible = false;
            this.view.effectSw.mouseEnabled = false;
            this.view.effectSwInd.visible = true;
            this.view.effectSwInd.selected = this.editMng.effectSw;
            this.view.effectSwInd.alpha = 0.6;
         }
      }
      
      private function createComponents() : void
      {
         var _loc2_:EffectDetailComponent = null;
         var _loc3_:KnobComponent = null;
         var _loc4_:GraphicEqSlider = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc13_:Number = NaN;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:Object = null;
         var _loc1_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         if(!this.editMng.effectTypeList)
         {
            return;
         }
         this.setEffectTypeAndSw();
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < this.editMng.parameterArray.length)
         {
            if(this.editMng.parameterArray[_loc6_].page == this.page + 1)
            {
               _loc9_++;
               if(this.editMng.parameterArray[_loc6_].row == 1)
               {
                  _loc7_++;
               }
               else if(this.editMng.parameterArray[_loc6_].row == 2)
               {
                  _loc8_++;
               }
            }
            _loc6_++;
         }
         var _loc12_:int = 0;
         var _loc14_:int = 0;
         this.indexOffset = 0;
         _loc6_ = 0;
         while(_loc6_ < this.editMng.parameterArray.length)
         {
            _loc17_ = this.editMng.parameterArray[_loc6_];
            if(_loc17_.page != this.page + 1)
            {
               if(_loc17_.page < this.page + 1)
               {
                  ++this.indexOffset;
               }
            }
            else
            {
               _loc15_ = _loc17_.id;
               _loc16_ = "temp_" + _loc15_;
               _loc13_ = ParameterUtil.getDoubleByteData(this.addressMap[_loc16_].address,_loc1_[_loc15_]) * Number(_loc17_.step);
               _loc10_ = {};
               _loc10_.id = _loc17_.id;
               _loc10_.name = _loc17_.name;
               _loc10_.max = _loc17_.max;
               _loc10_.min = _loc17_.min;
               _loc10_.step = _loc17_.step;
               _loc10_.precision = _loc17_.precision;
               _loc10_.address = this.addressMap[_loc16_].address;
               _loc10_.value = _loc13_;
               _loc2_ = new EffectDetailComponent();
               _loc2_.setdata(_loc10_);
               _loc2_.adjustHarmonistCodeLabel(_loc17_);
               _loc2_.addEventListener(ToneCentralEvents.SELECT,this.stepperLabelClickHandler,false,0,true);
               this.view.paramVgroup.addElement(_loc2_);
               this.stepperArray.push(_loc2_);
               if(this.editMng.effectType == ParameterDefinitionGT.FX1_TYPE[15].name && this.page == 0)
               {
                  _loc11_ = {};
                  _loc11_.id = _loc17_.id;
                  _loc11_.name = _loc17_.name;
                  _loc11_.max = _loc17_.max;
                  _loc11_.min = _loc17_.min;
                  _loc11_.step = _loc17_.step;
                  _loc11_.val = _loc13_;
                  this.view.rowLine.visible = false;
                  this.view.geqScaleLabelArea.visible = true;
                  this.view.g10ScaleLabelArea.visible = false;
                  this.view.geqGridLayer.visible = true;
                  _loc4_ = new GraphicEqSlider();
                  _loc4_.x = _loc14_ * 34 + 55;
                  _loc4_.y = 70;
                  _loc4_.index = _loc14_;
                  _loc4_.setData(_loc11_);
                  _loc4_.addEventListener(MouseEvent.MOUSE_DOWN,this.knobClickHandler,false,0,true);
                  this.view.knobSpace.addElement(_loc4_);
                  this.knobArray.push(_loc4_);
               }
               else if(this.editMng.effectType == ParameterDefinitionGT.EQ_TYPE[1].name && this.page == 0)
               {
                  _loc11_ = {};
                  _loc11_.id = _loc17_.id;
                  _loc11_.name = _loc17_.name;
                  _loc11_.max = _loc17_.max;
                  _loc11_.min = _loc17_.min;
                  _loc11_.step = _loc17_.step;
                  _loc11_.precision = _loc17_.precision;
                  _loc11_.val = _loc13_;
                  this.view.rowLine.visible = false;
                  this.view.geqScaleLabelArea.visible = false;
                  this.view.g10ScaleLabelArea.visible = true;
                  this.view.geqGridLayer.visible = true;
                  _loc4_ = new GraphicEqSlider();
                  _loc4_.x = _loc14_ * 34 + 55;
                  _loc4_.y = 70;
                  _loc4_.index = _loc14_;
                  _loc4_.setData(_loc11_);
                  _loc4_.addEventListener(MouseEvent.MOUSE_DOWN,this.knobClickHandler,false,0,true);
                  this.view.knobSpace.addElement(_loc4_);
                  this.knobArray.push(_loc4_);
               }
               else
               {
                  this.view.rowLine.visible = true;
                  this.view.geqGridLayer.visible = false;
                  this.view.geqScaleLabelArea.visible = false;
                  this.view.g10ScaleLabelArea.visible = false;
                  _loc3_ = this.createKnobs(_loc17_,_loc13_,_loc7_,_loc8_,_loc14_);
                  if(!this.editMng.isEnableParameter(_loc17_))
                  {
                     _loc3_.knobEnabled = false;
                     _loc2_.stepperEnabeld = false;
                  }
               }
               _loc14_++;
            }
            _loc6_++;
         }
         this.searchTargetKnob();
         this.setStepperEffectType();
         this.view.validateNow();
         if(this.view.paramVgroup.height <= 360)
         {
            this.view.editArea.height = 360;
         }
         else
         {
            this.view.editArea.height = this.view.paramVgroup.height + 20;
         }
      }
      
      private function drawGraphicEqGrid() : void
      {
         var _loc1_:Number = 208 / 8;
         var _loc2_:Graphics = this.view.geqGridLayer.graphics;
         _loc2_.clear();
         _loc2_.lineStyle(1,9430271,0.5);
         var _loc3_:int = 0;
         while(_loc3_ < 9)
         {
            _loc2_.moveTo(50,110 + _loc1_ * _loc3_);
            _loc2_.lineTo(430,110 + _loc1_ * _loc3_);
            _loc3_++;
         }
      }
      
      private function createKnobs(param1:Object, param2:Number, param3:int, param4:int, param5:int) : KnobComponent
      {
         var _loc8_:Number = NaN;
         var _loc6_:Object = {};
         _loc6_.id = param1.id;
         _loc6_.name = param1.name;
         _loc6_.max = param1.max;
         _loc6_.min = param1.min;
         _loc6_.step = param1.step;
         _loc6_.val = param2;
         var _loc7_:KnobComponent = new KnobComponent();
         if(param1.row == 1)
         {
            _loc8_ = this.calcLeftOffset(param3);
            _loc7_.y = 78;
            _loc7_.x = 80 * param5 + _loc8_;
         }
         else
         {
            _loc8_ = this.calcLeftOffset(param4);
            _loc7_.y = 225;
            _loc7_.x = 80 * (param5 - param3) + _loc8_;
         }
         _loc7_.setData(_loc6_);
         _loc7_.adjustHarmonistCodeLabel(param1);
         _loc7_.index = param5;
         _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,this.knobClickHandler,false,0,true);
         _loc7_.addEventListener(ToneCentralEvents.WHEEL_START,this.knobWheelStartHandler,false,0,true);
         this.view.knobSpace.addElement(_loc7_);
         this.knobArray.push(_loc7_);
         return _loc7_;
      }
      
      private function stepperLabelClickHandler(param1:ToneCentralEvents) : void
      {
      }
      
      private function calcLeftOffset(param1:int) : Number
      {
         return (445 - 80 * param1) / 2;
      }
      
      private function runningModeChangeHandler(param1:ToneCentralEvents) : void
      {
         this.runningMode = String(param1.data);
      }
      
      private function sliderMouseWheelHandler(param1:MouseEvent) : void
      {
         if(this.view.slider.value == this.view.slider.maximum && param1.delta > 0 || this.view.slider.value == this.view.slider.minimum && param1.delta < 0)
         {
            return;
         }
         if(param1.delta < 0)
         {
            param1.delta = -1;
         }
         else if(param1.delta > 0)
         {
            param1.delta = 1;
         }
         this.view.slider.value += param1.delta;
         if(this.view.slider.value < this.view.slider.minimum)
         {
            this.view.slider.value = this.view.slider.minimum;
         }
         else if(this.view.slider.value > this.view.slider.maximum)
         {
            this.view.slider.value = this.view.slider.maximum;
         }
         this.drawLine();
         this.targetStepper.paramVal = this.view.slider.value;
      }
      
      private function changeModeHandler(param1:ToneCentralEvents) : void
      {
         this.isManual = String(param1.data) == "manual";
      }
      
      private function stepperSelectHandler(param1:ToneCentralEvents) : void
      {
         if(this.targetStepper)
         {
            this.targetStepper.selected = false;
         }
         this.targetStepper = EffectDetailComponent(param1.currentTarget);
         this.targetStepper.selected = true;
         if(this.targetKnob)
         {
            this.targetKnob.removeEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler);
         }
         this.targetKnob = this.knobArray[this.targetStepper.knobIndex];
         this.targetKnob.addEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler,false,0,true);
         this.selectKnobIndex = this.targetKnob.index;
         this.setSelectedState();
      }
      
      private function setStepperEffectType() : void
      {
         var _loc2_:EffectDetailComponent = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.stepperArray.length)
         {
            _loc2_ = this.stepperArray[_loc1_];
            _loc2_.setEffectType(this.editMng.effectCategory,this.editMng.effectType,_loc1_,this.editMng.parameterArray[_loc1_ + this.indexOffset].id);
            _loc1_++;
         }
         if(this.targetStepper)
         {
            this.redraw(this.targetStepper.max,this.targetStepper.min,Number(this.targetStepper.paramVal),this.targetStepper.step);
         }
      }
      
      private function objectClean() : void
      {
         if(this.targetKnob)
         {
            this.targetKnob.removeEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler);
            this.targetKnob = null;
         }
         if(this.targetStepper)
         {
            this.targetStepper = null;
         }
         this.view.knobSpace.removeAllElements();
         this.view.slider.value = 0;
         this.view.scaleLabelGroup.removeAllElements();
         this.view.scaleLayer.graphics.clear();
         this.view.lineLayer.graphics.clear();
         this.stepperArray = new Vector.<EffectDetailComponent>();
         this.knobArray = new Vector.<AbstractKnob>();
         this.view.paramVgroup.removeAllElements();
         this.view.knobSpace.removeAllElements();
      }
      
      private function knobWheelStartHandler(param1:ToneCentralEvents) : void
      {
         this.setTargetKnob(param1.currentTarget as AbstractKnob);
      }
      
      private function knobClickHandler(param1:MouseEvent) : void
      {
         this._knobDragging = true;
         this.setTargetKnob(param1.currentTarget as AbstractKnob);
      }
      
      private function setTargetKnob(param1:AbstractKnob) : void
      {
         if(!param1.knobEnabled)
         {
            return;
         }
         if(this.targetKnob)
         {
            this.targetKnob.removeEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler);
         }
         this.targetKnob = AbstractKnob(param1);
         this.targetKnob.addEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler,false,0,true);
         this.selectKnobIndex = this.targetKnob.index;
         this.targetKnob.selected = true;
         if(this.targetStepper)
         {
            this.targetStepper.selected = false;
         }
         this.targetStepper = this.stepperArray[this.selectKnobIndex];
         this.targetStepper.selected = true;
         this.setSelectedState();
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         this._knobDragging = false;
         if(this.view.stage)
         {
            this.view.stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         }
      }
      
      private function knobDragHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:Number = NaN;
         var _loc4_:int = 0;
         this.view.stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,false,0,true);
         var _loc3_:Number = Number(param1.data);
         if(param1.currentTarget is GraphicEqSlider)
         {
            _loc2_ = _loc3_;
         }
         else
         {
            if(this.targetStepper.max > 100)
            {
               _loc3_ *= this.targetStepper.max / 100;
            }
            _loc4_ = int(_loc3_ / this.targetStepper.step) * this.targetStepper.step;
            _loc2_ = this.view.slider.value + _loc4_;
            if(_loc2_ > this.view.slider.maximum)
            {
               _loc2_ = this.view.slider.maximum;
            }
            else if(_loc2_ < this.view.slider.minimum)
            {
               _loc2_ = this.view.slider.minimum;
            }
         }
         this.view.slider.value = _loc2_;
         this.drawLine();
         if(this.targetStepper.paramVal != this.view.slider.value)
         {
            this.targetStepper.paramVal = this.view.slider.value;
         }
      }
      
      private function setSelectedState() : void
      {
         if(this.targetStepper.min < 0)
         {
            this.view.slider.maximum = this.targetStepper.max - this.targetStepper.min;
            this.view.slider.minimum = 0;
            this.view.slider.stepSize = this.targetStepper.step;
         }
         else
         {
            this.view.slider.maximum = this.targetStepper.max;
            this.view.slider.minimum = this.targetStepper.min;
            this.view.slider.stepSize = this.targetStepper.step;
         }
         this.scaleH = (this.view.slider.height - 10) / (this.targetStepper.max - this.targetStepper.min);
         this.view.slider.value = Number(this.targetStepper.paramVal);
         this.setSelectedColor();
         this.drawScale();
         this.drawLine();
      }
      
      private function setSelectedColor() : void
      {
         var _loc1_:EffectDetailComponent = null;
         var _loc2_:AbstractKnob = null;
         for each(_loc1_ in this.stepperArray)
         {
            if(_loc1_ != this.targetStepper)
            {
               _loc1_.setFieldColor(false);
            }
         }
         this.targetStepper.setFieldColor(true);
         for each(_loc2_ in this.knobArray)
         {
            _loc2_.selected = false;
         }
         this.targetKnob.selected = true;
      }
      
      private function clearLine() : void
      {
         var _loc1_:Graphics = this.view.lineLayer.graphics;
         _loc1_.clear();
         _loc1_ = this.view.sliderTrackSelected.graphics;
         _loc1_.clear();
      }
      
      private function clearScale() : void
      {
         this.view.scaleLabelGroup.removeAllElements();
         var _loc1_:Graphics = this.view.scaleLayer.graphics;
         _loc1_.clear();
      }
      
      private function drawScale() : void
      {
         if(!this.targetStepper || !this.targetKnob)
         {
            return;
         }
         this.scaleH = (this.view.slider.height - 10) / (this.targetStepper.max - this.targetStepper.min);
         if(this.targetStepper.dropDownDataList)
         {
            this.drawDropDownScale();
         }
         else
         {
            this.drawStepperScale();
         }
      }
      
      private function drawDropDownScale() : void
      {
         var _loc5_:Label = null;
         var _loc6_:BitmapImage = null;
         var _loc1_:Array = this.targetStepper.dropDownDataList;
         this.view.scaleLabelGroup.removeAllElements();
         var _loc2_:Graphics = this.view.scaleLayer.graphics;
         _loc2_.clear();
         _loc2_.lineStyle(1,9430271,1);
         var _loc3_:Number = this.view.slider.height / (_loc1_.length - 1);
         var _loc4_:Number = 0;
         var _loc7_:int = 1;
         if(_loc1_.length >= 80)
         {
            _loc7_ = 10;
         }
         var _loc8_:int = 0;
         while(_loc8_ < _loc1_.length)
         {
            if(_loc8_ % _loc7_ == 0)
            {
               _loc4_ = this.view.slider.height - _loc3_ * _loc8_;
               if(_loc8_ > 0 && _loc8_ < _loc1_.length - 1)
               {
                  _loc2_.moveTo(0,_loc4_);
                  _loc2_.lineTo(35,_loc4_);
               }
               _loc5_ = this.getScaleLabel();
               _loc5_.setStyle("fontSize",12);
               _loc5_.height = 12;
               _loc5_.text = _loc1_[_loc8_];
               _loc5_.y = _loc4_ - _loc5_.height / 2;
            }
            _loc8_++;
         }
      }
      
      private function drawStepperScale() : void
      {
         var _loc5_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc11_:Label = null;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc1_:Object = this.editMng.parameterArray[this.selectKnobIndex + this.indexOffset];
         var _loc2_:int = int(_loc1_.max);
         var _loc3_:int = int(_loc1_.min);
         this.view.scaleLabelGroup.removeAllElements();
         var _loc4_:Graphics = this.view.scaleLayer.graphics;
         _loc4_.clear();
         _loc4_.lineStyle(1,9430271,1);
         var _loc6_:Number = this.scaleH;
         if(this.view.slider.minimum == 0)
         {
            _loc7_ = this.view.slider.maximum;
         }
         else
         {
            _loc7_ = this.view.slider.maximum - this.view.slider.minimum;
         }
         if(_loc2_ - _loc3_ >= 500)
         {
            _loc5_ = 20;
         }
         else
         {
            _loc5_ = 2;
         }
         _loc8_ = 0;
         while(_loc8_ < _loc7_ + 1)
         {
            _loc12_ = _loc6_ * _loc8_ + 5;
            if(_loc8_ % _loc5_ == 0)
            {
               _loc4_.moveTo(0,_loc12_);
               _loc4_.lineTo(10,_loc12_);
            }
            _loc8_++;
         }
         if(_loc2_ - _loc3_ >= 1000)
         {
            _loc5_ = 100;
         }
         else if(_loc2_ - _loc3_ >= 500)
         {
            _loc5_ = 50;
         }
         else if(_loc2_ - _loc3_ >= 100)
         {
            _loc5_ = 20;
         }
         else if(_loc2_ - _loc3_ >= 50)
         {
            _loc5_ = 10;
         }
         else if(_loc2_ - _loc3_ == 1)
         {
            _loc5_ = 1;
         }
         else
         {
            _loc5_ = 2;
         }
         var _loc9_:int = Math.round((_loc2_ - _loc3_ + 1) / _loc5_);
         var _loc10_:Number = this.scaleH * _loc5_;
         _loc8_ = 0;
         while(_loc8_ <= _loc9_)
         {
            if(_loc3_ == 1)
            {
               _loc13_ = _loc5_ * _loc8_;
               if(_loc8_ == 0)
               {
                  _loc13_ += _loc3_;
               }
            }
            else
            {
               _loc13_ = _loc5_ * _loc8_ + _loc3_;
            }
            if(_loc13_ > _loc2_)
            {
               break;
            }
            _loc11_ = this.getScaleLabel();
            _loc11_.text = _loc13_.toString();
            _loc11_.y = this.view.slider.height - _loc10_ * _loc8_ - _loc11_.height / 2 - 5;
            _loc8_++;
         }
      }
      
      private function getScaleLabel() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "scale";
         _loc1_.x = -30;
         _loc1_.width = 50;
         _loc1_.height = 15;
         this.view.scaleLabelGroup.addElement(_loc1_);
         return _loc1_;
      }
      
      private function drawLine() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!this.targetStepper || !this.targetKnob)
         {
            return;
         }
         if(this.view.slider.minimum < 0)
         {
            _loc2_ = this.view.slider.height - this.view.slider.value * this.scaleH - 5;
         }
         else
         {
            _loc2_ = this.view.slider.height - (this.view.slider.value - this.view.slider.minimum) * this.scaleH - 5;
         }
         if(_loc2_ < 5)
         {
            _loc2_ = 5;
         }
         else if(_loc2_ > this.view.slider.height - 5)
         {
            _loc2_ = this.view.slider.height - 5;
         }
         var _loc5_:Graphics = this.view.lineLayer.graphics;
         _loc5_.clear();
         _loc5_.lineStyle(3,9430271,0.5);
         _loc3_ = this.targetKnob.x + this.targetKnob.pointX;
         _loc4_ = this.targetKnob.y + this.targetKnob.pointY;
         _loc1_ = this.view.slider.x;
         _loc5_.moveTo(_loc1_,_loc2_);
         _loc5_.lineTo(_loc3_,_loc4_);
         _loc1_ = this.view.slider.x + this.view.slider.width;
         _loc3_ = this.view.paramVgroup.x + this.targetStepper.pointX;
         _loc4_ = this.targetStepper.y + this.targetStepper.pointY;
         _loc5_.moveTo(_loc1_,_loc2_);
         _loc5_.lineTo(_loc3_,_loc4_);
         _loc5_ = this.view.sliderTrackSelected.graphics;
         _loc5_.clear();
         _loc5_.beginFill(9495807,0.5);
         _loc5_.drawRoundRect(0,_loc2_,this.view.sliderTrackSelected.width,this.view.slider.height - _loc2_,4,4);
         _loc5_.endFill();
      }
      
      private function effectSwUpdateHandler(param1:EditorEvent) : void
      {
         this.updateFromMe80 = true;
         this.view.effectSw.selected = this.editMng.effectSw;
         this.view.effectSwInd.selected = this.editMng.effectSw;
         this.updateFromMe80 = false;
      }
      
      private function paramUpdateHandler(param1:EditorEvent) : void
      {
         this.updateFromMe80 = true;
         var _loc2_:String = param1.data.address;
         var _loc3_:Number = Number(param1.data.value);
         var _loc4_:int = 0;
         while(_loc4_ < this.stepperArray.length)
         {
            if(this.stepperArray[_loc4_].address == _loc2_)
            {
               _loc3_ *= this.stepperArray[_loc4_].step;
               _loc3_ = ParameterUtil.getDoubleByteData(_loc2_,_loc3_);
               if(!this.knobArray[_loc4_].knobEnabled)
               {
                  return;
               }
               if(this._knobDragging)
               {
                  AbstractKnob(this.knobArray[_loc4_]).parameterVal = _loc3_;
                  this.stepperArray[_loc4_].updateFromMe80 = true;
                  this.stepperArray[_loc4_].paramVal = _loc3_;
                  this.stepperArray[_loc4_].updateFromMe80 = false;
               }
               else
               {
                  if(this.targetStepper != this.stepperArray[_loc4_])
                  {
                     this.setTargetKnob(this.knobArray[_loc4_]);
                  }
                  this.targetStepper.updateFromMe80 = true;
                  this.targetStepper.paramVal = _loc3_;
                  this.targetStepper.updateFromMe80 = false;
                  this.targetKnob.parameterVal = _loc3_;
                  this.view.slider.value = _loc3_;
                  this.drawLine();
               }
               break;
            }
            this.knobArray[_loc4_].adjustHarmonistCodeLabel(this.knobArray[_loc4_].data);
            this.stepperArray[_loc4_].adjustHarmonistCodeLabel(this.stepperArray[_loc4_].data);
            _loc4_++;
         }
         this.setDisabledComponent();
         this.updateFromMe80 = false;
      }
      
      private function subTypeUpdateHandler(param1:EditorEvent) : void
      {
         this.updateFromMe80 = true;
         this.view.subTypeDropDownList.selectedIndex = this.editMng.subTypeIndex;
         this.setDisabledComponent();
         this.updateFromMe80 = false;
      }
      
      private function setDisabledComponent() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:Boolean = false;
         if(!this.editMng.parameterArray)
         {
            return;
         }
         var _loc3_:Boolean = false;
         _loc1_ = 0;
         while(_loc1_ < this.editMng.parameterArray.length)
         {
            _loc4_ = this.editMng.isEnableParameter(this.editMng.parameterArray[_loc1_]);
            _loc2_ = 0;
            while(_loc2_ < this.stepperArray.length)
            {
               if(this.stepperArray[_loc2_].key == this.editMng.parameterArray[_loc1_].id)
               {
                  this.stepperArray[_loc2_].stepperEnabeld = _loc4_;
                  break;
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < this.knobArray.length)
            {
               if(this.knobArray[_loc2_].key == this.editMng.parameterArray[_loc1_].id)
               {
                  this.knobArray[_loc2_].knobEnabled = _loc4_;
                  if(!_loc4_ && this.targetKnob == this.knobArray[_loc2_])
                  {
                     _loc3_ = true;
                  }
                  break;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         if(_loc3_ || !this.targetKnob)
         {
            this.searchTargetKnob();
         }
      }
      
      private function searchTargetKnob() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.knobArray.length)
         {
            if(this.knobArray[_loc2_].knobEnabled)
            {
               this.setTargetKnob(this.knobArray[_loc2_]);
               _loc1_ = true;
               this.view.slider.enabled = true;
               this.view.slider.addEventListener(Event.CHANGE,this.sliderThumbDrag,false,0,true);
               this.view.slider.addEventListener(Event.CHANGE,this.sliderChangeHandler,false,0,true);
               this.view.slider.addEventListener(MouseEvent.MOUSE_WHEEL,this.sliderMouseWheelHandler,false,0,true);
               break;
            }
            _loc2_++;
         }
         if(!_loc1_)
         {
            if(this.targetKnob)
            {
               this.targetKnob.removeEventListener(ToneCentralEvents.KNOB_DRAG,this.knobDragHandler);
            }
            this.targetKnob = null;
            this.selectKnobIndex = -1;
            if(this.targetStepper)
            {
               this.targetStepper.selected = false;
            }
            this.targetStepper = null;
            this.view.slider.enabled = false;
            this.view.slider.removeEventListener(Event.CHANGE,this.sliderChangeHandler);
            this.view.slider.removeEventListener(Event.CHANGE,this.sliderThumbDrag);
            this.view.slider.removeEventListener(MouseEvent.MOUSE_WHEEL,this.sliderMouseWheelHandler);
            this.view.slider.value = 0;
            this.clearScale();
            this.clearLine();
         }
      }
      
      private function effectTypeUpdateHandler(param1:EditorEvent) : void
      {
         this.updateFromMe80 = true;
         this.updateView();
         this.updateFromMe80 = false;
      }
      
      private function redraw(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         if(param2 < 0)
         {
            this.view.slider.maximum = param1 - param2;
            this.view.slider.minimum = 0;
            this.view.slider.stepSize = param4;
         }
         else
         {
            this.view.slider.maximum = param1;
            this.view.slider.minimum = param2;
            this.view.slider.stepSize = param4;
         }
         this.scaleH = (this.view.slider.height - 10) / (param1 - param2);
         if(param2 < 0)
         {
            this.targetKnob.knobRotation({
               "max":param1 - param2,
               "min":0,
               "val":param3.toString()
            });
         }
         else
         {
            this.targetKnob.knobRotation({
               "max":param1,
               "min":param2,
               "val":param3.toString()
            });
         }
         this.view.slider.value = param3;
         this.setSelectedColor();
         this.drawScale();
         this.drawLine();
         this.updateFromMe80 = false;
         this.targetStepper.updateFromMe80 = false;
      }
      
      private function sliderChangeHandler(param1:Event) : void
      {
         if(!this.targetStepper)
         {
            return;
         }
         if(this.updateFromMe80)
         {
            this.updateFromMe80 = false;
            this.targetStepper.updateFromMe80 = false;
            return;
         }
         this.targetStepper.paramVal = this.view.slider.value;
      }
      
      public function sliderThumbDrag(param1:Event) : void
      {
         if(!this.targetStepper)
         {
            this.view.slider.value = 0;
            return;
         }
         this.drawLine();
         if(this.view.slider.minimum < 0)
         {
            this.targetKnob.knobRotation({
               "max":this.view.slider.maximum - this.view.slider.minimum,
               "min":0,
               "val":this.view.slider.value
            });
         }
         else
         {
            this.targetKnob.knobRotation({
               "max":this.view.slider.maximum,
               "min":this.view.slider.minimum,
               "val":this.view.slider.value
            });
         }
         this.targetStepper.paramVal = this.view.slider.value;
      }
      
      private function switchOnOff(param1:MouseEvent) : void
      {
         this.editMng.effectSw = this.view.effectSw.selected;
      }
      
      private function effectTypeChangeHandler(param1:IndexChangeEvent) : void
      {
         this.editMng.effectTypeIndex = this.view.effectTypeDropDownList.selectedIndex;
      }
      
      private function subTypeChangeHandler(param1:IndexChangeEvent) : void
      {
         this.editMng.subTypeIndex = this.view.subTypeDropDownList.selectedIndex;
      }
      
      private function windowResize(param1:ToneCentralEvents) : void
      {
         this.drawScale();
         this.drawLine();
      }
   }
}

