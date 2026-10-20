package tonecentral.views.edit.chain
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   
   public class EffectChain extends Group
   {
      
      private var _103149406logic:EffectChainLogic;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function EffectChain()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 230;
         this._EffectChain_EffectChainLogic1_i();
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
      
      private function _EffectChain_EffectChainLogic1_i() : EffectChainLogic
      {
         var _loc1_:EffectChainLogic = new EffectChainLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : EffectChainLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:EffectChainLogic) : void
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

