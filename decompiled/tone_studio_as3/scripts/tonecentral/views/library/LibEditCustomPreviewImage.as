package tonecentral.views.library
{
   import flash.filesystem.File;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class LibEditCustomPreviewImage extends Group
   {
      
      private var _691354055artworkImage:BitmapImage;
      
      private var _496144396ghostImage:BitmapImage;
      
      private var _103149406logic:LibEditCustomPreviewImageLogic;
      
      private var _340093965normalBorder:Rect;
      
      private var _1369420455selectedBorder:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function LibEditCustomPreviewImage()
      {
         super();
         mx_internal::_document = this;
         this.width = 40;
         this.height = 40;
         this.buttonMode = true;
         this.mxmlContent = [this._LibEditCustomPreviewImage_Rect1_i(),this._LibEditCustomPreviewImage_Rect2_i(),this._LibEditCustomPreviewImage_BitmapImage1_i(),this._LibEditCustomPreviewImage_BitmapImage2_i()];
         this._LibEditCustomPreviewImage_LibEditCustomPreviewImageLogic1_i();
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
      
      public function selectedImage() : void
      {
         this.logic.selectedImage();
      }
      
      public function getImage() : File
      {
         var _loc1_:File = null;
         if(this.logic.image)
         {
            _loc1_ = new File();
            _loc1_.url = this.logic.image;
            return _loc1_;
         }
         return null;
      }
      
      public function resetSelected() : void
      {
         this.logic.resetSelected();
      }
      
      public function setData(param1:String) : void
      {
         this.logic.setData(param1);
      }
      
      private function _LibEditCustomPreviewImage_LibEditCustomPreviewImageLogic1_i() : LibEditCustomPreviewImageLogic
      {
         var _loc1_:LibEditCustomPreviewImageLogic = new LibEditCustomPreviewImageLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LibEditCustomPreviewImage_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 40;
         _loc1_.height = 40;
         _loc1_.stroke = this._LibEditCustomPreviewImage_SolidColorStroke1_c();
         _loc1_.initialized(this,"normalBorder");
         this.normalBorder = _loc1_;
         BindingManager.executeBindings(this,"normalBorder",this.normalBorder);
         return _loc1_;
      }
      
      private function _LibEditCustomPreviewImage_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _LibEditCustomPreviewImage_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 40;
         _loc1_.height = 40;
         _loc1_.visible = false;
         _loc1_.stroke = this._LibEditCustomPreviewImage_SolidColorStroke2_c();
         _loc1_.initialized(this,"selectedBorder");
         this.selectedBorder = _loc1_;
         BindingManager.executeBindings(this,"selectedBorder",this.selectedBorder);
         return _loc1_;
      }
      
      private function _LibEditCustomPreviewImage_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15742775;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _LibEditCustomPreviewImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 2;
         _loc1_.y = 2;
         _loc1_.width = 36;
         _loc1_.height = 36;
         _loc1_.initialized(this,"artworkImage");
         this.artworkImage = _loc1_;
         BindingManager.executeBindings(this,"artworkImage",this.artworkImage);
         return _loc1_;
      }
      
      private function _LibEditCustomPreviewImage_BitmapImage2_i() : BitmapImage
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
      public function get logic() : LibEditCustomPreviewImageLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LibEditCustomPreviewImageLogic) : void
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
      public function get normalBorder() : Rect
      {
         return this._340093965normalBorder;
      }
      
      public function set normalBorder(param1:Rect) : void
      {
         var _loc2_:Object = this._340093965normalBorder;
         if(_loc2_ !== param1)
         {
            this._340093965normalBorder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"normalBorder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedBorder() : Rect
      {
         return this._1369420455selectedBorder;
      }
      
      public function set selectedBorder(param1:Rect) : void
      {
         var _loc2_:Object = this._1369420455selectedBorder;
         if(_loc2_ !== param1)
         {
            this._1369420455selectedBorder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedBorder",_loc2_,param1));
            }
         }
      }
   }
}

