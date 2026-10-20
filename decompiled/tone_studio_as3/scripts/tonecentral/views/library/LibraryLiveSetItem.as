package tonecentral.views.library
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.common.data.LiveSetData;
   import tonecentral.components.ImageButton;
   import tonecentral.components.ImageLabelButton;
   
   public class LibraryLiveSetItem extends Group
   {
      
      private var _691354055artworkImage:BitmapImage;
      
      private var _3141bg:Rect;
      
      private var _1264719728bgClickArea:UIComponent;
      
      private var _204859874bgColor:SolidColor;
      
      private var _1245745987deleteButton:ImageButton;
      
      private var _1454002652editButton:ImageLabelButton;
      
      private var _496144396ghostImage:BitmapImage;
      
      private var _103149406logic:LibraryLiveSetItemLogic;
      
      private var _1052832752nameBG:BitmapImage;
      
      private var _1215755049nameLabel:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_library_bgi_lib_txtbox_up_png_1092618550:Class = LibraryLiveSetItem__embed_mxml___assets_images_library_bgi_lib_txtbox_up_png_1092618550;
      
      public function LibraryLiveSetItem()
      {
         super();
         mx_internal::_document = this;
         this.width = 220;
         this.height = 40;
         this.mxmlContent = [this._LibraryLiveSetItem_Rect1_i(),this._LibraryLiveSetItem_Line1_c(),this._LibraryLiveSetItem_BitmapImage1_i(),this._LibraryLiveSetItem_Label1_i(),this._LibraryLiveSetItem_UIComponent1_i(),this._LibraryLiveSetItem_Rect2_c(),this._LibraryLiveSetItem_BitmapImage2_i(),this._LibraryLiveSetItem_BitmapImage3_i(),this._LibraryLiveSetItem_ImageLabelButton1_i(),this._LibraryLiveSetItem_ImageButton1_i()];
         this._LibraryLiveSetItem_LibraryLiveSetItemLogic1_i();
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
      
      public function set data(param1:LiveSetData) : void
      {
         this.logic.data = param1;
      }
      
      public function get data() : LiveSetData
      {
         return this.logic.data;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.logic.selected = param1;
      }
      
      private function _LibraryLiveSetItem_LibraryLiveSetItemLogic1_i() : LibraryLiveSetItemLogic
      {
         var _loc1_:LibraryLiveSetItemLogic = new LibraryLiveSetItemLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 39;
         _loc1_.fill = this._LibraryLiveSetItem_SolidColor1_i();
         _loc1_.initialized(this,"bg");
         this.bg = _loc1_;
         BindingManager.executeBindings(this,"bg",this.bg);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 7171437;
         this.bgColor = _loc1_;
         BindingManager.executeBindings(this,"bgColor",this.bgColor);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._LibraryLiveSetItem_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 40;
         _loc1_.verticalCenter = 0;
         _loc1_.height = 23;
         _loc1_.width = 172;
         _loc1_.source = this._embed_mxml___assets_images_library_bgi_lib_txtbox_up_png_1092618550;
         _loc1_.initialized(this,"nameBG");
         this.nameBG = _loc1_;
         BindingManager.executeBindings(this,"nameBG",this.nameBG);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "libraryItemLabel";
         _loc1_.verticalCenter = -1;
         _loc1_.x = 45;
         _loc1_.width = 165;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.id = "nameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameLabel = _loc1_;
         BindingManager.executeBindings(this,"nameLabel",this.nameLabel);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "bgClickArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgClickArea = _loc1_;
         BindingManager.executeBindings(this,"bgClickArea",this.bgClickArea);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 5;
         _loc1_.y = 5;
         _loc1_.width = 29;
         _loc1_.height = 29;
         _loc1_.fill = this._LibraryLiveSetItem_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 6;
         _loc1_.y = 6;
         _loc1_.width = 27;
         _loc1_.height = 27;
         _loc1_.initialized(this,"artworkImage");
         this.artworkImage = _loc1_;
         BindingManager.executeBindings(this,"artworkImage",this.artworkImage);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 100;
         _loc1_.height = 100;
         _loc1_.visible = false;
         _loc1_.initialized(this,"ghostImage");
         this.ghostImage = _loc1_;
         BindingManager.executeBindings(this,"ghostImage",this.ghostImage);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Edit";
         _loc1_.right = 25;
         _loc1_.y = 8;
         _loc1_.width = 40;
         _loc1_.height = 25;
         _loc1_.styleName = "update";
         _loc1_.visible = false;
         _loc1_.id = "editButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editButton = _loc1_;
         BindingManager.executeBindings(this,"editButton",this.editButton);
         return _loc1_;
      }
      
      private function _LibraryLiveSetItem_ImageButton1_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.right = 5;
         _loc1_.y = 12;
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "itemDeleteButton";
         _loc1_.visible = false;
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get artworkImage() : BitmapImage
      {
         return this._691354055artworkImage;
      }
      
      public function set artworkImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._691354055artworkImage;
         if(_loc2_ !== param1)
         {
            this._691354055artworkImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"artworkImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bg() : Rect
      {
         return this._3141bg;
      }
      
      public function set bg(param1:Rect) : void
      {
         var _loc2_:Object = this._3141bg;
         if(_loc2_ !== param1)
         {
            this._3141bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgClickArea() : UIComponent
      {
         return this._1264719728bgClickArea;
      }
      
      public function set bgClickArea(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1264719728bgClickArea;
         if(_loc2_ !== param1)
         {
            this._1264719728bgClickArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgClickArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgColor() : SolidColor
      {
         return this._204859874bgColor;
      }
      
      public function set bgColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._204859874bgColor;
         if(_loc2_ !== param1)
         {
            this._204859874bgColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get deleteButton() : ImageButton
      {
         return this._1245745987deleteButton;
      }
      
      public function set deleteButton(param1:ImageButton) : void
      {
         var _loc2_:Object = this._1245745987deleteButton;
         if(_loc2_ !== param1)
         {
            this._1245745987deleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editButton() : ImageLabelButton
      {
         return this._1454002652editButton;
      }
      
      public function set editButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1454002652editButton;
         if(_loc2_ !== param1)
         {
            this._1454002652editButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ghostImage() : BitmapImage
      {
         return this._496144396ghostImage;
      }
      
      public function set ghostImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._496144396ghostImage;
         if(_loc2_ !== param1)
         {
            this._496144396ghostImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ghostImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : LibraryLiveSetItemLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LibraryLiveSetItemLogic) : void
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
      public function get nameBG() : BitmapImage
      {
         return this._1052832752nameBG;
      }
      
      public function set nameBG(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1052832752nameBG;
         if(_loc2_ !== param1)
         {
            this._1052832752nameBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameLabel() : Label
      {
         return this._1215755049nameLabel;
      }
      
      public function set nameLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1215755049nameLabel;
         if(_loc2_ !== param1)
         {
            this._1215755049nameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabel",_loc2_,param1));
            }
         }
      }
   }
}

