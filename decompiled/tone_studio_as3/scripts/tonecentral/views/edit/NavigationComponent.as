package tonecentral.views.edit
{
   import flash.events.Event;
   import mx.collections.ArrayList;
   import mx.controls.Spacer;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.RadioButtonGroup;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.Definition;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.manager.EditManager;
   import tonecentral.components.ImageLabelRadioButton;
   import tonecentral.events.EditorEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class NavigationComponent extends Group
   {
      
      private static const HEIGHT:Number = 30;
      
      private var pageingLine:Class = NavigationComponent_pageingLine;
      
      private var viewStatusEvent:ViewStatusEvent;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var editorMng:EditManager;
      
      private var ctlGroup:HGroup;
      
      private var ctlOn:Boolean = false;
      
      private var updateFromMe80:Boolean = false;
      
      private var effectRadioGroup:RadioButtonGroup;
      
      private var pagingRadioGroup:RadioButtonGroup;
      
      private var pagingButtonArea:Group;
      
      private var effectsButton:ImageLabelRadioButton;
      
      private var chainButton:ImageLabelRadioButton;
      
      private var boosterButton:ImageLabelRadioButton;
      
      private var modButton:ImageLabelRadioButton;
      
      private var delayButton:ImageLabelRadioButton;
      
      private var fxButton:ImageLabelRadioButton;
      
      private var delay2Button:ImageLabelRadioButton;
      
      private var reverbButton:ImageLabelRadioButton;
      
      private var pedalButton:ImageLabelRadioButton;
      
      private var eqButton:ImageLabelRadioButton;
      
      private var nsButton:ImageLabelRadioButton;
      
      private var sendReturnButton:ImageLabelRadioButton;
      
      private var ctlButton:ImageLabelRadioButton;
      
      private var prevViewState:String;
      
      private var isInitLoading:Boolean = true;
      
      private var orgFxType:int = -1;
      
      public function NavigationComponent()
      {
         super();
         this.percentWidth = 100;
         this.height = HEIGHT;
         this.addressMap = AddressMap.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ViewStatusEvent.EFFECT_CATEGORY_CHANGE,this.viewStatusChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.SET_TEMPORARY,this.setTemporaryHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.patchChangeHandler,false,0,true);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CLEAR,this.patchClearHandler,false,0,true);
         this.editorMng = new EditManager();
         this.editorMng.addEventListener(EditorEvent.EFFECT_TYPE_CHANGE,this.effectTypeChangeHandler,false,0,true);
         this.pagingRadioGroup = new RadioButtonGroup();
         this.pagingRadioGroup.addEventListener(Event.CHANGE,this.pageChangeHandler,false,0,true);
         this.effectRadioGroup = new RadioButtonGroup();
         this.effectRadioGroup.addEventListener(Event.CHANGE,this.effectChangeHandler,false,0,true);
         this.effectRadioGroup.selectedValue = Definition.EFFECTS;
         this.createParts();
      }
      
      private function effectChangeHandler(param1:Event) : void
      {
         if(this.effectRadioGroup.selectedValue == Definition.EFFECTS)
         {
            this.mediator.changeViewState(this.effectRadioGroup.selectedValue.toString());
            this.pagingButtonArea.visible = false;
         }
         else if(this.effectRadioGroup.selectedValue == Definition.CHAIN)
         {
            this.mediator.changeViewState(this.effectRadioGroup.selectedValue.toString());
            this.pagingButtonArea.visible = false;
         }
         else if(this.effectRadioGroup.selectedValue == Definition.CTL_LIST)
         {
            this.mediator.changeViewState(this.effectRadioGroup.selectedValue.toString());
            this.pagingButtonArea.visible = false;
         }
         else
         {
            this.mediator.changeViewState("details");
            this.mediator.effectCategoryChange(this.effectRadioGroup.selectedValue.toString());
            this.pagingButtonArea.visible = true;
         }
      }
      
      private function patchChangeHandler(param1:ToneCentralEvents) : void
      {
         this.pagingRadioGroup.selectedValue = "0";
         this.orgFxType = -1;
      }
      
      private function patchClearHandler(param1:ToneCentralEvents) : void
      {
         this.pagingRadioGroup.selectedValue = "0";
      }
      
      private function pageChangeHandler(param1:Event) : void
      {
         var _loc2_:ViewStatusEvent = new ViewStatusEvent(ViewStatusEvent.PAGE_CHANGE);
         _loc2_.page = int(this.pagingRadioGroup.selectedValue);
         this.mediator.dispatchEvent(_loc2_);
      }
      
      private function createParts() : void
      {
         var _loc2_:BitmapImage = null;
         var _loc1_:ArrayList = new ArrayList([{"type":ToneCentralDefinition.EDIT_TYPE_PARAMETER},{"type":ToneCentralDefinition.EDIT_TYPE_EFECT_ON_OFF}]);
         this.pagingButtonArea = new Group();
         this.pagingButtonArea.setStyle("right",5);
         this.pagingButtonArea.visible = false;
         addElement(this.pagingButtonArea);
         this.ctlGroup = new HGroup();
         this.ctlGroup.gap = 0;
         this.ctlGroup.x = 0;
         addElement(this.ctlGroup);
         this.effectsButton = new ImageLabelRadioButton();
         this.effectsButton.styleName = "pagingLeftButton";
         this.effectsButton.label = "EFFECTS";
         this.effectsButton.value = Definition.EFFECTS;
         this.effectsButton.group = this.effectRadioGroup;
         this.effectsButton.width = 55;
         this.ctlGroup.addElement(this.effectsButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.chainButton = new ImageLabelRadioButton();
         this.chainButton.styleName = "pagingRightButton";
         this.chainButton.label = "CHAIN";
         this.chainButton.value = Definition.CHAIN;
         this.chainButton.group = this.effectRadioGroup;
         this.chainButton.width = 55;
         this.ctlGroup.addElement(this.chainButton);
         var _loc3_:Spacer = new Spacer();
         _loc3_.width = 5;
         this.ctlGroup.addElement(_loc3_);
         this.boosterButton = new ImageLabelRadioButton();
         this.boosterButton.styleName = "pagingLeftButton";
         this.boosterButton.label = "BOOSTER";
         this.boosterButton.value = ParameterDefinitionGT.AMP_EFECT_NAME[0];
         this.boosterButton.width = 55;
         this.boosterButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.boosterButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.modButton = new ImageLabelRadioButton();
         this.modButton.styleName = "pagingCenterButton";
         this.modButton.label = "MOD";
         this.modButton.value = ParameterDefinitionGT.AMP_EFECT_NAME[1];
         this.modButton.width = 55;
         this.modButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.modButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.delayButton = new ImageLabelRadioButton();
         this.delayButton.styleName = "pagingCenterButton";
         this.delayButton.label = "DELAY";
         this.delayButton.value = ParameterDefinitionGT.AMP_EFECT_NAME[2];
         this.delayButton.width = 55;
         this.delayButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.delayButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.fxButton = new ImageLabelRadioButton();
         this.fxButton.styleName = "pagingCenterButton";
         this.fxButton.label = "FX";
         this.fxButton.value = ParameterDefinitionGT.AMP_EFECT_NAME[3];
         this.fxButton.group = this.effectRadioGroup;
         this.fxButton.width = 55;
         this.ctlGroup.addElement(this.fxButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.delay2Button = new ImageLabelRadioButton();
         this.delay2Button.styleName = "pagingCenterButton";
         this.delay2Button.label = "DELAY2";
         this.delay2Button.value = ParameterDefinitionGT.AMP_EFECT_NAME[5];
         this.delay2Button.width = 55;
         this.delay2Button.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.delay2Button);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.reverbButton = new ImageLabelRadioButton();
         this.reverbButton.styleName = "pagingRightButton";
         this.reverbButton.label = "REVERB";
         this.reverbButton.value = ParameterDefinitionGT.AMP_EFECT_NAME[4];
         this.reverbButton.width = 55;
         this.reverbButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.reverbButton);
         var _loc4_:Spacer = new Spacer();
         _loc4_.width = 5;
         this.ctlGroup.addElement(_loc4_);
         this.pedalButton = new ImageLabelRadioButton();
         this.pedalButton.styleName = "pagingLeftButton";
         this.pedalButton.label = "PEDAL";
         this.pedalButton.value = Definition.PEDAL_FX;
         this.pedalButton.width = 45;
         this.pedalButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.pedalButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.eqButton = new ImageLabelRadioButton();
         this.eqButton.styleName = "pagingCenterButton";
         this.eqButton.label = "EQ";
         this.eqButton.value = Definition.EQ;
         this.eqButton.width = 45;
         this.eqButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.eqButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.nsButton = new ImageLabelRadioButton();
         this.nsButton.styleName = "pagingCenterButton";
         this.nsButton.label = "NS";
         this.nsButton.value = Definition.NS;
         this.nsButton.width = 45;
         this.nsButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.nsButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.sendReturnButton = new ImageLabelRadioButton();
         this.sendReturnButton.styleName = "pagingCenterButton";
         this.sendReturnButton.label = "S/R";
         this.sendReturnButton.value = Definition.SENDRETURN;
         this.sendReturnButton.width = 45;
         this.sendReturnButton.group = this.effectRadioGroup;
         this.ctlGroup.addElement(this.sendReturnButton);
         _loc2_ = new BitmapImage();
         _loc2_.source = this.pageingLine;
         this.ctlGroup.addElement(_loc2_);
         this.ctlButton = new ImageLabelRadioButton();
         this.ctlButton.styleName = "pagingRightButton";
         this.ctlButton.label = "ASGN";
         this.ctlButton.value = Definition.CTL_LIST;
         this.ctlButton.width = 45;
         this.ctlButton.group = this.effectRadioGroup;
         this.ctlOn = false;
         this.ctlGroup.addElement(this.ctlButton);
      }
      
      private function viewStatusChangeHandler(param1:ViewStatusEvent) : void
      {
         this.editorMng.effectCategory = param1.data as String;
         this.createPagingButton();
      }
      
      private function effectTypeChangeHandler(param1:EditorEvent) : void
      {
         this.createPagingButton();
      }
      
      private function setTemporaryHandler(param1:ToneCentralEvents) : void
      {
         this.editorMng.effectCategory = this.editorMng.effectCategory;
         this.createPagingButton();
      }
      
      private function createPagingButton() : void
      {
         var _loc2_:int = 0;
         var _loc3_:BitmapImage = null;
         var _loc5_:ImageLabelRadioButton = null;
         this.pagingButtonArea.removeAllElements();
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.editorMng.parameterArray.length)
         {
            if(this.editorMng.parameterArray[_loc2_].page > _loc1_)
            {
               _loc1_ = int(this.editorMng.parameterArray[_loc2_].page);
            }
            _loc2_++;
         }
         if(_loc1_ == 1)
         {
            return;
         }
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc5_ = new ImageLabelRadioButton();
            _loc5_.label = (_loc2_ + 1).toString();
            _loc5_.width = 24;
            _loc5_.x = _loc4_;
            if(_loc2_ == 0)
            {
               _loc5_.styleName = "pagingLeftButton";
               _loc3_ = new BitmapImage();
               _loc3_.source = this.pageingLine;
               _loc3_.x = _loc5_.x + _loc5_.width - 1;
               this.pagingButtonArea.addElement(_loc3_);
               _loc4_ += _loc5_.width;
            }
            else if(_loc2_ == _loc1_ - 1)
            {
               _loc5_.styleName = "pagingRightButton";
            }
            else
            {
               _loc5_.styleName = "pagingCenterButton";
               _loc3_ = new BitmapImage();
               _loc3_.source = this.pageingLine;
               _loc3_.x = _loc5_.x + _loc5_.width - 2;
               this.pagingButtonArea.addElement(_loc3_);
               _loc4_ += _loc5_.width - 1;
            }
            _loc5_.group = this.pagingRadioGroup;
            _loc5_.value = _loc2_;
            this.pagingButtonArea.addElement(_loc5_);
            _loc2_++;
         }
         this.pagingRadioGroup.selectedValue = 0;
      }
   }
}

