package jp.co.site4d.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import jp.co.site4d.events.NetEvent;
   
   public class FileDownloader extends EventDispatcher
   {
      
      public static const TEMP_FILE:String = "temp";
      
      public var file:File;
      
      private var urlStream:URLStream;
      
      private var fileData:ByteArray;
      
      private var savePath:String;
      
      private var _bytesLoaded:int = 0;
      
      private var _bytesTotal:int = 0;
      
      public function FileDownloader(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function get bytesTotal() : int
      {
         return this._bytesTotal;
      }
      
      public function get bytesLoaded() : int
      {
         return this._bytesLoaded;
      }
      
      public function download(param1:String, param2:String) : void
      {
         this.savePath = param2;
         this.urlStream = new URLStream();
         this.fileData = new ByteArray();
         var _loc3_:URLRequest = new URLRequest(param1);
         var _loc4_:URLRequestHeader = new URLRequestHeader("pragma","no-cache");
         _loc3_.requestHeaders.push(_loc4_);
         this.urlStream.addEventListener(Event.COMPLETE,this.completeHandler);
         this.urlStream.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         this.urlStream.addEventListener(IOErrorEvent.IO_ERROR,this.IOErrorHandler);
         this.urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         this.urlStream.load(_loc3_);
      }
      
      private function progressHandler(param1:ProgressEvent) : void
      {
         this._bytesLoaded = param1.bytesLoaded;
         this._bytesTotal = param1.bytesTotal;
         dispatchEvent(new NetEvent(NetEvent.PROGRESS));
      }
      
      private function IOErrorHandler(param1:IOErrorEvent) : void
      {
         dispatchEvent(new NetEvent(NetEvent.IO_ERROR));
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         dispatchEvent(new NetEvent(NetEvent.SECURITY_ERROR));
      }
      
      private function completeHandler(param1:Event) : void
      {
         this.urlStream.readBytes(this.fileData,0,this.urlStream.bytesAvailable);
         this.writeFile();
      }
      
      private function writeFile() : void
      {
         if(this.savePath == TEMP_FILE)
         {
            this.file = File.createTempFile();
         }
         else
         {
            this.file = new File(this.savePath);
         }
         var _loc1_:FileStream = new FileStream();
         _loc1_.addEventListener(Event.CLOSE,this.fileCloseHandler,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.IOErrorHandler,false,0,true);
         _loc1_.openAsync(this.file,FileMode.WRITE);
         _loc1_.writeBytes(this.fileData,0,this.fileData.length);
         _loc1_.close();
      }
      
      private function fileCloseHandler(param1:Event) : void
      {
         dispatchEvent(new NetEvent(NetEvent.COMPLETE));
      }
   }
}

