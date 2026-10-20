package tonecentral.components.popup
{
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.collections.ArrayCollection;
   import mx.managers.PopUpManager;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.TextInput;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.manager.EditManager;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.CustomDropDownList;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.library.PatchTextInput;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class SelectWritePatchNoPopup extends ToneCentralPopup
   {
      
      private static const PATCH:String = "patch";
      
      private static const QUICK_SETTING:String = "quickSetting";
      
      private static const PREAMP:String = "preAmp";
      
      private var patchNoList:Array;
      
      private var qsSourceLabel:Label;
      
      private var qsTargetLabel:Label;
      
      private var editMng:EditManager;
      
      private var patchNoSelect:CustomDropDownList;
      
      private var patchNameInput:TextInput;
      
      private var addressMap:AddressMap;
      
      private var patchName:String;
      
      private var patchWriteArea:Group;
      
      public function SelectWritePatchNoPopup(param1:String = "", param2:String = "")
      {
         super(param1);
         var _loc3_:Array = ["PANEL","A: CH1","A: CH2","A: CH3","A: CH4","B: CH1","B: CH2","B: CH3","B: CH4"];
         if(ToneCentralMediator.getInstance().ampModel == 0)
         {
            _loc3_ = ["PANEL","A: CH1","A: CH2","B: CH1","B: CH2"];
         }
         this.patchNoList = _loc3_.slice(0,ParameterDefinitionGT.MAX_PATCH_NUMBER + 1);
         this.addressMap = AddressMap.getInstance();
         this.editMng = new EditManager();
         this.patchName = param2;
      }
      
      private function getUserPatch(param1:String, param2:int, param3:Array) : Boolean
      {
         return param1.charAt(0) == "U";
      }
      
      override protected function addOther() : void
      {
         this.patchWriteArea = new Group();
         this.patchWriteArea.y = 0;
         container.addElement(this.patchWriteArea);
         this.patchNoSelect = new CustomDropDownList();
         this.patchNoSelect.isSystemSetting = true;
         this.patchNoSelect.styleName = "systemDropDown";
         this.patchNoSelect.x = 20;
         this.patchNoSelect.y = 20;
         this.patchNoSelect.width = 90;
         this.patchWriteArea.addElement(this.patchNoSelect);
         this.patchNoSelect.dataProvider = new ArrayCollection(this.patchNoList);
         var _loc1_:int = mediator.sysex.params.temporaryParams.currentPatchNo;
         if(_loc1_ >= this.patchNoList.length || _loc1_ < 0)
         {
            _loc1_ = 0;
         }
         this.patchNoSelect.selectedIndex = _loc1_;
         this.patchNameInput = new PatchTextInput();
         this.patchNameInput.x = 120;
         this.patchNameInput.y = 22;
         this.patchNameInput.width = 225;
         this.patchNameInput.height = 26;
         this.patchNameInput.maxChars = 16;
         this.patchNameInput.restrict = "-~";
         this.patchNameInput.styleName = "selectPachNameInput";
         this.patchNameInput.editable = true;
         this.patchNameInput.showInAutomationHierarchy = false;
         this.patchNameInput.text = this.patchName;
         this.patchWriteArea.addElement(this.patchNameInput);
      }
      
      private function selectedPatchNoList(param1:MouseEvent) : void
      {
         var _loc2_:String = this.addressMap.getPatchNum(param1.target.value);
         mediator.sysex.commandWriteFunc(_loc2_);
         PopUpManager.removePopUp(this);
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(360,100);
      }
      
      override protected function addLabel() : void
      {
         super.addLabel();
         label.styleName = "notFindwritePatchNoError";
      }
      
      override protected function addButton() : void
      {
         okButton = new ImageLabelButton();
         okButton.styleName = "dialogOKButton";
         okButton.horizontalCenter = 0;
         okButton.bottom = 10;
         okButton.width = 80;
         okButton.height = 25;
         okButton.label = "OK";
         container.addElement(okButton);
         okButton.addEventListener(MouseEvent.CLICK,this.okClickHandler,false,0,true);
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.x = 10;
         closeButton.bottom = 10;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CANCEL";
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
         okButton.setFocus();
      }
      
      private function okClickHandler(param1:MouseEvent) : void
      {
         okButton.removeEventListener(MouseEvent.CLICK,this.okClickHandler);
         this.writePatch();
      }
      
      private function writePatch() : void
      {
         ToneCentralUtil.sendPatchName(this.patchNameInput.text);
         var _loc1_:Timer = new Timer(30,1);
         _loc1_.addEventListener(TimerEvent.TIMER,this.patchWriteDeleyTimerHandler,false,0,true);
         _loc1_.start();
      }
      
      private function patchWriteDeleyTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:String = this.addressMap.getPatchNum(this.patchNoSelect.selectedIndex);
         mediator.sysex.commandWriteFunc(_loc2_);
         mediator.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PATCH_WRITE_DATASET));
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.OK));
         openFlag = false;
         close();
      }
   }
}

