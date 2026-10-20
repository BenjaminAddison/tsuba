package tonecentral.components.popup
{
   import flash.display.CapsStyle;
   import flash.display.Graphics;
   import flash.display.LineScaleMode;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.utils.Timer;
   import mx.collections.ArrayList;
   import mx.core.BitmapAsset;
   import mx.core.FlexGlobals;
   import mx.core.UIComponent;
   import mx.effects.Rotate;
   import spark.components.Label;
   import spark.events.IndexChangeEvent;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.SystemManager;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.CustomDropDownList;
   import tonecentral.components.ImageButton;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.chain.CustomNumericStepper;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   
   public class Tuner extends ToneCentralPopup
   {
      
      private static const MULTI_METER_CENTER:Number = 357;
      
      private static var paramTextBoxImage:Class = Tuner_paramTextBoxImage;
      
      private static var bgMultiTunerImage:Class = Tuner_bgMultiTunerImage;
      
      private static const REGULAR_TUNING:Array = [4,9,2,7,11,4];
      
      private static const DROP_D_TUNING:Array = [2,9,2,7,11,4];
      
      private var bgCodeDispImg:Class = Tuner_bgCodeDispImg;
      
      private var leftArrowSelectedImg:Class = Tuner_leftArrowSelectedImg;
      
      private var leftArrowImg:Class = Tuner_leftArrowImg;
      
      private var rightArrowSelectedImg:Class = Tuner_rightArrowSelectedImg;
      
      private var rightArrowImg:Class = Tuner_rightArrowImg;
      
      private var meterImg:Class = Tuner_meterImg;
      
      private var imgA:Class = Tuner_imgA;
      
      private var imgASharp:Class = Tuner_imgASharp;
      
      private var imgB:Class = Tuner_imgB;
      
      private var imgC:Class = Tuner_imgC;
      
      private var imgCSharp:Class = Tuner_imgCSharp;
      
      private var imgD:Class = Tuner_imgD;
      
      private var imgDSharp:Class = Tuner_imgDSharp;
      
      private var imgE:Class = Tuner_imgE;
      
      private var imgF:Class = Tuner_imgF;
      
      private var imgFSharp:Class = Tuner_imgFSharp;
      
      private var imgG:Class = Tuner_imgG;
      
      private var imgGSharp:Class = Tuner_imgGSharp;
      
      private var bgMultiCodeDispImg:Class = Tuner_bgMultiCodeDispImg;
      
      private var imgMA:Class = Tuner_imgMA;
      
      private var imgMASharp:Class = Tuner_imgMASharp;
      
      private var imgMB:Class = Tuner_imgMB;
      
      private var imgMC:Class = Tuner_imgMC;
      
      private var imgMCSharp:Class = Tuner_imgMCSharp;
      
      private var imgMD:Class = Tuner_imgMD;
      
      private var imgMDSharp:Class = Tuner_imgMDSharp;
      
      private var imgME:Class = Tuner_imgME;
      
      private var imgMF:Class = Tuner_imgMF;
      
      private var imgMFSharp:Class = Tuner_imgMFSharp;
      
      private var imgMG:Class = Tuner_imgMG;
      
      private var imgMGSharp:Class = Tuner_imgMGSharp;
      
      private var bgCodeDisplay:BitmapImage;
      
      private var leftArrow:BitmapImage;
      
      private var rightArrow:BitmapImage;
      
      private var meter:BitmapImage;
      
      private var meterArrow:UIComponent;
      
      private var key:BitmapImage;
      
      private var meterMask:UIComponent;
      
      private var addressMap:AddressMap;
      
      private var systemMng:SystemManager;
      
      private var rotate:Rotate;
      
      private var mainLabel:Label;
      
      private var leftLabel:Label;
      
      private var rightLabel:Label;
      
      private var subLabel10:Label;
      
      private var subLabel20:Label;
      
      private var subLabel30:Label;
      
      private var subLabel40:Label;
      
      private var subLabelm10:Label;
      
      private var subLabelm20:Label;
      
      private var subLabelm30:Label;
      
      private var subLabelm40:Label;
      
      private var sharpLabel:Label;
      
      private var flatLabel:Label;
      
      private var pitchStepper:CustomNumericStepper;
      
      private var pitchLabel:Label;
      
      private var pitchChangeDelayTimer:Timer;
      
      private var valueChangeDelayTimer:Timer;
      
      private var bgMultiTuner:UIComponent;
      
      private var str1Key:BitmapImage;
      
      private var str2Key:BitmapImage;
      
      private var str3Key:BitmapImage;
      
      private var str4Key:BitmapImage;
      
      private var str5Key:BitmapImage;
      
      private var str6Key:BitmapImage;
      
      private var str1Bar:UIComponent;
      
      private var str2Bar:UIComponent;
      
      private var str3Bar:UIComponent;
      
      private var str4Bar:UIComponent;
      
      private var str5Bar:UIComponent;
      
      private var str6Bar:UIComponent;
      
      private var pitch:int;
      
      private var _isValueChanging:Boolean = false;
      
      private var poliMeterLabel50:Label;
      
      private var poliMeterLabel0:Label;
      
      private var poliMeterLabelm50:Label;
      
      private var offsetLabel:Label;
      
      private var typeLabel:Label;
      
      private var tuningTypeSelect:CustomDropDownList;
      
      private var offsetUpButton:ImageButton;
      
      private var offsetDownButton:ImageButton;
      
      private var outputLabel:Label;
      
      private var outputTypeSelect:CustomDropDownList;
      
      private var currentRunningMode:String;
      
      private var isCreatedComponent:Boolean;
      
      private var isCreatedMulti:Boolean;
      
      private var yPosChangeDelayTimer:Timer;
      
      public function Tuner(param1:String = "")
      {
         super(param1);
         this.addressMap = AddressMap.getInstance();
         this.systemMng = SystemManager.getInstance();
         this.systemMng.addEventListener(SystemEvent.TUNER_CHANGE,this.tunerSettingChangeHandler,false,0,true);
         this.systemMng.addEventListener(SystemEvent.POLY_TUNER_CHANGE,this.polyTunerSettingChangeHandler,false,0,true);
         this.pitchChangeDelayTimer = new Timer(300);
         this.pitchChangeDelayTimer.addEventListener(TimerEvent.TIMER,this.pitchChangeDelayHandler,false,0,true);
         this.valueChangeDelayTimer = new Timer(300);
         this.valueChangeDelayTimer.addEventListener(TimerEvent.TIMER,this.valueChangeDelayHandler,false,0,true);
         this.yPosChangeDelayTimer = new Timer(300);
         this.yPosChangeDelayTimer.addEventListener(TimerEvent.TIMER,this.yPosChangeDelayHandler,false,0,true);
         mediator.sysex.addEventListener(ToneCentralEvents.RUNNING_MODE,this.runningModeChangeHandler,false,0,true);
         this.height = 310;
      }
      
      private function yPosChangeDelayHandler(param1:TimerEvent) : void
      {
         this.yPosChangeDelayTimer.reset();
         this.adjustYPos();
      }
      
      private function runningModeChangeHandler(param1:ToneCentralEvents) : void
      {
         if(this.isCreatedComponent && this.currentRunningMode != mediator.runningMode && (mediator.runningMode == "1" || mediator.runningMode == "2"))
         {
            if(mediator.runningMode == "1")
            {
               setDialogSize(590,310);
               if(this.isCreatedMulti)
               {
                  this.removeMultiMode();
                  this.isCreatedMulti = false;
               }
            }
            else
            {
               setDialogSize(590,600);
               this.createMultiMode();
            }
            this.currentRunningMode = mediator.runningMode;
            this.yPosChangeDelayTimer.start();
         }
      }
      
      private function adjustYPos() : void
      {
         this.y = BOSS_TONE_STUDIO_for_KATANA(FlexGlobals.topLevelApplication).height / 2 - this.height / 2;
      }
      
      private function removeMultiMode() : void
      {
         this.bgMultiTuner.graphics.clear();
         container.removeElement(this.bgMultiTuner);
         container.removeElement(this.str1Key);
         container.removeElement(this.str2Key);
         container.removeElement(this.str3Key);
         container.removeElement(this.str4Key);
         container.removeElement(this.str5Key);
         container.removeElement(this.str6Key);
         this.str1Bar.graphics.clear();
         this.str2Bar.graphics.clear();
         this.str3Bar.graphics.clear();
         this.str4Bar.graphics.clear();
         this.str5Bar.graphics.clear();
         this.str6Bar.graphics.clear();
         container.removeElement(this.str1Bar);
         container.removeElement(this.str2Bar);
         container.removeElement(this.str3Bar);
         container.removeElement(this.str4Bar);
         container.removeElement(this.str5Bar);
         container.removeElement(this.str6Bar);
         container.removeElement(this.poliMeterLabel50);
         container.removeElement(this.poliMeterLabel0);
         container.removeElement(this.poliMeterLabelm50);
         container.removeElement(this.offsetLabel);
         container.removeElement(this.offsetUpButton);
         container.removeElement(this.offsetDownButton);
         container.removeElement(this.tuningTypeSelect);
         container.removeElement(this.typeLabel);
         this.bgMultiTuner = null;
         this.str1Key = null;
         this.str2Key = null;
         this.str3Key = null;
         this.str4Key = null;
         this.str5Key = null;
         this.str6Key = null;
         this.str1Bar = null;
         this.str2Bar = null;
         this.str3Bar = null;
         this.str4Bar = null;
         this.str5Bar = null;
         this.str6Bar = null;
         this.poliMeterLabel50 = null;
         this.poliMeterLabel0 = null;
         this.poliMeterLabelm50 = null;
         this.offsetLabel = null;
         this.offsetUpButton = null;
         this.offsetDownButton = null;
         this.tuningTypeSelect = null;
         this.typeLabel = null;
      }
      
      public function get isValueChanging() : Boolean
      {
         return this._isValueChanging;
      }
      
      public function set isValueChanging(param1:Boolean) : void
      {
         this._isValueChanging = param1;
      }
      
      private function tunerSettingChangeHandler(param1:SystemEvent) : void
      {
         this.pitchStepper.value = String(mediator.sysex.params.system.sys_tuner_pitch + 435);
         this.pitch = int(this.pitchStepper.value);
         this.outputTypeSelect.selectedIndex = mediator.sysex.params.system.sys_tuner_output;
      }
      
      private function polyTunerSettingChangeHandler(param1:SystemEvent) : void
      {
         if(!this.isCreatedComponent || mediator.runningMode == "0" || mediator.runningMode == "1")
         {
            return;
         }
         this.setMultiTuningKey();
         this.tuningTypeSelect.selectedIndex = mediator.sysex.params.system.sys_polyphonic_tuner_type;
      }
      
      private function setBasePitch() : void
      {
         var _loc1_:int = mediator.sysex.params.system.sys_tuner_pitch;
         this.pitch = _loc1_ + 435;
         if(this.pitchStepper)
         {
            this.pitchStepper.value = String(this.pitch);
         }
         if(this.outputTypeSelect)
         {
            this.outputTypeSelect.selectedIndex = mediator.sysex.params.system.sys_tuner_output;
            this.setMultiTuningKey();
         }
         if(this.tuningTypeSelect)
         {
            this.tuningTypeSelect.selectedIndex = mediator.sysex.params.system.sys_polyphonic_tuner_type;
         }
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         if(mediator.runningMode == "1")
         {
            setDialogSize(590,310);
         }
         else
         {
            setDialogSize(590,600);
         }
         this.yPosChangeDelayTimer.start();
      }
      
      override protected function addOther() : void
      {
         container.clipAndEnableScrolling = true;
         this.bgCodeDisplay = new BitmapImage();
         this.bgCodeDisplay.source = this.bgCodeDispImg;
         this.bgCodeDisplay.horizontalCenter = 0;
         this.bgCodeDisplay.y = 113;
         container.addElement(this.bgCodeDisplay);
         this.key = new BitmapImage();
         this.key.horizontalCenter = 0;
         this.key.y = 127;
         container.addElement(this.key);
         this.meter = new BitmapImage();
         this.meter.source = this.meterImg;
         this.meter.horizontalCenter = 0;
         this.meter.y = 65;
         container.addElement(this.meter);
         this.meterArrow = new UIComponent();
         this.meterArrow.width = 650;
         this.meterArrow.height = 650;
         this.meterArrow.x = -30;
         this.meterArrow.y = 65;
         container.addElement(this.meterArrow);
         this.meterMask = new UIComponent();
         this.meterMask.x = -30;
         this.meterMask.y = 65;
         container.addElement(this.meterMask);
         this.meterArrow.mask = this.meterMask;
         this.leftArrow = new BitmapImage();
         this.leftArrow.source = this.leftArrowImg;
         this.leftArrow.y = 144;
         this.leftArrow.horizontalCenter = -100;
         container.addElement(this.leftArrow);
         this.rightArrow = new BitmapImage();
         this.rightArrow.source = this.rightArrowImg;
         this.rightArrow.y = 144;
         this.rightArrow.horizontalCenter = 100;
         container.addElement(this.rightArrow);
         this.mainLabel = new Label();
         this.mainLabel.text = "0";
         this.mainLabel.styleName = "mainMeterLabel";
         this.mainLabel.y = 30;
         this.mainLabel.horizontalCenter = 0;
         container.addElement(this.mainLabel);
         this.leftLabel = new Label();
         this.leftLabel.text = "-50";
         this.leftLabel.styleName = "mainMeterLabel";
         this.leftLabel.x = 50;
         this.leftLabel.y = 110;
         container.addElement(this.leftLabel);
         this.rightLabel = new Label();
         this.rightLabel.text = "+50";
         this.rightLabel.styleName = "mainMeterLabel";
         this.rightLabel.x = 510;
         this.rightLabel.y = 110;
         container.addElement(this.rightLabel);
         this.subLabel10 = new Label();
         this.subLabel10.text = "+10";
         this.subLabel10.styleName = "subMeterLabel";
         this.subLabel10.x = 333;
         this.subLabel10.y = 38;
         container.addElement(this.subLabel10);
         this.subLabel20 = new Label();
         this.subLabel20.text = "+20";
         this.subLabel20.styleName = "subMeterLabel";
         this.subLabel20.x = 385;
         this.subLabel20.y = 48;
         container.addElement(this.subLabel20);
         this.subLabel30 = new Label();
         this.subLabel30.text = "+30";
         this.subLabel30.styleName = "subMeterLabel";
         this.subLabel30.x = 433;
         this.subLabel30.y = 68;
         container.addElement(this.subLabel30);
         this.subLabel40 = new Label();
         this.subLabel40.text = "+40";
         this.subLabel40.styleName = "subMeterLabel";
         this.subLabel40.x = 476;
         this.subLabel40.y = 90;
         container.addElement(this.subLabel40);
         this.subLabelm10 = new Label();
         this.subLabelm10.text = "-10";
         this.subLabelm10.styleName = "subMeterLabel";
         this.subLabelm10.x = 228;
         this.subLabelm10.y = 38;
         container.addElement(this.subLabelm10);
         this.subLabelm20 = new Label();
         this.subLabelm20.text = "-20";
         this.subLabelm20.styleName = "subMeterLabel";
         this.subLabelm20.x = 185;
         this.subLabelm20.y = 48;
         container.addElement(this.subLabelm20);
         this.subLabelm30 = new Label();
         this.subLabelm30.text = "-30";
         this.subLabelm30.styleName = "subMeterLabel";
         this.subLabelm30.x = 137;
         this.subLabelm30.y = 68;
         container.addElement(this.subLabelm30);
         this.subLabelm40 = new Label();
         this.subLabelm40.text = "-40";
         this.subLabelm40.styleName = "subMeterLabel";
         this.subLabelm40.x = 94;
         this.subLabelm40.y = 90;
         container.addElement(this.subLabelm40);
         this.sharpLabel = new Label();
         this.sharpLabel.text = "#";
         this.sharpLabel.horizontalCenter = 155;
         this.sharpLabel.y = 150;
         this.sharpLabel.styleName = "tunerMarkLabel";
         container.addElement(this.sharpLabel);
         this.flatLabel = new Label();
         this.flatLabel.text = "♭";
         this.flatLabel.horizontalCenter = -155;
         this.flatLabel.y = 150;
         this.flatLabel.styleName = "tunerMarkLabel";
         container.addElement(this.flatLabel);
         this.pitchStepper = new CustomNumericStepper(77,25,30);
         this.pitchStepper.maximum = 445;
         this.pitchStepper.minimum = 435;
         this.pitchStepper.stepSize = 1;
         this.pitchStepper.x = 490;
         this.pitchStepper.y = 210;
         this.pitchStepper.addEventListener(Event.CHANGE,this.pitchStepperChangeHandler,false,0,true);
         container.addElement(this.pitchStepper);
         this.pitchLabel = new Label();
         this.pitchLabel.styleName = "pitchLabel";
         this.pitchLabel.text = "PITCH";
         this.pitchLabel.y = 214;
         this.pitchLabel.x = 440;
         container.addElement(this.pitchLabel);
         this.outputTypeSelect = new CustomDropDownList();
         this.outputTypeSelect.styleName = "systemDropDown";
         this.outputTypeSelect.width = 80;
         this.outputTypeSelect.y = 206;
         this.outputTypeSelect.x = 95;
         this.outputTypeSelect.dataProvider = new ArrayList(ToneCentralDefinition.TUNING_OUTPUT_LIST);
         this.outputTypeSelect.addEventListener(IndexChangeEvent.CHANGE,this.outputTypeChangeHandler,false,0,true);
         this.outputTypeSelect.selectedIndex = 0;
         container.addElement(this.outputTypeSelect);
         this.outputLabel = new Label();
         this.outputLabel.styleName = "pitchLabel";
         this.outputLabel.text = "OUTPUT";
         this.outputLabel.y = 214;
         this.outputLabel.x = 30;
         container.addElement(this.outputLabel);
         this.drawMeterArrow();
         this.drawMeterMask();
         this.rotate = new Rotate(this.meterArrow);
         this.rotate.duration = 10;
         this.rotate.originX = 325;
         this.rotate.originY = 325;
         if(mediator.runningMode == "2")
         {
            this.createMultiMode();
         }
         this.setBasePitch();
         this.isCreatedComponent = true;
      }
      
      private function createMultiMode() : void
      {
         this.bgMultiTuner = new UIComponent();
         this.bgMultiTuner.width = 350;
         this.bgMultiTuner.horizontalCenter = 0;
         this.bgMultiTuner.y = 280;
         container.addElement(this.bgMultiTuner);
         this.str1Key = new BitmapImage();
         this.str1Key.x = 135 + 60 * 5;
         this.str1Key.y = 457;
         container.addElement(this.str1Key);
         this.str2Key = new BitmapImage();
         this.str2Key.x = 135 + 60 * 4;
         this.str2Key.y = 457;
         container.addElement(this.str2Key);
         this.str3Key = new BitmapImage();
         this.str3Key.x = 135 + 60 * 3;
         this.str3Key.y = 457;
         container.addElement(this.str3Key);
         this.str4Key = new BitmapImage();
         this.str4Key.x = 135 + 60 * 2;
         this.str4Key.y = 457;
         container.addElement(this.str4Key);
         this.str5Key = new BitmapImage();
         this.str5Key.x = 135 + 60 * 1;
         this.str5Key.y = 457;
         container.addElement(this.str5Key);
         this.str6Key = new BitmapImage();
         this.str6Key.x = 135;
         this.str6Key.y = 457;
         container.addElement(this.str6Key);
         this.str1Bar = new UIComponent();
         this.str1Bar.x = 120 + 60 * 5;
         this.str1Bar.y = 360;
         this.str1Bar.visible = false;
         container.addElement(this.str1Bar);
         this.drawMultiMeterBar(this.str1Bar);
         this.str2Bar = new UIComponent();
         this.str2Bar.x = 120 + 60 * 4;
         this.str2Bar.y = MULTI_METER_CENTER;
         this.str2Bar.visible = false;
         container.addElement(this.str2Bar);
         this.drawMultiMeterBar(this.str2Bar);
         this.str3Bar = new UIComponent();
         this.str3Bar.x = 120 + 60 * 3;
         this.str3Bar.y = MULTI_METER_CENTER;
         this.str3Bar.visible = false;
         container.addElement(this.str3Bar);
         this.drawMultiMeterBar(this.str3Bar);
         this.str4Bar = new UIComponent();
         this.str4Bar.x = 120 + 60 * 2;
         this.str4Bar.y = MULTI_METER_CENTER;
         this.str4Bar.visible = false;
         container.addElement(this.str4Bar);
         this.drawMultiMeterBar(this.str4Bar);
         this.str5Bar = new UIComponent();
         this.str5Bar.x = 120 + 60 * 1;
         this.str5Bar.y = MULTI_METER_CENTER;
         this.str5Bar.visible = false;
         container.addElement(this.str5Bar);
         this.drawMultiMeterBar(this.str5Bar);
         this.str6Bar = new UIComponent();
         this.str6Bar.x = 120;
         this.str6Bar.y = MULTI_METER_CENTER;
         this.str6Bar.visible = false;
         container.addElement(this.str6Bar);
         this.drawMultiMeterBar(this.str6Bar);
         this.poliMeterLabel50 = new Label();
         this.poliMeterLabel50.text = "+50";
         this.poliMeterLabel50.styleName = "subMeterLabel";
         this.poliMeterLabel50.setStyle("textAlign","right");
         this.poliMeterLabel50.width = 40;
         this.poliMeterLabel50.x = 70;
         this.poliMeterLabel50.y = MULTI_METER_CENTER - 85;
         container.addElement(this.poliMeterLabel50);
         this.poliMeterLabel0 = new Label();
         this.poliMeterLabel0.text = "0";
         this.poliMeterLabel0.styleName = "subMeterLabel";
         this.poliMeterLabel0.setStyle("textAlign","right");
         this.poliMeterLabel0.width = 40;
         this.poliMeterLabel0.x = 70;
         this.poliMeterLabel0.y = MULTI_METER_CENTER - 10;
         container.addElement(this.poliMeterLabel0);
         this.poliMeterLabelm50 = new Label();
         this.poliMeterLabelm50.text = "-50";
         this.poliMeterLabelm50.styleName = "subMeterLabel";
         this.poliMeterLabelm50.setStyle("textAlign","right");
         this.poliMeterLabelm50.width = 40;
         this.poliMeterLabelm50.x = 70;
         this.poliMeterLabelm50.y = MULTI_METER_CENTER + 65;
         container.addElement(this.poliMeterLabelm50);
         this.offsetLabel = new Label();
         this.offsetLabel.styleName = "pitchLabel";
         this.offsetLabel.text = "OFFSET";
         this.offsetLabel.y = 500;
         this.offsetLabel.x = 485;
         container.addElement(this.offsetLabel);
         this.offsetUpButton = new ImageButton();
         this.offsetUpButton.styleName = "offsetUpButton";
         this.offsetUpButton.x = 485;
         this.offsetUpButton.y = 445;
         this.offsetUpButton.addEventListener(MouseEvent.CLICK,this.offsetUpClickHandler,false,0,true);
         container.addElement(this.offsetUpButton);
         this.offsetDownButton = new ImageButton();
         this.offsetDownButton.styleName = "offsetDownButton";
         this.offsetDownButton.x = 485;
         this.offsetDownButton.y = 470;
         this.offsetDownButton.addEventListener(MouseEvent.CLICK,this.offsetDownClickHandler,false,0,true);
         container.addElement(this.offsetDownButton);
         this.tuningTypeSelect = new CustomDropDownList();
         this.tuningTypeSelect.styleName = "systemDropDown";
         this.tuningTypeSelect.width = 80;
         this.tuningTypeSelect.y = 465;
         this.tuningTypeSelect.x = 26;
         this.tuningTypeSelect.dataProvider = new ArrayList(ToneCentralDefinition.TUNING_TYPE_LIST);
         this.tuningTypeSelect.addEventListener(IndexChangeEvent.CHANGE,this.tuningTypeChangeHandler,false,0,true);
         this.tuningTypeSelect.selectedIndex = 0;
         container.addElement(this.tuningTypeSelect);
         this.typeLabel = new Label();
         this.typeLabel.styleName = "pitchLabel";
         this.typeLabel.text = "TYPE";
         this.typeLabel.y = 500;
         this.typeLabel.x = 50;
         container.addElement(this.typeLabel);
         this.drawMultiTunerBg();
         this.setMultiTuningKey();
         this.isCreatedMulti = true;
      }
      
      private function outputTypeChangeHandler(param1:IndexChangeEvent) : void
      {
         mediator.sysex.setDataFunc(this.addressMap.sys_tuner_output.address,ToneCentralUtil.convertHexaDecimal(String(this.outputTypeSelect.selectedIndex),2));
         this.valueChangeDelayTimer.reset();
         this.valueChangeDelayTimer.start();
      }
      
      private function offsetDownClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = mediator.sysex.params.system.sys_polyphonic_tuner_offset;
         if(_loc2_ > 0)
         {
            _loc2_--;
            mediator.sysex.setDataFunc(this.addressMap.sys_polyphonic_tuner_offset.address,ToneCentralUtil.convertHexaDecimal(String(_loc2_),2));
            this.valueChangeDelayTimer.reset();
            this.valueChangeDelayTimer.start();
         }
      }
      
      private function offsetUpClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = mediator.sysex.params.system.sys_polyphonic_tuner_offset;
         if(_loc2_ < 11)
         {
            _loc2_++;
            mediator.sysex.setDataFunc(this.addressMap.sys_polyphonic_tuner_offset.address,ToneCentralUtil.convertHexaDecimal(String(_loc2_),2));
            this.valueChangeDelayTimer.reset();
            this.valueChangeDelayTimer.start();
         }
      }
      
      private function tuningTypeChangeHandler(param1:IndexChangeEvent) : void
      {
         mediator.sysex.setDataFunc(this.addressMap.sys_polyphonic_tuner_type.address,ToneCentralUtil.convertHexaDecimal(String(this.tuningTypeSelect.selectedIndex),2));
         this.valueChangeDelayTimer.reset();
         this.valueChangeDelayTimer.start();
      }
      
      private function drawMultiTunerBg() : void
      {
         var _loc1_:BitmapAsset = new bgMultiTunerImage();
         var _loc2_:BitmapAsset = new this.bgMultiCodeDispImg();
         var _loc3_:Graphics = this.bgMultiTuner.graphics;
         _loc3_.clear();
         var _loc4_:Matrix = new Matrix();
         var _loc5_:int = 0;
         while(_loc5_ < 6)
         {
            _loc4_.tx = 60 * _loc5_;
            _loc4_.ty = 0;
            _loc3_.beginBitmapFill(_loc1_.bitmapData,_loc4_,false);
            _loc3_.drawRect(60 * _loc5_,0,_loc1_.width,_loc1_.height);
            _loc4_.ty = 165;
            _loc3_.beginBitmapFill(_loc2_.bitmapData,_loc4_,false);
            _loc3_.drawRect(60 * _loc5_,165,_loc2_.width,_loc2_.height);
            _loc5_++;
         }
         _loc3_.endFill();
      }
      
      private function drawMultiMeterBar(param1:UIComponent) : void
      {
         var _loc2_:Graphics = param1.graphics;
         _loc2_.lineStyle(4,10480127,1,false,LineScaleMode.NORMAL,CapsStyle.NONE);
         _loc2_.moveTo(0,0);
         _loc2_.lineTo(50,0);
      }
      
      private function setMultiTuningKey() : void
      {
         var _loc1_:Array = null;
         if(mediator.runningMode == "1" || mediator.runningMode == "0")
         {
            return;
         }
         if(mediator.sysex.params.system.sys_polyphonic_tuner_type == 0)
         {
            _loc1_ = REGULAR_TUNING;
         }
         else
         {
            _loc1_ = DROP_D_TUNING;
         }
         this.setMultiKey(this.str6Key,this.tuningKeyOffset(_loc1_[0]));
         this.setMultiKey(this.str5Key,this.tuningKeyOffset(_loc1_[1]));
         this.setMultiKey(this.str4Key,this.tuningKeyOffset(_loc1_[2]));
         this.setMultiKey(this.str3Key,this.tuningKeyOffset(_loc1_[3]));
         this.setMultiKey(this.str2Key,this.tuningKeyOffset(_loc1_[4]));
         this.setMultiKey(this.str1Key,this.tuningKeyOffset(_loc1_[5]));
      }
      
      private function tuningKeyOffset(param1:int) : int
      {
         var _loc2_:int = param1 + mediator.sysex.params.system.sys_polyphonic_tuner_offset - 5;
         if(_loc2_ < 0)
         {
            _loc2_ += 12;
         }
         else if(_loc2_ > 11)
         {
            _loc2_ -= 12;
         }
         return _loc2_;
      }
      
      private function pitchStepperChangeHandler(param1:Event) : void
      {
         if(this.pitch == int(this.pitchStepper.value))
         {
            return;
         }
         this.pitchChangeDelayTimer.reset();
         this.pitchChangeDelayTimer.start();
      }
      
      private function pitchChangeDelayHandler(param1:TimerEvent) : void
      {
         this.pitchChangeDelayTimer.reset();
         var _loc2_:int = int(this.pitchStepper.value) - 435;
         mediator.sysex.setDataFunc(this.addressMap.sys_tuner_pitch.address,ToneCentralUtil.convertHexaDecimal(String(_loc2_),2));
         this.isValueChanging = true;
      }
      
      private function valueChangeDelayHandler(param1:TimerEvent) : void
      {
         this.valueChangeDelayTimer.reset();
         if(mediator.runningMode == "1")
         {
            mediator.sysex.setDataFunc(this.addressMap.command_running_mode.address,"01");
         }
         else
         {
            mediator.sysex.setDataFunc(this.addressMap.command_running_mode.address,"02");
         }
         this.isValueChanging = true;
      }
      
      override protected function addButton() : void
      {
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.x = 15;
         closeButton.bottom = 23;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CLOSE";
         closeButton.setFocus();
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,this.onCloseClick,false,0,true);
      }
      
      override protected function drawBackground() : void
      {
         super.drawBackground();
         if(!backgoundLayer)
         {
            return;
         }
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(2,dialogHeight - 65);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,dialogHeight - 65);
         if(mediator.runningMode == "2")
         {
            backgoundLayer.graphics.moveTo(2,260);
            backgoundLayer.graphics.lineTo(dialogWidth - 2,260);
         }
      }
      
      private function drawMeterArrow() : void
      {
         var _loc1_:Graphics = this.meterArrow.graphics;
         _loc1_.lineStyle(4,10480127,1,false,LineScaleMode.NORMAL,CapsStyle.NONE);
         _loc1_.moveTo(325,0);
         _loc1_.lineTo(325,26);
      }
      
      private function drawMeterMask() : void
      {
         var _loc1_:BitmapAsset = new this.meterImg();
         var _loc2_:Number = this.meterArrow.width / 2 - _loc1_.bitmapData.width / 2 + this.meterArrow.x;
         this.meterMask.x = _loc2_;
         this.meterMask.graphics.beginBitmapFill(_loc1_.bitmapData,null,false);
         this.meterMask.graphics.drawRect(0,0,_loc1_.bitmapData.width,_loc1_.bitmapData.height);
         this.meterMask.graphics.endFill();
      }
      
      override protected function onOpen() : void
      {
         mediator.sysex.addEventListener(ToneCentralEvents.TUNER_PITCH,this.tunerPitchHandler,false,0,true);
         mediator.sysex.addEventListener(ToneCentralEvents.TUNER_MULTI_PITCH,this.tunerMultiPitchHandler,false,0,true);
      }
      
      private function tunerMultiPitchHandler(param1:ToneCentralEvents) : void
      {
         switch(param1.data.address)
         {
            case this.addressMap.command_tuner_multi_mode_str_1_pitch.address:
               this.setMultiMeterPosition(this.str1Bar,param1.data.value);
               break;
            case this.addressMap.command_tuner_multi_mode_str_2_pitch.address:
               this.setMultiMeterPosition(this.str2Bar,param1.data.value);
               break;
            case this.addressMap.command_tuner_multi_mode_str_3_pitch.address:
               this.setMultiMeterPosition(this.str3Bar,param1.data.value);
               break;
            case this.addressMap.command_tuner_multi_mode_str_4_pitch.address:
               this.setMultiMeterPosition(this.str4Bar,param1.data.value);
               break;
            case this.addressMap.command_tuner_multi_mode_str_5_pitch.address:
               this.setMultiMeterPosition(this.str5Bar,param1.data.value);
               break;
            case this.addressMap.command_tuner_multi_mode_str_6_pitch.address:
               this.setMultiMeterPosition(this.str6Bar,param1.data.value);
         }
      }
      
      private function tunerPitchHandler(param1:ToneCentralEvents) : void
      {
         if(param1.data.value[0] == "0C")
         {
            this.reset();
            return;
         }
         this.setKey(param1.data.value[0]);
         var _loc2_:int = parseInt(param1.data.value[1],16) - 50;
         this.setArrow(_loc2_);
         this.rotateMeter(_loc2_);
         this.setLabelColor(_loc2_);
      }
      
      private function setLabelColor(param1:int) : void
      {
         this.mainLabel.styleName = "mainMeterLabel";
         this.leftLabel.styleName = "mainMeterLabel";
         this.rightLabel.styleName = "mainMeterLabel";
         this.subLabel10.styleName = "subMeterLabel";
         this.subLabel20.styleName = "subMeterLabel";
         this.subLabel30.styleName = "subMeterLabel";
         this.subLabel40.styleName = "subMeterLabel";
         this.subLabelm10.styleName = "subMeterLabel";
         this.subLabelm20.styleName = "subMeterLabel";
         this.subLabelm30.styleName = "subMeterLabel";
         this.subLabelm40.styleName = "subMeterLabel";
         if(param1 < -45)
         {
            this.leftLabel.styleName = "mainMeterLabelFocus";
         }
         else if(param1 < -35)
         {
            this.subLabelm40.styleName = "subMeterLabelFocus";
         }
         else if(param1 < -25)
         {
            this.subLabelm30.styleName = "subMeterLabelFocus";
         }
         else if(param1 < -15)
         {
            this.subLabelm20.styleName = "subMeterLabelFocus";
         }
         else if(param1 < -5)
         {
            this.subLabelm10.styleName = "subMeterLabelFocus";
         }
         else if(param1 < 5)
         {
            this.mainLabel.styleName = "mainMeterLabelFocus";
         }
         else if(param1 < 15)
         {
            this.subLabel10.styleName = "subMeterLabelFocus";
         }
         else if(param1 < 25)
         {
            this.subLabel20.styleName = "subMeterLabelFocus";
         }
         else if(param1 < 35)
         {
            this.subLabel30.styleName = "subMeterLabelFocus";
         }
         else if(param1 < 45)
         {
            this.subLabel40.styleName = "subMeterLabelFocus";
         }
         else if(param1 <= 50)
         {
            this.rightLabel.styleName = "mainMeterLabelFocus";
         }
      }
      
      private function reset() : void
      {
         this.key.source = null;
         this.leftArrow.source = this.leftArrowImg;
         this.rightArrow.source = this.rightArrowImg;
         this.rotateMeter(0);
         this.mainLabel.styleName = "mainMeterLabel";
         this.leftLabel.styleName = "mainMeterLabel";
         this.rightLabel.styleName = "mainMeterLabel";
         this.subLabel10.styleName = "subMeterLabel";
         this.subLabel20.styleName = "subMeterLabel";
         this.subLabel30.styleName = "subMeterLabel";
         this.subLabel40.styleName = "subMeterLabel";
         this.subLabelm10.styleName = "subMeterLabel";
         this.subLabelm20.styleName = "subMeterLabel";
         this.subLabelm30.styleName = "subMeterLabel";
         this.subLabelm40.styleName = "subMeterLabel";
      }
      
      private function setArrow(param1:int) : void
      {
         if(param1 < -3)
         {
            this.leftArrow.source = this.leftArrowSelectedImg;
            this.rightArrow.source = this.rightArrowImg;
         }
         else if(param1 > 3)
         {
            this.leftArrow.source = this.leftArrowImg;
            this.rightArrow.source = this.rightArrowSelectedImg;
         }
         else
         {
            this.leftArrow.source = this.leftArrowSelectedImg;
            this.rightArrow.source = this.rightArrowSelectedImg;
         }
      }
      
      private function setKey(param1:String) : void
      {
         switch(param1)
         {
            case "00":
               this.key.source = this.imgC;
               break;
            case "01":
               this.key.source = this.imgCSharp;
               break;
            case "02":
               this.key.source = this.imgD;
               break;
            case "03":
               this.key.source = this.imgDSharp;
               break;
            case "04":
               this.key.source = this.imgE;
               break;
            case "05":
               this.key.source = this.imgF;
               break;
            case "06":
               this.key.source = this.imgFSharp;
               break;
            case "07":
               this.key.source = this.imgG;
               break;
            case "08":
               this.key.source = this.imgGSharp;
               break;
            case "09":
               this.key.source = this.imgA;
               break;
            case "0A":
               this.key.source = this.imgASharp;
               break;
            case "0B":
               this.key.source = this.imgB;
         }
      }
      
      private function setMultiKey(param1:BitmapImage, param2:int) : void
      {
         if(!param1)
         {
            return;
         }
         switch(param2)
         {
            case 0:
               param1.source = this.imgMC;
               break;
            case 1:
               param1.source = this.imgMCSharp;
               break;
            case 2:
               param1.source = this.imgMD;
               break;
            case 3:
               param1.source = this.imgMDSharp;
               break;
            case 4:
               param1.source = this.imgME;
               break;
            case 5:
               param1.source = this.imgMF;
               break;
            case 6:
               param1.source = this.imgMFSharp;
               break;
            case 7:
               param1.source = this.imgMG;
               break;
            case 8:
               param1.source = this.imgMGSharp;
               break;
            case 9:
               param1.source = this.imgMA;
               break;
            case 10:
               param1.source = this.imgMASharp;
               break;
            case 11:
               param1.source = this.imgMB;
         }
      }
      
      private function setMultiMeterPosition(param1:UIComponent, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(param2[0] == "0C")
         {
            param1.visible = false;
         }
         else
         {
            param1.visible = true;
            _loc3_ = int(ToneCentralUtil.convertDecimal(param2[1]));
            if(45 <= _loc3_ && _loc3_ <= 55)
            {
               _loc3_ = 50;
            }
            _loc4_ = MULTI_METER_CENTER - (_loc3_ - 50) * 146 / 100;
            if(_loc4_ < MULTI_METER_CENTER - 75 || _loc4_ > MULTI_METER_CENTER + 75)
            {
               param1.visible = false;
            }
            else
            {
               param1.visible = true;
               param1.y = _loc4_;
            }
         }
      }
      
      private function rotateMeter(param1:int) : void
      {
         if(this.rotate.isPlaying)
         {
            return;
         }
         var _loc2_:Number = param1 * 40 / 50;
         this.rotate.angleTo = _loc2_;
         this.rotate.play();
      }
      
      override protected function onCloseClick(param1:MouseEvent) : void
      {
         if(mediator.connected)
         {
            mediator.sysex.setDataFunc(this.addressMap.command_running_mode.address,"00");
         }
         else
         {
            close();
         }
      }
      
      override protected function onClose() : void
      {
         mediator.sysex.removeEventListener(ToneCentralEvents.TUNER_PITCH,this.tunerPitchHandler);
      }
   }
}

