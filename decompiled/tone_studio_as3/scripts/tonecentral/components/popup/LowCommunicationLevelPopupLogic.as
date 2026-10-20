package tonecentral.components.popup
{
   public class LowCommunicationLevelPopupLogic extends ViewLogic
   {
      
      private var view:LowCommunicationLevelPopup;
      
      public function LowCommunicationLevelPopupLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as LowCommunicationLevelPopup;
      }
   }
}

