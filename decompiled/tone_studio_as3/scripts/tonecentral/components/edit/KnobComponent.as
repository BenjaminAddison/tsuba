package tonecentral.components.edit
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.events.ToneCentralEvents;
   
   public class KnobComponent extends AbstractKnob
   {
      
      private static var selectedBackImage:Class = KnobComponent_selectedBackImage;
      
      private static const WIDTH:Number = 78;
      
      private static const HEIGHT:Number = 104;
      
      private var knobBgi:DisplayObject;
      
      private var knobBgBgi:BitmapImage;
      
      private var knobCenter:DisplayObject;
      
      private var center:UIComponent;
      
      private var backBgi:BitmapImage;
      
      private var point:UIComponent;
      
      private var knob:UIComponent;
      
      private var rotateGroup:Group;
      
      private var knobImage:Class = KnobComponent_knobImage;
      
      private var centerImage:Class = KnobComponent_centerImage;
      
      private var knobBgImage:Class = KnobComponent_knobBgImage;
      
      private var prevY:int;
      
      public function KnobComponent()
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
         _loc2_.data = param1.delta;
         dispatchEvent(_loc2_);
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
         var _loc2_:int = this.prevY - stage.mouseY;
         this.prevY = stage.mouseY;
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.KNOB_DRAG);
         _loc3_.data = _loc2_;
         dispatchEvent(_loc3_);
      }
      
      override protected function drawKnob() : void
      {
         parameterNameLabel = new Label();
         parameterNameLabel.width = WIDTH;
         parameterNameLabel.height = 33;
         parameterNameLabel.x = 0;
         parameterNameLabel.y = -13;
         parameterNameLabel.styleName = "parameterName";
         parameterNameLabel.setStyle("verticalAlign","middle");
         parameterNameLabel.text = parameterName;
         addElement(parameterNameLabel);
         this.backBgi = new BitmapImage();
         var _loc1_:Class = selectedBackImage;
         this.backBgi.source = new _loc1_();
         this.backBgi.width = WIDTH;
         this.backBgi.height = 86;
         this.backBgi.x = 0;
         this.backBgi.y = 23;
         this.backBgi.visible = false;
         addElement(this.backBgi);
         this.knobBgBgi = new BitmapImage();
         this.knobBgBgi.source = new this.knobBgImage();
         this.knobBgBgi.width = 60;
         this.knobBgBgi.height = 69;
         this.knobBgBgi.x = 9;
         this.knobBgBgi.y = 24;
         addElement(this.knobBgBgi);
         this.rotateGroup = new Group();
         this.rotateGroup.x = 12.5 + 53 / 2;
         this.rotateGroup.y = 24 + 58 / 2;
         addElement(this.rotateGroup);
         this.knobBgi = new this.knobImage();
         this.knob = new UIComponent();
         this.knob.width = 53;
         this.knob.height = 58;
         this.knob.addChild(this.knobBgi);
         this.rotateGroup.addElement(this.knob);
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
         this.knobCenter = new this.centerImage();
         this.center = new UIComponent();
         this.center.x = 12.5 + 53 / 2;
         this.center.y = 23 + 58 / 2;
         this.center.width = 30;
         this.center.height = 30;
         this.center.addChild(this.knobCenter);
         addElement(this.center);
         this.point = new UIComponent();
         this.point.mouseEnabled = false;
         this.point.mouseChildren = false;
         _pointX = this.rotateGroup.x;
         _pointY = 51;
         this.point.graphics.lineStyle(3,9430271,1);
         this.point.graphics.beginFill(9430271,1);
         this.point.graphics.drawCircle(_pointX,_pointY,1);
         this.point.graphics.endFill();
         this.point.filters = [new DropShadowFilter(2,90)];
         this.point.visible = false;
         addElement(this.point);
      }
      
      override public function adjustHarmonistCodeLabel(param1:Object) : void
      {
         var _loc4_:Array = null;
         var _loc2_:String = "";
         var _loc3_:Number = ParameterDefinitionGT.getHarmonistCodeIndex(param1.id);
         if(!isNaN(_loc3_))
         {
            _loc4_ = parameterNameLabel.text.split(":");
            parameterNameLabel.text = _loc4_[0] + ":" + ParameterDefinitionGT.getHarmonistCodeName(_loc3_);
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
            _loc1_ = 320 * (this.parameterVal / (parameterMax - parameterMin)) - 160;
         }
         else
         {
            _loc1_ = 320 * ((this.parameterVal - parameterMin) / (parameterMax - parameterMin)) - 160;
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
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
         if(param1)
         {
            this.backBgi.visible = true;
            this.point.visible = true;
         }
         else
         {
            this.backBgi.visible = false;
            this.point.visible = false;
         }
      }
   }
}

