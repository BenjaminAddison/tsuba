package tonecentral.components.edit
{
   import flash.events.Event;
   import mx.events.FlexEvent;
   import spark.components.Label;
   import spark.components.VSlider;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.skin.GraphicEqVSliderSkin;
   
   public class GraphicEqSlider extends AbstractKnob
   {
      
      private static const WIDTH:Number = 33;
      
      private static const HEIGHT:Number = 270;
      
      private var slider:VSlider;
      
      private var nameLabel:Label;
      
      public function GraphicEqSlider()
      {
         super();
         this.width = WIDTH;
         this.height = HEIGHT;
         this.buttonMode = true;
         addEventListener(FlexEvent.CREATION_COMPLETE,this.onComplete,false,0,true);
      }
      
      private function onComplete(param1:FlexEvent) : void
      {
      }
      
      override protected function drawKnob() : void
      {
         this.nameLabel = new Label();
         this.nameLabel.styleName = "parameterName";
         this.nameLabel.horizontalCenter = 0;
         this.nameLabel.text = parameterName.replace("Hz","");
         addElement(this.nameLabel);
         this.slider = new VSlider();
         this.slider.y = 20;
         this.slider.height = HEIGHT - 20;
         this.slider.showDataTip = false;
         if(parameterMin < 0)
         {
            this.slider.maximum = parameterMax - parameterMin;
            this.slider.minimum = 0;
         }
         else
         {
            this.slider.maximum = parameterMax;
            this.slider.minimum = parameterMin;
         }
         this.slider.value = _parameterVal;
         this.slider.stepSize = parameterStep;
         this.slider.setStyle("skinClass",GraphicEqVSliderSkin);
         this.slider.addEventListener(Event.CHANGE,this.sliderChangeHandler,false,0,true);
         addElement(this.slider);
         _pointX = WIDTH - 3;
         this.setPointY();
      }
      
      private function sliderChangeHandler(param1:Event) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.KNOB_DRAG);
         _loc2_.data = this.slider.value;
         dispatchEvent(_loc2_);
      }
      
      override public function set parameterVal(param1:Number) : void
      {
         super.parameterVal = param1;
         if(this.slider)
         {
            this.slider.value = param1;
            this.setPointY();
         }
      }
      
      private function setPointY() : void
      {
         var _loc1_:Number = this.slider.height - 40;
         _pointY = this.slider.y + _loc1_ - _loc1_ * this.slider.value / this.slider.maximum + 20;
      }
   }
}

