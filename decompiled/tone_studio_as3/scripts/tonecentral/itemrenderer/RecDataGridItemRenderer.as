package tonecentral.itemrenderer
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Label;
   import spark.components.gridClasses.GridItemRenderer;
   
   public class RecDataGridItemRenderer extends GridItemRenderer
   {
      
      private var _26330496lblData:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function RecDataGridItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.clipAndEnableScrolling = true;
         this.height = 30;
         this.mxmlContent = [this._RecDataGridItemRenderer_Label1_i()];
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
      
      override public function prepare(param1:Boolean) : void
      {
         if(data)
         {
            this.lblData.text = data[column.dataField];
         }
      }
      
      private function _RecDataGridItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.top = 9;
         _loc1_.left = 7;
         _loc1_.styleName = "dataGridItemLabel";
         _loc1_.id = "lblData";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lblData = _loc1_;
         BindingManager.executeBindings(this,"lblData",this.lblData);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get lblData() : Label
      {
         return this._26330496lblData;
      }
      
      public function set lblData(param1:Label) : void
      {
         var _loc2_:Object = this._26330496lblData;
         if(_loc2_ !== param1)
         {
            this._26330496lblData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lblData",_loc2_,param1));
            }
         }
      }
   }
}

