package tonecentral.components.popup
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import mx.core.BitmapAsset;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import spark.components.Group;
   import spark.components.Label;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.ImageButton;
   import tonecentral.events.ToneCentralEvents;
   
   public class PlayerSlider extends Group
   {
      
      private static const THUMB_LEFT:int = 47;
      
      private static const SLIDER_LEFT:int = 56;
      
      private static const SLIDER_WIDTH:int = 310;
      
      private var repeatAImg:Class = PlayerSlider_repeatAImg;
      
      private var repeatBImg:Class = PlayerSlider_repeatBImg;
      
      private var sliderStartLabel:Label;
      
      private var sliderEndLabel:Label;
      
      private var repeatA:UIComponent;
      
      private var repeatB:UIComponent;
      
      private var _value:Number;
      
      private var _maxTime:Number = 0;
      
      private var _maximum:Number = 0;
      
      private var _minimum:Number = 0;
      
      private var interval:Number = 0;
      
      private var _repeatMode:String = "noRepeat";
      
      private var sliderRail:UIComponent;
      
      private var sliderProgress:UIComponent;
      
      private var sliderThumb:ImageButton;
      
      private var repeatALabel:TextField;
      
      private var repeatBLabel:TextField;
      
      private var _valueB:Number;
      
      private var _valueA:Number;
      
      public function PlayerSlider()
      {
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,this.onCreationComplete,false,0,true);
      }
      
      public function get repeatMode() : String
      {
         return this._repeatMode;
      }
      
      public function set repeatMode(param1:String) : void
      {
         this._repeatMode = param1;
         if(this._repeatMode == ToneCentralDefinition.ONE_REPEAT)
         {
            this.sliderThumb.enabled = false;
         }
         else
         {
            this.sliderThumb.enabled = true;
         }
      }
      
      public function get valueA() : Number
      {
         return this._valueA;
      }
      
      public function set valueA(param1:Number) : void
      {
         this._valueA = param1;
         this.repeatALabel.text = ToneCentralUtil.timeFormat(this._valueA);
      }
      
      public function get valueB() : Number
      {
         return this._valueB;
      }
      
      public function set valueB(param1:Number) : void
      {
         this._valueB = param1;
         this.repeatBLabel.text = ToneCentralUtil.timeFormat(this._valueB);
      }
      
      public function get maxTime() : Number
      {
         return this._maxTime;
      }
      
      public function set maxTime(param1:Number) : void
      {
         this._maxTime = param1;
         this.playTime = 0;
         if(this._maxTime > 0 && this._repeatMode != ToneCentralDefinition.ONE_REPEAT)
         {
            this.sliderThumb.enabled = true;
         }
      }
      
      public function get maximum() : Number
      {
         return this._maximum;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function set value(param1:Number) : void
      {
         if(param1 < 0)
         {
            return;
         }
         this._value = param1;
         this.setThumbPosition();
         this.playTime = param1;
      }
      
      private function setThumbPosition() : void
      {
         var _loc1_:Number = this.interval * this.value + THUMB_LEFT;
         this.sliderThumb.x = _loc1_;
         this.setProgress();
      }
      
      public function set playTime(param1:Number) : void
      {
         this.sliderStartLabel.text = ToneCentralUtil.timeFormat(param1);
         this.sliderEndLabel.text = "-" + ToneCentralUtil.timeFormat(this._maxTime - param1);
         this.repeatALabel.text = "00:00";
         this.repeatBLabel.text = ToneCentralUtil.timeFormat(param1);
         this.repeatA.x = 56;
         this.repeatB.x = SLIDER_LEFT + SLIDER_WIDTH - 35;
      }
      
      public function set maximum(param1:Number) : void
      {
         this._maximum = param1;
         this.interval = SLIDER_WIDTH / this._maximum;
      }
      
      private function onCreationComplete(param1:FlexEvent) : void
      {
         this.sliderStartLabel = new Label();
         this.sliderStartLabel.width = 35;
         this.sliderStartLabel.y = 0;
         this.sliderStartLabel.x = 10;
         this.sliderStartLabel.styleName = "recSliderTimeStart";
         this.sliderStartLabel.text = "0:00";
         addElement(this.sliderStartLabel);
         this.sliderEndLabel = new Label();
         this.sliderEndLabel.width = 35;
         this.sliderEndLabel.x = 383;
         this.sliderEndLabel.y = 0;
         this.sliderEndLabel.styleName = "recSliderTimeEnd";
         this.sliderEndLabel.text = "0:00";
         addElement(this.sliderEndLabel);
         this.sliderRail = new UIComponent();
         this.sliderRail.x = 55;
         this.sliderRail.width = 312;
         addElement(this.sliderRail);
         this.sliderProgress = new UIComponent();
         this.sliderProgress.x = SLIDER_LEFT;
         this.sliderProgress.y = 1;
         this.sliderProgress.width = SLIDER_WIDTH;
         addElement(this.sliderProgress);
         this.repeatA = new UIComponent();
         this.drawBitmap(this.repeatA,this.repeatAImg);
         this.repeatA.x = SLIDER_LEFT;
         this.repeatA.y = 0;
         this.repeatA.visible = false;
         this.repeatA.addEventListener(MouseEvent.MOUSE_DOWN,this.repeatAMouseDownHandler,false,0,true);
         addElement(this.repeatA);
         this.repeatALabel = new TextField();
         this.repeatALabel.defaultTextFormat = new TextFormat("Helvetica67-CondensedMedium",12,16777215);
         this.repeatALabel.text = "00:00";
         this.repeatALabel.x = 3;
         this.repeatALabel.y = 17;
         this.repeatALabel.selectable = false;
         this.repeatA.addChild(this.repeatALabel);
         this.repeatB = new UIComponent();
         this.drawBitmap(this.repeatB,this.repeatBImg);
         this.repeatB.x = 330;
         this.repeatB.y = 0;
         this.repeatB.visible = false;
         this.repeatB.addEventListener(MouseEvent.MOUSE_DOWN,this.repeatBMouseDownHandler,false,0,true);
         addElement(this.repeatB);
         this.repeatBLabel = new TextField();
         this.repeatBLabel.defaultTextFormat = new TextFormat("Helvetica67-CondensedMedium",12,16777215);
         this.repeatBLabel.text = "00:00";
         this.repeatBLabel.x = 3;
         this.repeatBLabel.y = 17;
         this.repeatBLabel.selectable = false;
         this.repeatB.addChild(this.repeatBLabel);
         this.sliderThumb = new ImageButton();
         this.sliderThumb.styleName = "playerSliderThumb";
         this.sliderThumb.height = 18;
         this.sliderThumb.width = 18;
         this.sliderThumb.y = -3;
         this.sliderThumb.x = THUMB_LEFT;
         this.sliderThumb.enabled = false;
         this.sliderThumb.addEventListener(MouseEvent.MOUSE_DOWN,this.thumbMouseDownHandler,false,0,true);
         addElement(this.sliderThumb);
         this.drawSliderRail();
      }
      
      private function repeatAMouseDownHandler(param1:MouseEvent) : void
      {
         this.repeatA.removeEventListener(MouseEvent.MOUSE_DOWN,this.repeatAMouseDownHandler);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.repeatAMouseUpHandler,false,0,true);
         this.repeatA.addEventListener(Event.ENTER_FRAME,this.repeatADragMouseMoveHandler,false,0,true);
         var _loc2_:Number = this.repeatB.x + SLIDER_LEFT - 35;
         this.repeatA.startDrag(false,new Rectangle(SLIDER_LEFT,0,_loc2_,0));
      }
      
      private function repeatAMouseUpHandler(param1:MouseEvent) : void
      {
         this.repeatA.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.repeatAMouseUpHandler);
         this.repeatA.removeEventListener(Event.ENTER_FRAME,this.repeatADragMouseMoveHandler);
         this.repeatA.addEventListener(MouseEvent.MOUSE_DOWN,this.repeatAMouseDownHandler,false,0,true);
      }
      
      private function repeatADragMouseMoveHandler(param1:Event) : void
      {
         this._valueA = (this.repeatA.x - 56) / this.interval;
         this.repeatALabel.text = ToneCentralUtil.timeFormat(int(this._valueA));
      }
      
      private function repeatBMouseDownHandler(param1:MouseEvent) : void
      {
         this.repeatB.removeEventListener(MouseEvent.MOUSE_DOWN,this.repeatBMouseDownHandler);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.repeatBMouseUpHandler,false,0,true);
         this.repeatB.addEventListener(Event.ENTER_FRAME,this.repeatBDragMouseMoveHandler,false,0,true);
         var _loc2_:Number = SLIDER_WIDTH - this.repeatA.x + 35;
         this.repeatB.startDrag(false,new Rectangle(this.repeatA.x - 35,0,_loc2_,0));
      }
      
      private function repeatBMouseUpHandler(param1:MouseEvent) : void
      {
         this.repeatB.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.repeatBMouseUpHandler);
         this.repeatB.removeEventListener(Event.ENTER_FRAME,this.repeatBDragMouseMoveHandler);
         this.repeatB.addEventListener(MouseEvent.MOUSE_DOWN,this.repeatBMouseDownHandler,false,0,true);
      }
      
      private function repeatBDragMouseMoveHandler(param1:Event) : void
      {
         this._valueB = (this.repeatB.x - 21) / this.interval;
         this.repeatBLabel.text = ToneCentralUtil.timeFormat(int(this._valueB));
      }
      
      private function thumbMouseDownHandler(param1:MouseEvent) : void
      {
         if(this._maximum == 0)
         {
            return;
         }
         this.sliderThumb.removeEventListener(MouseEvent.MOUSE_DOWN,this.thumbMouseDownHandler);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.thumbMouseUpHandler,false,0,true);
         this.sliderThumb.addEventListener(Event.ENTER_FRAME,this.thumbDragMouseMoveHandler,false,0,true);
         this.sliderThumb.startDrag(false,new Rectangle(47,-3,SLIDER_WIDTH,0));
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.START_DRAG));
      }
      
      private function thumbDragMouseMoveHandler(param1:Event) : void
      {
         this.setProgress();
         var _loc2_:Number = this.sliderThumb.x - this.sliderProgress.x + this.sliderThumb.width / 2;
         var _loc3_:Number = _loc2_ / SLIDER_WIDTH * this._maximum;
         this.sliderStartLabel.text = ToneCentralUtil.timeFormat(_loc3_);
         this.sliderEndLabel.text = "-" + ToneCentralUtil.timeFormat(this._maximum - _loc3_);
         this._value = _loc3_;
      }
      
      private function setProgress() : void
      {
         var _loc1_:Number = this.sliderThumb.x - this.sliderProgress.x + this.sliderThumb.width / 2;
         this.drawSliderProgress(_loc1_);
      }
      
      private function thumbMouseUpHandler(param1:MouseEvent) : void
      {
         this.sliderThumb.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.thumbMouseUpHandler);
         this.sliderThumb.removeEventListener(Event.ENTER_FRAME,this.thumbDragMouseMoveHandler);
         this.sliderThumb.addEventListener(MouseEvent.MOUSE_DOWN,this.thumbMouseDownHandler,false,0,true);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.STOP_DRAG));
      }
      
      private function drawBitmap(param1:UIComponent, param2:Class) : void
      {
         var _loc3_:BitmapAsset = new param2();
         var _loc4_:Graphics = param1.graphics;
         _loc4_.clear();
         _loc4_.beginBitmapFill(_loc3_.bitmapData,null,false);
         _loc4_.drawRect(0,0,_loc3_.bitmapData.width,_loc3_.bitmapData.height);
         _loc4_.endFill();
      }
      
      private function drawSliderRail() : void
      {
         var _loc1_:Graphics = this.sliderRail.graphics;
         _loc1_.beginFill(2960685);
         _loc1_.lineStyle(1,5526612);
         _loc1_.drawRoundRect(0,0.5,312,9,9,9);
         _loc1_.endFill();
      }
      
      private function drawSliderProgress(param1:Number) : void
      {
         var _loc2_:Graphics = this.sliderProgress.graphics;
         _loc2_.clear();
         _loc2_.beginFill(10480127);
         _loc2_.lineStyle(1,0);
         _loc2_.drawRoundRect(0,0.5,param1,7,7,7);
         _loc2_.endFill();
      }
      
      public function reset() : void
      {
         this.sliderProgress.graphics.clear();
         this.sliderEndLabel.text = "00:00";
         this.sliderStartLabel.text = "00:00";
         this.sliderThumb.enabled = false;
         this.sliderThumb.x = THUMB_LEFT;
      }
   }
}

