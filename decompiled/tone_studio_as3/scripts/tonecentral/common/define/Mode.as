package tonecentral.common.define
{
   public class Mode
   {
      
      public static const EDITOR:Mode = new Mode("editor");
      
      public static const LIBRARY:Mode = new Mode("library");
      
      public static const TONE_CENTRAL:Mode = new Mode("toneCentral");
      
      private var _mode:String;
      
      public function Mode(param1:String)
      {
         super();
         this._mode = param1;
      }
      
      public function get mode() : String
      {
         return this._mode;
      }
   }
}

