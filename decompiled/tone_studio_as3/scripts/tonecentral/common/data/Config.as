package tonecentral.common.data
{
   public class Config
   {
      
      private var _confSystem:Object = {
         "knobMode":"",
         "usbLevel":"",
         "usbDirectMon":"",
         "usbLoopback":"",
         "usbDryRec":"",
         "usbMidiCh":"",
         "tunerMute":"",
         "patchChangeMode":"",
         "manualChangeMode":"",
         "autoOff":""
      };
      
      private var _confLanguage:String;
      
      private var _confManual:Object = new Object();
      
      private var _confDevice:Object = new Object();
      
      public function Config()
      {
         super();
      }
      
      public function get confSystem() : Object
      {
         return this._confSystem;
      }
      
      public function set confSystem(param1:Object) : void
      {
         this._confSystem = param1;
      }
      
      public function get confLanguage() : String
      {
         return this._confLanguage;
      }
      
      public function set confLanguage(param1:String) : void
      {
         this._confLanguage = param1;
      }
      
      public function get confManual() : Object
      {
         return this._confManual;
      }
      
      public function set confManual(param1:Object) : void
      {
         this._confManual = param1;
      }
      
      public function get confDevice() : Object
      {
         return this._confDevice;
      }
      
      public function set confDevice(param1:Object) : void
      {
         this._confDevice = param1;
      }
   }
}

