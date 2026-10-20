package tonecentral.components.popup
{
   import flash.events.Event;
   import mx.binding.BindingManager;
   import mx.collections.ArrayList;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.DataGrid;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.components.gridClasses.GridColumn;
   import spark.events.GridSelectionEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.itemrenderer.RecDataGridItemRenderer;
   import tonecentral.itemrenderer.RecDataGridNameItemRenderer;
   import tonecentral.itemrenderer.RecGridHeaderRenderer;
   import tonecentral.itemrenderer.RecGridItemEditor;
   import tonecentral.skin.RecDataGridSkin;
   
   public class RecDataGrid extends Group
   {
      
      private var _109620734songs:DataGrid;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function RecDataGrid()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._RecDataGrid_Scroller1_c()];
         this.addEventListener("creationComplete",this.___RecDataGrid_Group1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set dataProvider(param1:IList) : void
      {
         this.songs.dataProvider = param1;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this.songs.selectedIndex = param1;
      }
      
      public function get selectedIndex() : int
      {
         return this.songs.selectedIndex;
      }
      
      public function get selectedItem() : Object
      {
         return this.songs.selectedItem;
      }
      
      public function removeItemAt(param1:int) : void
      {
         this.songs.dataProvider.removeItemAt(param1);
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.songs.addEventListener(GridSelectionEvent.SELECTION_CHANGE,this.songSelectChangeHandler,false,0,true);
         this.songs.addEventListener(ToneCentralEvents.DELETE,this.songDeleteHandler,false,0,true);
      }
      
      private function songSelectChangeHandler(param1:GridSelectionEvent) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function songDeleteHandler(param1:Event) : void
      {
         var _loc2_:int = this.songs.selectedIndex;
         var _loc3_:Object = this.songs.selectedItem;
         this.songs.endItemEditorSession();
         var _loc4_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DELETE);
         _loc4_.data = _loc3_;
         dispatchEvent(_loc4_);
      }
      
      private function _RecDataGrid_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._RecDataGrid_Group2_c();
         _loc1_.setStyle("verticalScrollPolicy","auto");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGrid_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecDataGrid_DataGrid1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RecDataGrid_DataGrid1_i() : DataGrid
      {
         var _loc1_:DataGrid = new DataGrid();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.editable = true;
         _loc1_.columns = this._RecDataGrid_ArrayList1_c();
         _loc1_.setStyle("skinClass",RecDataGridSkin);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("rollOverColor",6710886);
         _loc1_.setStyle("selectionColor",865598);
         _loc1_.setStyle("symbolColor",14079702);
         _loc1_.id = "songs";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.songs = _loc1_;
         BindingManager.executeBindings(this,"songs",this.songs);
         return _loc1_;
      }
      
      private function _RecDataGrid_ArrayList1_c() : ArrayList
      {
         var _loc1_:ArrayList = new ArrayList();
         _loc1_.source = [this._RecDataGrid_GridColumn1_c(),this._RecDataGrid_GridColumn2_c(),this._RecDataGrid_GridColumn3_c()];
         return _loc1_;
      }
      
      private function _RecDataGrid_GridColumn1_c() : GridColumn
      {
         var _loc1_:GridColumn = new GridColumn();
         _loc1_.width = 40;
         _loc1_.headerText = "";
         _loc1_.dataField = "no";
         _loc1_.editable = false;
         _loc1_.itemRenderer = this._RecDataGrid_ClassFactory1_c();
         _loc1_.headerRenderer = this._RecDataGrid_ClassFactory2_c();
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridItemRenderer;
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecGridHeaderRenderer;
         return _loc1_;
      }
      
      private function _RecDataGrid_GridColumn2_c() : GridColumn
      {
         var _loc1_:GridColumn = new GridColumn();
         _loc1_.headerText = "Name";
         _loc1_.dataField = "name";
         _loc1_.itemRenderer = this._RecDataGrid_ClassFactory3_c();
         _loc1_.headerRenderer = this._RecDataGrid_ClassFactory4_c();
         _loc1_.itemEditor = this._RecDataGrid_ClassFactory5_c();
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridNameItemRenderer;
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory4_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecGridHeaderRenderer;
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory5_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecGridItemEditor;
         return _loc1_;
      }
      
      private function _RecDataGrid_GridColumn3_c() : GridColumn
      {
         var _loc1_:GridColumn = new GridColumn();
         _loc1_.width = 60;
         _loc1_.headerText = "Time";
         _loc1_.dataField = "time";
         _loc1_.editable = false;
         _loc1_.itemRenderer = this._RecDataGrid_ClassFactory6_c();
         _loc1_.headerRenderer = this._RecDataGrid_ClassFactory7_c();
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory6_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecDataGridItemRenderer;
         return _loc1_;
      }
      
      private function _RecDataGrid_ClassFactory7_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RecGridHeaderRenderer;
         return _loc1_;
      }
      
      public function ___RecDataGrid_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get songs() : DataGrid
      {
         return this._109620734songs;
      }
      
      public function set songs(param1:DataGrid) : void
      {
         var _loc2_:Object = this._109620734songs;
         if(_loc2_ !== param1)
         {
            this._109620734songs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"songs",_loc2_,param1));
            }
         }
      }
   }
}

