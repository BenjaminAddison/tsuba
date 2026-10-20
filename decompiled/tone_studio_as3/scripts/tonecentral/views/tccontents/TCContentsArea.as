package tonecentral.views.tccontents
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
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.itemrenderer.LibraryListItemRenderer;
   import tonecentral.itemrenderer.TrackListItemRenderer;
   import tonecentral.skin.DropListSkin;
   
   use namespace mx_internal;
   
   public class TCContentsArea extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _159077850downloadButton:ImageLabelButton;
      
      private var _1420014792footerArea:Group;
      
      private var _394773312footerBg:BitmapImage;
      
      private var _1115259982headerBg:BitmapImage;
      
      private var _177381979infoArea:TCInfoArea;
      
      private var _1204898396informationTxt:BitmapImage;
      
      private var _766719803informationTxtGroup:Group;
      
      private var _102977213line1:BitmapImage;
      
      private var _102977214line2:BitmapImage;
      
      private var _797058452liveSetList:TCPatchList;
      
      private var _1773136538livesetTxt:BitmapImage;
      
      private var _1467420465loadFaultModal:LoadFaultModalArea;
      
      private var _103149406logic:TCContentsAreaLogic;
      
      private var _1081571394mainbg:BitmapImage;
      
      private var _513613562patchList:TCPatchList;
      
      private var _1230365960patchTxt:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_tonecentral_txt_information_png_2069468738:Class;
      
      private var _embed_mxml___assets_images_bg_tc_png_1606380461:Class;
      
      private var _embed_mxml___assets_images_tonecentral_txt_patch_png_1481723226:Class;
      
      private var _embed_mxml___assets_images_bg_head_png_953662464:Class;
      
      private var _embed_mxml___assets_images_lin_head_png_2082447925:Class;
      
      private var _embed_mxml___assets_images_tonecentral_txt_liveset_png_1237582398:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TCContentsArea()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml___assets_images_tonecentral_txt_information_png_2069468738 = TCContentsArea__embed_mxml___assets_images_tonecentral_txt_information_png_2069468738;
         this._embed_mxml___assets_images_bg_tc_png_1606380461 = TCContentsArea__embed_mxml___assets_images_bg_tc_png_1606380461;
         this._embed_mxml___assets_images_tonecentral_txt_patch_png_1481723226 = TCContentsArea__embed_mxml___assets_images_tonecentral_txt_patch_png_1481723226;
         this._embed_mxml___assets_images_bg_head_png_953662464 = TCContentsArea__embed_mxml___assets_images_bg_head_png_953662464;
         this._embed_mxml___assets_images_lin_head_png_2082447925 = TCContentsArea__embed_mxml___assets_images_lin_head_png_2082447925;
         this._embed_mxml___assets_images_tonecentral_txt_liveset_png_1237582398 = TCContentsArea__embed_mxml___assets_images_tonecentral_txt_liveset_png_1237582398;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._TCContentsArea_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_tccontents_TCContentsAreaWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TCContentsArea[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._TCContentsArea_BitmapImage1_i(),this._TCContentsArea_BitmapImage2_i(),this._TCContentsArea_HGroup1_c(),this._TCContentsArea_BitmapImage6_i(),this._TCContentsArea_BitmapImage7_i(),this._TCContentsArea_Rect1_c(),this._TCContentsArea_Group5_c(),this._TCContentsArea_Group6_c(),this._TCContentsArea_Line1_c(),this._TCContentsArea_Line2_c(),this._TCContentsArea_TCInfoArea1_i(),this._TCContentsArea_Group7_i(),this._TCContentsArea_LoadFaultModalArea1_i()];
         this._TCContentsArea_TCContentsAreaLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TCContentsArea._watcherSetupUtil = param1;
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
      
      private function _TCContentsArea_TCContentsAreaLogic1_i() : TCContentsAreaLogic
      {
         var _loc1_:TCContentsAreaLogic = new TCContentsAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.source = this._embed_mxml___assets_images_bg_head_png_953662464;
         _loc1_.initialized(this,"headerBg");
         this.headerBg = _loc1_;
         BindingManager.executeBindings(this,"headerBg",this.headerBg);
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.top = 40;
         _loc1_.bottom = 40;
         _loc1_.source = this._embed_mxml___assets_images_bg_tc_png_1606380461;
         _loc1_.initialized(this,"mainbg");
         this.mainbg = _loc1_;
         BindingManager.executeBindings(this,"mainbg",this.mainbg);
         return _loc1_;
      }
      
      private function _TCContentsArea_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TCContentsArea_Group2_c(),this._TCContentsArea_Group3_c(),this._TCContentsArea_Group4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCContentsArea_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 171;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._TCContentsArea_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_tonecentral_txt_liveset_png_1237582398;
         _loc1_.width = 54;
         _loc1_.height = 17;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"livesetTxt");
         this.livesetTxt = _loc1_;
         BindingManager.executeBindings(this,"livesetTxt",this.livesetTxt);
         return _loc1_;
      }
      
      private function _TCContentsArea_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 171;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._TCContentsArea_BitmapImage4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_tonecentral_txt_patch_png_1481723226;
         _loc1_.width = 40;
         _loc1_.height = 17;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"patchTxt");
         this.patchTxt = _loc1_;
         BindingManager.executeBindings(this,"patchTxt",this.patchTxt);
         return _loc1_;
      }
      
      private function _TCContentsArea_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 40;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TCContentsArea_BitmapImage5_i()];
         _loc1_.id = "informationTxtGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.informationTxtGroup = _loc1_;
         BindingManager.executeBindings(this,"informationTxtGroup",this.informationTxtGroup);
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml___assets_images_tonecentral_txt_information_png_2069468738;
         _loc1_.width = 87;
         _loc1_.height = 17;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"informationTxt");
         this.informationTxt = _loc1_;
         BindingManager.executeBindings(this,"informationTxt",this.informationTxt);
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 2;
         _loc1_.x = 170;
         _loc1_.y = 0;
         _loc1_.source = this._embed_mxml___assets_images_lin_head_png_2082447925;
         _loc1_.initialized(this,"line1");
         this.line1 = _loc1_;
         BindingManager.executeBindings(this,"line1",this.line1);
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage7_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 2;
         _loc1_.x = 340;
         _loc1_.y = 0;
         _loc1_.source = this._embed_mxml___assets_images_lin_head_png_2082447925;
         _loc1_.initialized(this,"line2");
         this.line2 = _loc1_;
         BindingManager.executeBindings(this,"line2",this.line2);
         return _loc1_;
      }
      
      private function _TCContentsArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.y = 40;
         _loc1_.width = 340;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._TCContentsArea_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TCContentsArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4276545;
         return _loc1_;
      }
      
      private function _TCContentsArea_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 171;
         _loc1_.y = 40;
         _loc1_.percentHeight = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._TCContentsArea_TCPatchList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCContentsArea_TCPatchList1_i() : TCPatchList
      {
         var _loc1_:TCPatchList = new TCPatchList();
         _loc1_.width = 178;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._TCContentsArea_ClassFactory1_c();
         _loc1_.setStyle("contentBackgroundColor",4276545);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("skinClass",DropListSkin);
         _loc1_.id = "liveSetList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.liveSetList = _loc1_;
         BindingManager.executeBindings(this,"liveSetList",this.liveSetList);
         return _loc1_;
      }
      
      private function _TCContentsArea_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LibraryListItemRenderer;
         return _loc1_;
      }
      
      private function _TCContentsArea_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 171;
         _loc1_.y = 40;
         _loc1_.x = 170;
         _loc1_.percentHeight = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._TCContentsArea_TCPatchList2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCContentsArea_TCPatchList2_i() : TCPatchList
      {
         var _loc1_:TCPatchList = new TCPatchList();
         _loc1_.width = 178;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._TCContentsArea_ClassFactory2_c();
         _loc1_.setStyle("contentBackgroundColor",4276545);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("skinClass",DropListSkin);
         _loc1_.id = "patchList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.patchList = _loc1_;
         BindingManager.executeBindings(this,"patchList",this.patchList);
         return _loc1_;
      }
      
      private function _TCContentsArea_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TrackListItemRenderer;
         return _loc1_;
      }
      
      private function _TCContentsArea_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 40;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._TCContentsArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TCContentsArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _TCContentsArea_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.x = 170;
         _loc1_.y = 40;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._TCContentsArea_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TCContentsArea_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _TCContentsArea_TCInfoArea1_i() : TCInfoArea
      {
         var _loc1_:TCInfoArea = new TCInfoArea();
         _loc1_.x = 341;
         _loc1_.top = 40;
         _loc1_.bottom = 40;
         _loc1_.id = "infoArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoArea = _loc1_;
         BindingManager.executeBindings(this,"infoArea",this.infoArea);
         return _loc1_;
      }
      
      private function _TCContentsArea_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 341;
         _loc1_.bottom = 0;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TCContentsArea_BitmapImage8_i(),this._TCContentsArea_ImageLabelButton1_i()];
         _loc1_.id = "footerArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.footerArea = _loc1_;
         BindingManager.executeBindings(this,"footerArea",this.footerArea);
         return _loc1_;
      }
      
      private function _TCContentsArea_BitmapImage8_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.source = this._embed_mxml___assets_images_bg_head_png_953662464;
         _loc1_.initialized(this,"footerBg");
         this.footerBg = _loc1_;
         BindingManager.executeBindings(this,"footerBg",this.footerBg);
         return _loc1_;
      }
      
      private function _TCContentsArea_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 5;
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.id = "downloadButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.downloadButton = _loc1_;
         BindingManager.executeBindings(this,"downloadButton",this.downloadButton);
         return _loc1_;
      }
      
      private function _TCContentsArea_LoadFaultModalArea1_i() : LoadFaultModalArea
      {
         var _loc1_:LoadFaultModalArea = new LoadFaultModalArea();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "loadFaultModal";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadFaultModal = _loc1_;
         BindingManager.executeBindings(this,"loadFaultModal",this.loadFaultModal);
         return _loc1_;
      }
      
      private function _TCContentsArea_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","tccontentsarea.add.btn");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"downloadButton.label");
         result[1] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","tccontentsarea.add.btn.style");
         },null,"downloadButton.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get downloadButton() : ImageLabelButton
      {
         return this._159077850downloadButton;
      }
      
      public function set downloadButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._159077850downloadButton;
         if(_loc2_ !== param1)
         {
            this._159077850downloadButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"downloadButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get footerArea() : Group
      {
         return this._1420014792footerArea;
      }
      
      public function set footerArea(param1:Group) : void
      {
         var _loc2_:Object = this._1420014792footerArea;
         if(_loc2_ !== param1)
         {
            this._1420014792footerArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"footerArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get footerBg() : BitmapImage
      {
         return this._394773312footerBg;
      }
      
      public function set footerBg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._394773312footerBg;
         if(_loc2_ !== param1)
         {
            this._394773312footerBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"footerBg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerBg() : BitmapImage
      {
         return this._1115259982headerBg;
      }
      
      public function set headerBg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1115259982headerBg;
         if(_loc2_ !== param1)
         {
            this._1115259982headerBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerBg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoArea() : TCInfoArea
      {
         return this._177381979infoArea;
      }
      
      public function set infoArea(param1:TCInfoArea) : void
      {
         var _loc2_:Object = this._177381979infoArea;
         if(_loc2_ !== param1)
         {
            this._177381979infoArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get informationTxt() : BitmapImage
      {
         return this._1204898396informationTxt;
      }
      
      public function set informationTxt(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1204898396informationTxt;
         if(_loc2_ !== param1)
         {
            this._1204898396informationTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"informationTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get informationTxtGroup() : Group
      {
         return this._766719803informationTxtGroup;
      }
      
      public function set informationTxtGroup(param1:Group) : void
      {
         var _loc2_:Object = this._766719803informationTxtGroup;
         if(_loc2_ !== param1)
         {
            this._766719803informationTxtGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"informationTxtGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get line1() : BitmapImage
      {
         return this._102977213line1;
      }
      
      public function set line1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._102977213line1;
         if(_loc2_ !== param1)
         {
            this._102977213line1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"line1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get line2() : BitmapImage
      {
         return this._102977214line2;
      }
      
      public function set line2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._102977214line2;
         if(_loc2_ !== param1)
         {
            this._102977214line2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"line2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get liveSetList() : TCPatchList
      {
         return this._797058452liveSetList;
      }
      
      public function set liveSetList(param1:TCPatchList) : void
      {
         var _loc2_:Object = this._797058452liveSetList;
         if(_loc2_ !== param1)
         {
            this._797058452liveSetList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"liveSetList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get livesetTxt() : BitmapImage
      {
         return this._1773136538livesetTxt;
      }
      
      public function set livesetTxt(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1773136538livesetTxt;
         if(_loc2_ !== param1)
         {
            this._1773136538livesetTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"livesetTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loadFaultModal() : LoadFaultModalArea
      {
         return this._1467420465loadFaultModal;
      }
      
      public function set loadFaultModal(param1:LoadFaultModalArea) : void
      {
         var _loc2_:Object = this._1467420465loadFaultModal;
         if(_loc2_ !== param1)
         {
            this._1467420465loadFaultModal = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadFaultModal",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : TCContentsAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:TCContentsAreaLogic) : void
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
      
      [Bindable(event="propertyChange")]
      public function get patchList() : TCPatchList
      {
         return this._513613562patchList;
      }
      
      public function set patchList(param1:TCPatchList) : void
      {
         var _loc2_:Object = this._513613562patchList;
         if(_loc2_ !== param1)
         {
            this._513613562patchList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"patchList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get patchTxt() : BitmapImage
      {
         return this._1230365960patchTxt;
      }
      
      public function set patchTxt(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1230365960patchTxt;
         if(_loc2_ !== param1)
         {
            this._1230365960patchTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"patchTxt",_loc2_,param1));
            }
         }
      }
   }
}

