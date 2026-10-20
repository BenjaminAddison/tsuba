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
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.TileGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import tonecentral.common.data.TCPageData;
   import tonecentral.components.ImageButton;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.ScrollGroup;
   import tonecentral.skin.ScrollerSkin;
   
   use namespace mx_internal;
   
   public class TCInfoArea extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _TCInfoArea_Label4:Label;
      
      private var _410956671container:VGroup;
      
      private var _1976965306headerArea:Group;
      
      private var _103149406logic:TCInfoAreaLogic;
      
      private var _1319211093patchDescTable:PatchDescTable;
      
      private var _532328931permaLinkButton:ImageLabelButton;
      
      private var _985752863player:SCPlayer;
      
      private var _2095672862playlistArtWork:BitmapImage;
      
      private var _1807125809playlistDescLabel:Label;
      
      private var _580007805playlistName:Label;
      
      private var _713095147playlistTextLabel:Label;
      
      private var _65731834scrollArea:Scroller;
      
      private var _226620441scrollerArea:ScrollGroup;
      
      private var _1549555897tagArea:Group;
      
      private var _1549236392tagList:TileGroup;
      
      private var _77453744youtubeArea:Group;
      
      private var _1028972791youtubePlayButton:ImageButton;
      
      private var _994800668youtubePlayer:UIComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TCInfoArea()
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
         bindings = this._TCInfoArea_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_tccontents_TCInfoAreaWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TCInfoArea[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._TCInfoArea_Scroller1_i()];
         this._TCInfoArea_TCInfoAreaLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TCInfoArea._watcherSetupUtil = param1;
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
      
      public function set pageData(param1:TCPageData) : void
      {
         this.logic.pageData = param1;
      }
      
      public function changeEnablePermaLinkButton(param1:Boolean) : void
      {
         this.logic.changeEnablePermaLinkButton(param1);
      }
      
      private function _TCInfoArea_TCInfoAreaLogic1_i() : TCInfoAreaLogic
      {
         var _loc1_:TCInfoAreaLogic = new TCInfoAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _TCInfoArea_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._TCInfoArea_ScrollGroup1_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "scrollArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollArea = _loc1_;
         BindingManager.executeBindings(this,"scrollArea",this.scrollArea);
         return _loc1_;
      }
      
      private function _TCInfoArea_ScrollGroup1_i() : ScrollGroup
      {
         var _loc1_:ScrollGroup = new ScrollGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TCInfoArea_VGroup1_i()];
         _loc1_.id = "scrollerArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollerArea = _loc1_;
         BindingManager.executeBindings(this,"scrollerArea",this.scrollerArea);
         return _loc1_;
      }
      
      private function _TCInfoArea_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 30;
         _loc1_.paddingRight = 30;
         _loc1_.paddingTop = 30;
         _loc1_.paddingBottom = 30;
         _loc1_.gap = 20;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._TCInfoArea_Group2_i(),this._TCInfoArea_Label3_i(),this._TCInfoArea_Group4_i(),this._TCInfoArea_Group5_i(),this._TCInfoArea_SCPlayer1_i(),this._TCInfoArea_PatchDescTable1_i()];
         _loc1_.id = "container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _TCInfoArea_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TCInfoArea_BitmapImage1_i(),this._TCInfoArea_VGroup2_c()];
         _loc1_.id = "headerArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerArea = _loc1_;
         BindingManager.executeBindings(this,"headerArea",this.headerArea);
         return _loc1_;
      }
      
      private function _TCInfoArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 100;
         _loc1_.height = 100;
         _loc1_.initialized(this,"playlistArtWork");
         this.playlistArtWork = _loc1_;
         BindingManager.executeBindings(this,"playlistArtWork",this.playlistArtWork);
         return _loc1_;
      }
      
      private function _TCInfoArea_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.x = 120;
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._TCInfoArea_Group3_c(),this._TCInfoArea_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCInfoArea_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TCInfoArea_Label1_i(),this._TCInfoArea_ImageLabelButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TCInfoArea_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 2;
         _loc1_.styleName = "tcPlaylistName";
         _loc1_.id = "playlistName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playlistName = _loc1_;
         BindingManager.executeBindings(this,"playlistName",this.playlistName);
         return _loc1_;
      }
      
      private function _TCInfoArea_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.right = 0;
         _loc1_.label = "WebSite";
         _loc1_.styleName = "update";
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.id = "permaLinkButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.permaLinkButton = _loc1_;
         BindingManager.executeBindings(this,"permaLinkButton",this.permaLinkButton);
         return _loc1_;
      }
      
      private function _TCInfoArea_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "tcInfoDesc";
         _loc1_.id = "playlistDescLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playlistDescLabel = _loc1_;
         BindingManager.executeBindings(this,"playlistDescLabel",this.playlistDescLabel);
         return _loc1_;
      }
      
      private function _TCInfoArea_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "tcInfoText";
         _loc1_.id = "playlistTextLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playlistTextLabel = _loc1_;
         BindingManager.executeBindings(this,"playlistTextLabel",this.playlistTextLabel);
         return _loc1_;
      }
      
      private function _TCInfoArea_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._TCInfoArea_Rect1_c(),this._TCInfoArea_TileGroup1_i()];
         _loc1_.id = "tagArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tagArea = _loc1_;
         BindingManager.executeBindings(this,"tagArea",this.tagArea);
         return _loc1_;
      }
      
      private function _TCInfoArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._TCInfoArea_SolidColor1_c();
         _loc1_.stroke = this._TCInfoArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TCInfoArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2236962;
         return _loc1_;
      }
      
      private function _TCInfoArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _TCInfoArea_TileGroup1_i() : TileGroup
      {
         var _loc1_:TileGroup = new TileGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.verticalGap = 5;
         _loc1_.horizontalGap = 5;
         _loc1_.id = "tagList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tagList = _loc1_;
         BindingManager.executeBindings(this,"tagList",this.tagList);
         return _loc1_;
      }
      
      private function _TCInfoArea_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._TCInfoArea_UIComponent1_i(),this._TCInfoArea_ImageButton1_i(),this._TCInfoArea_Rect2_c(),this._TCInfoArea_Label4_i()];
         _loc1_.id = "youtubeArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.youtubeArea = _loc1_;
         BindingManager.executeBindings(this,"youtubeArea",this.youtubeArea);
         return _loc1_;
      }
      
      private function _TCInfoArea_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.buttonMode = true;
         _loc1_.id = "youtubePlayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.youtubePlayer = _loc1_;
         BindingManager.executeBindings(this,"youtubePlayer",this.youtubePlayer);
         return _loc1_;
      }
      
      private function _TCInfoArea_ImageButton1_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.x = 10;
         _loc1_.y = 10;
         _loc1_.styleName = "playButton";
         _loc1_.buttonMode = true;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "youtubePlayButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.youtubePlayButton = _loc1_;
         BindingManager.executeBindings(this,"youtubePlayButton",this.youtubePlayButton);
         return _loc1_;
      }
      
      private function _TCInfoArea_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 240;
         _loc1_.height = 40;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 50;
         _loc1_.fill = this._TCInfoArea_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TCInfoArea_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      private function _TCInfoArea_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.bottom = 25;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 50;
         _loc1_.id = "_TCInfoArea_Label4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TCInfoArea_Label4 = _loc1_;
         BindingManager.executeBindings(this,"_TCInfoArea_Label4",this._TCInfoArea_Label4);
         return _loc1_;
      }
      
      private function _TCInfoArea_SCPlayer1_i() : SCPlayer
      {
         var _loc1_:SCPlayer = new SCPlayer();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.id = "player";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.player = _loc1_;
         BindingManager.executeBindings(this,"player",this.player);
         return _loc1_;
      }
      
      private function _TCInfoArea_PatchDescTable1_i() : PatchDescTable
      {
         var _loc1_:PatchDescTable = new PatchDescTable();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.id = "patchDescTable";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.patchDescTable = _loc1_;
         BindingManager.executeBindings(this,"patchDescTable",this.patchDescTable);
         return _loc1_;
      }
      
      private function _TCInfoArea_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","tcinfoarea.youtubePlay.btn");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TCInfoArea_Label4.text");
         result[1] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","tcinfoarea.youtubePlay.style");
         },null,"_TCInfoArea_Label4.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : VGroup
      {
         return this._410956671container;
      }
      
      public function set container(param1:VGroup) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerArea() : Group
      {
         return this._1976965306headerArea;
      }
      
      public function set headerArea(param1:Group) : void
      {
         var _loc2_:Object = this._1976965306headerArea;
         if(_loc2_ !== param1)
         {
            this._1976965306headerArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : TCInfoAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:TCInfoAreaLogic) : void
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
      public function get patchDescTable() : PatchDescTable
      {
         return this._1319211093patchDescTable;
      }
      
      public function set patchDescTable(param1:PatchDescTable) : void
      {
         var _loc2_:Object = this._1319211093patchDescTable;
         if(_loc2_ !== param1)
         {
            this._1319211093patchDescTable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"patchDescTable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get permaLinkButton() : ImageLabelButton
      {
         return this._532328931permaLinkButton;
      }
      
      public function set permaLinkButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._532328931permaLinkButton;
         if(_loc2_ !== param1)
         {
            this._532328931permaLinkButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"permaLinkButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get player() : SCPlayer
      {
         return this._985752863player;
      }
      
      public function set player(param1:SCPlayer) : void
      {
         var _loc2_:Object = this._985752863player;
         if(_loc2_ !== param1)
         {
            this._985752863player = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"player",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playlistArtWork() : BitmapImage
      {
         return this._2095672862playlistArtWork;
      }
      
      public function set playlistArtWork(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2095672862playlistArtWork;
         if(_loc2_ !== param1)
         {
            this._2095672862playlistArtWork = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playlistArtWork",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playlistDescLabel() : Label
      {
         return this._1807125809playlistDescLabel;
      }
      
      public function set playlistDescLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1807125809playlistDescLabel;
         if(_loc2_ !== param1)
         {
            this._1807125809playlistDescLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playlistDescLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playlistName() : Label
      {
         return this._580007805playlistName;
      }
      
      public function set playlistName(param1:Label) : void
      {
         var _loc2_:Object = this._580007805playlistName;
         if(_loc2_ !== param1)
         {
            this._580007805playlistName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playlistName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playlistTextLabel() : Label
      {
         return this._713095147playlistTextLabel;
      }
      
      public function set playlistTextLabel(param1:Label) : void
      {
         var _loc2_:Object = this._713095147playlistTextLabel;
         if(_loc2_ !== param1)
         {
            this._713095147playlistTextLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playlistTextLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollArea() : Scroller
      {
         return this._65731834scrollArea;
      }
      
      public function set scrollArea(param1:Scroller) : void
      {
         var _loc2_:Object = this._65731834scrollArea;
         if(_loc2_ !== param1)
         {
            this._65731834scrollArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollerArea() : ScrollGroup
      {
         return this._226620441scrollerArea;
      }
      
      public function set scrollerArea(param1:ScrollGroup) : void
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
      public function get tagArea() : Group
      {
         return this._1549555897tagArea;
      }
      
      public function set tagArea(param1:Group) : void
      {
         var _loc2_:Object = this._1549555897tagArea;
         if(_loc2_ !== param1)
         {
            this._1549555897tagArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagList() : TileGroup
      {
         return this._1549236392tagList;
      }
      
      public function set tagList(param1:TileGroup) : void
      {
         var _loc2_:Object = this._1549236392tagList;
         if(_loc2_ !== param1)
         {
            this._1549236392tagList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get youtubeArea() : Group
      {
         return this._77453744youtubeArea;
      }
      
      public function set youtubeArea(param1:Group) : void
      {
         var _loc2_:Object = this._77453744youtubeArea;
         if(_loc2_ !== param1)
         {
            this._77453744youtubeArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"youtubeArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get youtubePlayButton() : ImageButton
      {
         return this._1028972791youtubePlayButton;
      }
      
      public function set youtubePlayButton(param1:ImageButton) : void
      {
         var _loc2_:Object = this._1028972791youtubePlayButton;
         if(_loc2_ !== param1)
         {
            this._1028972791youtubePlayButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"youtubePlayButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get youtubePlayer() : UIComponent
      {
         return this._994800668youtubePlayer;
      }
      
      public function set youtubePlayer(param1:UIComponent) : void
      {
         var _loc2_:Object = this._994800668youtubePlayer;
         if(_loc2_ !== param1)
         {
            this._994800668youtubePlayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"youtubePlayer",_loc2_,param1));
            }
         }
      }
   }
}

