package tonecentral.views.tccontents
{
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import mx.core.UIComponent;
   import mx.events.ResizeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import tonecentral.events.ToneCentralEvents;
   
   public class SCTrackListItem extends Group
   {
      
      private var _data:Object;
      
      private var bg:UIComponent;
      
      private var title:Label;
      
      private var _selected:Boolean = false;
      
      public function SCTrackListItem()
      {
         super();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.drawBg();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.percentWidth = 100;
         this.height = 30;
         this.buttonMode = true;
         this.bg = new UIComponent();
         this.bg.width = this.width;
         this.bg.height = this.height;
         addElement(this.bg);
         this.title = new Label();
         this.title.styleName = "SCTrackLabel";
         this.title.height = 16;
         this.title.x = 10;
         this.title.verticalCenter = 2;
         this.title.mouseEnabled = false;
         addElement(this.title);
         if(this._data)
         {
            this.title.text = this._data.title;
         }
         this.drawBg();
         this.addEventListener(ResizeEvent.RESIZE,this.resizeHandler,false,0,true);
         this.addEventListener(MouseEvent.CLICK,this.itemClickHandler,false,0,true);
      }
      
      private function itemClickHandler(param1:MouseEvent) : void
      {
         if(this._selected)
         {
            return;
         }
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function resizeHandler(param1:ResizeEvent) : void
      {
         this.drawBg();
         this.title.width = this.width - 20;
      }
      
      private function drawBg() : void
      {
         var _loc1_:Graphics = this.bg.graphics;
         _loc1_.clear();
         if(this._selected)
         {
            _loc1_.beginFill(996669);
         }
         else
         {
            _loc1_.beginFill(2234390);
         }
         _loc1_.drawRect(0,0,this.width,this.height);
         _loc1_.endFill();
         _loc1_.lineStyle(1,3287335);
         _loc1_.moveTo(0,this.height - 1);
         _loc1_.lineTo(this.width,this.height - 1);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(this.title)
         {
            this.title.text = this._data.title;
         }
      }
   }
}

