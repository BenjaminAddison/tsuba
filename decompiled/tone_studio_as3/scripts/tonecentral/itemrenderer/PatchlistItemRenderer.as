package tonecentral.itemrenderer
{
   import tonecentral.common.data.PatchData;
   
   public class PatchlistItemRenderer extends AbstractToneCentralItemRenderer
   {
      
      public function PatchlistItemRenderer()
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
         if(Boolean(patchNoLabel) && Boolean(data))
         {
            patchNoLabel.text = PatchData(data).patchNo;
            patchNameLabel.text = PatchData(data).name;
            type = PatchData(data).patchNo;
            this.setBgImages();
            setUpStyle();
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
      }
      
      private function setBgImages() : void
      {
         if(Boolean(data) && Boolean(data.patchNo) && data.patchNo != "PANEL")
         {
            upImage = RendererAssets.patchlist_u_upImage;
            overImage = RendererAssets.patchlist_u_overImage;
            downImage = RendererAssets.patchlist_u_downImage;
            selectedImage = RendererAssets.patchlist_u_selectedImage;
         }
         else
         {
            upImage = RendererAssets.patchlist_p_upImage;
            overImage = RendererAssets.patchlist_p_overImage;
            downImage = RendererAssets.patchlist_p_downImage;
            selectedImage = RendererAssets.patchlist_p_selectedImage;
         }
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
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

