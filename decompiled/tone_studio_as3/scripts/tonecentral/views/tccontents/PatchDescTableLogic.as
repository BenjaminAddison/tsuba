package tonecentral.views.tccontents
{
   import tonecentral.common.view.ToneCentralViewLogic;
   
   public class PatchDescTableLogic extends ToneCentralViewLogic
   {
      
      private var view:PatchDescTable;
      
      public function PatchDescTableLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = PatchDescTable(param1);
      }
      
      public function set data(param1:XML) : void
      {
         var _loc4_:XML = null;
         var _loc5_:PatchDescItem = null;
         this.view.container.removeAllElements();
         var _loc2_:XMLList = param1.div;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length())
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = new PatchDescItem();
            this.view.container.addElement(_loc5_);
            _loc5_.data = _loc4_;
            _loc3_++;
         }
      }
   }
}

