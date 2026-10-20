package tonecentral.itemrenderer
{
   import flash.geom.Point;
   import mx.core.DragSource;
   import mx.events.DragEvent;
   import mx.managers.DragManager;
   import tonecentral.common.data.PatchData;
   import tonecentral.events.ToneCentralEvents;
   
   public class LibraryPatchlistItemRenderer extends AbstractToneCentralItemRenderer
   {
      
      private var dragStartPosition:Point;
      
      public function LibraryPatchlistItemRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         super.data = PatchData.restore(param1);
         data.patchID = param1.patchID;
         if(Boolean(data) && Boolean(patchNoLabel))
         {
            patchNoLabel.text = PatchData(data).patchNo;
            patchNameLabel.text = PatchData(data).name;
            type = PatchData(data).patchNo;
         }
         this.setBgImages();
         this.hovered = false;
         setUpStyle();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         addEventListener(DragEvent.DRAG_ENTER,this.dragEnterHandler,false,0,true);
         addEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler,false,0,true);
      }
      
      private function dragCompleteHandler(param1:DragEvent) : void
      {
         var _loc2_:Point = new Point(param1.localX,param1.localY);
         owner.dispatchEvent(new DragEvent(DragEvent.DRAG_COMPLETE));
      }
      
      private function dragExitHandler(param1:DragEvent) : void
      {
         this.owner.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.ITEM_DRAG_EXIT));
      }
      
      private function dragEnterHandler(param1:DragEvent) : void
      {
         var _loc4_:Object = null;
         var _loc5_:ToneCentralEvents = null;
         var _loc2_:DragSource = param1.dragSource;
         var _loc3_:Object = _loc2_.dataForFormat("chainItem");
         if(!(param1.dragInitiator is LibraryPatchlistItemRenderer) && param1.dragInitiator != this.owner && PatchData(data).patchNo != "PANEL" && !_loc3_ && _loc2_.formats.indexOf("itemsByIndex") != -1)
         {
            addEventListener(DragEvent.DRAG_DROP,this.dragDropHandler,false,0,true);
            DragManager.acceptDragDrop(this);
            _loc4_ = param1.dragSource.dataForFormat(param1.dragSource.formats[0]);
            _loc5_ = new ToneCentralEvents(ToneCentralEvents.ITEM_DRAG_ENTER);
            _loc5_.data = {
               "pos":this.owner.localToGlobal(new Point(this.x,this.y)),
               "count":_loc4_.length,
               "height":this.height
            };
            this.owner.dispatchEvent(_loc5_);
         }
      }
      
      private function dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DROP);
         _loc2_.data = {
            "index":this.itemIndex,
            "data":param1.dragSource.dataForFormat(param1.dragSource.formats[0])
         };
         owner.dispatchEvent(_loc2_);
         var _loc3_:Object = param1.dragSource.dataForFormat(param1.dragSource.formats[0]);
         _loc2_ = new ToneCentralEvents(ToneCentralEvents.ITEM_DRAG_DROP);
         _loc2_.data = {
            "index":this.itemIndex,
            "data":param1.dragSource.dataForFormat(param1.dragSource.formats[0])
         };
         this.owner.dispatchEvent(_loc2_);
      }
      
      private function setBgImages() : void
      {
         if(Boolean(data) && Boolean(data.patchNo) && data.patchNo != "PANEL")
         {
            upImage = RendererAssets.patchlist_lib_u_upImage;
            overImage = RendererAssets.patchlist_lib_u_overImage;
            downImage = RendererAssets.patchlist_lib_u_downImage;
            selectedImage = RendererAssets.patchlist_lib_u_selectedImage;
         }
         else
         {
            upImage = RendererAssets.patchlist_lib_p_upImage;
            overImage = RendererAssets.patchlist_lib_p_overImage;
            downImage = RendererAssets.patchlist_lib_p_downImage;
            selectedImage = RendererAssets.patchlist_lib_p_selectedImage;
         }
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         changeBg();
      }
      
      override protected function onUP() : void
      {
         patchNoLabel.styleName = "patchlistNo";
         patchNameLabel.styleName = "patchlistName";
      }
      
      override protected function onOver() : void
      {
         patchNoLabel.styleName = "patchlistNo";
         patchNameLabel.styleName = "patchlistName";
      }
      
      override protected function onSelected() : void
      {
         patchNoLabel.styleName = "patchlistNo";
         patchNameLabel.styleName = "patchlistName";
      }
   }
}

