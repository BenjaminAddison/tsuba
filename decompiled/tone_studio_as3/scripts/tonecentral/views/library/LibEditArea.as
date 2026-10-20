package tonecentral.views.library
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.TileGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import tonecentral.common.data.LiveSetData;
   import tonecentral.components.DashedLine;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.LivesetEditTextInput;
   import tonecentral.components.popup.ToneCentralPopup;
   
   use namespace mx_internal;
   
   public class LibEditArea extends ToneCentralPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _LibEditArea_Label5:Label;
      
      public var _LibEditArea_Label7:Label;
      
      public var _LibEditArea_Label8:Label;
      
      public var _LibEditArea_Rect1:Rect;
      
      public var _LibEditArea_Rect3:Rect;
      
      public var _LibEditArea_Rect4:Rect;
      
      private var _691354055artworkImage:BitmapImage;
      
      private var _1314718334customPreviewArtworkImage:LibEditCustomPreviewImage;
      
      private var _496144396ghostImage:BitmapImage;
      
      private var _103149406logic:LibEditAreaLogic;
      
      private var _1213385727nameInput:LivesetEditTextInput;
      
      private var _506490423presetImages:TileGroup;
      
      private var _636152622presetImagesGrp:Group;
      
      private var _1656373096selectFile:ImageLabelButton;
      
      private var _1791483012titleLabel:Label;
      
      private var _243635666uploadArea:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function LibEditArea()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._LibEditArea_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_library_LibEditAreaWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return LibEditArea[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 393;
         this.height = 620;
         this.mxmlContent = [this._LibEditArea_Label1_i(),this._LibEditArea_Label2_c(),this._LibEditArea_Rect1_i(),this._LibEditArea_Rect2_c(),this._LibEditArea_BitmapImage1_i(),this._LibEditArea_BitmapImage2_i(),this._LibEditArea_LivesetEditTextInput1_i(),this._LibEditArea_Label3_c(),this._LibEditArea_Label4_c(),this._LibEditArea_Label5_i(),this._LibEditArea_Rect3_i(),this._LibEditArea_Group1_i(),this._LibEditArea_Label6_c(),this._LibEditArea_Label7_i(),this._LibEditArea_Rect4_i(),this._LibEditArea_LibEditCustomPreviewImage1_i(),this._LibEditArea_Group2_c(),this._LibEditArea_Group3_i()];
         this._LibEditArea_LibEditAreaLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         LibEditArea._watcherSetupUtil = param1;
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
      
      public function getData() : LiveSetData
      {
         return this.logic.getData();
      }
      
      public function setData(param1:LiveSetData) : void
      {
         this.logic.setData(param1);
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(393,620);
      }
      
      override protected function drawBackground() : void
      {
         super.drawBackground();
         if(!backgoundLayer)
         {
            return;
         }
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(2,40);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,40);
         backgoundLayer.graphics.moveTo(2,160);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,160);
         backgoundLayer.graphics.moveTo(2,dialogHeight - 65);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,dialogHeight - 65);
      }
      
      override protected function addButton() : void
      {
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.left = 20;
         closeButton.bottom = 23;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CANCEL";
         closeButton.setFocus();
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
         okButton = new ImageLabelButton();
         okButton.styleName = "dialogOKButton";
         okButton.horizontalCenter = 0;
         okButton.bottom = 23;
         okButton.width = 80;
         okButton.height = 25;
         okButton.label = "OK";
         okButton.setFocus();
         container.addElement(okButton);
         okButton.addEventListener(MouseEvent.CLICK,this.onOKClick,false,0,true);
      }
      
      override public function close() : void
      {
         this.logic.close();
      }
      
      public function exeClose() : void
      {
         super.close();
      }
      
      public function onOKClick(param1:MouseEvent) : void
      {
         this.logic.onOKClick();
      }
      
      private function _LibEditArea_LibEditAreaLogic1_i() : LibEditAreaLogic
      {
         var _loc1_:LibEditAreaLogic = new LibEditAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LibEditArea_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "libEditTitleLabel";
         _loc1_.x = 10;
         _loc1_.y = 12;
         _loc1_.text = "EDIT LIVESET";
         _loc1_.id = "titleLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleLabel = _loc1_;
         BindingManager.executeBindings(this,"titleLabel",this.titleLabel);
         return _loc1_;
      }
      
      private function _LibEditArea_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "LibEditTitleLabel";
         _loc1_.x = 10;
         _loc1_.y = 55;
         _loc1_.text = "LIVESET NAME";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LibEditArea_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 2;
         _loc1_.y = 94;
         _loc1_.height = 58;
         _loc1_.fill = this._LibEditArea_SolidColor1_c();
         _loc1_.initialized(this,"_LibEditArea_Rect1");
         this._LibEditArea_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_LibEditArea_Rect1",this._LibEditArea_Rect1);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3092271;
         return _loc1_;
      }
      
      private function _LibEditArea_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 20;
         _loc1_.y = 102;
         _loc1_.width = 40;
         _loc1_.height = 40;
         _loc1_.stroke = this._LibEditArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _LibEditArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 22;
         _loc1_.y = 104;
         _loc1_.width = 36;
         _loc1_.height = 36;
         _loc1_.initialized(this,"artworkImage");
         this.artworkImage = _loc1_;
         BindingManager.executeBindings(this,"artworkImage",this.artworkImage);
         return _loc1_;
      }
      
      private function _LibEditArea_BitmapImage2_i() : BitmapImage
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
      
      private function _LibEditArea_LivesetEditTextInput1_i() : LivesetEditTextInput
      {
         var _loc1_:LivesetEditTextInput = new LivesetEditTextInput();
         _loc1_.height = 40;
         _loc1_.y = 102;
         _loc1_.width = 305;
         _loc1_.x = 70;
         _loc1_.styleName = "liveSetEditTextInput";
         _loc1_.restrict = "-~";
         _loc1_.maxChars = 260;
         _loc1_.id = "nameInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameInput = _loc1_;
         BindingManager.executeBindings(this,"nameInput",this.nameInput);
         return _loc1_;
      }
      
      private function _LibEditArea_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "LibEditTitleLabel";
         _loc1_.x = 10;
         _loc1_.y = 172;
         _loc1_.text = "LIVESET IMAGE";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LibEditArea_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "LibEditLabel";
         _loc1_.x = 10;
         _loc1_.y = 194;
         _loc1_.text = "PRESET IMAGE";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LibEditArea_Label5_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 209;
         _loc1_.id = "_LibEditArea_Label5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._LibEditArea_Label5 = _loc1_;
         BindingManager.executeBindings(this,"_LibEditArea_Label5",this._LibEditArea_Label5);
         return _loc1_;
      }
      
      private function _LibEditArea_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 2;
         _loc1_.y = 229;
         _loc1_.height = 150;
         _loc1_.fill = this._LibEditArea_SolidColor2_c();
         _loc1_.initialized(this,"_LibEditArea_Rect3");
         this._LibEditArea_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_LibEditArea_Rect3",this._LibEditArea_Rect3);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3092271;
         return _loc1_;
      }
      
      private function _LibEditArea_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 229;
         _loc1_.height = 150;
         _loc1_.mxmlContent = [this._LibEditArea_TileGroup1_i()];
         _loc1_.id = "presetImagesGrp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.presetImagesGrp = _loc1_;
         BindingManager.executeBindings(this,"presetImagesGrp",this.presetImagesGrp);
         return _loc1_;
      }
      
      private function _LibEditArea_TileGroup1_i() : TileGroup
      {
         var _loc1_:TileGroup = new TileGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalGap = 5;
         _loc1_.horizontalGap = 5;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 20;
         _loc1_.paddingRight = 15;
         _loc1_.id = "presetImages";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.presetImages = _loc1_;
         BindingManager.executeBindings(this,"presetImages",this.presetImages);
         return _loc1_;
      }
      
      private function _LibEditArea_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "LibEditLabel";
         _loc1_.x = 10;
         _loc1_.y = 389;
         _loc1_.text = "UPLOAD IMAGE";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LibEditArea_Label7_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 404;
         _loc1_.id = "_LibEditArea_Label7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._LibEditArea_Label7 = _loc1_;
         BindingManager.executeBindings(this,"_LibEditArea_Label7",this._LibEditArea_Label7);
         return _loc1_;
      }
      
      private function _LibEditArea_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 2;
         _loc1_.y = 426;
         _loc1_.height = 123;
         _loc1_.fill = this._LibEditArea_SolidColor3_c();
         _loc1_.initialized(this,"_LibEditArea_Rect4");
         this._LibEditArea_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_LibEditArea_Rect4",this._LibEditArea_Rect4);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3092271;
         return _loc1_;
      }
      
      private function _LibEditArea_LibEditCustomPreviewImage1_i() : LibEditCustomPreviewImage
      {
         var _loc1_:LibEditCustomPreviewImage = new LibEditCustomPreviewImage();
         _loc1_.x = 20;
         _loc1_.y = 434;
         _loc1_.id = "customPreviewArtworkImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.customPreviewArtworkImage = _loc1_;
         BindingManager.executeBindings(this,"customPreviewArtworkImage",this.customPreviewArtworkImage);
         return _loc1_;
      }
      
      private function _LibEditArea_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 58;
         _loc1_.y = 426;
         _loc1_.mxmlContent = [this._LibEditArea_ImageLabelButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LibEditArea_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.x = 70;
         _loc1_.verticalCenter = 0;
         _loc1_.label = "UPLOAD IMAGE";
         _loc1_.styleName = "importButton";
         _loc1_.id = "selectFile";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectFile = _loc1_;
         BindingManager.executeBindings(this,"selectFile",this.selectFile);
         return _loc1_;
      }
      
      private function _LibEditArea_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 70;
         _loc1_.y = 486;
         _loc1_.percentWidth = 100;
         _loc1_.height = 50;
         _loc1_.right = 20;
         _loc1_.mxmlContent = [this._LibEditArea_Rect5_c(),this._LibEditArea_DashedLine1_c(),this._LibEditArea_DashedLine2_c(),this._LibEditArea_DashedLine3_c(),this._LibEditArea_DashedLine4_c(),this._LibEditArea_Label8_i()];
         _loc1_.id = "uploadArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.uploadArea = _loc1_;
         BindingManager.executeBindings(this,"uploadArea",this.uploadArea);
         return _loc1_;
      }
      
      private function _LibEditArea_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LibEditArea_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3092271;
         return _loc1_;
      }
      
      private function _LibEditArea_DashedLine1_c() : DashedLine
      {
         var _loc1_:DashedLine = new DashedLine();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 0;
         _loc1_.height = 50;
         _loc1_.dashLength = 3;
         _loc1_.stroke = this._LibEditArea_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10594472;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _LibEditArea_DashedLine2_c() : DashedLine
      {
         var _loc1_:DashedLine = new DashedLine();
         _loc1_.x = 303;
         _loc1_.y = 0;
         _loc1_.width = 0;
         _loc1_.height = 50;
         _loc1_.dashLength = 3;
         _loc1_.stroke = this._LibEditArea_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10594472;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _LibEditArea_DashedLine3_c() : DashedLine
      {
         var _loc1_:DashedLine = new DashedLine();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 303;
         _loc1_.height = 0;
         _loc1_.dashLength = 3;
         _loc1_.stroke = this._LibEditArea_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10594472;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _LibEditArea_DashedLine4_c() : DashedLine
      {
         var _loc1_:DashedLine = new DashedLine();
         _loc1_.x = 0;
         _loc1_.y = 50;
         _loc1_.width = 303;
         _loc1_.height = 0;
         _loc1_.dashLength = 3;
         _loc1_.stroke = this._LibEditArea_SolidColorStroke5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibEditArea_SolidColorStroke5_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10594472;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _LibEditArea_Label8_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "_LibEditArea_Label8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._LibEditArea_Label8 = _loc1_;
         BindingManager.executeBindings(this,"_LibEditArea_Label8",this._LibEditArea_Label8);
         return _loc1_;
      }
      
      private function _LibEditArea_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return this.width - 4;
         },null,"_LibEditArea_Rect1.width");
         result[1] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","editLiveset.livesetName.noteLabelStyle");
         },null,"_LibEditArea_Label5.styleName");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","editLiveset.presetImage.noteLabel");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_LibEditArea_Label5.text");
         result[3] = new Binding(this,function():Number
         {
            return this.width - 4;
         },null,"_LibEditArea_Rect3.width");
         result[4] = new Binding(this,function():Number
         {
            return this.width;
         },null,"presetImagesGrp.width");
         result[5] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","editLiveset.livesetName.noteLabelStyle");
         },null,"_LibEditArea_Label7.styleName");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","editLiveset.uploadImage.noteLabel");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_LibEditArea_Label7.text");
         result[7] = new Binding(this,function():Number
         {
            return this.width - 4;
         },null,"_LibEditArea_Rect4.width");
         result[8] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","editLiveset.livesetName.noteLabelStyle");
         },null,"_LibEditArea_Label8.styleName");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","editLiveset.uploadImage.dragLabel");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_LibEditArea_Label8.text");
         return result;
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
      public function get customPreviewArtworkImage() : LibEditCustomPreviewImage
      {
         return this._1314718334customPreviewArtworkImage;
      }
      
      public function set customPreviewArtworkImage(param1:LibEditCustomPreviewImage) : void
      {
         var _loc2_:Object = this._1314718334customPreviewArtworkImage;
         if(_loc2_ !== param1)
         {
            this._1314718334customPreviewArtworkImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"customPreviewArtworkImage",_loc2_,param1));
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
      public function get logic() : LibEditAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LibEditAreaLogic) : void
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
      public function get nameInput() : LivesetEditTextInput
      {
         return this._1213385727nameInput;
      }
      
      public function set nameInput(param1:LivesetEditTextInput) : void
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
      public function get presetImages() : TileGroup
      {
         return this._506490423presetImages;
      }
      
      public function set presetImages(param1:TileGroup) : void
      {
         var _loc2_:Object = this._506490423presetImages;
         if(_loc2_ !== param1)
         {
            this._506490423presetImages = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"presetImages",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get presetImagesGrp() : Group
      {
         return this._636152622presetImagesGrp;
      }
      
      public function set presetImagesGrp(param1:Group) : void
      {
         var _loc2_:Object = this._636152622presetImagesGrp;
         if(_loc2_ !== param1)
         {
            this._636152622presetImagesGrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"presetImagesGrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectFile() : ImageLabelButton
      {
         return this._1656373096selectFile;
      }
      
      public function set selectFile(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1656373096selectFile;
         if(_loc2_ !== param1)
         {
            this._1656373096selectFile = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectFile",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleLabel() : Label
      {
         return this._1791483012titleLabel;
      }
      
      public function set titleLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1791483012titleLabel;
         if(_loc2_ !== param1)
         {
            this._1791483012titleLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get uploadArea() : Group
      {
         return this._243635666uploadArea;
      }
      
      public function set uploadArea(param1:Group) : void
      {
         var _loc2_:Object = this._243635666uploadArea;
         if(_loc2_ !== param1)
         {
            this._243635666uploadArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"uploadArea",_loc2_,param1));
            }
         }
      }
   }
}

