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
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Label;
   import spark.components.gridClasses.GridItemRenderer;
   import tonecentral.components.ImageButton;
   import tonecentral.events.ToneCentralEvents;
   
   public class RecDataGridNameItemRenderer extends GridItemRenderer implements IStateClient2
   {
      
      private var _1245745987deleteButton:ImageButton;
      
      private var _26330496lblData:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function RecDataGridNameItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.clipAndEnableScrolling = true;
         this.height = 30;
         this.mxmlContent = [this._RecDataGridNameItemRenderer_Label1_i(),this._RecDataGridNameItemRenderer_ImageButton1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[]
         }),new State({
            "name":"selected",
            "overrides":[]
         })];
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
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         if(currentState == "selected")
         {
            this.lblData.width = 285;
            this.deleteButton.visible = true;
         }
         else
         {
            this.lblData.width = 315;
            this.deleteButton.visible = false;
         }
      }
      
      protected function deleteButtonClickHandler(param1:MouseEvent) : void
      {
         owner.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DELETE));
      }
      
      private function _RecDataGridNameItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.top = 9;
         _loc1_.x = 7;
         _loc1_.width = 315;
         _loc1_.styleName = "dataGridItemNameLabel";
         _loc1_.maxDisplayedLines = 1;
         _loc1_.id = "lblData";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lblData = _loc1_;
         BindingManager.executeBindings(this,"lblData",this.lblData);
         return _loc1_;
      }
      
      private function _RecDataGridNameItemRenderer_ImageButton1_i() : ImageButton
      {
         var _loc1_:ImageButton = new ImageButton();
         _loc1_.right = 10;
         _loc1_.y = 8;
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "itemDeleteButton";
         _loc1_.visible = false;
         _loc1_.addEventListener("click",this.__deleteButton_click);
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      public function __deleteButton_click(param1:MouseEvent) : void
      {
         this.deleteButtonClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get deleteButton() : ImageButton
      {
         return this._1245745987deleteButton;
      }
      
      public function set deleteButton(param1:ImageButton) : void
      {
         var _loc2_:Object = this._1245745987deleteButton;
         if(_loc2_ !== param1)
         {
            this._1245745987deleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
            }
         }
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

