package tonecentral.skin
{
   import flash.events.Event;
   import jp.co.site4d.events.ComponentEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.events.StateChangeEvent;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkButtonSkin;
   
   public class ImageLabelButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private var _1779941047buttonImage:BitmapImage;
      
      private var _1777527070buttonLabel:Label;
      
      private var _887523944symbol:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var upImage:Class;
      
      private var overImage:Class;
      
      private var downImage:Class;
      
      private var disabledImage:Class;
      
      private var btnLabel:Label = new Label();
      
      public function ImageLabelButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._ImageLabelButtonSkin_Group1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
         })];
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
      
      override protected function childrenCreated() : void
      {
         this.upImage = hostComponent.getStyle("upImage");
         this.overImage = hostComponent.getStyle("overImage");
         this.downImage = hostComponent.getStyle("downImage");
         this.disabledImage = hostComponent.getStyle("disabledImage");
         this.buttonLabel.styleName = hostComponent.getStyle("labelStyle");
         this.buttonLabel.text = hostComponent.label;
         addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.stateChangeHandler,false,0,true);
         hostComponent.addEventListener(ComponentEvent.STYLE_CHANGE,this.styleChangeHandler,false,0,true);
      }
      
      private function stateChangeHandler(param1:StateChangeEvent) : void
      {
         this.alpha = 1;
         this.buttonImage.source = this.upImage;
         if(currentState == "over")
         {
            this.buttonImage.source = this.overImage;
         }
         else if(currentState == "down")
         {
            this.buttonImage.source = this.downImage;
         }
         else if(currentState == "disabled")
         {
            if(this.disabledImage)
            {
               this.buttonImage.source = this.disabledImage;
            }
            else
            {
               this.alpha = 0.5;
            }
         }
         else
         {
            this.buttonImage.source = this.upImage;
         }
      }
      
      private function styleChangeHandler(param1:Event) : void
      {
         this.upImage = hostComponent.getStyle("upImage");
         this.overImage = hostComponent.getStyle("overImage");
         this.downImage = hostComponent.getStyle("downImage");
         this.disabledImage = hostComponent.getStyle("disabledImage");
         this.buttonLabel.styleName = hostComponent.getStyle("labelStyle");
         this.stateChangeHandler(null);
      }
      
      override protected function contentChangeHandler(param1:Event) : void
      {
         super.contentChangeHandler(param1);
         this.buttonLabel.text = hostComponent.label;
      }
      
      private function _ImageLabelButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ImageLabelButtonSkin_BitmapImage1_i(),this._ImageLabelButtonSkin_Label1_i()];
         _loc1_.id = "symbol";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.symbol = _loc1_;
         BindingManager.executeBindings(this,"symbol",this.symbol);
         return _loc1_;
      }
      
      private function _ImageLabelButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"buttonImage");
         this.buttonImage = _loc1_;
         BindingManager.executeBindings(this,"buttonImage",this.buttonImage);
         return _loc1_;
      }
      
      private function _ImageLabelButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "buttonLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonLabel = _loc1_;
         BindingManager.executeBindings(this,"buttonLabel",this.buttonLabel);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonImage() : BitmapImage
      {
         return this._1779941047buttonImage;
      }
      
      public function set buttonImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1779941047buttonImage;
         if(_loc2_ !== param1)
         {
            this._1779941047buttonImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonLabel() : Label
      {
         return this._1777527070buttonLabel;
      }
      
      public function set buttonLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1777527070buttonLabel;
         if(_loc2_ !== param1)
         {
            this._1777527070buttonLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get symbol() : Group
      {
         return this._887523944symbol;
      }
      
      public function set symbol(param1:Group) : void
      {
         var _loc2_:Object = this._887523944symbol;
         if(_loc2_ !== param1)
         {
            this._887523944symbol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"symbol",_loc2_,param1));
            }
         }
      }
   }
}

