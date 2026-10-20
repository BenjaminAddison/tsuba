package tonecentral.views.sidearea
{
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RadioButtonGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.common.data.PatchData;
   import tonecentral.components.CustomList;
   import tonecentral.components.ImageLabelRadioButtonDisableNonAlpha;
   import tonecentral.itemrenderer.LibraryPatchlistItemRenderer;
   import tonecentral.itemrenderer.PatchlistItemRenderer;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.skin.DropListSkin;
   
   public class SideArea extends Group
   {
      
      private var _746556853captureImage:BitmapImage;
      
      private var _2097211673dragScrollAreaBottom:UIComponent;
      
      private var _2394407dragScrollAreaTop:UIComponent;
      
      private var _1454002652editButton:ImageLabelRadioButtonDisableNonAlpha;
      
      private var _1408017327editorModeGroup:RadioButtonGroup;
      
      private var _130003341infoCountLabel:Label;
      
      private var _1495702007infoTitleArea:UIComponent;
      
      private var _2008121293libraryButton:ImageLabelRadioButtonDisableNonAlpha;
      
      private var _1183121781libraryPatchList:CustomList;
      
      private var _1085638243listSeperator:Rect;
      
      private var _103149406logic:SideAreaLogic;
      
      private var _1077721628menubg:BitmapImage;
      
      private var _1394514412newsIcon:BitmapImage;
      
      private var _282972339newsLable:Label;
      
      private var _891992377patchlistGroup:Group;
      
      private var _1078756976patchlistdata:CustomList;
      
      private var _838846263update:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__assets_images_sidearea_img_infoicon_png_792843985:Class = SideArea__embed_mxml__assets_images_sidearea_img_infoicon_png_792843985;
      
      private var _embed_mxml___assets_images_bgi_menubg_br_png_450669621:Class = SideArea__embed_mxml___assets_images_bgi_menubg_br_png_450669621;
      
      private var _embed_mxml___assets_images_bgi_menubg_png_505860267:Class = SideArea__embed_mxml___assets_images_bgi_menubg_png_505860267;
      
      public function SideArea()
      {
         super();
         mx_internal::_document = this;
         this.width = 180;
         this.mxmlContent = [this._SideArea_BitmapImage1_i(),this._SideArea_BitmapImage2_i(),this._SideArea_UIComponent1_i(),this._SideArea_BitmapImage3_i(),this._SideArea_Label1_i(),this._SideArea_Label2_i(),this._SideArea_ImageLabelRadioButtonDisableNonAlpha1_i(),this._SideArea_ImageLabelRadioButtonDisableNonAlpha2_i(),this._SideArea_Line1_c(),this._SideArea_Line2_c(),this._SideArea_Group2_i(),this._SideArea_UIComponent2_i(),this._SideArea_UIComponent3_i(),this._SideArea_BitmapImage4_i()];
         this._SideArea_RadioButtonGroup1_i();
         this._SideArea_SideAreaLogic1_i();
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
      
      public function setEditorPatchList() : void
      {
         this.logic.setEditorPatchList();
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
         this.logic.infoLoadComplete(param1);
      }
      
      public function infoHide() : void
      {
         this.logic.infoHide();
      }
      
      public function resetSelected() : void
      {
         this.logic.resetSelected();
      }
      
      public function resetEditorModeGroup() : void
      {
         if(this.editorModeGroup.selection)
         {
            this.editorModeGroup.selection.selected = false;
         }
      }
      
      public function selectedEditorModeGroup() : void
      {
         this.editorModeGroup.selectedValue = ToneCentralMediator.getInstance().selectedMode.mode;
      }
      
      public function applyLiveset(param1:Vector.<PatchData>) : void
      {
         this.logic.applyLiveset(param1);
      }
      
      public function contentsAreaDragComplete() : void
      {
         this.logic.contentsAreaDragComplete();
      }
      
      private function _SideArea_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"editorModeGroup");
         this.editorModeGroup = _loc1_;
         BindingManager.executeBindings(this,"editorModeGroup",this.editorModeGroup);
         return _loc1_;
      }
      
      private function _SideArea_SideAreaLogic1_i() : SideAreaLogic
      {
         var _loc1_:SideAreaLogic = new SideAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _SideArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_menubg_png_505860267;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fillMode = "repeat";
         _loc1_.initialized(this,"menubg");
         this.menubg = _loc1_;
         BindingManager.executeBindings(this,"menubg",this.menubg);
         return _loc1_;
      }
      
      private function _SideArea_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_bgi_menubg_br_png_450669621;
         _loc1_.percentWidth = 100;
         _loc1_.height = 32;
         _loc1_.initialized(this,"update");
         this.update = _loc1_;
         BindingManager.executeBindings(this,"update",this.update);
         return _loc1_;
      }
      
      private function _SideArea_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.buttonMode = true;
         _loc1_.id = "infoTitleArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoTitleArea = _loc1_;
         BindingManager.executeBindings(this,"infoTitleArea",this.infoTitleArea);
         return _loc1_;
      }
      
      private function _SideArea_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__assets_images_sidearea_img_infoicon_png_792843985;
         _loc1_.x = 15;
         _loc1_.y = 7;
         _loc1_.initialized(this,"newsIcon");
         this.newsIcon = _loc1_;
         BindingManager.executeBindings(this,"newsIcon",this.newsIcon);
         return _loc1_;
      }
      
      private function _SideArea_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 40;
         _loc1_.y = 11;
         _loc1_.text = "NEWS";
         _loc1_.styleName = "infoTitleLabel";
         _loc1_.mouseEnabled = false;
         _loc1_.id = "newsLable";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newsLable = _loc1_;
         BindingManager.executeBindings(this,"newsLable",this.newsLable);
         return _loc1_;
      }
      
      private function _SideArea_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 11;
         _loc1_.right = 10;
         _loc1_.width = 35;
         _loc1_.text = "";
         _loc1_.visible = false;
         _loc1_.styleName = "infoCountLabel";
         _loc1_.mouseEnabled = false;
         _loc1_.id = "infoCountLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoCountLabel = _loc1_;
         BindingManager.executeBindings(this,"infoCountLabel",this.infoCountLabel);
         return _loc1_;
      }
      
      private function _SideArea_ImageLabelRadioButtonDisableNonAlpha1_i() : ImageLabelRadioButtonDisableNonAlpha
      {
         var _loc1_:ImageLabelRadioButtonDisableNonAlpha = new ImageLabelRadioButtonDisableNonAlpha();
         _loc1_.x = 10;
         _loc1_.y = 46;
         _loc1_.width = 80;
         _loc1_.height = 30;
         _loc1_.styleName = "edit";
         _loc1_.label = "EDITOR";
         _loc1_.groupName = "editorModeGroup";
         _loc1_.value = "editor";
         _loc1_.id = "editButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editButton = _loc1_;
         BindingManager.executeBindings(this,"editButton",this.editButton);
         return _loc1_;
      }
      
      private function _SideArea_ImageLabelRadioButtonDisableNonAlpha2_i() : ImageLabelRadioButtonDisableNonAlpha
      {
         var _loc1_:ImageLabelRadioButtonDisableNonAlpha = new ImageLabelRadioButtonDisableNonAlpha();
         _loc1_.x = 90;
         _loc1_.y = 46;
         _loc1_.width = 80;
         _loc1_.height = 30;
         _loc1_.styleName = "library";
         _loc1_.label = "LIBRARIAN";
         _loc1_.groupName = "editorModeGroup";
         _loc1_.value = "library";
         _loc1_.id = "libraryButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.libraryButton = _loc1_;
         BindingManager.executeBindings(this,"libraryButton",this.libraryButton);
         return _loc1_;
      }
      
      private function _SideArea_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 90;
         _loc1_.stroke = this._SideArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SideArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _SideArea_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SideArea_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SideArea_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _SideArea_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 90;
         _loc1_.width = 180;
         _loc1_.percentHeight = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._SideArea_CustomList1_i(),this._SideArea_Rect1_i(),this._SideArea_CustomList2_i()];
         _loc1_.id = "patchlistGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.patchlistGroup = _loc1_;
         BindingManager.executeBindings(this,"patchlistGroup",this.patchlistGroup);
         return _loc1_;
      }
      
      private function _SideArea_CustomList1_i() : CustomList
      {
         var _loc1_:CustomList = new CustomList();
         _loc1_.width = 187;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._SideArea_ClassFactory1_c();
         _loc1_.setStyle("contentBackgroundAlpha",1);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("borderAlpha",1);
         _loc1_.setStyle("borderColor",0);
         _loc1_.setStyle("focusAlpha",0);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("skinClass",DropListSkin);
         _loc1_.id = "patchlistdata";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.patchlistdata = _loc1_;
         BindingManager.executeBindings(this,"patchlistdata",this.patchlistdata);
         return _loc1_;
      }
      
      private function _SideArea_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PatchlistItemRenderer;
         return _loc1_;
      }
      
      private function _SideArea_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SideArea_SolidColor1_c();
         _loc1_.initialized(this,"listSeperator");
         this.listSeperator = _loc1_;
         BindingManager.executeBindings(this,"listSeperator",this.listSeperator);
         return _loc1_;
      }
      
      private function _SideArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3355443;
         return _loc1_;
      }
      
      private function _SideArea_CustomList2_i() : CustomList
      {
         var _loc1_:CustomList = new CustomList();
         _loc1_.width = 187;
         _loc1_.percentHeight = 100;
         _loc1_.dropEnabled = false;
         _loc1_.dragEnabled = true;
         _loc1_.allowMultipleSelection = true;
         _loc1_.visible = false;
         _loc1_.itemRenderer = this._SideArea_ClassFactory2_c();
         _loc1_.setStyle("contentBackgroundAlpha",1);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("borderAlpha",1);
         _loc1_.setStyle("borderColor",0);
         _loc1_.setStyle("focusAlpha",0);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("skinClass",DropListSkin);
         _loc1_.id = "libraryPatchList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.libraryPatchList = _loc1_;
         BindingManager.executeBindings(this,"libraryPatchList",this.libraryPatchList);
         return _loc1_;
      }
      
      private function _SideArea_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LibraryPatchlistItemRenderer;
         return _loc1_;
      }
      
      private function _SideArea_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 50;
         _loc1_.y = 120;
         _loc1_.visible = false;
         _loc1_.id = "dragScrollAreaTop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragScrollAreaTop = _loc1_;
         BindingManager.executeBindings(this,"dragScrollAreaTop",this.dragScrollAreaTop);
         return _loc1_;
      }
      
      private function _SideArea_UIComponent3_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 50;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.id = "dragScrollAreaBottom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragScrollAreaBottom = _loc1_;
         BindingManager.executeBindings(this,"dragScrollAreaBottom",this.dragScrollAreaBottom);
         return _loc1_;
      }
      
      private function _SideArea_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.visible = false;
         _loc1_.initialized(this,"captureImage");
         this.captureImage = _loc1_;
         BindingManager.executeBindings(this,"captureImage",this.captureImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get captureImage() : BitmapImage
      {
         return this._746556853captureImage;
      }
      
      public function set captureImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._746556853captureImage;
         if(_loc2_ !== param1)
         {
            this._746556853captureImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"captureImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragScrollAreaBottom() : UIComponent
      {
         return this._2097211673dragScrollAreaBottom;
      }
      
      public function set dragScrollAreaBottom(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2097211673dragScrollAreaBottom;
         if(_loc2_ !== param1)
         {
            this._2097211673dragScrollAreaBottom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragScrollAreaBottom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragScrollAreaTop() : UIComponent
      {
         return this._2394407dragScrollAreaTop;
      }
      
      public function set dragScrollAreaTop(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2394407dragScrollAreaTop;
         if(_loc2_ !== param1)
         {
            this._2394407dragScrollAreaTop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragScrollAreaTop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editButton() : ImageLabelRadioButtonDisableNonAlpha
      {
         return this._1454002652editButton;
      }
      
      public function set editButton(param1:ImageLabelRadioButtonDisableNonAlpha) : void
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
      public function get editorModeGroup() : RadioButtonGroup
      {
         return this._1408017327editorModeGroup;
      }
      
      public function set editorModeGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1408017327editorModeGroup;
         if(_loc2_ !== param1)
         {
            this._1408017327editorModeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editorModeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoCountLabel() : Label
      {
         return this._130003341infoCountLabel;
      }
      
      public function set infoCountLabel(param1:Label) : void
      {
         var _loc2_:Object = this._130003341infoCountLabel;
         if(_loc2_ !== param1)
         {
            this._130003341infoCountLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoCountLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoTitleArea() : UIComponent
      {
         return this._1495702007infoTitleArea;
      }
      
      public function set infoTitleArea(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1495702007infoTitleArea;
         if(_loc2_ !== param1)
         {
            this._1495702007infoTitleArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoTitleArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get libraryButton() : ImageLabelRadioButtonDisableNonAlpha
      {
         return this._2008121293libraryButton;
      }
      
      public function set libraryButton(param1:ImageLabelRadioButtonDisableNonAlpha) : void
      {
         var _loc2_:Object = this._2008121293libraryButton;
         if(_loc2_ !== param1)
         {
            this._2008121293libraryButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"libraryButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get libraryPatchList() : CustomList
      {
         return this._1183121781libraryPatchList;
      }
      
      public function set libraryPatchList(param1:CustomList) : void
      {
         var _loc2_:Object = this._1183121781libraryPatchList;
         if(_loc2_ !== param1)
         {
            this._1183121781libraryPatchList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"libraryPatchList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listSeperator() : Rect
      {
         return this._1085638243listSeperator;
      }
      
      public function set listSeperator(param1:Rect) : void
      {
         var _loc2_:Object = this._1085638243listSeperator;
         if(_loc2_ !== param1)
         {
            this._1085638243listSeperator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listSeperator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : SideAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:SideAreaLogic) : void
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
      public function get newsIcon() : BitmapImage
      {
         return this._1394514412newsIcon;
      }
      
      public function set newsIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1394514412newsIcon;
         if(_loc2_ !== param1)
         {
            this._1394514412newsIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newsIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newsLable() : Label
      {
         return this._282972339newsLable;
      }
      
      public function set newsLable(param1:Label) : void
      {
         var _loc2_:Object = this._282972339newsLable;
         if(_loc2_ !== param1)
         {
            this._282972339newsLable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newsLable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get patchlistGroup() : Group
      {
         return this._891992377patchlistGroup;
      }
      
      public function set patchlistGroup(param1:Group) : void
      {
         var _loc2_:Object = this._891992377patchlistGroup;
         if(_loc2_ !== param1)
         {
            this._891992377patchlistGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"patchlistGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get patchlistdata() : CustomList
      {
         return this._1078756976patchlistdata;
      }
      
      public function set patchlistdata(param1:CustomList) : void
      {
         var _loc2_:Object = this._1078756976patchlistdata;
         if(_loc2_ !== param1)
         {
            this._1078756976patchlistdata = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"patchlistdata",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get update() : BitmapImage
      {
         return this._838846263update;
      }
      
      public function set update(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._838846263update;
         if(_loc2_ !== param1)
         {
            this._838846263update = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"update",_loc2_,param1));
            }
         }
      }
   }
}

