package tonecentral.views.edit
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.events.PopUpEvent;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.EditManager;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.LabelTextImageButton;
   import tonecentral.components.popup.ConfirmPopup;
   import tonecentral.components.popup.SelectWritePatchNoPopup;
   import tonecentral.events.EditorEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.TemporaryParams;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class EditHeaderComponent extends Group
   {
      
      public static const PARAMS_LIST:Array = [{
         "id":"ns1_threshold",
         "name":"NS",
         "min":0,
         "max":100,
         "step":1
      }];
      
      private var bgPatchNoImg_u:Class = EditHeaderComponent_bgPatchNoImg_u;
      
      private var bgPatchNoImg_p:Class = EditHeaderComponent_bgPatchNoImg_p;
      
      private var textAreaBgImg:Class = EditHeaderComponent_textAreaBgImg;
      
      private var selectedPatchNoLabel:Label;
      
      private var selectedPatchName:Label;
      
      private var writeButton:LabelTextImageButton;
      
      private var clearButton:ImageLabelButton;
      
      private var selectedPatchNoBgi:BitmapImage;
      
      private var selectedPatchNameBgi:BitmapImage;
      
      private var textAreaBg:BitmapImage;
      
      private var updateFromMe80:Boolean = false;
      
      private var bgPatchNo:BitmapImage;
      
      private var patchNoTxtStyle:String;
      
      private var isManual:Boolean;
      
      private var addressMap:AddressMap;
      
      private var mediator:ToneCentralMediator;
      
      private var editMng:EditManager;
      
      private var selectWritePatchNoPopup:SelectWritePatchNoPopup;
      
      public function EditHeaderComponent()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex = SystemExclusive.getInstance();
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.CHANGE_MODE,this.changeModeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.CHAB_SUCCESS,this.chabSuccessHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.CHAB_LOAD_END,this.chabLoadEndHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.CONNECTED,this.deviceConnectedHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.DISCONNECTED,this.deviceDisconnectedHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PATCH_WRITE,this.patchWriteHandler,false,0,true);
         this.addressMap = AddressMap.getInstance();
         this.addressMap.addEventListener(ToneCentralEvents.ADDRESS_MAP_COMPLETE,this.addressMapComplete,false,0,true);
         this.editMng = new EditManager();
         this.editMng.addEventListener(EditorEvent.PARAM_CHANGE,this.paramChangeHandler,false,0,true);
      }
      
      private function chabLoadEndHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.hideLoading();
      }
      
      private function chabSuccessHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.showLoading();
      }
      
      private function hideLoadingDelayTimerHandler(param1:TimerEvent) : void
      {
         this.mediator.hideLoading();
      }
      
      private function deviceDisconnectedHandler(param1:ToneCentralEvents) : void
      {
         this.writeButton.enabled = false;
      }
      
      private function deviceConnectedHandler(param1:ToneCentralEvents) : void
      {
         this.writeButton.enabled = true;
      }
      
      private function addressMapComplete(param1:ToneCentralEvents) : void
      {
         this.createParts();
      }
      
      public function createParts() : void
      {
         this.bgPatchNo = new BitmapImage();
         this.bgPatchNo.y = 7;
         this.bgPatchNo.x = 10;
         this.bgPatchNo.width = 42;
         this.bgPatchNo.height = 25;
         this.bgPatchNo.source = this.bgPatchNoImg_p;
         addElement(this.bgPatchNo);
         this.selectedPatchNoLabel = new Label();
         this.selectedPatchNoLabel.y = 15;
         this.selectedPatchNoLabel.x = 12;
         this.selectedPatchNoLabel.width = 38;
         this.selectedPatchNoLabel.styleName = this.patchNoTxtStyle;
         addElement(this.selectedPatchNoLabel);
         this.textAreaBg = new BitmapImage();
         this.textAreaBg.source = this.textAreaBgImg;
         this.textAreaBg.x = 57;
         this.textAreaBg.y = 8;
         this.textAreaBg.width = 225;
         this.textAreaBg.height = 25;
         addElement(this.textAreaBg);
         this.selectedPatchName = new Label();
         this.selectedPatchName.styleName = "selectPachName";
         this.selectedPatchName.x = 62;
         this.selectedPatchName.y = 15;
         addElement(this.selectedPatchName);
         this.writeButton = new LabelTextImageButton();
         this.writeButton.y = 8;
         this.writeButton.right = 15;
         this.writeButton.width = 100;
         this.writeButton.height = 25;
         this.writeButton.styleName = "write";
         this.writeButton.enabled = false;
         this.writeButton.addEventListener(MouseEvent.CLICK,this.writeClickHandler,false,0,true);
         addElement(this.writeButton);
         this.clearButton = new ImageLabelButton();
         this.clearButton.y = 8;
         this.clearButton.right = 125;
         this.clearButton.width = 100;
         this.clearButton.height = 25;
         this.clearButton.label = "CLEAR";
         this.clearButton.styleName = "clearButton";
         this.clearButton.addEventListener(MouseEvent.CLICK,this.clearButtonClickHandler,false,0,true);
         addElement(this.clearButton);
      }
      
      private function clearButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ConfirmPopup = new ConfirmPopup();
         _loc2_.setHeaderText("dialog.clear.header");
         _loc2_.setMsgText("dialog.clear.msg");
         _loc2_.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = _loc2_;
         _loc2_.addEventListener(ToneCentralEvents.OK,this.clearOKHandler,false,0,true);
      }
      
      private function clearOKHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.sysex.setDataFunc(this.addressMap.command_patch_clear.address,"00");
      }
      
      private function createItemData(param1:Object) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:TemporaryParams = this.mediator.sysex.params.temporaryParams;
         _loc3_ = param1.id;
         _loc4_ = "temp_" + _loc3_;
         _loc2_ = {};
         _loc2_.id = param1.id;
         _loc2_.name = param1.name;
         _loc2_.max = param1.max;
         _loc2_.min = param1.min;
         _loc2_.step = param1.step;
         _loc2_.address = this.addressMap[_loc4_].address;
         _loc5_ = ParameterUtil.getDoubleByteData(_loc2_.address,_loc6_[_loc3_]) * int(_loc2_.step);
         _loc2_.value = _loc5_;
         return _loc2_;
      }
      
      private function writeClickHandler(param1:MouseEvent) : void
      {
         this.stage.focus = null;
         this.selectWritePatchNoPopup = new SelectWritePatchNoPopup("",this.mediator.sysex.params.temporaryParams.patchname);
         this.selectWritePatchNoPopup.popup(Context.dialogMng.parent,true);
         this.selectWritePatchNoPopup.addEventListener(PopUpEvent.CLOSE,this.writePopupCloseHandler,false,0,true);
         Context.dialogMng.currentPopup = this.selectWritePatchNoPopup;
      }
      
      private function writePopupCloseHandler(param1:PopUpEvent) : void
      {
         this.selectWritePatchNoPopup = null;
      }
      
      private function patchWriteHandler(param1:ToneCentralEvents) : void
      {
         if(this.selectWritePatchNoPopup)
         {
            this.selectWritePatchNoPopup.close();
         }
      }
      
      private function changeHandler(param1:Event) : void
      {
         if(this.updateFromMe80)
         {
            this.updateFromMe80 = false;
            return;
         }
         var _loc2_:String = this.addressMap.temp_master_bpm.address;
         var _loc3_:int = int(param1.target.value);
         var _loc4_:String = ToneCentralUtil.convertHexaDecimal(Math.floor(_loc3_ / 128).toString(),2);
         var _loc5_:String = ToneCentralUtil.convertHexaDecimal((_loc3_ % 128).toString(),2);
         this.mediator.sysex.setDataFunc(_loc2_,_loc4_ + "," + _loc5_);
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.setHeaderContents();
      }
      
      private function changeModeHandler(param1:ToneCentralEvents) : void
      {
         this.isManual = String(param1.data) == "manual";
         this.setHeaderContents();
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.mediator.selectedArea = ToneCentralDefinition.SIDE_AREA;
         this.setHeaderContents();
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.setHeaderContents();
      }
      
      private function setHeaderContents() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         this.updateFromMe80 = true;
         if(this.mediator.selectedArea == ToneCentralDefinition.SIDE_AREA && !this.isManual)
         {
            _loc1_ = this.mediator.sysex.params.temporaryParams.currentPatchNo;
            if(_loc1_ == 0)
            {
               this.selectedPatchNoLabel.text = "PANEL";
            }
            else
            {
               _loc2_ = ["PANEL","A: CH1","A: CH2","A: CH3","A: CH4","B: CH1","B: CH2","B: CH3","B: CH4"];
               if(ParameterDefinitionGT.MAX_PATCH_NUMBER == 4)
               {
                  _loc2_ = ["PANEL","A: CH1","A: CH2","B: CH1","B: CH2"];
               }
               this.selectedPatchNoLabel.text = _loc2_[_loc1_];
            }
         }
         else
         {
            this.selectedPatchNoLabel.text = "";
         }
         this.selectedPatchName.text = this.mediator.sysex.params.temporaryParams.patchname;
         if(this.mediator.connected)
         {
            this.writeButton.enabled = true;
            this.writeButton.alpha = 1;
         }
         this.selectedPatchName.enabled = true;
         if(this.mediator.sysex.temporaryAllUpdate)
         {
            this.selectedPatchNoLabel.text = "";
         }
         this.setPatchNoBg();
      }
      
      private function paramChangeHandler(param1:EditorEvent) : void
      {
         this.updateFromMe80 = true;
         this.selectedPatchName.text = this.mediator.sysex.params.temporaryParams.patchname;
      }
      
      private function setPatchNoBg() : void
      {
         if(this.mediator.sysex.params.temporaryParams.currentPatchNo >= 0 && this.mediator.sysex.params.temporaryParams.currentPatchNo < 200 && this.mediator.selectedArea == ToneCentralDefinition.SIDE_AREA && !this.isManual)
         {
            this.bgPatchNo.source = this.bgPatchNoImg_u;
            this.patchNoTxtStyle = "selectPatchNo";
         }
         else
         {
            this.bgPatchNo.source = this.bgPatchNoImg_p;
            this.patchNoTxtStyle = "selectPatchNo_p";
         }
         if(this.selectedPatchNoLabel)
         {
            this.selectedPatchNoLabel.styleName = this.patchNoTxtStyle;
         }
      }
      
      private function nameLengthAdjustment(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Array = new Array();
         if(param1.length > 0)
         {
            _loc2_ = param1.split(",");
         }
         if(_loc2_.length > 16)
         {
            _loc2_ = _loc2_.slice(0,16);
         }
         var _loc3_:Array = new Array();
         if(_loc2_.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < 16)
            {
               if(_loc4_ < _loc2_.length)
               {
                  _loc3_[_loc4_] = _loc2_[_loc4_];
               }
               else
               {
                  _loc3_[_loc4_] = "20";
               }
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < 16)
            {
               _loc3_[_loc5_] = "20";
               _loc5_++;
            }
         }
         return _loc3_.join(",");
      }
   }
}

