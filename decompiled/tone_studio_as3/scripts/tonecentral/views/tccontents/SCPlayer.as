package tonecentral.views.tccontents
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import tonecentral.components.ImageButton;
   
   public class SCPlayer extends Group
   {
      
      private var _1607243192endTime:Label;
      
      private var _103149406logic:SCPlayerLogic;
      
      private var _1097557894playButton:ImageButton;
      
      private var _962286277playIndicator:UIComponent;
      
      private var _1878759457playTime:Label;
      
      private var _2129294769startTime:Label;
      
      private var _1834774060stopButton:ImageButton;
      
      private var _729577609trackList:SCTrackList;
      
      private var _2081240632trackWaveForm:BitmapImage;
      
      private var _1887928549waveBgColor:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SCPlayer()
      {
         super();
         mx_internal::_document = this;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._SCPlayer_Rect1_c(),this._SCPlayer_Rect2_c(),this._SCPlayer_Rect3_c(),this._SCPlayer_BitmapImage1_i(),this._SCPlayer_UIComponent1_i(),this._SCPlayer_Label1_i(),this._SCPlayer_Label2_i(),this._SCPlayer_Label3_i(),this._SCPlayer_ImageButton1_i(),this._SCPlayer_ImageButton2_i(),this._SCPlayer_SCTrackList1_i(),this._SCPlayer_Line1_c()];
         this._SCPlayer_SCPlayerLogic1_i();
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
      
      public function set url(param1:String) : void
      {
         this.logic.url = param1;
      }
      
      private function _SCPlayer_SCPlayerLogic1_i() : SCPlayerLogic
      {
         var _loc1_:SCPlayerLogic = new SCPlayerLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _SCPlayer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._SCPlayer_SolidColor1_c();
         _loc1_.stroke = this._SCPlayer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SCPlayer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4013373;
         return _loc1_;
      }
      
      private function _SCPlayer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _SCPlayer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 20;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._SCPlayer_SolidColor2_c();
         _loc1_.stroke = this._SCPlayer_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SCPlayer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _SCPlayer_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2234390;
         return _loc1_;
      }
      
      private function _SCPlayer_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.y = 10;
         _loc1_.left = 120;
         _loc1_.right = 15;
         _loc1_.height = 50;
         _loc1_.fill = this._SCPlayer_SolidColor3_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SCPlayer_SolidColor3_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.waveBgColor = _loc1_;
         BindingManager.executeBindings(this,"waveBgColor",this.waveBgColor);
         return _loc1_;
      }
      
      private function _SCPlayer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.y = 10;
         _loc1_.left = 120;
         _loc1_.right = 15;
         _loc1_.height = 50;
         _loc1_.scaleMode = "stretch";
         _loc1_.initialized(this,"trackWaveForm");
         this.trackWaveForm = _loc1_;
         BindingManager.executeBindings(this,"trackWaveForm",this.trackWaveForm);
         return _loc1_;
      }
      
      private function _SCPlayer_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.y = 10;
         _loc1_.left = 120;
         _loc1_.right = 15;
         _loc1_.height = 50;
         _loc1_.id = "playIndicator";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playIndicator = _loc1_;
         BindingManager.executeBindings(this,"playIndicator",this.playIndicator);
         return _loc1_;
      }
      
      private function _SCPlayer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 65;
         _loc1_.width = 40;
         _loc1_.x = 100;
         _loc1_.text = "00:00";
         _loc1_.styleName = "playerTime";
         _loc1_.id = "startTime";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startTime = _loc1_;
         BindingManager.executeBindings(this,"startTime",this.startTime);
         return _loc1_;
      }
      
      private function _SCPlayer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 65;
         _loc1_.width = 40;
         _loc1_.text = "00:00";
         _loc1_.styleName = "playerTime";
         _loc1_.id = "playTime";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playTime = _loc1_;
         BindingManager.executeBindings(this,"playTime",this.playTime);
         return _loc1_;
      }
      
      private function _SCPlayer_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 65;
         _loc1_.width = 40;
         _loc1_.right = -5;
         _loc1_.text = "00:00";
         _loc1_.styleName = "playerTime";
         _loc1_.id = "endTime";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endTime = _loc1_;
         BindingManager.executeBindings(this,"endTime",this.endTime);
         return _loc1_;
      }
      
      private function _SCPlayer_ImageButton1_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.x = 10;
         _loc1_.y = 10;
         _loc1_.styleName = "playButton";
         _loc1_.buttonMode = true;
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
         return _loc1_;
      }
      
      private function _SCPlayer_ImageButton2_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.x = 60;
         _loc1_.y = 10;
         _loc1_.styleName = "stopButton";
         _loc1_.buttonMode = true;
         _loc1_.id = "stopButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stopButton = _loc1_;
         BindingManager.executeBindings(this,"stopButton",this.stopButton);
         return _loc1_;
      }
      
      private function _SCPlayer_SCTrackList1_i() : SCTrackList
      {
         var _loc1_:SCTrackList = new SCTrackList();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.y = 80;
         _loc1_.id = "trackList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.trackList = _loc1_;
         BindingManager.executeBindings(this,"trackList",this.trackList);
         return _loc1_;
      }
      
      private function _SCPlayer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 79.5;
         _loc1_.stroke = this._SCPlayer_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SCPlayer_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get endTime() : Label
      {
         return this._1607243192endTime;
      }
      
      public function set endTime(param1:Label) : void
      {
         var _loc2_:Object = this._1607243192endTime;
         if(_loc2_ !== param1)
         {
            this._1607243192endTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : SCPlayerLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:SCPlayerLogic) : void
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
      public function get playButton() : ImageButton
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:ImageButton) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playIndicator() : UIComponent
      {
         return this._962286277playIndicator;
      }
      
      public function set playIndicator(param1:UIComponent) : void
      {
         var _loc2_:Object = this._962286277playIndicator;
         if(_loc2_ !== param1)
         {
            this._962286277playIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playTime() : Label
      {
         return this._1878759457playTime;
      }
      
      public function set playTime(param1:Label) : void
      {
         var _loc2_:Object = this._1878759457playTime;
         if(_loc2_ !== param1)
         {
            this._1878759457playTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startTime() : Label
      {
         return this._2129294769startTime;
      }
      
      public function set startTime(param1:Label) : void
      {
         var _loc2_:Object = this._2129294769startTime;
         if(_loc2_ !== param1)
         {
            this._2129294769startTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stopButton() : ImageButton
      {
         return this._1834774060stopButton;
      }
      
      public function set stopButton(param1:ImageButton) : void
      {
         var _loc2_:Object = this._1834774060stopButton;
         if(_loc2_ !== param1)
         {
            this._1834774060stopButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stopButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trackList() : SCTrackList
      {
         return this._729577609trackList;
      }
      
      public function set trackList(param1:SCTrackList) : void
      {
         var _loc2_:Object = this._729577609trackList;
         if(_loc2_ !== param1)
         {
            this._729577609trackList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trackList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trackWaveForm() : BitmapImage
      {
         return this._2081240632trackWaveForm;
      }
      
      public function set trackWaveForm(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2081240632trackWaveForm;
         if(_loc2_ !== param1)
         {
            this._2081240632trackWaveForm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trackWaveForm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get waveBgColor() : SolidColor
      {
         return this._1887928549waveBgColor;
      }
      
      public function set waveBgColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1887928549waveBgColor;
         if(_loc2_ !== param1)
         {
            this._1887928549waveBgColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveBgColor",_loc2_,param1));
            }
         }
      }
   }
}

