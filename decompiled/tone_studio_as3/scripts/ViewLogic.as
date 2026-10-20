package
{
   import flash.events.Event;
   import mx.core.IMXMLObject;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   
   public class ViewLogic implements IMXMLObject
   {
      
      protected var mxmlObject:UIComponent;
      
      public function ViewLogic()
      {
         super();
      }
      
      final public function initialized(param1:Object, param2:String) : void
      {
         this.setView(param1);
         this.mxmlObject = UIComponent(param1);
         this.mxmlObject.addEventListener(FlexEvent.PREINITIALIZE,this.preInitializedHandler,false,0,true);
         this.mxmlObject.addEventListener(FlexEvent.INITIALIZE,this.initializedHandler,false,0,true);
         this.mxmlObject.addEventListener(FlexEvent.CREATION_COMPLETE,this.creationCompletedHandler,false,0,true);
      }
      
      private function initializedHandler(param1:FlexEvent) : void
      {
         param1.currentTarget.removeEventListener(param1.type,this.initializedHandler);
         this.onInitialized();
      }
      
      private function preInitializedHandler(param1:FlexEvent) : void
      {
         param1.currentTarget.removeEventListener(param1.type,this.preInitializedHandler);
         this.onPreInitialized();
      }
      
      private function creationCompletedHandler(param1:FlexEvent) : void
      {
         this.mxmlObject.addEventListener(Event.ADDED_TO_STAGE,this.showHandler,false,0,true);
         this.mxmlObject.addEventListener(Event.REMOVED_FROM_STAGE,this.hideHandler,false,0,true);
         this.mxmlObject.addEventListener(FlexEvent.HIDE,this.visibleHideHandler,false,0,true);
         this.mxmlObject.removeEventListener(FlexEvent.CREATION_COMPLETE,this.creationCompletedHandler);
         this.onCreationComplete();
      }
      
      private function visibleHideHandler(param1:FlexEvent) : void
      {
         this.onVisibleHide();
      }
      
      protected function onVisibleHide() : void
      {
      }
      
      private function showHandler(param1:Event) : void
      {
         this.mxmlObject.removeEventListener(Event.ADDED_TO_STAGE,this.showHandler);
         this.onShow();
         this.mxmlObject.addEventListener(Event.REMOVED_FROM_STAGE,this.hideHandler,false,0,true);
      }
      
      private function hideHandler(param1:Event) : void
      {
         this.mxmlObject.removeEventListener(Event.REMOVED_FROM_STAGE,this.hideHandler);
         this.onHide();
         this.mxmlObject.addEventListener(Event.ADDED_TO_STAGE,this.showHandler,false,0,true);
      }
      
      protected function onInitialized() : void
      {
      }
      
      protected function onPreInitialized() : void
      {
      }
      
      protected function onCreationComplete() : void
      {
      }
      
      protected function onShow() : void
      {
      }
      
      protected function onHide() : void
      {
      }
      
      protected function setView(param1:Object) : void
      {
      }
   }
}

