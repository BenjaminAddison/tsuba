package tonecentral.views.edit.playmenu
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import tonecentral.components.ImageLabelToggleButton;
   
   public class PlayMenu extends Group
   {
      
      private var _394774304footerbg:BitmapImage;
      
      private var _103149406logic:PlayMenuLogic;
      
      private var _2125717286modalArea:Group;
      
      private var _3443508play:ImageLabelToggleButton;
      
      private var _1985941072setting:ImageLabelToggleButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bg_foot_png_216730582:Class = PlayMenu__embed_mxml___assets_images_bg_foot_png_216730582;
      
      public function PlayMenu()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._PlayMenu_BitmapImage1_i(),this._PlayMenu_HGroup1_c(),this._PlayMenu_Group2_i()];
         this._PlayMenu_PlayMenuLogic1_i();
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
      
      private function _PlayMenu_PlayMenuLogic1_i() : PlayMenuLogic
      {
         var _loc1_:PlayMenuLogic = new PlayMenuLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _PlayMenu_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.x = 0;
         _loc1_.bottom = 0;
         _loc1_.source = this._embed_mxml___assets_images_bg_foot_png_216730582;
         _loc1_.initialized(this,"footerbg");
         this.footerbg = _loc1_;
         BindingManager.executeBindings(this,"footerbg",this.footerbg);
         return _loc1_;
      }
      
      private function _PlayMenu_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._PlayMenu_ImageLabelToggleButton1_i(),this._PlayMenu_ImageLabelToggleButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PlayMenu_ImageLabelToggleButton1_i() : ImageLabelToggleButton
      {
         var _loc1_:ImageLabelToggleButton = new ImageLabelToggleButton();
         _loc1_.label = "PLAY";
         _loc1_.width = 101;
         _loc1_.height = 42;
         _loc1_.styleName = "playMenuBt";
         _loc1_.id = "play";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.play = _loc1_;
         BindingManager.executeBindings(this,"play",this.play);
         return _loc1_;
      }
      
      private function _PlayMenu_ImageLabelToggleButton2_i() : ImageLabelToggleButton
      {
         var _loc1_:ImageLabelToggleButton = new ImageLabelToggleButton();
         _loc1_.label = "SYSTEM";
         _loc1_.width = 101;
         _loc1_.height = 42;
         _loc1_.styleName = "playMenuBt";
         _loc1_.id = "setting";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.setting = _loc1_;
         BindingManager.executeBindings(this,"setting",this.setting);
         return _loc1_;
      }
      
      private function _PlayMenu_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._PlayMenu_Rect1_c()];
         _loc1_.id = "modalArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.modalArea = _loc1_;
         BindingManager.executeBindings(this,"modalArea",this.modalArea);
         return _loc1_;
      }
      
      private function _PlayMenu_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._PlayMenu_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PlayMenu_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get footerbg() : BitmapImage
      {
         return this._394774304footerbg;
      }
      
      public function set footerbg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._394774304footerbg;
         if(_loc2_ !== param1)
         {
            this._394774304footerbg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"footerbg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : PlayMenuLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:PlayMenuLogic) : void
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
      public function get modalArea() : Group
      {
         return this._2125717286modalArea;
      }
      
      public function set modalArea(param1:Group) : void
      {
         var _loc2_:Object = this._2125717286modalArea;
         if(_loc2_ !== param1)
         {
            this._2125717286modalArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modalArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get play() : ImageLabelToggleButton
      {
         return this._3443508play;
      }
      
      public function set play(param1:ImageLabelToggleButton) : void
      {
         var _loc2_:Object = this._3443508play;
         if(_loc2_ !== param1)
         {
            this._3443508play = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"play",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get setting() : ImageLabelToggleButton
      {
         return this._1985941072setting;
      }
      
      public function set setting(param1:ImageLabelToggleButton) : void
      {
         var _loc2_:Object = this._1985941072setting;
         if(_loc2_ !== param1)
         {
            this._1985941072setting = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"setting",_loc2_,param1));
            }
         }
      }
   }
}

