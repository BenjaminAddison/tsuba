package tonecentral.views.sidearea
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RadioButtonGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import tonecentral.components.ImageButtonDisableNonAlpha;
   import tonecentral.components.ImageLabelRadioButton;
   
   public class TCSideArea extends Group
   {
      
      private var _917172173allButton:ImageLabelRadioButton;
      
      private var _103149406logic:TCSideAreaLogic;
      
      private var _1077721628menubg:BitmapImage;
      
      private var _160345906pickupButton:ImageLabelRadioButton;
      
      private var _786041083tagGroup:RadioButtonGroup;
      
      private var _320706700tcLogoButton:ImageButtonDisableNonAlpha;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bgi_tcmenubg_png_350819253:Class = TCSideArea__embed_mxml___assets_images_bgi_tcmenubg_png_350819253;
      
      public function TCSideArea()
      {
         super();
         mx_internal::_document = this;
         this.width = 180;
         this.mxmlContent = [this._TCSideArea_BitmapImage1_i(),this._TCSideArea_ImageButtonDisableNonAlpha1_i(),this._TCSideArea_ImageLabelRadioButton1_i(),this._TCSideArea_ImageLabelRadioButton2_i(),this._TCSideArea_Label1_c(),this._TCSideArea_Line1_c()];
         this._TCSideArea_TCSideAreaLogic1_i();
         this._TCSideArea_RadioButtonGroup1_i();
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
      
      public function loadTags() : void
      {
         this.logic.loadTags();
      }
      
      public function tagReset() : void
      {
         this.tagGroup.selectedValue = "all";
      }
      
      private function _TCSideArea_TCSideAreaLogic1_i() : TCSideAreaLogic
      {
         var _loc1_:TCSideAreaLogic = new TCSideAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _TCSideArea_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"tagGroup");
         this.tagGroup = _loc1_;
         BindingManager.executeBindings(this,"tagGroup",this.tagGroup);
         return _loc1_;
      }
      
      private function _TCSideArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_tcmenubg_png_350819253;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fillMode = "repeat";
         _loc1_.initialized(this,"menubg");
         this.menubg = _loc1_;
         BindingManager.executeBindings(this,"menubg",this.menubg);
         return _loc1_;
      }
      
      private function _TCSideArea_ImageButtonDisableNonAlpha1_i() : ImageButtonDisableNonAlpha
      {
         var _loc1_:ImageButtonDisableNonAlpha = new ImageButtonDisableNonAlpha();
         _loc1_.styleName = "toneCentralDown";
         _loc1_.width = 180;
         _loc1_.height = 62;
         _loc1_.buttonMode = true;
         _loc1_.id = "tcLogoButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tcLogoButton = _loc1_;
         BindingManager.executeBindings(this,"tcLogoButton",this.tcLogoButton);
         return _loc1_;
      }
      
      private function _TCSideArea_ImageLabelRadioButton1_i() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "ALL";
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 72;
         _loc1_.width = 160;
         _loc1_.styleName = "tagButton";
         _loc1_.selected = true;
         _loc1_.groupName = "tagGroup";
         _loc1_.value = "all";
         _loc1_.id = "allButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.allButton = _loc1_;
         BindingManager.executeBindings(this,"allButton",this.allButton);
         return _loc1_;
      }
      
      private function _TCSideArea_ImageLabelRadioButton2_i() : ImageLabelRadioButton
      {
         var _loc1_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc1_.label = "PICK UP";
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 107;
         _loc1_.width = 160;
         _loc1_.styleName = "tagButton";
         _loc1_.groupName = "tagGroup";
         _loc1_.value = "pickup";
         _loc1_.id = "pickupButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pickupButton = _loc1_;
         BindingManager.executeBindings(this,"pickupButton",this.pickupButton);
         return _loc1_;
      }
      
      private function _TCSideArea_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "KEYWORD TAGS";
         _loc1_.x = 12;
         _loc1_.y = 156;
         _loc1_.styleName = "tagGenreLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCSideArea_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 145;
         _loc1_.stroke = this._TCSideArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TCSideArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get allButton() : ImageLabelRadioButton
      {
         return this._917172173allButton;
      }
      
      public function set allButton(param1:ImageLabelRadioButton) : void
      {
         var _loc2_:Object = this._917172173allButton;
         if(_loc2_ !== param1)
         {
            this._917172173allButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : TCSideAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:TCSideAreaLogic) : void
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
      public function get menubg() : BitmapImage
      {
         return this._1077721628menubg;
      }
      
      public function set menubg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1077721628menubg;
         if(_loc2_ !== param1)
         {
            this._1077721628menubg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menubg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pickupButton() : ImageLabelRadioButton
      {
         return this._160345906pickupButton;
      }
      
      public function set pickupButton(param1:ImageLabelRadioButton) : void
      {
         var _loc2_:Object = this._160345906pickupButton;
         if(_loc2_ !== param1)
         {
            this._160345906pickupButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pickupButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagGroup() : RadioButtonGroup
      {
         return this._786041083tagGroup;
      }
      
      public function set tagGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._786041083tagGroup;
         if(_loc2_ !== param1)
         {
            this._786041083tagGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tcLogoButton() : ImageButtonDisableNonAlpha
      {
         return this._320706700tcLogoButton;
      }
      
      public function set tcLogoButton(param1:ImageButtonDisableNonAlpha) : void
      {
         var _loc2_:Object = this._320706700tcLogoButton;
         if(_loc2_ !== param1)
         {
            this._320706700tcLogoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tcLogoButton",_loc2_,param1));
            }
         }
      }
   }
}

