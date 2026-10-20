package tonecentral.views.edit.amp
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import tonecentral.components.ImageLabelButton;
   
   public class EffectPanel extends Group
   {
      
      private var _2012978849booster1:EffectTypeSelect;
      
      private var _2012978850booster2:EffectTypeSelect;
      
      private var _2012978851booster3:EffectTypeSelect;
      
      private var _1335462130delay1:EffectTypeSelect;
      
      private var _1335462129delay2:EffectTypeSelect;
      
      private var _1550347010delay21:EffectTypeSelect;
      
      private var _1550347011delay22:EffectTypeSelect;
      
      private var _1550347012delay23:EffectTypeSelect;
      
      private var _1321868760delay2TimeLabel:Label;
      
      private var _1335462128delay3:EffectTypeSelect;
      
      private var _315531804delayTimeLabel:Label;
      
      private var _1183362090dly_rev_layer1:EffectTypeSelect;
      
      private var _1183362091dly_rev_layer2:EffectTypeSelect;
      
      private var _1183362092dly_rev_layer3:EffectTypeSelect;
      
      private var _101791fx1:EffectTypeSelect;
      
      private var _101792fx2:EffectTypeSelect;
      
      private var _101793fx3:EffectTypeSelect;
      
      private var _103149406logic:EffectPanelLogic;
      
      private var _3357039mod1:EffectTypeSelect;
      
      private var _3357040mod2:EffectTypeSelect;
      
      private var _3357041mod3:EffectTypeSelect;
      
      private var _1099845791reverb1:EffectTypeSelect;
      
      private var _1099845792reverb2:EffectTypeSelect;
      
      private var _1099845793reverb3:EffectTypeSelect;
      
      private var _659901621tapButton:ImageLabelButton;
      
      private var _1017886179tapButton2:ImageLabelButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_btn_pageing_right_up_png_113602093:Class = EffectPanel__embed_mxml___assets_images_btn_pageing_right_up_png_113602093;
      
      private var _embed_mxml__assets_images_btn_pageing_line_png_210628006:Class = EffectPanel__embed_mxml__assets_images_btn_pageing_line_png_210628006;
      
      private var _embed_mxml___assets_images_btn_vtgl_up_png_1825333965:Class = EffectPanel__embed_mxml___assets_images_btn_vtgl_up_png_1825333965;
      
      private var _embed_mxml___assets_images_btn_pageing_left_up_png_1272306319:Class = EffectPanel__embed_mxml___assets_images_btn_pageing_left_up_png_1272306319;
      
      public function EffectPanel()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._EffectPanel_Group2_c()];
         this._EffectPanel_EffectPanelLogic1_i();
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
      
      private function _EffectPanel_EffectPanelLogic1_i() : EffectPanelLogic
      {
         var _loc1_:EffectPanelLogic = new EffectPanelLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _EffectPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 10;
         _loc1_.mxmlContent = [this._EffectPanel_Group3_c(),this._EffectPanel_Group4_c(),this._EffectPanel_Group5_c(),this._EffectPanel_Group7_c(),this._EffectPanel_Group8_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._EffectPanel_BitmapImage1_c(),this._EffectPanel_Label1_c(),this._EffectPanel_EffectTypeSelect1_i(),this._EffectPanel_EffectTypeSelect2_i(),this._EffectPanel_EffectTypeSelect3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_btn_pageing_left_up_png_1272306319;
         _loc1_.width = 130;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "BOOSTER";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect1_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "booster1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.booster1 = _loc1_;
         BindingManager.executeBindings(this,"booster1",this.booster1);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect2_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "booster2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.booster2 = _loc1_;
         BindingManager.executeBindings(this,"booster2",this.booster2);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect3_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "booster3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.booster3 = _loc1_;
         BindingManager.executeBindings(this,"booster3",this.booster3);
         return _loc1_;
      }
      
      private function _EffectPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 130;
         _loc1_.mxmlContent = [this._EffectPanel_BitmapImage2_c(),this._EffectPanel_BitmapImage3_c(),this._EffectPanel_Label2_c(),this._EffectPanel_EffectTypeSelect4_i(),this._EffectPanel_EffectTypeSelect5_i(),this._EffectPanel_EffectTypeSelect6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__assets_images_btn_pageing_line_png_210628006;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_btn_pageing_right_up_png_113602093;
         _loc1_.width = 130;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "MOD";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect4_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "mod1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mod1 = _loc1_;
         BindingManager.executeBindings(this,"mod1",this.mod1);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect5_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "mod2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mod2 = _loc1_;
         BindingManager.executeBindings(this,"mod2",this.mod2);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect6_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "mod3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mod3 = _loc1_;
         BindingManager.executeBindings(this,"mod3",this.mod3);
         return _loc1_;
      }
      
      private function _EffectPanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 265;
         _loc1_.mxmlContent = [this._EffectPanel_BitmapImage4_c(),this._EffectPanel_Label3_c(),this._EffectPanel_EffectTypeSelect7_i(),this._EffectPanel_EffectTypeSelect8_i(),this._EffectPanel_EffectTypeSelect9_i(),this._EffectPanel_Group6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage4_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_btn_pageing_left_up_png_1272306319;
         _loc1_.width = 130;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "DELAY";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect7_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "delay1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay1 = _loc1_;
         BindingManager.executeBindings(this,"delay1",this.delay1);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect8_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "delay2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay2 = _loc1_;
         BindingManager.executeBindings(this,"delay2",this.delay2);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect9_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "delay3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay3 = _loc1_;
         BindingManager.executeBindings(this,"delay3",this.delay3);
         return _loc1_;
      }
      
      private function _EffectPanel_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 310;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._EffectPanel_ImageLabelButton1_i(),this._EffectPanel_Label4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "TAP";
         _loc1_.buttonMode = true;
         _loc1_.x = 0;
         _loc1_.width = 40;
         _loc1_.styleName = "update";
         _loc1_.id = "tapButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tapButton = _loc1_;
         BindingManager.executeBindings(this,"tapButton",this.tapButton);
         return _loc1_;
      }
      
      private function _EffectPanel_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "delayTime";
         _loc1_.y = 10;
         _loc1_.x = 40;
         _loc1_.width = 50;
         _loc1_.text = "0ms";
         _loc1_.id = "delayTimeLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delayTimeLabel = _loc1_;
         BindingManager.executeBindings(this,"delayTimeLabel",this.delayTimeLabel);
         return _loc1_;
      }
      
      private function _EffectPanel_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 395;
         _loc1_.mxmlContent = [this._EffectPanel_BitmapImage5_c(),this._EffectPanel_BitmapImage6_c(),this._EffectPanel_Label5_c(),this._EffectPanel_EffectTypeSelect10_i(),this._EffectPanel_EffectTypeSelect11_i(),this._EffectPanel_EffectTypeSelect12_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage5_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__assets_images_btn_pageing_line_png_210628006;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage6_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_btn_pageing_right_up_png_113602093;
         _loc1_.width = 130;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "FX";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect10_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "fx1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fx1 = _loc1_;
         BindingManager.executeBindings(this,"fx1",this.fx1);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect11_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "fx2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fx2 = _loc1_;
         BindingManager.executeBindings(this,"fx2",this.fx2);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect12_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "fx3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fx3 = _loc1_;
         BindingManager.executeBindings(this,"fx3",this.fx3);
         return _loc1_;
      }
      
      private function _EffectPanel_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 530;
         _loc1_.mxmlContent = [this._EffectPanel_BitmapImage7_c(),this._EffectPanel_Group9_c(),this._EffectPanel_Group10_c(),this._EffectPanel_Group12_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_BitmapImage7_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_btn_vtgl_up_png_1825333965;
         _loc1_.width = 310;
         _loc1_.height = 390;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_Group9_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 0;
         _loc1_.left = 10;
         _loc1_.mxmlContent = [this._EffectPanel_Label6_c(),this._EffectPanel_EffectTypeSelect13_i(),this._EffectPanel_EffectTypeSelect14_i(),this._EffectPanel_EffectTypeSelect15_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "MODE";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect13_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "dly_rev_layer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dly_rev_layer1 = _loc1_;
         BindingManager.executeBindings(this,"dly_rev_layer1",this.dly_rev_layer1);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect14_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "dly_rev_layer2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dly_rev_layer2 = _loc1_;
         BindingManager.executeBindings(this,"dly_rev_layer2",this.dly_rev_layer2);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect15_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "dly_rev_layer3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dly_rev_layer3 = _loc1_;
         BindingManager.executeBindings(this,"dly_rev_layer3",this.dly_rev_layer3);
         return _loc1_;
      }
      
      private function _EffectPanel_Group10_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._EffectPanel_Label7_c(),this._EffectPanel_EffectTypeSelect16_i(),this._EffectPanel_EffectTypeSelect17_i(),this._EffectPanel_EffectTypeSelect18_i(),this._EffectPanel_Group11_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "DELAY2";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect16_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "delay21";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay21 = _loc1_;
         BindingManager.executeBindings(this,"delay21",this.delay21);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect17_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "delay22";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay22 = _loc1_;
         BindingManager.executeBindings(this,"delay22",this.delay22);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect18_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "delay23";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay23 = _loc1_;
         BindingManager.executeBindings(this,"delay23",this.delay23);
         return _loc1_;
      }
      
      private function _EffectPanel_Group11_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 310;
         _loc1_.horizontalCenter = 20;
         _loc1_.mxmlContent = [this._EffectPanel_ImageLabelButton2_i(),this._EffectPanel_Label8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_ImageLabelButton2_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "TAP";
         _loc1_.buttonMode = true;
         _loc1_.x = 0;
         _loc1_.width = 40;
         _loc1_.styleName = "update";
         _loc1_.id = "tapButton2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tapButton2 = _loc1_;
         BindingManager.executeBindings(this,"tapButton2",this.tapButton2);
         return _loc1_;
      }
      
      private function _EffectPanel_Label8_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "delayTime";
         _loc1_.y = 10;
         _loc1_.x = 40;
         _loc1_.width = 50;
         _loc1_.text = "0ms";
         _loc1_.id = "delay2TimeLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delay2TimeLabel = _loc1_;
         BindingManager.executeBindings(this,"delay2TimeLabel",this.delay2TimeLabel);
         return _loc1_;
      }
      
      private function _EffectPanel_Group12_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 0;
         _loc1_.right = 10;
         _loc1_.mxmlContent = [this._EffectPanel_Label9_c(),this._EffectPanel_EffectTypeSelect19_i(),this._EffectPanel_EffectTypeSelect20_i(),this._EffectPanel_EffectTypeSelect21_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "REVERB";
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 65;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect19_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 140;
         _loc1_.id = "reverb1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.reverb1 = _loc1_;
         BindingManager.executeBindings(this,"reverb1",this.reverb1);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect20_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 185;
         _loc1_.id = "reverb2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.reverb2 = _loc1_;
         BindingManager.executeBindings(this,"reverb2",this.reverb2);
         return _loc1_;
      }
      
      private function _EffectPanel_EffectTypeSelect21_i() : EffectTypeSelect
      {
         var _loc1_:EffectTypeSelect = new EffectTypeSelect();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 230;
         _loc1_.id = "reverb3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.reverb3 = _loc1_;
         BindingManager.executeBindings(this,"reverb3",this.reverb3);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get booster1() : EffectTypeSelect
      {
         return this._2012978849booster1;
      }
      
      public function set booster1(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._2012978849booster1;
         if(_loc2_ !== param1)
         {
            this._2012978849booster1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"booster1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get booster2() : EffectTypeSelect
      {
         return this._2012978850booster2;
      }
      
      public function set booster2(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._2012978850booster2;
         if(_loc2_ !== param1)
         {
            this._2012978850booster2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"booster2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get booster3() : EffectTypeSelect
      {
         return this._2012978851booster3;
      }
      
      public function set booster3(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._2012978851booster3;
         if(_loc2_ !== param1)
         {
            this._2012978851booster3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"booster3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay1() : EffectTypeSelect
      {
         return this._1335462130delay1;
      }
      
      public function set delay1(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1335462130delay1;
         if(_loc2_ !== param1)
         {
            this._1335462130delay1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay2() : EffectTypeSelect
      {
         return this._1335462129delay2;
      }
      
      public function set delay2(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1335462129delay2;
         if(_loc2_ !== param1)
         {
            this._1335462129delay2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay21() : EffectTypeSelect
      {
         return this._1550347010delay21;
      }
      
      public function set delay21(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1550347010delay21;
         if(_loc2_ !== param1)
         {
            this._1550347010delay21 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay21",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay22() : EffectTypeSelect
      {
         return this._1550347011delay22;
      }
      
      public function set delay22(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1550347011delay22;
         if(_loc2_ !== param1)
         {
            this._1550347011delay22 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay22",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay23() : EffectTypeSelect
      {
         return this._1550347012delay23;
      }
      
      public function set delay23(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1550347012delay23;
         if(_loc2_ !== param1)
         {
            this._1550347012delay23 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay23",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay2TimeLabel() : Label
      {
         return this._1321868760delay2TimeLabel;
      }
      
      public function set delay2TimeLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1321868760delay2TimeLabel;
         if(_loc2_ !== param1)
         {
            this._1321868760delay2TimeLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay2TimeLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delay3() : EffectTypeSelect
      {
         return this._1335462128delay3;
      }
      
      public function set delay3(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1335462128delay3;
         if(_loc2_ !== param1)
         {
            this._1335462128delay3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delay3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delayTimeLabel() : Label
      {
         return this._315531804delayTimeLabel;
      }
      
      public function set delayTimeLabel(param1:Label) : void
      {
         var _loc2_:Object = this._315531804delayTimeLabel;
         if(_loc2_ !== param1)
         {
            this._315531804delayTimeLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delayTimeLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dly_rev_layer1() : EffectTypeSelect
      {
         return this._1183362090dly_rev_layer1;
      }
      
      public function set dly_rev_layer1(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1183362090dly_rev_layer1;
         if(_loc2_ !== param1)
         {
            this._1183362090dly_rev_layer1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dly_rev_layer1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dly_rev_layer2() : EffectTypeSelect
      {
         return this._1183362091dly_rev_layer2;
      }
      
      public function set dly_rev_layer2(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1183362091dly_rev_layer2;
         if(_loc2_ !== param1)
         {
            this._1183362091dly_rev_layer2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dly_rev_layer2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dly_rev_layer3() : EffectTypeSelect
      {
         return this._1183362092dly_rev_layer3;
      }
      
      public function set dly_rev_layer3(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1183362092dly_rev_layer3;
         if(_loc2_ !== param1)
         {
            this._1183362092dly_rev_layer3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dly_rev_layer3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fx1() : EffectTypeSelect
      {
         return this._101791fx1;
      }
      
      public function set fx1(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._101791fx1;
         if(_loc2_ !== param1)
         {
            this._101791fx1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fx1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fx2() : EffectTypeSelect
      {
         return this._101792fx2;
      }
      
      public function set fx2(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._101792fx2;
         if(_loc2_ !== param1)
         {
            this._101792fx2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fx2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fx3() : EffectTypeSelect
      {
         return this._101793fx3;
      }
      
      public function set fx3(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._101793fx3;
         if(_loc2_ !== param1)
         {
            this._101793fx3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fx3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : EffectPanelLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:EffectPanelLogic) : void
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
      public function get mod1() : EffectTypeSelect
      {
         return this._3357039mod1;
      }
      
      public function set mod1(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._3357039mod1;
         if(_loc2_ !== param1)
         {
            this._3357039mod1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mod1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mod2() : EffectTypeSelect
      {
         return this._3357040mod2;
      }
      
      public function set mod2(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._3357040mod2;
         if(_loc2_ !== param1)
         {
            this._3357040mod2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mod2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mod3() : EffectTypeSelect
      {
         return this._3357041mod3;
      }
      
      public function set mod3(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._3357041mod3;
         if(_loc2_ !== param1)
         {
            this._3357041mod3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mod3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reverb1() : EffectTypeSelect
      {
         return this._1099845791reverb1;
      }
      
      public function set reverb1(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1099845791reverb1;
         if(_loc2_ !== param1)
         {
            this._1099845791reverb1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reverb1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reverb2() : EffectTypeSelect
      {
         return this._1099845792reverb2;
      }
      
      public function set reverb2(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1099845792reverb2;
         if(_loc2_ !== param1)
         {
            this._1099845792reverb2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reverb2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reverb3() : EffectTypeSelect
      {
         return this._1099845793reverb3;
      }
      
      public function set reverb3(param1:EffectTypeSelect) : void
      {
         var _loc2_:Object = this._1099845793reverb3;
         if(_loc2_ !== param1)
         {
            this._1099845793reverb3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reverb3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tapButton() : ImageLabelButton
      {
         return this._659901621tapButton;
      }
      
      public function set tapButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._659901621tapButton;
         if(_loc2_ !== param1)
         {
            this._659901621tapButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tapButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tapButton2() : ImageLabelButton
      {
         return this._1017886179tapButton2;
      }
      
      public function set tapButton2(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1017886179tapButton2;
         if(_loc2_ !== param1)
         {
            this._1017886179tapButton2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tapButton2",_loc2_,param1));
            }
         }
      }
   }
}

