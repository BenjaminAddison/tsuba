package tonecentral.views.tccontents
{
   import tonecentral.common.view.ToneCentralViewLogic;
   
   public class PatchDescItemLogic extends ToneCentralViewLogic
   {
      
      private var view:PatchDescItem;
      
      public function PatchDescItemLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = PatchDescItem(param1);
      }
      
      public function set data(param1:XML) : void
      {
         var _loc2_:XMLList = param1.span;
         this.view.numLabel.text = _loc2_[0].toString();
         this.view.nameLabel.text = _loc2_[1].toString();
         this.view.descLabel.text = _loc2_[2].toString();
      }
   }
}

