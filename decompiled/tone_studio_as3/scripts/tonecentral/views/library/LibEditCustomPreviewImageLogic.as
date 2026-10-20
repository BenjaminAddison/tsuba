package tonecentral.views.library
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   
   public class LibEditCustomPreviewImageLogic extends ToneCentralViewLogic
   {
      
      private var view:LibEditCustomPreviewImage;
      
      public var image:String;
      
      private var selected:Boolean;
      
      public function LibEditCustomPreviewImageLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LibEditCustomPreviewImage(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.view.addEventListener(MouseEvent.CLICK,this.mouseClickHandler,false,0,true);
      }
      
      public function setData(param1:String) : void
      {
         this.image = param1;
         this.view.ghostImage.source = param1;
         this.view.ghostImage.addEventListener(Event.COMPLETE,this.imageCompleteHandler,false,0,true);
      }
      
      private function imageCompleteHandler(param1:Event) : void
      {
         var _loc2_:BitmapData = new BitmapData(36,36);
         _loc2_.draw(this.view.ghostImage.bitmapData,new Matrix(36 / this.view.ghostImage.bitmapData.width,0,0,36 / this.view.ghostImage.bitmapData.height),null,null,null,true);
         this.view.artworkImage.source = _loc2_;
      }
      
      public function resetSelected() : void
      {
         this.view.normalBorder.visible = true;
         this.view.selectedBorder.visible = false;
         this.selected = false;
      }
      
      public function selectedImage() : void
      {
         this.view.normalBorder.visible = false;
         this.view.selectedBorder.visible = true;
      }
      
      private function mouseClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralEvents = null;
         if(!this.selected)
         {
            this.selected = !this.selected;
            _loc2_ = new ToneCentralEvents(ToneCentralEvents.PRESET_ARTWORK_SELECTED);
            this.view.dispatchEvent(_loc2_);
         }
      }
   }
}

