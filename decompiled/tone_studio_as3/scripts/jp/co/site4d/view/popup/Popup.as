package jp.co.site4d.view.popup
{
   import flash.events.Event;
   import mx.core.UIComponent;
   import mx.managers.PopUpManager;
   
   internal class Popup
   {
      
      private var _view:UIComponent;
      
      private var _parent:UIComponent;
      
      public function Popup(param1:UIComponent, param2:UIComponent)
      {
         super();
         this._view = param1;
         this._parent = param2;
      }
      
      internal function show(param1:Boolean = true, param2:Boolean = true) : void
      {
         PopUpManager.addPopUp(this._view,this._parent,param1);
         if(param2)
         {
            PopUpManager.centerPopUp(this._view);
         }
      }
      
      private function onChange(param1:Event) : void
      {
         PopUpManager.centerPopUp(this._view);
      }
      
      internal function hide() : void
      {
         PopUpManager.removePopUp(this._view);
      }
   }
}

