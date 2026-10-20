package tonecentral.components.chain
{
   import jp.co.site4d.skin.desktop.ImageRadioButtonSkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.primitives.BitmapImage;
   import tonecentral.components.ImageLabelToggleButton;
   
   public class ChainSelectButton extends Group
   {
      
      private var _1017207851effectSw:ImageLabelToggleButton;
      
      private var _103149406logic:ChainSelectButtonLogic;
      
      private var _1040695581routingImg:BitmapImage;
      
      private var _2098037647routingName:Label;
      
      private var _1555143502selectButton:RadioButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ChainSelectButton()
      {
         super();
         mx_internal::_document = this;
         this.width = 830;
         this.height = 128;
         this.mxmlContent = [this._ChainSelectButton_RadioButton1_i(),this._ChainSelectButton_Label1_i(),this._ChainSelectButton_BitmapImage1_i(),this._ChainSelectButton_ImageLabelToggleButton1_i()];
         this._ChainSelectButton_ChainSelectButtonLogic1_i();
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
      
      public function set label(param1:String) : void
      {
         this.logic.label = param1;
      }
      
      public function set value(param1:String) : void
      {
         this.logic.value = param1;
      }
      
      public function get value() : String
      {
         return this.logic.value;
      }
      
      public function set radioButtonGroup(param1:RadioButtonGroup) : void
      {
         this.selectButton.group = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.logic.selected = param1;
      }
      
      public function changeSelect() : void
      {
         this.logic.changeSelect();
      }
      
      private function _ChainSelectButton_ChainSelectButtonLogic1_i() : ChainSelectButtonLogic
      {
         var _loc1_:ChainSelectButtonLogic = new ChainSelectButtonLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ChainSelectButton_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.styleName = "chainSelectDisp";
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ImageRadioButtonSkin);
         _loc1_.id = "selectButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectButton = _loc1_;
         BindingManager.executeBindings(this,"selectButton",this.selectButton);
         return _loc1_;
      }
      
      private function _ChainSelectButton_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 40;
         _loc1_.y = 13;
         _loc1_.styleName = "USBRoutingLabel";
         _loc1_.mouseEnabled = false;
         _loc1_.id = "routingName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.routingName = _loc1_;
         BindingManager.executeBindings(this,"routingName",this.routingName);
         return _loc1_;
      }
      
      private function _ChainSelectButton_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 20;
         _loc1_.initialized(this,"routingImg");
         this.routingImg = _loc1_;
         BindingManager.executeBindings(this,"routingImg",this.routingImg);
         return _loc1_;
      }
      
      private function _ChainSelectButton_ImageLabelToggleButton1_i() : ImageLabelToggleButton
      {
         var _loc1_:ImageLabelToggleButton = new ImageLabelToggleButton();
         _loc1_.styleName = "effectSw";
         _loc1_.x = 10;
         _loc1_.y = 10;
         _loc1_.width = 18;
         _loc1_.height = 18;
         _loc1_.buttonMode = true;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "effectSw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectSw = _loc1_;
         BindingManager.executeBindings(this,"effectSw",this.effectSw);
         return _loc1_;
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
      public function get logic() : ChainSelectButtonLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ChainSelectButtonLogic) : void
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
      public function get routingImg() : BitmapImage
      {
         return this._1040695581routingImg;
      }
      
      public function set routingImg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1040695581routingImg;
         if(_loc2_ !== param1)
         {
            this._1040695581routingImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"routingImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get routingName() : Label
      {
         return this._2098037647routingName;
      }
      
      public function set routingName(param1:Label) : void
      {
         var _loc2_:Object = this._2098037647routingName;
         if(_loc2_ !== param1)
         {
            this._2098037647routingName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"routingName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectButton() : RadioButton
      {
         return this._1555143502selectButton;
      }
      
      public function set selectButton(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1555143502selectButton;
         if(_loc2_ !== param1)
         {
            this._1555143502selectButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectButton",_loc2_,param1));
            }
         }
      }
   }
}

