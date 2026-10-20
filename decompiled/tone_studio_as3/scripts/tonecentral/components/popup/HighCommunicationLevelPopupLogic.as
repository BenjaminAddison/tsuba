package tonecentral.components.popup
{
   public class HighCommunicationLevelPopupLogic extends ViewLogic
   {
      
      private var view:HighCommunicationLevelPopup;
      
      public function HighCommunicationLevelPopupLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as HighCommunicationLevelPopup;
      }
   }
}

