package tonecentral.views.main
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.Mode;
   import tonecentral.components.ImageButton;
   import tonecentral.views.sidearea.SideArea;
   import tonecentral.views.sidearea.TCSideArea;
   
   public class SideAreaContainer extends Group
   {
      
      private var _95476506devBG:Rect;
      
      private var _303938455devBGColor:SolidColor;
      
      private var _1082347487devLabel:Label;
      
      private var _935490183disconnectedLabel:Label;
      
      private var _103149406logic:SideAreaContainerLogic;
      
      private var _3327403logo:BitmapImage;
      
      private var _1077721628menubg:BitmapImage;
      
      private var _216571524sideArea:SideArea;
      
      private var _1193794139sideAreaGroup:Group;
      
      private var _27766143tcButton:ImageButton;
      
      private var _939008047tcSlideArea:TCSideArea;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_img_boss_png_40076779:Class = SideAreaContainer__embed_mxml___assets_images_img_boss_png_40076779;
      
      private var _embed_mxml___assets_images_bgi_menubg_png_505860267:Class = SideAreaContainer__embed_mxml___assets_images_bgi_menubg_png_505860267;
      
      public function SideAreaContainer()
      {
         super();
         mx_internal::_document = this;
         this.width = 180;
         this.percentHeight = 100;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._SideAreaContainer_BitmapImage1_i(),this._SideAreaContainer_BitmapImage2_i(),this._SideAreaContainer_Rect1_i(),this._SideAreaContainer_Label1_i(),this._SideAreaContainer_Label2_i(),this._SideAreaContainer_Group2_i()];
         this._SideAreaContainer_SideAreaContainerLogic1_i();
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
      
      public function get mode() : Mode
      {
         return this.logic.mode;
      }
      
      public function patchCopy() : Vector.<PatchData>
      {
         return this.logic.patchCopy();
      }
      
      public function patchPaste(param1:Vector.<PatchData>) : void
      {
         this.logic.patchPaste(param1);
      }
      
      public function infoLoadComplete(param1:int) : void
      {
         this.sideArea.infoLoadComplete(param1);
      }
      
      public function infoHide() : void
      {
         this.sideArea.infoHide();
      }
      
      public function loadTags() : void
      {
         this.logic.loadTags();
      }
      
      public function resetSelected() : void
      {
         this.sideArea.resetSelected();
      }
      
      public function setEditorPatchList() : void
      {
         this.sideArea.setEditorPatchList();
      }
      
      public function applyLiveset(param1:Vector.<PatchData>) : void
      {
         this.sideArea.applyLiveset(param1);
      }
      
      public function contentsAreaDragComplete() : void
      {
         this.sideArea.contentsAreaDragComplete();
      }
      
      private function _SideAreaContainer_SideAreaContainerLogic1_i() : SideAreaContainerLogic
      {
         var _loc1_:SideAreaContainerLogic = new SideAreaContainerLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _SideAreaContainer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_menubg_png_505860267;
         _loc1_.width = 180;
         _loc1_.height = 83;
         _loc1_.fillMode = "repeat";
         _loc1_.initialized(this,"menubg");
         this.menubg = _loc1_;
         BindingManager.executeBindings(this,"menubg",this.menubg);
         return _loc1_;
      }
      
      private function _SideAreaContainer_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_img_boss_png_40076779;
         _loc1_.width = 126;
         _loc1_.height = 33;
         _loc1_.x = 25;
         _loc1_.y = 25;
         _loc1_.initialized(this,"logo");
         this.logo = _loc1_;
         BindingManager.executeBindings(this,"logo",this.logo);
         return _loc1_;
      }
      
      private function _SideAreaContainer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 180;
         _loc1_.height = 16;
         _loc1_.y = 0;
         _loc1_.x = 0;
         _loc1_.visible = false;
         _loc1_.fill = this._SideAreaContainer_SolidColor1_i();
         _loc1_.initialized(this,"devBG");
         this.devBG = _loc1_;
         BindingManager.executeBindings(this,"devBG",this.devBG);
         return _loc1_;
      }
      
      private function _SideAreaContainer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 94399;
         this.devBGColor = _loc1_;
         BindingManager.executeBindings(this,"devBGColor",this.devBGColor);
         return _loc1_;
      }
      
      private function _SideAreaContainer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 3;
         _loc1_.width = 180;
         _loc1_.height = 20;
         _loc1_.text = "Dev";
         _loc1_.styleName = "devLabelStyle";
         _loc1_.visible = false;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "devLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.devLabel = _loc1_;
         BindingManager.executeBindings(this,"devLabel",this.devLabel);
         return _loc1_;
      }
      
      private function _SideAreaContainer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 3;
         _loc1_.width = 180;
         _loc1_.height = 20;
         _loc1_.text = "Disconnect";
         _loc1_.styleName = "disconnectLabelStyle";
         _loc1_.visible = false;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "disconnectedLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.disconnectedLabel = _loc1_;
         BindingManager.executeBindings(this,"disconnectedLabel",this.disconnectedLabel);
         return _loc1_;
      }
      
      private function _SideAreaContainer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.y = 83;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SideAreaContainer_SideArea1_i(),this._SideAreaContainer_ImageButton1_i(),this._SideAreaContainer_TCSideArea1_i()];
         _loc1_.id = "sideAreaGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sideAreaGroup = _loc1_;
         BindingManager.executeBindings(this,"sideAreaGroup",this.sideAreaGroup);
         return _loc1_;
      }
      
      private function _SideAreaContainer_SideArea1_i() : SideArea
      {
         var _loc1_:SideArea = new SideArea();
         _loc1_.top = 0;
         _loc1_.bottom = 62;
         _loc1_.id = "sideArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sideArea = _loc1_;
         BindingManager.executeBindings(this,"sideArea",this.sideArea);
         return _loc1_;
      }
      
      private function _SideAreaContainer_ImageButton1_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.bottom = 0;
         _loc1_.styleName = "toneCentralUp";
         _loc1_.width = 180;
         _loc1_.height = 62;
         _loc1_.buttonMode = true;
         _loc1_.id = "tcButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tcButton = _loc1_;
         BindingManager.executeBindings(this,"tcButton",this.tcButton);
         return _loc1_;
      }
      
      private function _SideAreaContainer_TCSideArea1_i() : TCSideArea
      {
         var _loc1_:TCSideArea = new TCSideArea();
         _loc1_.visible = false;
         _loc1_.id = "tcSlideArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tcSlideArea = _loc1_;
         BindingManager.executeBindings(this,"tcSlideArea",this.tcSlideArea);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get devBG() : Rect
      {
         return this._95476506devBG;
      }
      
      public function set devBG(param1:Rect) : void
      {
         var _loc2_:Object = this._95476506devBG;
         if(_loc2_ !== param1)
         {
            this._95476506devBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"devBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get devBGColor() : SolidColor
      {
         return this._303938455devBGColor;
      }
      
      public function set devBGColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._303938455devBGColor;
         if(_loc2_ !== param1)
         {
            this._303938455devBGColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"devBGColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get devLabel() : Label
      {
         return this._1082347487devLabel;
      }
      
      public function set devLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1082347487devLabel;
         if(_loc2_ !== param1)
         {
            this._1082347487devLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"devLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get disconnectedLabel() : Label
      {
         return this._935490183disconnectedLabel;
      }
      
      public function set disconnectedLabel(param1:Label) : void
      {
         var _loc2_:Object = this._935490183disconnectedLabel;
         if(_loc2_ !== param1)
         {
            this._935490183disconnectedLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disconnectedLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : SideAreaContainerLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:SideAreaContainerLogic) : void
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
      public function get logo() : BitmapImage
      {
         return this._3327403logo;
      }
      
      public function set logo(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3327403logo;
         if(_loc2_ !== param1)
         {
            this._3327403logo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logo",_loc2_,param1));
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
      public function get sideArea() : SideArea
      {
         return this._216571524sideArea;
      }
      
      public function set sideArea(param1:SideArea) : void
      {
         var _loc2_:Object = this._216571524sideArea;
         if(_loc2_ !== param1)
         {
            this._216571524sideArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sideArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sideAreaGroup() : Group
      {
         return this._1193794139sideAreaGroup;
      }
      
      public function set sideAreaGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1193794139sideAreaGroup;
         if(_loc2_ !== param1)
         {
            this._1193794139sideAreaGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sideAreaGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tcButton() : ImageButton
      {
         return this._27766143tcButton;
      }
      
      public function set tcButton(param1:ImageButton) : void
      {
         var _loc2_:Object = this._27766143tcButton;
         if(_loc2_ !== param1)
         {
            this._27766143tcButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tcButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tcSlideArea() : TCSideArea
      {
         return this._939008047tcSlideArea;
      }
      
      public function set tcSlideArea(param1:TCSideArea) : void
      {
         var _loc2_:Object = this._939008047tcSlideArea;
         if(_loc2_ !== param1)
         {
            this._939008047tcSlideArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tcSlideArea",_loc2_,param1));
            }
         }
      }
   }
}

