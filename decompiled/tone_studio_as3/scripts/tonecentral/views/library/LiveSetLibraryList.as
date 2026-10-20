package tonecentral.views.library
{
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.common.data.LibraryDataSet;
   import tonecentral.common.data.PatchData;
   import tonecentral.itemrenderer.LibraryPatchItemRenderer;
   import tonecentral.skin.DropListSkin;
   
   public class LiveSetLibraryList extends Group
   {
      
      private var _3141bg:Rect;
      
      private var _204859874bgColor:SolidColor;
      
      private var _746556853captureImage:BitmapImage;
      
      private var _2097211673dragScrollAreaBottom:UIComponent;
      
      private var _2394407dragScrollAreaTop:UIComponent;
      
      private var _918820347dragShatter:UIComponent;
      
      private var _432782461dropLine:Line;
      
      private var _796979209liveSetItem:LibraryLiveSetItem;
      
      private var _103149406logic:LiveSetLibraryListLogic;
      
      private var _513613562patchList:PatchList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function LiveSetLibraryList()
      {
         super();
         mx_internal::_document = this;
         this.width = 221;
         this.percentHeight = 100;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._LiveSetLibraryList_Rect1_i(),this._LiveSetLibraryList_Line1_c(),this._LiveSetLibraryList_LibraryLiveSetItem1_i(),this._LiveSetLibraryList_PatchList1_i(),this._LiveSetLibraryList_UIComponent1_i(),this._LiveSetLibraryList_UIComponent2_i(),this._LiveSetLibraryList_BitmapImage1_i(),this._LiveSetLibraryList_UIComponent3_i(),this._LiveSetLibraryList_Line2_i()];
         this._LiveSetLibraryList_LiveSetLibraryListLogic1_i();
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
      
      public function set data(param1:LibraryDataSet) : void
      {
         this.logic.data = param1;
      }
      
      public function get data() : LibraryDataSet
      {
         return this.logic.data;
      }
      
      public function setSelect() : void
      {
         this.logic.setSelect();
      }
      
      public function resetSelected() : void
      {
         this.logic.resetSelected();
      }
      
      public function get isDroped() : Boolean
      {
         return this.logic.isDroped;
      }
      
      public function dragComplete() : void
      {
         this.logic.dragComplete();
      }
      
      public function copy() : Vector.<PatchData>
      {
         return this.logic.copy();
      }
      
      public function paste(param1:Vector.<PatchData>, param2:String) : void
      {
         this.logic.paste(param1,param2);
      }
      
      public function copyAllPatches() : Vector.<PatchData>
      {
         return this.logic.copyAllPatches();
      }
      
      public function addListener() : void
      {
         this.logic.addListener();
      }
      
      public function removeListener() : void
      {
         this.logic.removeListener();
      }
      
      public function setPrevSelected() : void
      {
         this.logic.setPrevSelected();
      }
      
      private function _LiveSetLibraryList_LiveSetLibraryListLogic1_i() : LiveSetLibraryListLogic
      {
         var _loc1_:LiveSetLibraryListLogic = new LiveSetLibraryListLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._LiveSetLibraryList_SolidColor1_i();
         _loc1_.initialized(this,"bg");
         this.bg = _loc1_;
         BindingManager.executeBindings(this,"bg",this.bg);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4276545;
         this.bgColor = _loc1_;
         BindingManager.executeBindings(this,"bgColor",this.bgColor);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._LiveSetLibraryList_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_LibraryLiveSetItem1_i() : LibraryLiveSetItem
      {
         var _loc1_:LibraryLiveSetItem = new LibraryLiveSetItem();
         _loc1_.id = "liveSetItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.liveSetItem = _loc1_;
         BindingManager.executeBindings(this,"liveSetItem",this.liveSetItem);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_PatchList1_i() : PatchList
      {
         var _loc1_:PatchList = new PatchList();
         _loc1_.y = 40;
         _loc1_.percentHeight = 100;
         _loc1_.width = 228;
         _loc1_.dragEnabled = true;
         _loc1_.dropEnabled = true;
         _loc1_.allowMultipleSelection = true;
         _loc1_.itemRenderer = this._LiveSetLibraryList_ClassFactory1_c();
         _loc1_.setStyle("skinClass",DropListSkin);
         _loc1_.setStyle("contentBackgroundAlpha",0);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("focusAlpha",0);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "patchList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.patchList = _loc1_;
         BindingManager.executeBindings(this,"patchList",this.patchList);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LibraryPatchItemRenderer;
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 50;
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
      
      private function _LiveSetLibraryList_UIComponent2_i() : UIComponent
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
      
      private function _LiveSetLibraryList_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.visible = false;
         _loc1_.initialized(this,"captureImage");
         this.captureImage = _loc1_;
         BindingManager.executeBindings(this,"captureImage",this.captureImage);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_UIComponent3_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "dragShatter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragShatter = _loc1_;
         BindingManager.executeBindings(this,"dragShatter",this.dragShatter);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.stroke = this._LiveSetLibraryList_SolidColorStroke2_c();
         _loc1_.initialized(this,"dropLine");
         this.dropLine = _loc1_;
         BindingManager.executeBindings(this,"dropLine",this.dropLine);
         return _loc1_;
      }
      
      private function _LiveSetLibraryList_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16711680;
         _loc1_.weight = 3;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bg() : Rect
      {
         return this._3141bg;
      }
      
      public function set bg(param1:Rect) : void
      {
         var _loc2_:Object = this._3141bg;
         if(_loc2_ !== param1)
         {
            this._3141bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bg",_loc2_,param1));
            }
         }
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
      public function get dragShatter() : UIComponent
      {
         return this._918820347dragShatter;
      }
      
      public function set dragShatter(param1:UIComponent) : void
      {
         var _loc2_:Object = this._918820347dragShatter;
         if(_loc2_ !== param1)
         {
            this._918820347dragShatter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragShatter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropLine() : Line
      {
         return this._432782461dropLine;
      }
      
      public function set dropLine(param1:Line) : void
      {
         var _loc2_:Object = this._432782461dropLine;
         if(_loc2_ !== param1)
         {
            this._432782461dropLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get liveSetItem() : LibraryLiveSetItem
      {
         return this._796979209liveSetItem;
      }
      
      public function set liveSetItem(param1:LibraryLiveSetItem) : void
      {
         var _loc2_:Object = this._796979209liveSetItem;
         if(_loc2_ !== param1)
         {
            this._796979209liveSetItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"liveSetItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : LiveSetLibraryListLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:LiveSetLibraryListLogic) : void
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
      public function get patchList() : PatchList
      {
         return this._513613562patchList;
      }
      
      public function set patchList(param1:PatchList) : void
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
   }
}

