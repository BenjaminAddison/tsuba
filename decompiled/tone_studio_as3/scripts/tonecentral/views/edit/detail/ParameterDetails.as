package tonecentral.views.edit.detail
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
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.components.VSlider;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.components.CustomDropDownList;
   import tonecentral.components.ImageLabelToggleButton;
   import tonecentral.skin.CustomVSliderSkin;
   import tonecentral.skin.ScrollerSkin;
   
   use namespace mx_internal;
   
   public class ParameterDetails extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1601478071editArea:Group;
      
      private var _1715632060effectName:Label;
      
      private var _1017207851effectSw:ImageLabelToggleButton;
      
      private var _1650225098effectSwInd:ImageLabelToggleButton;
      
      private var _87165830effectTypeDropDownList:CustomDropDownList;
      
      private var _1500020223fxBoxSel:Rect;
      
      private var _1151150622fxBoxSelColor:SolidColor;
      
      private var _1626379741g10ScaleLabelArea:Group;
      
      private var _1842320280geqGridLayer:UIComponent;
      
      private var _55026090geqScaleLabelArea:Group;
      
      private var _925912112knobSpace:Group;
      
      private var _1814164035lineLayer:UIComponent;
      
      private var _103149406logic:ParameterDetailsLogic;
      
      private var _894858934paramVgroup:VGroup;
      
      private var _1386307822rowLine:Line;
      
      private var _643109077scaleLabelGroup:Group;
      
      private var _1906186791scaleLayer:UIComponent;
      
      private var _226620441scrollerArea:Group;
      
      private var _899647263slider:VSlider;
      
      private var _1655945637sliderTrackSelected:UIComponent;
      
      private var _29377751subTypeDropDownList:CustomDropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bgi_v_txtbox_png_1736123726:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ParameterDetails()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml___assets_images_bgi_v_txtbox_png_1736123726 = ParameterDetails__embed_mxml___assets_images_bgi_v_txtbox_png_1736123726;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ParameterDetails_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_edit_detail_ParameterDetailsWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ParameterDetails[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._ParameterDetails_Scroller1_c()];
         this._ParameterDetails_ParameterDetailsLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ParameterDetails._watcherSetupUtil = param1;
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
      
      protected function slider_changeHandler(param1:Event) : void
      {
         this.logic.sliderThumbDrag(param1);
      }
      
      private function _ParameterDetails_ParameterDetailsLogic1_i() : ParameterDetailsLogic
      {
         var _loc1_:ParameterDetailsLogic = new ParameterDetailsLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ParameterDetails_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.viewport = this._ParameterDetails_Group2_i();
         _loc1_.setStyle("verticalScrollPolicy","auto");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("skinClass",ScrollerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ParameterDetails_Line1_c(),this._ParameterDetails_Rect1_i(),this._ParameterDetails_Label1_i(),this._ParameterDetails_Line2_c(),this._ParameterDetails_Group3_i()];
         _loc1_.id = "scrollerArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollerArea = _loc1_;
         BindingManager.executeBindings(this,"scrollerArea",this.scrollerArea);
         return _loc1_;
      }
      
      private function _ParameterDetails_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 0;
         _loc1_.stroke = this._ParameterDetails_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ParameterDetails_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ParameterDetails_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.y = 5;
         _loc1_.width = 10;
         _loc1_.height = 20;
         _loc1_.fill = this._ParameterDetails_SolidColor1_i();
         _loc1_.initialized(this,"fxBoxSel");
         this.fxBoxSel = _loc1_;
         BindingManager.executeBindings(this,"fxBoxSel",this.fxBoxSel);
         return _loc1_;
      }
      
      private function _ParameterDetails_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         this.fxBoxSelColor = _loc1_;
         BindingManager.executeBindings(this,"fxBoxSelColor",this.fxBoxSelColor);
         return _loc1_;
      }
      
      private function _ParameterDetails_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "effectDetailEffectName";
         _loc1_.y = 9;
         _loc1_.id = "effectName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectName = _loc1_;
         BindingManager.executeBindings(this,"effectName",this.effectName);
         return _loc1_;
      }
      
      private function _ParameterDetails_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 30;
         _loc1_.stroke = this._ParameterDetails_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ParameterDetails_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ParameterDetails_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 5;
         _loc1_.y = 40;
         _loc1_.visible = false;
         _loc1_.width = 800;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ParameterDetails_BitmapImage1_c(),this._ParameterDetails_ImageLabelToggleButton1_i(),this._ParameterDetails_ImageLabelToggleButton2_i(),this._ParameterDetails_CustomDropDownList1_i(),this._ParameterDetails_CustomDropDownList2_i(),this._ParameterDetails_Line3_c(),this._ParameterDetails_Line4_i(),this._ParameterDetails_Group4_i(),this._ParameterDetails_UIComponent1_i(),this._ParameterDetails_Group5_i(),this._ParameterDetails_Group6_i(),this._ParameterDetails_UIComponent2_i(),this._ParameterDetails_UIComponent3_i(),this._ParameterDetails_VSlider1_i(),this._ParameterDetails_VGroup1_i(),this._ParameterDetails_Group7_i(),this._ParameterDetails_UIComponent4_i()];
         _loc1_.id = "editArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editArea = _loc1_;
         BindingManager.executeBindings(this,"editArea",this.editArea);
         return _loc1_;
      }
      
      private function _ParameterDetails_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 445;
         _loc1_.height = 350;
         _loc1_.source = this._embed_mxml___assets_images_bgi_v_txtbox_png_1736123726;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ParameterDetails_ImageLabelToggleButton1_i() : ImageLabelToggleButton
      {
         var _loc1_:ImageLabelToggleButton = new ImageLabelToggleButton();
         _loc1_.x = 10;
         _loc1_.y = 13;
         _loc1_.width = 36;
         _loc1_.height = 36;
         _loc1_.styleName = "effectSwLarge";
         _loc1_.id = "effectSw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectSw = _loc1_;
         BindingManager.executeBindings(this,"effectSw",this.effectSw);
         return _loc1_;
      }
      
      private function _ParameterDetails_ImageLabelToggleButton2_i() : ImageLabelToggleButton
      {
         var _loc1_:ImageLabelToggleButton = new ImageLabelToggleButton();
         _loc1_.x = 10;
         _loc1_.y = 13;
         _loc1_.width = 36;
         _loc1_.height = 36;
         _loc1_.mouseEnabled = false;
         _loc1_.styleName = "effectSwLargeSquare";
         _loc1_.id = "effectSwInd";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectSwInd = _loc1_;
         BindingManager.executeBindings(this,"effectSwInd",this.effectSwInd);
         return _loc1_;
      }
      
      private function _ParameterDetails_CustomDropDownList1_i() : CustomDropDownList
      {
         var _loc1_:CustomDropDownList = new CustomDropDownList();
         _loc1_.x = 58;
         _loc1_.y = 10;
         _loc1_.labelField = "name";
         _loc1_.width = 200;
         _loc1_.height = 40;
         _loc1_.styleName = "effectDetailBlueDropDown";
         _loc1_.id = "effectTypeDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectTypeDropDownList = _loc1_;
         BindingManager.executeBindings(this,"effectTypeDropDownList",this.effectTypeDropDownList);
         return _loc1_;
      }
      
      private function _ParameterDetails_CustomDropDownList2_i() : CustomDropDownList
      {
         var _loc1_:CustomDropDownList = new CustomDropDownList();
         _loc1_.x = 280;
         _loc1_.y = 10;
         _loc1_.width = 150;
         _loc1_.height = 40;
         _loc1_.styleName = "effectDetailBlueDropDown";
         _loc1_.labelField = "name";
         _loc1_.id = "subTypeDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subTypeDropDownList = _loc1_;
         BindingManager.executeBindings(this,"subTypeDropDownList",this.subTypeDropDownList);
         return _loc1_;
      }
      
      private function _ParameterDetails_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.width = 445;
         _loc1_.y = 57;
         _loc1_.stroke = this._ParameterDetails_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ParameterDetails_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ParameterDetails_Line4_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.width = 445;
         _loc1_.y = 203;
         _loc1_.stroke = this._ParameterDetails_SolidColorStroke4_c();
         _loc1_.initialized(this,"rowLine");
         this.rowLine = _loc1_;
         BindingManager.executeBindings(this,"rowLine",this.rowLine);
         return _loc1_;
      }
      
      private function _ParameterDetails_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 9430271;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ParameterDetails_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 472;
         _loc1_.width = 20;
         _loc1_.height = 390;
         _loc1_.id = "scaleLabelGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleLabelGroup = _loc1_;
         BindingManager.executeBindings(this,"scaleLabelGroup",this.scaleLabelGroup);
         return _loc1_;
      }
      
      private function _ParameterDetails_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "geqGridLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.geqGridLayer = _loc1_;
         BindingManager.executeBindings(this,"geqGridLayer",this.geqGridLayer);
         return _loc1_;
      }
      
      private function _ParameterDetails_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ParameterDetails_Label2_c(),this._ParameterDetails_Label3_c(),this._ParameterDetails_Label4_c()];
         _loc1_.id = "geqScaleLabelArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.geqScaleLabelArea = _loc1_;
         BindingManager.executeBindings(this,"geqScaleLabelArea",this.geqScaleLabelArea);
         return _loc1_;
      }
      
      private function _ParameterDetails_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "+20";
         _loc1_.x = 5;
         _loc1_.y = 105;
         _loc1_.width = 40;
         _loc1_.styleName = "scale";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "0";
         _loc1_.x = 5;
         _loc1_.y = 208;
         _loc1_.width = 40;
         _loc1_.styleName = "scale";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "-20";
         _loc1_.x = 5;
         _loc1_.y = 312;
         _loc1_.width = 40;
         _loc1_.styleName = "scale";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ParameterDetails_Label5_c(),this._ParameterDetails_Label6_c(),this._ParameterDetails_Label7_c()];
         _loc1_.id = "g10ScaleLabelArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.g10ScaleLabelArea = _loc1_;
         BindingManager.executeBindings(this,"g10ScaleLabelArea",this.g10ScaleLabelArea);
         return _loc1_;
      }
      
      private function _ParameterDetails_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "+12";
         _loc1_.x = 5;
         _loc1_.y = 105;
         _loc1_.width = 40;
         _loc1_.styleName = "scale";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "0";
         _loc1_.x = 5;
         _loc1_.y = 208;
         _loc1_.width = 40;
         _loc1_.styleName = "scale";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "-12";
         _loc1_.x = 5;
         _loc1_.y = 312;
         _loc1_.width = 40;
         _loc1_.styleName = "scale";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ParameterDetails_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 495;
         _loc1_.id = "scaleLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleLayer = _loc1_;
         BindingManager.executeBindings(this,"scaleLayer",this.scaleLayer);
         return _loc1_;
      }
      
      private function _ParameterDetails_UIComponent3_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 494;
         _loc1_.width = 35;
         _loc1_.id = "sliderTrackSelected";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderTrackSelected = _loc1_;
         BindingManager.executeBindings(this,"sliderTrackSelected",this.sliderTrackSelected);
         return _loc1_;
      }
      
      private function _ParameterDetails_VSlider1_i() : VSlider
      {
         var _loc1_:VSlider = new VSlider();
         _loc1_.x = 490;
         _loc1_.width = 44;
         _loc1_.height = 350;
         _loc1_.showDataTip = false;
         _loc1_.setStyle("skinClass",CustomVSliderSkin);
         _loc1_.setStyle("liveDragging",true);
         _loc1_.id = "slider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.slider = _loc1_;
         BindingManager.executeBindings(this,"slider",this.slider);
         return _loc1_;
      }
      
      private function _ParameterDetails_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 545;
         _loc1_.gap = 5;
         _loc1_.id = "paramVgroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.paramVgroup = _loc1_;
         BindingManager.executeBindings(this,"paramVgroup",this.paramVgroup);
         return _loc1_;
      }
      
      private function _ParameterDetails_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "knobSpace";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.knobSpace = _loc1_;
         BindingManager.executeBindings(this,"knobSpace",this.knobSpace);
         return _loc1_;
      }
      
      private function _ParameterDetails_UIComponent4_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.id = "lineLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lineLayer = _loc1_;
         BindingManager.executeBindings(this,"lineLayer",this.lineLayer);
         return _loc1_;
      }
      
      private function _ParameterDetails_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return editArea.x;
         },null,"fxBoxSel.x");
         result[1] = new Binding(this,function():Number
         {
            return editArea.x + 20;
         },null,"effectName.x");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get editArea() : Group
      {
         return this._1601478071editArea;
      }
      
      public function set editArea(param1:Group) : void
      {
         var _loc2_:Object = this._1601478071editArea;
         if(_loc2_ !== param1)
         {
            this._1601478071editArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectName() : Label
      {
         return this._1715632060effectName;
      }
      
      public function set effectName(param1:Label) : void
      {
         var _loc2_:Object = this._1715632060effectName;
         if(_loc2_ !== param1)
         {
            this._1715632060effectName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectSw() : ImageLabelToggleButton
      {
         return this._1017207851effectSw;
      }
      
      public function set effectSw(param1:ImageLabelToggleButton) : void
      {
         var _loc2_:Object = this._1017207851effectSw;
         if(_loc2_ !== param1)
         {
            this._1017207851effectSw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectSw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectSwInd() : ImageLabelToggleButton
      {
         return this._1650225098effectSwInd;
      }
      
      public function set effectSwInd(param1:ImageLabelToggleButton) : void
      {
         var _loc2_:Object = this._1650225098effectSwInd;
         if(_loc2_ !== param1)
         {
            this._1650225098effectSwInd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectSwInd",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectTypeDropDownList() : CustomDropDownList
      {
         return this._87165830effectTypeDropDownList;
      }
      
      public function set effectTypeDropDownList(param1:CustomDropDownList) : void
      {
         var _loc2_:Object = this._87165830effectTypeDropDownList;
         if(_loc2_ !== param1)
         {
            this._87165830effectTypeDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectTypeDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fxBoxSel() : Rect
      {
         return this._1500020223fxBoxSel;
      }
      
      public function set fxBoxSel(param1:Rect) : void
      {
         var _loc2_:Object = this._1500020223fxBoxSel;
         if(_loc2_ !== param1)
         {
            this._1500020223fxBoxSel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fxBoxSel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fxBoxSelColor() : SolidColor
      {
         return this._1151150622fxBoxSelColor;
      }
      
      public function set fxBoxSelColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1151150622fxBoxSelColor;
         if(_loc2_ !== param1)
         {
            this._1151150622fxBoxSelColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fxBoxSelColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get g10ScaleLabelArea() : Group
      {
         return this._1626379741g10ScaleLabelArea;
      }
      
      public function set g10ScaleLabelArea(param1:Group) : void
      {
         var _loc2_:Object = this._1626379741g10ScaleLabelArea;
         if(_loc2_ !== param1)
         {
            this._1626379741g10ScaleLabelArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"g10ScaleLabelArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get geqGridLayer() : UIComponent
      {
         return this._1842320280geqGridLayer;
      }
      
      public function set geqGridLayer(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1842320280geqGridLayer;
         if(_loc2_ !== param1)
         {
            this._1842320280geqGridLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"geqGridLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get geqScaleLabelArea() : Group
      {
         return this._55026090geqScaleLabelArea;
      }
      
      public function set geqScaleLabelArea(param1:Group) : void
      {
         var _loc2_:Object = this._55026090geqScaleLabelArea;
         if(_loc2_ !== param1)
         {
            this._55026090geqScaleLabelArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"geqScaleLabelArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get knobSpace() : Group
      {
         return this._925912112knobSpace;
      }
      
      public function set knobSpace(param1:Group) : void
      {
         var _loc2_:Object = this._925912112knobSpace;
         if(_loc2_ !== param1)
         {
            this._925912112knobSpace = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"knobSpace",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineLayer() : UIComponent
      {
         return this._1814164035lineLayer;
      }
      
      public function set lineLayer(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1814164035lineLayer;
         if(_loc2_ !== param1)
         {
            this._1814164035lineLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ParameterDetailsLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ParameterDetailsLogic) : void
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
      public function get paramVgroup() : VGroup
      {
         return this._894858934paramVgroup;
      }
      
      public function set paramVgroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._894858934paramVgroup;
         if(_loc2_ !== param1)
         {
            this._894858934paramVgroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paramVgroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowLine() : Line
      {
         return this._1386307822rowLine;
      }
      
      public function set rowLine(param1:Line) : void
      {
         var _loc2_:Object = this._1386307822rowLine;
         if(_loc2_ !== param1)
         {
            this._1386307822rowLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleLabelGroup() : Group
      {
         return this._643109077scaleLabelGroup;
      }
      
      public function set scaleLabelGroup(param1:Group) : void
      {
         var _loc2_:Object = this._643109077scaleLabelGroup;
         if(_loc2_ !== param1)
         {
            this._643109077scaleLabelGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleLabelGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleLayer() : UIComponent
      {
         return this._1906186791scaleLayer;
      }
      
      public function set scaleLayer(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1906186791scaleLayer;
         if(_loc2_ !== param1)
         {
            this._1906186791scaleLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollerArea() : Group
      {
         return this._226620441scrollerArea;
      }
      
      public function set scrollerArea(param1:Group) : void
      {
         var _loc2_:Object = this._226620441scrollerArea;
         if(_loc2_ !== param1)
         {
            this._226620441scrollerArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollerArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get slider() : VSlider
      {
         return this._899647263slider;
      }
      
      public function set slider(param1:VSlider) : void
      {
         var _loc2_:Object = this._899647263slider;
         if(_loc2_ !== param1)
         {
            this._899647263slider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderTrackSelected() : UIComponent
      {
         return this._1655945637sliderTrackSelected;
      }
      
      public function set sliderTrackSelected(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1655945637sliderTrackSelected;
         if(_loc2_ !== param1)
         {
            this._1655945637sliderTrackSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderTrackSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subTypeDropDownList() : CustomDropDownList
      {
         return this._29377751subTypeDropDownList;
      }
      
      public function set subTypeDropDownList(param1:CustomDropDownList) : void
      {
         var _loc2_:Object = this._29377751subTypeDropDownList;
         if(_loc2_ !== param1)
         {
            this._29377751subTypeDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subTypeDropDownList",_loc2_,param1));
            }
         }
      }
   }
}

