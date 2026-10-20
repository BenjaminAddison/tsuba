package tonecentral.components.chain
{
   import flash.events.Event;
   import tonecentral.common.manager.ApplicationManager;
   
   public class ChainSelectButtonLogic extends ViewLogic
   {
      
      private var chain1Up:Class = ChainSelectButtonLogic_chain1Up;
      
      private var chain1Selected:Class = ChainSelectButtonLogic_chain1Selected;
      
      private var chain2Up:Class = ChainSelectButtonLogic_chain2Up;
      
      private var chain2Selected:Class = ChainSelectButtonLogic_chain2Selected;
      
      private var chain3Up:Class = ChainSelectButtonLogic_chain3Up;
      
      private var chain3Selected:Class = ChainSelectButtonLogic_chain3Selected;
      
      private var _selected:Boolean;
      
      private var _value:String;
      
      private var view:ChainSelectButton;
      
      private var appMng:ApplicationManager;
      
      public function ChainSelectButtonLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as ChainSelectButton;
      }
      
      public function get label() : String
      {
         return this.view.routingName.text;
      }
      
      public function set label(param1:String) : void
      {
         this.view.routingName.text = param1;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function set value(param1:String) : void
      {
         this._value = param1;
         this.view.selectButton.value = param1;
         this.setChainImage();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.view.selectButton.selected = this._selected;
         this.view.effectSw.selected = this._selected;
         this.setChainImage();
      }
      
      override protected function onCreationComplete() : void
      {
         this.appMng = ApplicationManager.getInstance();
         this.view.selectButton.addEventListener(Event.CHANGE,this.selectButtonChangeHandler,false,0,true);
      }
      
      private function setChainImage() : void
      {
         switch(this._value)
         {
            case "00":
               if(this.view.effectSw.selected)
               {
                  this.view.routingImg.source = this.chain1Selected;
               }
               else
               {
                  this.view.routingImg.source = this.chain1Up;
               }
               break;
            case "01":
               if(this.view.effectSw.selected)
               {
                  this.view.routingImg.source = this.chain2Selected;
               }
               else
               {
                  this.view.routingImg.source = this.chain2Up;
               }
               break;
            case "02":
               if(this.view.effectSw.selected)
               {
                  this.view.routingImg.source = this.chain3Selected;
               }
               else
               {
                  this.view.routingImg.source = this.chain3Up;
               }
         }
      }
      
      private function selectButtonChangeHandler(param1:Event) : void
      {
         this.selected = this.view.selectButton.selected;
         this.setChainImage();
      }
      
      public function changeSelect() : void
      {
         this.view.effectSw.selected = this.view.selectButton.selected;
         this.setChainImage();
      }
   }
}

