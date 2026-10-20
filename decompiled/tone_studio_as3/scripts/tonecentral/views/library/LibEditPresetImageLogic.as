package tonecentral.views.library
{
   import flash.events.MouseEvent;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   
   public class LibEditPresetImageLogic extends ToneCentralViewLogic
   {
      
      private var view:LibEditPresetImage;
      
      public var image:String;
      
      private var selected:Boolean;
      
      public function LibEditPresetImageLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LibEditPresetImage(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.view.addEventListener(MouseEvent.CLICK,this.mouseClickHandler,false,0,true);
      }
      
      public function setData(param1:String) : void
      {
         this.image = param1;
         this.view.artworkImage.source = param1;
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

