package tonecentral.views.sidearea
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import tonecentral.common.net.DataAPILoader;
   import tonecentral.components.ImageLabelRadioButton;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class TCSideAreaLogic extends ViewLogic
   {
      
      private var view:TCSideArea;
      
      private var loader:DataAPILoader;
      
      private var _selectedTag:String;
      
      private var toneCentralMediator:ToneCentralMediator;
      
      public function TCSideAreaLogic()
      {
         super();
      }
      
      public function get selectedTag() : String
      {
         return this.view.tagGroup.selectedValue.toString();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = TCSideArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.loader = new DataAPILoader();
         this.loader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.loadCompleteHandler,false,0,true);
         this.loader.addEventListener(ToneCentralEvents.LOAD_FAULT,this.loadFaultHandler,false,0,true);
         this.view.tcLogoButton.addEventListener(MouseEvent.CLICK,this.logoClickHandler,false,0,true);
         this.view.tagGroup.addEventListener(Event.CHANGE,this.tagChangeHandler,false,0,true);
         this.toneCentralMediator = ToneCentralMediator.getInstance();
         this.toneCentralMediator.addEventListener(ToneCentralEvents.REFRESH_COMPLETE_TC,this.refreshCompleteTCHandler,false,0,true);
         this.toneCentralMediator.addEventListener(ToneCentralEvents.SET_TEMPORARY_START,this.setTemporaryStartHandler,false,0,true);
         this.toneCentralMediator.addEventListener(ToneCentralEvents.SET_TEMPORARY_END,this.setTemporaryEndHandler,false,0,true);
      }
      
      private function setTemporaryStartHandler(param1:ToneCentralEvents) : void
      {
         this.view.tcLogoButton.enabled = false;
      }
      
      private function setTemporaryEndHandler(param1:ToneCentralEvents) : void
      {
         this.view.tcLogoButton.enabled = true;
      }
      
      private function refreshCompleteTCHandler(param1:ToneCentralEvents) : void
      {
         this.toneCentralMediator.removeEventListener(ToneCentralEvents.REFRESH_COMPLETE_TC,this.refreshCompleteTCHandler);
         this.loadTags();
      }
      
      public function loadTags() : void
      {
         this.loader.loadTags();
      }
      
      private function tagChangeHandler(param1:Event) : void
      {
         this.toneCentralMediator.TCTagChange(this.view.tagGroup.selectedValue);
      }
      
      private function loadCompleteHandler(param1:ToneCentralEvents) : void
      {
         var _loc7_:ImageLabelRadioButton = null;
         var _loc2_:Object = param1.data;
         var _loc3_:Array = _loc2_.tags.list;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc7_ = this.createTagButton(_loc3_[_loc6_]);
            this.view.addElement(_loc7_);
            _loc4_ = Math.floor(_loc6_ / 2);
            _loc5_ = _loc6_ % 2;
            _loc7_.x = _loc5_ * 85 + 10;
            _loc7_.y = _loc4_ * 35 + 175;
            _loc6_++;
         }
      }
      
      private function createTagButton(param1:Object) : ImageLabelRadioButton
      {
         var _loc2_:ImageLabelRadioButton = new ImageLabelRadioButton();
         _loc2_.label = String(param1.name).replace("&amp;","&");
         _loc2_.width = 75;
         _loc2_.styleName = "tagButton";
         _loc2_.groupName = "tagGroup";
         _loc2_.value = param1.name;
         return _loc2_;
      }
      
      private function loadFaultHandler(param1:ToneCentralEvents) : void
      {
      }
      
      private function logoClickHandler(param1:MouseEvent) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.TONE_CENTRAL_CLICK));
      }
   }
}

