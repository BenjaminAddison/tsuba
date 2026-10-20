package jp.co.site4d.view.popup
{
   import mx.core.IFlexDisplayObject;
   import mx.core.UIComponent;
   import mx.managers.IFocusManagerContainer;
   import spark.components.Group;
   import spark.events.PopUpEvent;
   
   public class PopupContainer extends Group implements IFocusManagerContainer
   {
      
      protected var popUp:Popup;
      
      private var _defaultButton:IFlexDisplayObject;
      
      public function PopupContainer()
      {
         super();
      }
      
      public function popup(param1:UIComponent, param2:Boolean = true, param3:Boolean = true) : void
      {
         if(!this.isShowOK(param1))
         {
            return;
         }
         this.popUp = new Popup(this,param1);
         this.popUp.show(param2,param3);
         dispatchEvent(new PopUpEvent(PopUpEvent.OPEN));
         this.onOpen();
      }
      
      public function isShowOK(param1:UIComponent) : Boolean
      {
         return true;
      }
      
      protected function onOpen() : void
      {
      }
      
      public function close() : void
      {
         this.onClose();
         if(this.popUp)
         {
            this.popUp.hide();
            this.popUp = null;
            dispatchEvent(new PopUpEvent(PopUpEvent.CLOSE));
         }
      }
      
      protected function onClose() : void
      {
      }
      
      public function set defaultButton(param1:IFlexDisplayObject) : void
      {
         this._defaultButton = param1;
      }
      
      public function get defaultButton() : IFlexDisplayObject
      {
         if(this._defaultButton)
         {
            return this._defaultButton;
         }
         return this;
      }
   }
}

