package tonecentral.views.edit.chain
{
   import flash.events.Event;
   import spark.components.RadioButtonGroup;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.chain.ChainSelectButton;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class EffectChainLogic extends ToneCentralViewLogic
   {
      
      private var view:EffectChain;
      
      private var chain1:ChainSelectButton;
      
      private var chain2:ChainSelectButton;
      
      private var chain3:ChainSelectButton;
      
      private var chainGroup:RadioButtonGroup;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      public function EffectChainLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = EffectChain(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.addressMap = AddressMap.getInstance();
         this.chainGroup = new RadioButtonGroup();
         this.chainGroup.addEventListener(Event.CHANGE,this.chainSelectChangeHandler,false,0,true);
         this.chain1 = new ChainSelectButton();
         this.chain1.radioButtonGroup = this.chainGroup;
         this.chain1.value = "00";
         this.chain1.label = "CHAIN1";
         this.chain1.y = 10;
         this.chain1.horizontalCenter = 0;
         this.view.addElement(this.chain1);
         this.chain2 = new ChainSelectButton();
         this.chain2.radioButtonGroup = this.chainGroup;
         this.chain2.value = "01";
         this.chain2.label = "CHAIN2";
         this.chain2.y = 140;
         this.chain2.horizontalCenter = 0;
         this.view.addElement(this.chain2);
         this.chain3 = new ChainSelectButton();
         this.chain3.radioButtonGroup = this.chainGroup;
         this.chain3.value = "02";
         this.chain3.label = "CHAIN3";
         this.chain3.y = 270;
         this.chain3.horizontalCenter = 0;
         this.view.addElement(this.chain3);
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.chainGroup.selectedValue = "0" + this.mediator.sysex.params.temporaryParams.chain_ptn;
         this.chain1.changeSelect();
         this.chain2.changeSelect();
         this.chain3.changeSelect();
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.chainGroup.selectedValue = "0" + this.mediator.sysex.params.temporaryParams.chain_ptn;
         this.chain1.changeSelect();
         this.chain2.changeSelect();
         this.chain3.changeSelect();
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.chainGroup.selectedValue = "0" + this.mediator.sysex.params.temporaryParams.chain_ptn;
         this.chain1.changeSelect();
         this.chain2.changeSelect();
         this.chain3.changeSelect();
      }
      
      private function chainSelectChangeHandler(param1:Event) : void
      {
         this.chain1.changeSelect();
         this.chain2.changeSelect();
         this.chain3.changeSelect();
         this.mediator.sysex.setDataFunc(this.addressMap.temp_chain_ptn.address,this.chainGroup.selectedValue.toString());
      }
   }
}

