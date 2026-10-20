package tonecentral.itemrenderer
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Label;
   import spark.components.TextArea;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.components.ImageButton;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.library.PatchTextInput;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.skin.PatchTextAreaSkin;
   
   public class LibraryPatchItemRenderer extends ItemRenderer implements IStateClient2
   {
      
      public var _LibraryPatchItemRenderer_Line1:Line;
      
      public var _LibraryPatchItemRenderer_Line2:Line;
      
      public var _LibraryPatchItemRenderer_Line3:Line;
      
      public var _LibraryPatchItemRenderer_Rect1:Rect;
      
      public var _LibraryPatchItemRenderer_Rect2:Rect;
      
      public var _LibraryPatchItemRenderer_Rect3:Rect;
      
      private var _204859874bgColor:SolidColor;
      
      private var _1245745987deleteButton:ImageButton;
      
      private var _842221599dragArea:Rect;
      
      private var _1134277630dragAreaColor:SolidColor;
      
      private var _659434007dragAreaHoverd:Rect;
      
      private var _139939078dragAreaHoverdColor:SolidColor;
      
      private var _936665700dragAreaSelected:Rect;
      
      private var _1851342041dragAreaSelectedColor:SolidColor;
      
      private var _433101796dropArea:UIComponent;
      
      private var _1454002652editButton:ImageLabelButton;
      
      private var _1747789496hoveredColor:SolidColor;
      
      private var _1732874634hoveredState:State;
      
      private var _103149406logic:LibraryPatchItemRendererLogic;
      
      private var _1688438448memoInput:TextArea;
      
      private var _1690807980memoLable:Label;
      
      private var _1213385727nameInput:PatchTextInput;
      
      private var _1039748078nameInput1:PatchTextInput;
      
      private var _1039748077nameInput2:PatchTextInput;
      
      private var _1215755049nameLabel:Label;
      
      private var _2092167603noLabel:Label;
      
      private var _272232470normalState:State;
      
      private var _1039694921noteBG:BitmapImage;
      
      private var _1641788370okButton:ImageLabelButton;
      
      private var _1430566280selectedColor:SolidColor;
      
      private var _1445481142selectedState:State;
      
      private var _1832518081separateHoverdLine:SolidColorStroke;
      
      private var _1514102199separateLine:SolidColorStroke;
      
      private var _1419348978separateSelectedLine:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var mediator:ToneCentralMediator;
      
      private var _embed_mxml___assets_images_library_bgi_liveset_textinput_desable_png_1573167106:Class = LibraryPatchItemRenderer__embed_mxml___assets_images_library_bgi_liveset_textinput_desable_png_1573167106;
      
      private var _embed_mxml__assets_images_library_img_handle_png_1785536243:Class = LibraryPatchItemRenderer__embed_mxml__assets_images_library_img_handle_png_1785536243;
      
      public function LibraryPatchItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.width = 220;
         this.height = 96;
         this.buttonMode = true;
         this.doubleClickEnabled = true;
         this.mxmlContent = [this._LibraryPatchItemRenderer_Rect1_i(),this._LibraryPatchItemRenderer_Rect4_i(),this._LibraryPatchItemRenderer_Rect5_i(),this._LibraryPatchItemRenderer_Rect6_i(),this._LibraryPatchItemRenderer_Line4_c(),this._LibraryPatchItemRenderer_BitmapImage1_c(),this._LibraryPatchItemRenderer_BitmapImage2_i(),this._LibraryPatchItemRenderer_Label1_i(),this._LibraryPatchItemRenderer_Label2_i(),this._LibraryPatchItemRenderer_Label3_i(),this._LibraryPatchItemRenderer_UIComponent1_i(),this._LibraryPatchItemRenderer_ImageLabelButton1_i(),this._LibraryPatchItemRenderer_ImageLabelButton2_i(),this._LibraryPatchItemRenderer_ImageButton1_i(),this._LibraryPatchItemRenderer_PatchTextInput1_i(),this._LibraryPatchItemRenderer_PatchTextInput2_i(),this._LibraryPatchItemRenderer_PatchTextInput3_i(),this._LibraryPatchItemRenderer_TextArea1_i()];
         this.currentState = "normal";
         this._LibraryPatchItemRenderer_LibraryPatchItemRendererLogic1_i();
         this.addEventListener("creationComplete",this.___LibraryPatchItemRenderer_ItemRenderer1_creationComplete);
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._LibraryPatchItemRenderer_Line1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._LibraryPatchItemRenderer_Line2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._LibraryPatchItemRenderer_Line3_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._LibraryPatchItemRenderer_Rect2_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._LibraryPatchItemRenderer_Rect3_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dragAreaSelected"]
            }),new SetProperty().initializeFromObject({
               "target":"dragArea",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dragAreaSelected"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_LibraryPatchItemRenderer_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"dragAreaHoverd",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"selected",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dragAreaSelected"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_LibraryPatchItemRenderer_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"dragAreaSelected",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"noLabel",
               "name":"styleName",
               "value":"libraryPatchLabelSelect"
            }),new SetProperty().initializeFromObject({
               "target":"nameLabel",
               "name":"styleName",
               "value":"libraryPatchLabelSelect"
            }),new SetProperty().initializeFromObject({
               "target":"memoLable",
               "name":"styleName",
               "value":"libraryPatchLabelSelect"
            })]
         })];
         this.normalState = states[0];
         this.hoveredState = states[1];
         this.selectedState = states[2];
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
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.mediator = ToneCentralMediator.getInstance();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.logic.data = data;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         if(!this.mediator)
         {
            return;
         }
         super.stateChanged(param1,param2,param3);
         if(param2 == "selected" && !this.logic.editMode)
         {
            if(this.mediator.hideMemo)
            {
               this.nameLabel.width = 143;
            }
            else
            {
               this.nameLabel.width = 105;
            }
            this.noLabel.styleName = "libraryPatchLabelSelect";
            this.nameLabel.styleName = "libraryPatchLabelSelect";
            this.memoLable.styleName = "libraryPatchLabelSelect";
         }
         else
         {
            this.nameLabel.width = 143;
            this.noLabel.styleName = "libraryPatchLabel";
            this.nameLabel.styleName = "libraryPatchLabel";
            this.memoLable.styleName = "libraryPatchLabel";
         }
         this.logic.stateChanged();
      }
      
      private function _LibraryPatchItemRenderer_LibraryPatchItemRendererLogic1_i() : LibraryPatchItemRendererLogic
      {
         var _loc1_:LibraryPatchItemRendererLogic = new LibraryPatchItemRendererLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LibraryPatchItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,"_LibraryPatchItemRenderer_Rect1");
         this._LibraryPatchItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_LibraryPatchItemRenderer_Rect1",this._LibraryPatchItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3092271;
         this.bgColor = _loc1_;
         BindingManager.executeBindings(this,"bgColor",this.bgColor);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LibraryPatchItemRenderer_SolidColor2_i();
         _loc1_.initialized(this,"_LibraryPatchItemRenderer_Rect2");
         this._LibraryPatchItemRenderer_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_LibraryPatchItemRenderer_Rect2",this._LibraryPatchItemRenderer_Rect2);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 222114;
         this.hoveredColor = _loc1_;
         BindingManager.executeBindings(this,"hoveredColor",this.hoveredColor);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LibraryPatchItemRenderer_SolidColor3_i();
         _loc1_.initialized(this,"_LibraryPatchItemRenderer_Rect3");
         this._LibraryPatchItemRenderer_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_LibraryPatchItemRenderer_Rect3",this._LibraryPatchItemRenderer_Rect3);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColor3_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 806749;
         this.selectedColor = _loc1_;
         BindingManager.executeBindings(this,"selectedColor",this.selectedColor);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 16;
         _loc1_.height = 95;
         _loc1_.visible = false;
         _loc1_.fill = this._LibraryPatchItemRenderer_SolidColor4_i();
         _loc1_.initialized(this,"dragArea");
         this.dragArea = _loc1_;
         BindingManager.executeBindings(this,"dragArea",this.dragArea);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColor4_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 7171437;
         this.dragAreaColor = _loc1_;
         BindingManager.executeBindings(this,"dragAreaColor",this.dragAreaColor);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 16;
         _loc1_.height = 95;
         _loc1_.visible = false;
         _loc1_.fill = this._LibraryPatchItemRenderer_SolidColor5_i();
         _loc1_.initialized(this,"dragAreaHoverd");
         this.dragAreaHoverd = _loc1_;
         BindingManager.executeBindings(this,"dragAreaHoverd",this.dragAreaHoverd);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColor5_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3325423;
         this.dragAreaHoverdColor = _loc1_;
         BindingManager.executeBindings(this,"dragAreaHoverdColor",this.dragAreaHoverdColor);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Rect6_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 16;
         _loc1_.height = 95;
         _loc1_.visible = false;
         _loc1_.fill = this._LibraryPatchItemRenderer_SolidColor6_i();
         _loc1_.initialized(this,"dragAreaSelected");
         this.dragAreaSelected = _loc1_;
         BindingManager.executeBindings(this,"dragAreaSelected",this.dragAreaSelected);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColor6_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3438730;
         this.dragAreaSelectedColor = _loc1_;
         BindingManager.executeBindings(this,"dragAreaSelectedColor",this.dragAreaSelectedColor);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.y = 0;
         _loc1_.x = 16;
         _loc1_.stroke = this._LibraryPatchItemRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,"_LibraryPatchItemRenderer_Line1");
         this._LibraryPatchItemRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_LibraryPatchItemRenderer_Line1",this._LibraryPatchItemRenderer_Line1);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7171437;
         _loc1_.weight = 1;
         this.separateLine = _loc1_;
         BindingManager.executeBindings(this,"separateLine",this.separateLine);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.y = 0;
         _loc1_.x = 16;
         _loc1_.stroke = this._LibraryPatchItemRenderer_SolidColorStroke2_i();
         _loc1_.initialized(this,"_LibraryPatchItemRenderer_Line2");
         this._LibraryPatchItemRenderer_Line2 = _loc1_;
         BindingManager.executeBindings(this,"_LibraryPatchItemRenderer_Line2",this._LibraryPatchItemRenderer_Line2);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3589105;
         _loc1_.weight = 1;
         this.separateHoverdLine = _loc1_;
         BindingManager.executeBindings(this,"separateHoverdLine",this.separateHoverdLine);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Line3_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.y = 0;
         _loc1_.x = 16;
         _loc1_.stroke = this._LibraryPatchItemRenderer_SolidColorStroke3_i();
         _loc1_.initialized(this,"_LibraryPatchItemRenderer_Line3");
         this._LibraryPatchItemRenderer_Line3 = _loc1_;
         BindingManager.executeBindings(this,"_LibraryPatchItemRenderer_Line3",this._LibraryPatchItemRenderer_Line3);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColorStroke3_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4228761;
         _loc1_.weight = 1;
         this.separateSelectedLine = _loc1_;
         BindingManager.executeBindings(this,"separateSelectedLine",this.separateSelectedLine);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._LibraryPatchItemRenderer_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__assets_images_library_img_handle_png_1785536243;
         _loc1_.verticalCenter = 0;
         _loc1_.x = 4;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 23;
         _loc1_.y = 51;
         _loc1_.height = 38;
         _loc1_.width = 183;
         _loc1_.source = this._embed_mxml___assets_images_library_bgi_liveset_textinput_desable_png_1573167106;
         _loc1_.initialized(this,"noteBG");
         this.noteBG = _loc1_;
         BindingManager.executeBindings(this,"noteBG",this.noteBG);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "libraryPatchLabel";
         _loc1_.y = 10;
         _loc1_.x = 25;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "noLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.noLabel = _loc1_;
         BindingManager.executeBindings(this,"noLabel",this.noLabel);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "libraryPatchLabel";
         _loc1_.y = 10;
         _loc1_.x = 55;
         _loc1_.width = 143;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "nameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameLabel = _loc1_;
         BindingManager.executeBindings(this,"nameLabel",this.nameLabel);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "libraryPatchLabel";
         _loc1_.x = 29;
         _loc1_.y = 57;
         _loc1_.width = 170;
         _loc1_.maxDisplayedLines = 2;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "memoLable";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.memoLable = _loc1_;
         BindingManager.executeBindings(this,"memoLable",this.memoLable);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 15;
         _loc1_.verticalCenter = 0;
         _loc1_.visible = false;
         _loc1_.id = "dropArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropArea = _loc1_;
         BindingManager.executeBindings(this,"dropArea",this.dropArea);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Edit";
         _loc1_.right = 18;
         _loc1_.y = 5;
         _loc1_.width = 40;
         _loc1_.height = 23;
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
      
      private function _LibraryPatchItemRenderer_ImageLabelButton2_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "OK";
         _loc1_.right = 36;
         _loc1_.y = 5;
         _loc1_.width = 40;
         _loc1_.height = 23;
         _loc1_.styleName = "update";
         _loc1_.visible = false;
         _loc1_.id = "okButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.okButton = _loc1_;
         BindingManager.executeBindings(this,"okButton",this.okButton);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_ImageButton1_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.right = 17;
         _loc1_.y = 9;
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
      
      private function _LibraryPatchItemRenderer_PatchTextInput1_i() : PatchTextInput
      {
         var _loc1_:PatchTextInput = new PatchTextInput();
         _loc1_.x = 48;
         _loc1_.y = 6;
         _loc1_.width = 95;
         _loc1_.height = 20;
         _loc1_.styleName = "patchTextInput";
         _loc1_.visible = false;
         _loc1_.restrict = "-~";
         _loc1_.maxChars = 16;
         _loc1_.id = "nameInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameInput = _loc1_;
         BindingManager.executeBindings(this,"nameInput",this.nameInput);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_PatchTextInput2_i() : PatchTextInput
      {
         var _loc1_:PatchTextInput = new PatchTextInput();
         _loc1_.x = 48;
         _loc1_.y = 6;
         _loc1_.width = 45;
         _loc1_.height = 20;
         _loc1_.styleName = "patchTextInput";
         _loc1_.visible = false;
         _loc1_.restrict = "-~";
         _loc1_.maxChars = 8;
         _loc1_.id = "nameInput1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameInput1 = _loc1_;
         BindingManager.executeBindings(this,"nameInput1",this.nameInput1);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_PatchTextInput3_i() : PatchTextInput
      {
         var _loc1_:PatchTextInput = new PatchTextInput();
         _loc1_.x = 97;
         _loc1_.y = 6;
         _loc1_.width = 46;
         _loc1_.height = 20;
         _loc1_.styleName = "patchTextInput";
         _loc1_.visible = false;
         _loc1_.restrict = "-~";
         _loc1_.maxChars = 8;
         _loc1_.id = "nameInput2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameInput2 = _loc1_;
         BindingManager.executeBindings(this,"nameInput2",this.nameInput2);
         return _loc1_;
      }
      
      private function _LibraryPatchItemRenderer_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.height = 40;
         _loc1_.width = 185;
         _loc1_.x = 23;
         _loc1_.y = 51;
         _loc1_.visible = false;
         _loc1_.styleName = "patchTextArea";
         _loc1_.restrict = "-~";
         _loc1_.maxChars = 42;
         _loc1_.setStyle("skinClass",PatchTextAreaSkin);
         _loc1_.id = "memoInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.memoInput = _loc1_;
         BindingManager.executeBindings(this,"memoInput",this.memoInput);
         return _loc1_;
      }
      
      public function ___LibraryPatchItemRenderer_ItemRenderer1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
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
      public function get dragArea() : Rect
      {
         return this._842221599dragArea;
      }
      
      public function set dragArea(param1:Rect) : void
      {
         var _loc2_:Object = this._842221599dragArea;
         if(_loc2_ !== param1)
         {
            this._842221599dragArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragAreaColor() : SolidColor
      {
         return this._1134277630dragAreaColor;
      }
      
      public function set dragAreaColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1134277630dragAreaColor;
         if(_loc2_ !== param1)
         {
            this._1134277630dragAreaColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragAreaColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragAreaHoverd() : Rect
      {
         return this._659434007dragAreaHoverd;
      }
      
      public function set dragAreaHoverd(param1:Rect) : void
      {
         var _loc2_:Object = this._659434007dragAreaHoverd;
         if(_loc2_ !== param1)
         {
            this._659434007dragAreaHoverd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragAreaHoverd",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragAreaHoverdColor() : SolidColor
      {
         return this._139939078dragAreaHoverdColor;
      }
      
      public function set dragAreaHoverdColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._139939078dragAreaHoverdColor;
         if(_loc2_ !== param1)
         {
            this._139939078dragAreaHoverdColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragAreaHoverdColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragAreaSelected() : Rect
      {
         return this._936665700dragAreaSelected;
      }
      
      public function set dragAreaSelected(param1:Rect) : void
      {
         var _loc2_:Object = this._936665700dragAreaSelected;
         if(_loc2_ !== param1)
         {
            this._936665700dragAreaSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragAreaSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragAreaSelectedColor() : SolidColor
      {
         return this._1851342041dragAreaSelectedColor;
      }
      
      public function set dragAreaSelectedColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1851342041dragAreaSelectedColor;
         if(_loc2_ !== param1)
         {
            this._1851342041dragAreaSelectedColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragAreaSelectedColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropArea() : UIComponent
      {
         return this._433101796dropArea;
      }
      
      public function set dropArea(param1:UIComponent) : void
      {
         var _loc2_:Object = this._433101796dropArea;
         if(_loc2_ !== param1)
         {
            this._433101796dropArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropArea",_loc2_,param1));
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
      public function get hoveredColor() : SolidColor
      {
         return this._1747789496hoveredColor;
      }
      
      public function set hoveredColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1747789496hoveredColor;
         if(_loc2_ !== param1)
         {
            this._1747789496hoveredColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoveredColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hoveredState() : State
      {
         return this._1732874634hoveredState;
      }
      
      public function set hoveredState(param1:State) : void
      {
         var _loc2_:Object = this._1732874634hoveredState;
         if(_loc2_ !== param1)
         {
            this._1732874634hoveredState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoveredState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : LibraryPatchItemRendererLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LibraryPatchItemRendererLogic) : void
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
      public function get memoInput() : TextArea
      {
         return this._1688438448memoInput;
      }
      
      public function set memoInput(param1:TextArea) : void
      {
         var _loc2_:Object = this._1688438448memoInput;
         if(_loc2_ !== param1)
         {
            this._1688438448memoInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"memoInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get memoLable() : Label
      {
         return this._1690807980memoLable;
      }
      
      public function set memoLable(param1:Label) : void
      {
         var _loc2_:Object = this._1690807980memoLable;
         if(_loc2_ !== param1)
         {
            this._1690807980memoLable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"memoLable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameInput() : PatchTextInput
      {
         return this._1213385727nameInput;
      }
      
      public function set nameInput(param1:PatchTextInput) : void
      {
         var _loc2_:Object = this._1213385727nameInput;
         if(_loc2_ !== param1)
         {
            this._1213385727nameInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameInput1() : PatchTextInput
      {
         return this._1039748078nameInput1;
      }
      
      public function set nameInput1(param1:PatchTextInput) : void
      {
         var _loc2_:Object = this._1039748078nameInput1;
         if(_loc2_ !== param1)
         {
            this._1039748078nameInput1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameInput1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameInput2() : PatchTextInput
      {
         return this._1039748077nameInput2;
      }
      
      public function set nameInput2(param1:PatchTextInput) : void
      {
         var _loc2_:Object = this._1039748077nameInput2;
         if(_loc2_ !== param1)
         {
            this._1039748077nameInput2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameInput2",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get noLabel() : Label
      {
         return this._2092167603noLabel;
      }
      
      public function set noLabel(param1:Label) : void
      {
         var _loc2_:Object = this._2092167603noLabel;
         if(_loc2_ !== param1)
         {
            this._2092167603noLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"noLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get normalState() : State
      {
         return this._272232470normalState;
      }
      
      public function set normalState(param1:State) : void
      {
         var _loc2_:Object = this._272232470normalState;
         if(_loc2_ !== param1)
         {
            this._272232470normalState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"normalState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get noteBG() : BitmapImage
      {
         return this._1039694921noteBG;
      }
      
      public function set noteBG(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1039694921noteBG;
         if(_loc2_ !== param1)
         {
            this._1039694921noteBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"noteBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get okButton() : ImageLabelButton
      {
         return this._1641788370okButton;
      }
      
      public function set okButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1641788370okButton;
         if(_loc2_ !== param1)
         {
            this._1641788370okButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedColor() : SolidColor
      {
         return this._1430566280selectedColor;
      }
      
      public function set selectedColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1430566280selectedColor;
         if(_loc2_ !== param1)
         {
            this._1430566280selectedColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedState() : State
      {
         return this._1445481142selectedState;
      }
      
      public function set selectedState(param1:State) : void
      {
         var _loc2_:Object = this._1445481142selectedState;
         if(_loc2_ !== param1)
         {
            this._1445481142selectedState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get separateHoverdLine() : SolidColorStroke
      {
         return this._1832518081separateHoverdLine;
      }
      
      public function set separateHoverdLine(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1832518081separateHoverdLine;
         if(_loc2_ !== param1)
         {
            this._1832518081separateHoverdLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"separateHoverdLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get separateLine() : SolidColorStroke
      {
         return this._1514102199separateLine;
      }
      
      public function set separateLine(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1514102199separateLine;
         if(_loc2_ !== param1)
         {
            this._1514102199separateLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"separateLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get separateSelectedLine() : SolidColorStroke
      {
         return this._1419348978separateSelectedLine;
      }
      
      public function set separateSelectedLine(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1419348978separateSelectedLine;
         if(_loc2_ !== param1)
         {
            this._1419348978separateSelectedLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"separateSelectedLine",_loc2_,param1));
            }
         }
      }
   }
}

