package tonecentral.views.edit
{
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ViewStatusEvent;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ParameterEditLogic extends ToneCentralViewLogic
   {
      
      private var view:ParameterEdit;
      
      private var mediator:ToneCentralMediator;
      
      public function ParameterEditLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = ParameterEdit(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ViewStatusEvent.VIEW_STATUS_CHANGE,this.viewStatusChangeHandler,false,0,true);
      }
      
      private function viewStatusChangeHandler(param1:ViewStatusEvent) : void
      {
         this.view.currentState = param1.state;
      }
   }
}

