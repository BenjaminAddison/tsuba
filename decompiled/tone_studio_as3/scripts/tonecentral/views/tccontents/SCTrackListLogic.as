package tonecentral.views.tccontents
{
   import tonecentral.events.ToneCentralEvents;
   
   public class SCTrackListLogic extends ViewLogic
   {
      
      private var view:SCTrackList;
      
      private var _data:Array;
      
      private var _selectedItem:SCTrackListItem;
      
      private var itemList:Vector.<SCTrackListItem>;
      
      public function SCTrackListLogic()
      {
         super();
      }
      
      public function get selectedItem() : SCTrackListItem
      {
         return this._selectedItem;
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = SCTrackList(param1);
      }
      
      public function get data() : Array
      {
         return this._data;
      }
      
      public function set data(param1:Array) : void
      {
         this._data = param1;
         this.createList();
      }
      
      private function createList() : void
      {
         var _loc2_:SCTrackListItem = null;
         this.view.listArea.removeAllElements();
         this.itemList = new Vector.<SCTrackListItem>();
         var _loc1_:int = 0;
         while(_loc1_ < this._data.length)
         {
            _loc2_ = new SCTrackListItem();
            _loc2_.addEventListener(ToneCentralEvents.SELECT,this.itemSelectHandler,false,0,true);
            this.view.listArea.addElement(_loc2_);
            _loc2_.data = this._data[_loc1_];
            this.itemList.push(_loc2_);
            _loc1_++;
         }
         this._selectedItem = this.itemList[0];
         this.selectedItem.selected = true;
      }
      
      private function itemSelectHandler(param1:ToneCentralEvents) : void
      {
         this._selectedItem = param1.currentTarget as SCTrackListItem;
         var _loc2_:int = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].selected = false;
            _loc2_++;
         }
         this.selectedItem.selected = true;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
   }
}

