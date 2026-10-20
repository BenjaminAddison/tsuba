package tonecentral.mediator
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import tonecentral.common.define.Mode;
   import tonecentral.events.ToneCentralEvents;
   
   public class KeyboardMediator extends EventDispatcher
   {
      
      private static var instance:KeyboardMediator;
      
      public function KeyboardMediator(param1:Blocker, param2:IEventDispatcher = null)
      {
         super(param2);
      }
      
      public static function getInstance() : KeyboardMediator
      {
         if(!instance)
         {
            instance = new KeyboardMediator(new Blocker());
         }
         return instance;
      }
      
      public function onKeyDown(param1:KeyboardEvent) : void
      {
         if(ToneCentralMediator.getInstance().contentsAreaMode.mode != Mode.LIBRARY.mode)
         {
            return;
         }
         if(Boolean(param1.commandKey) || Boolean(param1.controlKey))
         {
            if(param1.keyCode == Keyboard.C)
            {
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.COPY));
            }
            else if(param1.keyCode == Keyboard.V)
            {
               dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PASTE));
            }
         }
      }
   }
}

class Blocker
{
   
   public function Blocker()
   {
      super();
   }
}
