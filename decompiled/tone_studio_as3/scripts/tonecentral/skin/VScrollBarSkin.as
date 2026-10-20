package tonecentral.skin
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.VScrollBar;
   import spark.skins.SparkSkin;
   
   public class VScrollBarSkin extends SparkSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["track","thumb"];
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:VScrollBar;
      
      public function VScrollBarSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 15;
         this.minHeight = 35;
         this.mxmlContent = [this._VScrollBarSkin_Button1_i(),this._VScrollBarSkin_Button2_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"inactive",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"thumb",
               "name":"visible",
               "value":false
            })]
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _VScrollBarSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.percentHeight = 100;
         _loc1_.width = 10;
         _loc1_.right = 0;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.styleName = "vScrollBarTrack";
         _loc1_.setStyle("skinClass",VScrollBarTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _VScrollBarSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 1;
         _loc1_.width = 7;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.styleName = "vScrollBarThumb";
         _loc1_.setStyle("skinClass",VScrollBarThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : VScrollBar
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:VScrollBar) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

