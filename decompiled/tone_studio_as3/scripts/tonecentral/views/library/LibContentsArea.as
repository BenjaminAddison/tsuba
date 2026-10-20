package tonecentral.views.library
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Scroller;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.common.data.PatchData;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.components.ImageLabelToggleButton;
   import tonecentral.skin.ScrollerSkin;
   
   public class LibContentsArea extends Group
   {
      
      private var _522405370applyLivesetButton:ImageLabelButton;
      
      private var _476794988backupButton:ImageLabelButton;
      
      private var _73978485dragScrollAreaLeft:UIComponent;
      
      private var _1995973266dragScrollAreaRight:UIComponent;
      
      private var _1342730234exportButton:ImageLabelButton;
      
      private var _1115258990headerbg:BitmapImage;
      
      private var _1774127716hideMemo:ImageLabelToggleButton;
      
      private var _1760196407importButton:ImageLabelButton;
      
      private var _1501580621liveSetListContainer:HGroup;
      
      private var _352266734liveSetListScroller:Scroller;
      
      private var _1018044111liveSetListScrollerGroup:Group;
      
      private var _103149406logic:LibContentsAreaLogic;
      
      private var _1081408270newButton:ImageLabelButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bg_head_png_953662464:Class = LibContentsArea__embed_mxml___assets_images_bg_head_png_953662464;
      
      public function LibContentsArea()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._LibContentsArea_BitmapImage1_i(),this._LibContentsArea_Rect1_c(),this._LibContentsArea_Line1_c(),this._LibContentsArea_ImageLabelButton1_i(),this._LibContentsArea_ImageLabelButton2_i(),this._LibContentsArea_ImageLabelButton3_i(),this._LibContentsArea_ImageLabelButton4_i(),this._LibContentsArea_ImageLabelButton5_i(),this._LibContentsArea_ImageLabelToggleButton1_i(),this._LibContentsArea_Scroller1_i(),this._LibContentsArea_UIComponent1_i(),this._LibContentsArea_UIComponent2_i()];
         this._LibContentsArea_LibContentsAreaLogic1_i();
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
      
      public function resetSelected() : void
      {
         this.logic.resetSelected();
      }
      
      public function patchCopy() : Vector.<PatchData>
      {
         return this.logic.patchCopy();
      }
      
      public function patchPaste(param1:Vector.<PatchData>, param2:String) : void
      {
         this.logic.patchPaste(param1,param2);
      }
      
      public function sidePatchDragComlete() : void
      {
         this.logic.sidePatchDragComplete();
      }
      
      public function copyAllPatches() : Vector.<PatchData>
      {
         return this.logic.copyAllPatches();
      }
      
      public function sidePatchDragStart() : void
      {
         this.logic.sidePatchDragStart();
      }
      
      public function setPrevSelected() : void
      {
         this.logic.setPrevSelected();
      }
      
      private function _LibContentsArea_LibContentsAreaLogic1_i() : LibContentsAreaLogic
      {
         var _loc1_:LibContentsAreaLogic = new LibContentsAreaLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LibContentsArea_BitmapImage1_i() : BitmapImage
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
      
      private function _LibContentsArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.y = 40;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LibContentsArea_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibContentsArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6776679;
         return _loc1_;
      }
      
      private function _LibContentsArea_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.x = 0;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._LibContentsArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LibContentsArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _LibContentsArea_ImageLabelButton1_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Create Liveset";
         _loc1_.x = 20;
         _loc1_.y = 8;
         _loc1_.width = 110;
         _loc1_.height = 25;
         _loc1_.styleName = "update";
         _loc1_.id = "newButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newButton = _loc1_;
         BindingManager.executeBindings(this,"newButton",this.newButton);
         return _loc1_;
      }
      
      private function _LibContentsArea_ImageLabelButton2_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Export";
         _loc1_.x = 140;
         _loc1_.y = 8;
         _loc1_.width = 110;
         _loc1_.height = 25;
         _loc1_.styleName = "update";
         _loc1_.id = "exportButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.exportButton = _loc1_;
         BindingManager.executeBindings(this,"exportButton",this.exportButton);
         return _loc1_;
      }
      
      private function _LibContentsArea_ImageLabelButton3_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Import";
         _loc1_.x = 260;
         _loc1_.y = 8;
         _loc1_.width = 110;
         _loc1_.height = 25;
         _loc1_.styleName = "update";
         _loc1_.id = "importButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.importButton = _loc1_;
         BindingManager.executeBindings(this,"importButton",this.importButton);
         return _loc1_;
      }
      
      private function _LibContentsArea_ImageLabelButton4_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Backup";
         _loc1_.x = 380;
         _loc1_.y = 8;
         _loc1_.width = 110;
         _loc1_.height = 25;
         _loc1_.styleName = "update";
         _loc1_.enabled = false;
         _loc1_.id = "backupButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backupButton = _loc1_;
         BindingManager.executeBindings(this,"backupButton",this.backupButton);
         return _loc1_;
      }
      
      private function _LibContentsArea_ImageLabelButton5_i() : ImageLabelButton
      {
         var _loc1_:ImageLabelButton = new ImageLabelButton();
         _loc1_.label = "Apply Liveset ";
         _loc1_.x = 500;
         _loc1_.y = 8;
         _loc1_.width = 110;
         _loc1_.height = 25;
         _loc1_.styleName = "update";
         _loc1_.enabled = false;
         _loc1_.id = "applyLivesetButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.applyLivesetButton = _loc1_;
         BindingManager.executeBindings(this,"applyLivesetButton",this.applyLivesetButton);
         return _loc1_;
      }
      
      private function _LibContentsArea_ImageLabelToggleButton1_i() : ImageLabelToggleButton
      {
         var _loc1_:ImageLabelToggleButton = new ImageLabelToggleButton();
         _loc1_.x = 620;
         _loc1_.y = 8;
         _loc1_.width = 110;
         _loc1_.height = 25;
         _loc1_.styleName = "memoHideButton";
         _loc1_.label = "Show Memo";
         _loc1_.selected = true;
         _loc1_.id = "hideMemo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hideMemo = _loc1_;
         BindingManager.executeBindings(this,"hideMemo",this.hideMemo);
         return _loc1_;
      }
      
      private function _LibContentsArea_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.x = 1;
         _loc1_.percentWidth = 100;
         _loc1_.top = 40;
         _loc1_.bottom = 0;
         _loc1_.viewport = this._LibContentsArea_Group2_i();
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.id = "liveSetListScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.liveSetListScroller = _loc1_;
         BindingManager.executeBindings(this,"liveSetListScroller",this.liveSetListScroller);
         return _loc1_;
      }
      
      private function _LibContentsArea_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._LibContentsArea_HGroup1_i()];
         _loc1_.id = "liveSetListScrollerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.liveSetListScrollerGroup = _loc1_;
         BindingManager.executeBindings(this,"liveSetListScrollerGroup",this.liveSetListScrollerGroup);
         return _loc1_;
      }
      
      private function _LibContentsArea_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.id = "liveSetListContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.liveSetListContainer = _loc1_;
         BindingManager.executeBindings(this,"liveSetListContainer",this.liveSetListContainer);
         return _loc1_;
      }
      
      private function _LibContentsArea_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentHeight = 100;
         _loc1_.width = 50;
         _loc1_.right = 0;
         _loc1_.visible = false;
         _loc1_.id = "dragScrollAreaRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragScrollAreaRight = _loc1_;
         BindingManager.executeBindings(this,"dragScrollAreaRight",this.dragScrollAreaRight);
         return _loc1_;
      }
      
      private function _LibContentsArea_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentHeight = 100;
         _loc1_.width = 50;
         _loc1_.x = 0;
         _loc1_.visible = false;
         _loc1_.id = "dragScrollAreaLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragScrollAreaLeft = _loc1_;
         BindingManager.executeBindings(this,"dragScrollAreaLeft",this.dragScrollAreaLeft);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get applyLivesetButton() : ImageLabelButton
      {
         return this._522405370applyLivesetButton;
      }
      
      public function set applyLivesetButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._522405370applyLivesetButton;
         if(_loc2_ !== param1)
         {
            this._522405370applyLivesetButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"applyLivesetButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backupButton() : ImageLabelButton
      {
         return this._476794988backupButton;
      }
      
      public function set backupButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._476794988backupButton;
         if(_loc2_ !== param1)
         {
            this._476794988backupButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backupButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragScrollAreaLeft() : UIComponent
      {
         return this._73978485dragScrollAreaLeft;
      }
      
      public function set dragScrollAreaLeft(param1:UIComponent) : void
      {
         var _loc2_:Object = this._73978485dragScrollAreaLeft;
         if(_loc2_ !== param1)
         {
            this._73978485dragScrollAreaLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragScrollAreaLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragScrollAreaRight() : UIComponent
      {
         return this._1995973266dragScrollAreaRight;
      }
      
      public function set dragScrollAreaRight(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1995973266dragScrollAreaRight;
         if(_loc2_ !== param1)
         {
            this._1995973266dragScrollAreaRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragScrollAreaRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get exportButton() : ImageLabelButton
      {
         return this._1342730234exportButton;
      }
      
      public function set exportButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1342730234exportButton;
         if(_loc2_ !== param1)
         {
            this._1342730234exportButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"exportButton",_loc2_,param1));
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
      public function get hideMemo() : ImageLabelToggleButton
      {
         return this._1774127716hideMemo;
      }
      
      public function set hideMemo(param1:ImageLabelToggleButton) : void
      {
         var _loc2_:Object = this._1774127716hideMemo;
         if(_loc2_ !== param1)
         {
            this._1774127716hideMemo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hideMemo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get importButton() : ImageLabelButton
      {
         return this._1760196407importButton;
      }
      
      public function set importButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1760196407importButton;
         if(_loc2_ !== param1)
         {
            this._1760196407importButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"importButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get liveSetListContainer() : HGroup
      {
         return this._1501580621liveSetListContainer;
      }
      
      public function set liveSetListContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1501580621liveSetListContainer;
         if(_loc2_ !== param1)
         {
            this._1501580621liveSetListContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"liveSetListContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get liveSetListScroller() : Scroller
      {
         return this._352266734liveSetListScroller;
      }
      
      public function set liveSetListScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._352266734liveSetListScroller;
         if(_loc2_ !== param1)
         {
            this._352266734liveSetListScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"liveSetListScroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get liveSetListScrollerGroup() : Group
      {
         return this._1018044111liveSetListScrollerGroup;
      }
      
      public function set liveSetListScrollerGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1018044111liveSetListScrollerGroup;
         if(_loc2_ !== param1)
         {
            this._1018044111liveSetListScrollerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"liveSetListScrollerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : LibContentsAreaLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LibContentsAreaLogic) : void
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
      public function get newButton() : ImageLabelButton
      {
         return this._1081408270newButton;
      }
      
      public function set newButton(param1:ImageLabelButton) : void
      {
         var _loc2_:Object = this._1081408270newButton;
         if(_loc2_ !== param1)
         {
            this._1081408270newButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newButton",_loc2_,param1));
            }
         }
      }
   }
}

