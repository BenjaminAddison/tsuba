package tonecentral.views.edit.amp
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import mx.core.BitmapAsset;
   import mx.core.UIComponent;
   import tonecentral.events.ToneCentralEvents;
   
   public class EffectSwitch extends UIComponent
   {
      
      private var greenImg:Class = EffectSwitch_greenImg;
      
      private var yellowImg:Class = EffectSwitch_yellowImg;
      
      private var redImg:Class = EffectSwitch_redImg;
      
      private var blackImg:Class = EffectSwitch_blackImg;
      
      private var greenSwitch:BitmapAsset;
      
      private var yellowSwitch:BitmapAsset;
      
      private var redSwitch:BitmapAsset;
      
      private var blackSwitch:BitmapAsset;
      
      private var _data:int;
      
      public function EffectSwitch()
      {
         super();
         this.init();
      }
      
      public function get data() : int
      {
         return this._data;
      }
      
      public function set data(param1:int) : void
      {
         this._data = param1;
         this.drawSwitch();
      }
      
      private function init() : void
      {
         this.greenSwitch = new this.greenImg();
         this.yellowSwitch = new this.yellowImg();
         this.redSwitch = new this.redImg();
         this.blackSwitch = new this.blackImg();
         this.drawSwitch();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         ++this._data;
         if(this._data > 3)
         {
            this._data = 0;
         }
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_EFFECT));
      }
      
      private function drawSwitch() : void
      {
         var _loc1_:BitmapData = this.getColor();
         var _loc2_:Graphics = this.graphics;
         _loc2_.clear();
         _loc2_.beginBitmapFill(_loc1_);
         _loc2_.drawRect(0,0,_loc1_.width,_loc1_.height);
         _loc2_.endFill();
      }
      
      private function getColor() : BitmapData
      {
         switch(this.data)
         {
            case 0:
               return this.blackSwitch.bitmapData;
            case 1:
               return this.greenSwitch.bitmapData;
            case 2:
               return this.redSwitch.bitmapData;
            case 3:
               return this.yellowSwitch.bitmapData;
            default:
               return this.blackSwitch.bitmapData;
         }
      }
   }
}

