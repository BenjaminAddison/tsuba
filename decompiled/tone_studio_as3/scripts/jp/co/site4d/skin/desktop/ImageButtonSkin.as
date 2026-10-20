package jp.co.site4d.skin.desktop
{
   import flash.events.Event;
   import jp.co.site4d.events.ComponentEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.events.StateChangeEvent;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkButtonSkin;
   
   public class ImageButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private var _1779941047buttonImage:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var upImage:Class;
      
      private var overImage:Class;
      
      private var downImage:Class;
      
      private var disabledImage:Class;
      
      public function ImageButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._ImageButtonSkin_BitmapImage1_i()];
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
      }
      
      private function styleChangeHandler(param1:Event) : void
      {
         this.upImage = hostComponent.getStyle("upImage");
         this.overImage = hostComponent.getStyle("overImage");
         this.downImage = hostComponent.getStyle("downImage");
         this.disabledImage = hostComponent.getStyle("disabledImage");
         this.stateChangeHandler(null);
      }
      
      private function _ImageButtonSkin_BitmapImage1_i() : BitmapImage
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
   }
}

