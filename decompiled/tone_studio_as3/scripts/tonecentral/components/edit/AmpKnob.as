package tonecentral.components.edit
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.BitmapAsset;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import spark.components.Group;
   import tonecentral.events.ToneCentralEvents;
   
   public class AmpKnob extends AbstractKnob
   {
      
      private static const WIDTH:Number = 78;
      
      private static const HEIGHT:Number = 104;
      
      private var bgiKnob:Class = AmpKnob_bgiKnob;
      
      private var knobImage:Class = AmpKnob_knobImage;
      
      private var knobBgImage:Class = AmpKnob_knobBgImage;
      
      private var knobBgi:DisplayObject;
      
      private var knobBgBgi:UIComponent;
      
      private var knobBase:DisplayObject;
      
      private var knob:UIComponent;
      
      private var memori:UIComponent;
      
      private var rotateGroup:Group;
      
      public var maxAngle:int = 320;
      
      public var offsetAngle:int = 0;
      
      public var dragRate:Number = 1;
      
      private var deltaSum:Number = 0;
      
      private var prevY:int;
      
      public function AmpKnob()
      {
         super();
         this.width = WIDTH;
         this.height = HEIGHT;
         this.buttonMode = true;
         addEventListener(FlexEvent.CREATION_COMPLETE,this.onComplete,false,0,true);
      }
      
      private function onComplete(param1:FlexEvent) : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,false,0,true);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseWheelHandler,false,0,true);
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         if(!_selected)
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.WHEEL_START));
         }
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.KNOB_DRAG);
         this.deltaSum += param1.delta * this.dragRate;
         if(Math.abs(this.deltaSum) >= 1)
         {
            _loc2_.data = int(this.deltaSum);
            dispatchEvent(_loc2_);
            this.deltaSum = 0;
         }
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         this.prevY = stage.mouseY;
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,false,0,true);
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.START_DRAG));
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         var _loc3_:ToneCentralEvents = null;
         var _loc2_:Number = this.prevY - stage.mouseY;
         this.prevY = stage.mouseY;
         this.deltaSum += _loc2_ * this.dragRate;
         if(Math.abs(this.deltaSum) >= 1)
         {
            _loc3_ = new ToneCentralEvents(ToneCentralEvents.KNOB_DRAG);
            _loc3_.data = int(this.deltaSum);
            dispatchEvent(_loc3_);
            this.deltaSum = 0;
         }
      }
      
      override protected function drawKnob() : void
      {
         this.knobBgBgi = new UIComponent();
         this.knobBase = new this.knobBgImage();
         this.knobBase.x = 12.5 + 37 / 2;
         this.knobBase.y = 24 + 37 / 2;
         this.knobBgBgi.addChild(this.knobBase);
         addElement(this.knobBgBgi);
         this.rotateGroup = new Group();
         this.rotateGroup.x = 12.5 + 37 / 2;
         this.rotateGroup.y = 22 + 37 / 2;
         addElement(this.rotateGroup);
         this.knobBgi = new this.knobImage();
         this.knob = new UIComponent();
         this.knob.addChild(this.knobBgi);
         this.rotateGroup.addElement(this.knob);
         var _loc1_:BitmapAsset = new this.bgiKnob();
         this.memori = new UIComponent();
         this.memori.x = 15;
         this.memori.y = 62;
         addElement(this.memori);
         this.memori.graphics.beginBitmapFill(_loc1_.bitmapData);
         this.memori.graphics.drawRect(0,0,_loc1_.width,_loc1_.height);
         this.memori.graphics.endFill();
         if(parameterMin < 0)
         {
            this.knobRotation({
               "max":parameterMax - parameterMin,
               "min":0,
               "val":this.parameterVal
            });
         }
         else
         {
            this.knobRotation({
               "max":parameterMax,
               "min":parameterMin,
               "val":this.parameterVal
            });
         }
      }
      
      override public function knobRotation(param1:Object) : void
      {
         if(!knobEnabled)
         {
            return;
         }
         parameterMax = param1.max;
         parameterMin = param1.min;
         _parameterVal = param1.val;
         _data.val = param1.val;
         this.doRotate();
      }
      
      private function doRotate() : void
      {
         var _loc1_:Number = NaN;
         if(!this.rotateGroup || !knobEnabled)
         {
            return;
         }
         if(parameterMin < 0)
         {
            _loc1_ = this.maxAngle * (this.parameterVal / (parameterMax - parameterMin)) - this.maxAngle / 2 + this.offsetAngle;
         }
         else
         {
            _loc1_ = this.maxAngle * ((this.parameterVal - parameterMin) / (parameterMax - parameterMin)) - this.maxAngle / 2 + this.offsetAngle;
         }
         this.rotateGroup.rotation = _loc1_;
      }
      
      public function get parameterVal() : Number
      {
         return _parameterVal;
      }
      
      override public function set parameterVal(param1:Number) : void
      {
         super.parameterVal = param1;
         this.doRotate();
      }
      
      public function set showMemori(param1:Boolean) : void
      {
         this.memori.visible = param1;
      }
   }
}

