package tonecentral.views.edit
{
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.TemporaryParams;
   import tonecentral.systemexclusive.SystemExclusive;
   
   public class ContentsAreaLogic extends ToneCentralViewLogic
   {
      
      private var view:ContentsArea;
      
      private var _mediator:ToneCentralMediator;
      
      private var selectedItem:TemporaryParams;
      
      private var selectedPatchIndex:int;
      
      public function ContentsAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = ContentsArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this._mediator = ToneCentralMediator.getInstance();
         this._mediator.sysex = SystemExclusive.getInstance();
      }
   }
}

