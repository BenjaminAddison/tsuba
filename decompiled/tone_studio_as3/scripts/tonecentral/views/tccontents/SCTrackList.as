package tonecentral.views.tccontents
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.VGroup;
   
   public class SCTrackList extends Group
   {
      
      private var _1345091147listArea:VGroup;
      
      private var _103149406logic:SCTrackListLogic;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SCTrackList()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SCTrackList_VGroup1_i()];
         this._SCTrackList_SCTrackListLogic1_i();
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
      
      public function get data() : Array
      {
         return this.logic.data;
      }
      
      public function set data(param1:Array) : void
      {
         this.logic.data = param1;
      }
      
      public function get selectedItem() : SCTrackListItem
      {
         return this.logic.selectedItem;
      }
      
      private function _SCTrackList_SCTrackListLogic1_i() : SCTrackListLogic
      {
         var _loc1_:SCTrackListLogic = new SCTrackListLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _SCTrackList_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.paddingBottom = 5;
         _loc1_.id = "listArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listArea = _loc1_;
         BindingManager.executeBindings(this,"listArea",this.listArea);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get listArea() : VGroup
      {
         return this._1345091147listArea;
      }
      
      public function set listArea(param1:VGroup) : void
      {
         var _loc2_:Object = this._1345091147listArea;
         if(_loc2_ !== param1)
         {
            this._1345091147listArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : SCTrackListLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:SCTrackListLogic) : void
      {
         var _loc2_:Object = this._103149406logic;
         if(_loc2_ !== param1)
         {
            this._103149406logic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logic",_loc2_,param1));
            }
         }
      }
   }
}

