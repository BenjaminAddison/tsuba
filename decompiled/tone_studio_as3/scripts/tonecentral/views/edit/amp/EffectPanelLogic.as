package tonecentral.views.edit.amp
{
   import flash.events.MouseEvent;
   import mx.collections.ArrayCollection;
   import spark.components.RadioButtonGroup;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.manager.SystemManager;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.SystemEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.SystemParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class EffectPanelLogic extends ViewLogic
   {
      
      private var view:EffectPanel;
      
      private var mediator:ToneCentralMediator;
      
      private var systemMng:SystemManager;
      
      private var addressMap:AddressMap;
      
      private var effectListArray:Array;
      
      private var effectRadioGroup:RadioButtonGroup;
      
      public function EffectPanelLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as EffectPanel;
      }
      
      override protected function onCreationComplete() : void
      {
         this.addressMap = AddressMap.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_AMP_TEMPORARY,this.setAmpTemporaryHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.mediator.sysex.addUpdateTemporaryCallback(this.updateTemporaryHandler);
         this.systemMng = SystemManager.getInstance();
         this.systemMng.addEventListener(SystemEvent.AMP_CHANGE,this.ampChangeHandler,false,0,true);
         this.effectRadioGroup = new RadioButtonGroup();
         this.view.tapButton.addEventListener(MouseEvent.MOUSE_DOWN,this.tapButtonClickHandler,false,0,true);
         this.view.tapButton2.addEventListener(MouseEvent.MOUSE_DOWN,this.tapButton2ClickHandler,false,0,true);
         this.createEffectList();
         this.setEffectType();
         this.setEffectState();
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.setEffectType();
         this.setEffectState();
         this.setTapDelayTime();
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.setEffectType();
         this.setEffectState();
         this.setTapDelayTime();
      }
      
      private function updateTemporaryHandler(param1:Object) : void
      {
         this.setEffectType();
         this.setTapDelayTime();
      }
      
      private function tapButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = "00";
         this.mediator.sysex.setDataFunc(this.addressMap.command_sw_tap.address,_loc2_);
      }
      
      private function tapButton2ClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = "00";
         this.mediator.sysex.setDataFunc(this.addressMap.command_sw_tap2.address,_loc2_);
      }
      
      private function setAmpTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.getTemporaryPatchParamsFunc();
      }
      
      private function radioClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = this.effectRadioGroup.selectedValue.toString();
         this.mediator.effectCategoryChange(_loc2_);
      }
      
      private function ampChangeHandler(param1:SystemEvent) : void
      {
         this.setEffectState();
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.setEffectType();
         this.setEffectState();
         this.setTapDelayTime();
      }
      
      private function setEffectState() : void
      {
         var _loc1_:SystemParams = this.mediator.sysex.params.system;
         this.resetFxState();
         if(_loc1_.sys_fxsel_state_fx > 0)
         {
            this.effectListArray[_loc1_.sys_fxsel_state_fx - 1].isOn = true;
         }
         if(_loc1_.sys_fxsel_state_fx2 > 0)
         {
            this.effectListArray[_loc1_.sys_fxsel_state_fx2 + 5].isOn = true;
         }
         if(_loc1_.sys_fxsel_state_fx3 > 0)
         {
            this.effectListArray[_loc1_.sys_fxsel_state_fx3 + 11].isOn = true;
         }
      }
      
      private function resetFxState() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.effectListArray.length - 6)
         {
            this.effectListArray[_loc1_].isOn = false;
            _loc1_++;
         }
      }
      
      private function setEffectType() : void
      {
         var _loc3_:int = 0;
         var _loc1_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         var _loc2_:int = 0;
         while(_loc2_ < ParameterDefinitionGT.EFFECT_BOX_ASSIGN.length)
         {
            _loc3_ = int(_loc1_[ParameterDefinitionGT.EFFECT_BOX_ASSIGN[_loc2_].id]);
            this.effectListArray[_loc2_].setValue(_loc3_);
            _loc2_++;
         }
      }
      
      private function createEffectList() : void
      {
         this.view.booster1.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_BOOSTER_LIST);
         this.view.booster2.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_BOOSTER_LIST);
         this.view.booster3.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_BOOSTER_LIST);
         this.view.mod1.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_MOD_LIST);
         this.view.mod2.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_MOD_LIST);
         this.view.mod3.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_MOD_LIST);
         this.view.delay1.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DELAY_LIST);
         this.view.delay2.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DELAY_LIST);
         this.view.delay3.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DELAY_LIST);
         this.view.fx1.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_MOD_LIST);
         this.view.fx2.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_MOD_LIST);
         this.view.fx3.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_MOD_LIST);
         this.view.reverb1.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_REVERB_LIST);
         this.view.reverb2.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_REVERB_LIST);
         this.view.reverb3.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_REVERB_LIST);
         this.view.dly_rev_layer1.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DLY_REV_LAYER_LIST);
         this.view.dly_rev_layer2.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DLY_REV_LAYER_LIST);
         this.view.dly_rev_layer3.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DLY_REV_LAYER_LIST);
         this.view.delay21.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DELAY_LIST);
         this.view.delay22.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DELAY_LIST);
         this.view.delay23.dataProvider = new ArrayCollection(ParameterDefinitionGT.FX_DELAY_LIST);
         this.view.booster1.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[0];
         this.view.booster2.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[1];
         this.view.booster3.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[2];
         this.view.mod1.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[3];
         this.view.mod2.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[4];
         this.view.mod3.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[5];
         this.view.delay1.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[6];
         this.view.delay2.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[7];
         this.view.delay3.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[8];
         this.view.fx1.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[9];
         this.view.fx2.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[10];
         this.view.fx3.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[11];
         this.view.dly_rev_layer1.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[12];
         this.view.dly_rev_layer2.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[13];
         this.view.dly_rev_layer3.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[14];
         this.view.delay21.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[15];
         this.view.delay22.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[16];
         this.view.delay23.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[17];
         this.view.reverb1.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[18];
         this.view.reverb2.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[19];
         this.view.reverb3.data = ParameterDefinitionGT.EFFECT_BOX_ASSIGN[20];
         this.view.booster1.setColor(65280,39168);
         this.view.booster2.setColor(16711680,10027008);
         this.view.booster3.setColor(16763904,10066176);
         this.view.mod1.setColor(65280,39168);
         this.view.mod2.setColor(16711680,10027008);
         this.view.mod3.setColor(16763904,10066176);
         this.view.delay1.setColor(65280,39168);
         this.view.delay2.setColor(16711680,10027008);
         this.view.delay3.setColor(16763904,10066176);
         this.view.fx1.setColor(65280,39168);
         this.view.fx2.setColor(16711680,10027008);
         this.view.fx3.setColor(16763904,10066176);
         this.view.dly_rev_layer1.setColor(65280,39168);
         this.view.dly_rev_layer2.setColor(16711680,10027008);
         this.view.dly_rev_layer3.setColor(16763904,10066176);
         this.view.delay21.hideLamp();
         this.view.delay22.hideLamp();
         this.view.delay23.hideLamp();
         this.view.reverb1.hideLamp();
         this.view.reverb2.hideLamp();
         this.view.reverb3.hideLamp();
         this.effectListArray = [this.view.booster1,this.view.booster2,this.view.booster3,this.view.mod1,this.view.mod2,this.view.mod3,this.view.delay1,this.view.delay2,this.view.delay3,this.view.fx1,this.view.fx2,this.view.fx3,this.view.dly_rev_layer1,this.view.dly_rev_layer2,this.view.dly_rev_layer3,this.view.delay21,this.view.delay22,this.view.delay23,this.view.reverb1,this.view.reverb2,this.view.reverb3];
         var _loc1_:int = 0;
         while(_loc1_ < this.effectListArray.length)
         {
            this.effectListArray[_loc1_].addEventListener(ToneCentralEvents.CHANGE_EFFECT,this.changeEffectHandler,false,0,true);
            _loc1_++;
         }
      }
      
      private function changeEffectHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:EffectTypeSelect = param1.currentTarget as EffectTypeSelect;
         var _loc3_:String = ToneCentralUtil.convertHexaDecimal(_loc2_.selectedItem.val,2);
         var _loc4_:String = this.addressMap["temp_" + _loc2_.data.id].address;
         this.mediator.sysex.setDataFunc(_loc4_,_loc3_);
      }
      
      private function setTapDelayTime() : void
      {
         var _loc1_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         this.view.delayTimeLabel.text = _loc1_.delay_delay_time + "ms";
         this.view.delay2TimeLabel.text = _loc1_.delay2_delay_time + "ms";
      }
   }
}

