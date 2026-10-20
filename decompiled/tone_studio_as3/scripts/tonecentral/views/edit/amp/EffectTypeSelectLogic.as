package tonecentral.views.edit.amp
{
   import mx.collections.IList;
   import spark.events.IndexChangeEvent;
   import tonecentral.events.ToneCentralEvents;
   
   public class EffectTypeSelectLogic extends ViewLogic
   {
      
      private var view:EffectTypeSelect;
      
      private var _data:Object;
      
      public function EffectTypeSelectLogic()
      {
         super();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get isOn() : Boolean
      {
         return this.view.onLamp.visible;
      }
      
      public function set isOn(param1:Boolean) : void
      {
         this.view.onLamp.visible = param1;
         this.view.offLamp.visible = !param1;
      }
      
      public function hideLamp() : void
      {
         this.view.onLamp.visible = false;
         this.view.offLamp.visible = false;
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as EffectTypeSelect;
      }
      
      public function get selectedItem() : *
      {
         return this.view.dropdown.selectedItem;
      }
      
      public function get selectedIndex() : int
      {
         return this.view.dropdown.selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this.view.dropdown.selectedIndex = param1;
      }
      
      public function set dataProvider(param1:IList) : void
      {
         this.view.dropdown.dataProvider = param1;
      }
      
      override protected function onCreationComplete() : void
      {
         this.view.dropdown.addEventListener(IndexChangeEvent.CHANGE,this.effectTypeChageHandler,false,0,true);
      }
      
      private function effectTypeChageHandler(param1:IndexChangeEvent) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.CHANGE_EFFECT));
      }
      
      public function setValue(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.view.dropdown.dataProvider.length)
         {
            if(this.view.dropdown.dataProvider[_loc2_].val == param1)
            {
               this.view.dropdown.selectedIndex = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      public function setColor(param1:uint, param2:uint) : void
      {
         this.view.onEffectColor.color = param1;
         this.view.onStrokeColor.color = param2;
         this.view.offStrokeColor.color = param2;
      }
   }
}

