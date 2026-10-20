package tonecentral.views.edit.ctl
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import tonecentral.common.util.CTLParameterUtil;
   
   public class CTLTitle extends Group
   {
      
      private var _1091693382ctlName:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CTLTitle()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._CTLTitle_Label1_i()];
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
      
      public function init(param1:String) : void
      {
         this.ctlName.text = CTLParameterUtil.getCtlName(param1);
      }
      
      private function _CTLTitle_Label1_i() : Label
      {
         var _loc1_:Label = null;
         _loc1_ = new Label();
         _loc1_.styleName = "editorListEffectType";
         _loc1_.height = 15;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "ctlName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ctlName = _loc1_;
         BindingManager.executeBindings(this,"ctlName",this.ctlName);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ctlName() : Label
      {
         return this._1091693382ctlName;
      }
      
      public function set ctlName(param1:Label) : void
      {
         var _loc2_:Object = this._1091693382ctlName;
         if(_loc2_ !== param1)
         {
            this._1091693382ctlName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ctlName",_loc2_,param1));
            }
         }
      }
   }
}

