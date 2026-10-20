package tonecentral.views.edit.amp
{
   import mx.binding.BindingManager;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RadioButtonGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import tonecentral.components.ImageLabelRadioButton;
   
   public class AmpPanel extends Group
   {
      
      private var _991605247ampTypeGroup:RadioButtonGroup;
      
      private var _1901265579knobContainer:Group;
      
      private var _103149406logic:AmpPanelLogic;
      
      private var _109821083swFx1:EffectSwitch;
      
      private var _109821084swFx2:EffectSwitch;
      
      private var _109821085swFx3:EffectSwitch;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bgi_amp_panel_002_png_457037419:Class = AmpPanel__embed_mxml___assets_images_bgi_amp_panel_002_png_457037419;
      
      private var _embed_mxml___assets_images_bgi_amp_panel_png_1704893845:Class = AmpPanel__embed_mxml___assets_images_bgi_amp_panel_png_1704893845;
      
      private var _embed_mxml___assets_images_bgi_amp_type_png_705883339:Class = AmpPanel__embed_mxml___assets_images_bgi_amp_type_png_705883339;
      
      public function AmpPanel()
      {
         super();
         mx_internal::_document = this;
         this.visible = false;
         this.mxmlContent = [this._AmpPanel_Group2_c()];
         this._AmpPanel_RadioButtonGroup1_i();
         this._AmpPanel_AmpPanelLogic1_i();
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _AmpPanel_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"ampTypeGroup");
         this.ampTypeGroup = _loc1_;
         BindingManager.executeBindings(this,"ampTypeGroup",this.ampTypeGroup);
         return _loc1_;
      }
      
      private function _AmpPanel_AmpPanelLogic1_i() : AmpPanelLogic
      {
         var _loc1_:AmpPanelLogic = new AmpPanelLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _AmpPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 10;
         _loc1_.mxmlContent = [this._AmpPanel_BitmapImage1_c(),this._AmpPanel_BitmapImage2_c(),this._AmpPanel_BitmapImage3_c(),this._AmpPanel_Line1_c(),this._AmpPanel_Line2_c(),this._AmpPanel_Line3_c(),this._AmpPanel_Group3_c(),this._AmpPanel_HGroup1_c(),this._AmpPanel_Group4_c(),this._AmpPanel_Group5_c(),this._AmpPanel_Group6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_amp_type_png_705883339;
         _loc1_.x = 64;
         _loc1_.y = 151;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AmpPanel_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_amp_panel_png_1704893845;
         _loc1_.x = 529;
         _loc1_.y = 165;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AmpPanel_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_amp_panel_002_png_457037419;
         _loc1_.x = 675;
         _loc1_.y = 166;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AmpPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 185;
         _loc1_.x = 285;
         _loc1_.y = 55;
         _loc1_.stroke = this._AmpPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AmpPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _AmpPanel_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 185;
         _loc1_.x = 514;
         _loc1_.y = 55;
         _loc1_.stroke = this._AmpPanel_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AmpPanel_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _AmpPanel_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 185;
         _loc1_.x = 744;
         _loc1_.y = 55;
         _loc1_.stroke = this._AmpPanel_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AmpPanel_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _AmpPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 70;
         _loc1_.y = 60;
         _loc1_.mxmlContent = [this._AmpPanel_Label1_c(),this._AmpPanel_Label2_c(),this._AmpPanel_Label3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "AMPLIFIER";
         _loc1_.x = 65;
         _loc1_.styleName = "ampParameterName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "EQUALIZER";
         _loc1_.x = 300;
         _loc1_.styleName = "ampParameterName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "EFFECTS";
         _loc1_.x = 530;
         _loc1_.styleName = "ampParameterName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 60;
         _loc1_.y = 110;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._AmpPanel_Label4_c(),this._AmpPanel_Label5_c(),this._AmpPanel_Label6_c(),this._AmpPanel_Spacer1_c(),this._AmpPanel_Label7_c(),this._AmpPanel_Label8_c(),this._AmpPanel_Label9_c(),this._AmpPanel_Spacer2_c(),this._AmpPanel_Label10_c(),this._AmpPanel_Label11_c(),this._AmpPanel_Label12_c(),this._AmpPanel_Spacer3_c(),this._AmpPanel_Label13_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "AMP TYPE";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "GAIN";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "VOLUME";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "BASS";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "MIDDLE";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "TREBLE";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label10_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "BOOSTER/MOD";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label11_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "DELAY/FX";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label12_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "REVERB";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Label13_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "PRESENCE";
         _loc1_.styleName = "ampKnobName";
         _loc1_.width = 73;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 528;
         _loc1_.y = 80;
         _loc1_.mxmlContent = [this._AmpPanel_EffectSwitch1_i(),this._AmpPanel_EffectSwitch2_i(),this._AmpPanel_EffectSwitch3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_EffectSwitch1_i() : EffectSwitch
      {
         var _loc1_:EffectSwitch = new EffectSwitch();
         _loc1_.x = 0;
         _loc1_.id = "swFx1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swFx1 = _loc1_;
         BindingManager.executeBindings(this,"swFx1",this.swFx1);
         return _loc1_;
      }
      
      private function _AmpPanel_EffectSwitch2_i() : EffectSwitch
      {
         var _loc1_:EffectSwitch = new EffectSwitch();
         _loc1_.x = 73;
         _loc1_.id = "swFx2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swFx2 = _loc1_;
         BindingManager.executeBindings(this,"swFx2",this.swFx2);
         return _loc1_;
      }
      
      private function _AmpPanel_EffectSwitch3_i() : EffectSwitch
      {
         var _loc1_:EffectSwitch = new EffectSwitch();
         _loc1_.x = 146;
         _loc1_.id = "swFx3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swFx3 = _loc1_;
         BindingManager.executeBindings(this,"swFx3",this.swFx3);
         return _loc1_;
      }
      
      private function _AmpPanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = -20;
         _loc1_.y = 2;
         _loc1_.mxmlContent = [this._AmpPanel_ImageLabelRadioButton1_c(),this._AmpPanel_ImageLabelRadioButton2_c(),this._AmpPanel_ImageLabelRadioButton3_c(),this._AmpPanel_ImageLabelRadioButton4_c(),this._AmpPanel_ImageLabelRadioButton5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_ImageLabelRadioButton1_c() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "BROWN";
         _loc1_.y = 140;
         _loc1_.width = 85;
         _loc1_.height = 18;
         _loc1_.styleName = "ampSelect";
         _loc1_.groupName = "ampTypeGroup";
         _loc1_.value = 4;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_ImageLabelRadioButton2_c() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "LEAD";
         _loc1_.y = 160;
         _loc1_.width = 85;
         _loc1_.height = 18;
         _loc1_.styleName = "ampSelect";
         _loc1_.groupName = "ampTypeGroup";
         _loc1_.value = 3;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_ImageLabelRadioButton3_c() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "CRUNCH";
         _loc1_.y = 180;
         _loc1_.width = 85;
         _loc1_.height = 18;
         _loc1_.styleName = "ampSelect";
         _loc1_.groupName = "ampTypeGroup";
         _loc1_.value = 2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_ImageLabelRadioButton4_c() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "CLEAN";
         _loc1_.y = 200;
         _loc1_.width = 85;
         _loc1_.height = 18;
         _loc1_.styleName = "ampSelect";
         _loc1_.groupName = "ampTypeGroup";
         _loc1_.value = 1;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_ImageLabelRadioButton5_c() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "ACOUSTIC";
         _loc1_.y = 220;
         _loc1_.width = 85;
         _loc1_.height = 18;
         _loc1_.styleName = "ampSelect";
         _loc1_.groupName = "ampTypeGroup";
         _loc1_.value = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AmpPanel_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 70;
         _loc1_.y = 50;
         _loc1_.id = "knobContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.knobContainer = _loc1_;
         BindingManager.executeBindings(this,"knobContainer",this.knobContainer);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ampTypeGroup() : RadioButtonGroup
      {
         return this._991605247ampTypeGroup;
      }
      
      public function set ampTypeGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._991605247ampTypeGroup;
         if(_loc2_ !== param1)
         {
            this._991605247ampTypeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ampTypeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get knobContainer() : Group
      {
         return this._1901265579knobContainer;
      }
      
      public function set knobContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1901265579knobContainer;
         if(_loc2_ !== param1)
         {
            this._1901265579knobContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"knobContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : AmpPanelLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:AmpPanelLogic) : void
      {
         var _loc2_:Object = this._103149406logic;
         if(_loc2_ !== param1)
         {
            this._103149406logic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swFx1() : EffectSwitch
      {
         return this._109821083swFx1;
      }
      
      public function set swFx1(param1:EffectSwitch) : void
      {
         var _loc2_:Object = this._109821083swFx1;
         if(_loc2_ !== param1)
         {
            this._109821083swFx1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swFx1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swFx2() : EffectSwitch
      {
         return this._109821084swFx2;
      }
      
      public function set swFx2(param1:EffectSwitch) : void
      {
         var _loc2_:Object = this._109821084swFx2;
         if(_loc2_ !== param1)
         {
            this._109821084swFx2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swFx2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swFx3() : EffectSwitch
      {
         return this._109821085swFx3;
      }
      
      public function set swFx3(param1:EffectSwitch) : void
      {
         var _loc2_:Object = this._109821085swFx3;
         if(_loc2_ !== param1)
         {
            this._109821085swFx3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swFx3",_loc2_,param1));
            }
         }
      }
   }
}

