package tonecentral.views.edit
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import tonecentral.views.edit.amp.AmpPanel;
   
   public class ContentsArea extends Group
   {
      
      private var _1509090656ampPanel:AmpPanel;
      
      private var _3108362edit:ParameterEdit;
      
      private var _1221270899header:EditHeaderComponent;
      
      private var _1115258990headerbg:BitmapImage;
      
      private var _103149406logic:ContentsAreaLogic;
      
      private var _1081571394mainbg:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bg_head_png_953662464:Class = ContentsArea__embed_mxml___assets_images_bg_head_png_953662464;
      
      private var _embed_mxml___assets_images_bg_right_png_2028438861:Class = ContentsArea__embed_mxml___assets_images_bg_right_png_2028438861;
      
      public function ContentsArea()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._ContentsArea_BitmapImage1_i(),this._ContentsArea_BitmapImage2_i(),this._ContentsArea_Rect1_c(),this._ContentsArea_EditHeaderComponent1_i(),this._ContentsArea_AmpPanel1_i(),this._ContentsArea_ParameterEdit1_i()];
         this._ContentsArea_ContentsAreaLogic1_i();
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
      
      private function _ContentsArea_ContentsAreaLogic1_i() : ContentsAreaLogic
      {
         var _loc1_:ContentsAreaLogic = new ContentsAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ContentsArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.source = this._embed_mxml___assets_images_bg_head_png_953662464;
         _loc1_.initialized(this,"headerbg");
         this.headerbg = _loc1_;
         BindingManager.executeBindings(this,"headerbg",this.headerbg);
         return _loc1_;
      }
      
      private function _ContentsArea_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.y = 40;
         _loc1_.source = this._embed_mxml___assets_images_bg_right_png_2028438861;
         _loc1_.initialized(this,"mainbg");
         this.mainbg = _loc1_;
         BindingManager.executeBindings(this,"mainbg",this.mainbg);
         return _loc1_;
      }
      
      private function _ContentsArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 40;
         _loc1_.bottom = 3;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this._ContentsArea_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ContentsArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2236962;
         return _loc1_;
      }
      
      private function _ContentsArea_EditHeaderComponent1_i() : EditHeaderComponent
      {
         var _loc1_:EditHeaderComponent = new EditHeaderComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 40;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _ContentsArea_AmpPanel1_i() : AmpPanel
      {
         var _loc1_:AmpPanel = new AmpPanel();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "ampPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ampPanel = _loc1_;
         BindingManager.executeBindings(this,"ampPanel",this.ampPanel);
         return _loc1_;
      }
      
      private function _ContentsArea_ParameterEdit1_i() : ParameterEdit
      {
         var _loc1_:ParameterEdit = new ParameterEdit();
         _loc1_.percentWidth = 100;
         _loc1_.top = 268;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.id = "edit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.edit = _loc1_;
         BindingManager.executeBindings(this,"edit",this.edit);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ampPanel() : AmpPanel
      {
         return this._1509090656ampPanel;
      }
      
      public function set ampPanel(param1:AmpPanel) : void
      {
         var _loc2_:Object = this._1509090656ampPanel;
         if(_loc2_ !== param1)
         {
            this._1509090656ampPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ampPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get edit() : ParameterEdit
      {
         return this._3108362edit;
      }
      
      public function set edit(param1:ParameterEdit) : void
      {
         var _loc2_:Object = this._3108362edit;
         if(_loc2_ !== param1)
         {
            this._3108362edit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"edit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : EditHeaderComponent
      {
         return this._1221270899header;
      }
      
      public function set header(param1:EditHeaderComponent) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerbg() : BitmapImage
      {
         return this._1115258990headerbg;
      }
      
      public function set headerbg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1115258990headerbg;
         if(_loc2_ !== param1)
         {
            this._1115258990headerbg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerbg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ContentsAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ContentsAreaLogic) : void
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
      public function get mainbg() : BitmapImage
      {
         return this._1081571394mainbg;
      }
      
      public function set mainbg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1081571394mainbg;
         if(_loc2_ !== param1)
         {
            this._1081571394mainbg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainbg",_loc2_,param1));
            }
         }
      }
   }
}

