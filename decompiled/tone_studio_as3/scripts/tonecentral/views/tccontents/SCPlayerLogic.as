package tonecentral.views.tccontents
{
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.net.URLRequest;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.common.manager.LogManager;
   import tonecentral.common.net.NetworkManager;
   import tonecentral.common.net.SoundCloudLoader;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   
   public class SCPlayerLogic extends ToneCentralViewLogic
   {
      
      private var view:SCPlayer;
      
      private var _data:Array;
      
      private var song:Object;
      
      private var sound:Sound;
      
      private var soundCh:SoundChannel;
      
      private var pausePosition:Number = 0;
      
      private var scloader:SoundCloudLoader;
      
      private var netMng:NetworkManager;
      
      private var logMng:LogManager;
      
      private var isPlaying:Boolean = false;
      
      public function SCPlayerLogic()
      {
         super();
      }
      
      private function get data() : Array
      {
         return this._data;
      }
      
      private function set data(param1:Array) : void
      {
         this._data = param1;
         this.view.trackList.data = this._data;
         this.setSong(this._data[0]);
      }
      
      public function set url(param1:String) : void
      {
         this.view.visible = false;
         this.view.includeInLayout = false;
         if(this.netMng.available)
         {
            this.scloader.load(param1);
         }
      }
      
      private function setSong(param1:Object) : void
      {
         this.song = param1;
         this.stop();
         this.setContents();
      }
      
      private function setContents() : void
      {
         if(!this.view.trackWaveForm || !this._data)
         {
            return;
         }
         this.view.trackWaveForm.source = this.song.waveform_url;
         this.view.waveBgColor.color = 16777215;
         this.setSound();
      }
      
      private function waveImgLoadCompleteHandler(param1:Event) : void
      {
         this.view.waveBgColor.color = 6776679;
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = SCPlayer(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.netMng = NetworkManager.getInstance();
         this.logMng = LogManager.getInstance();
         this.scloader = new SoundCloudLoader();
         this.scloader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.loadCompleteHandler,false,0,true);
         this.scloader.addEventListener(ToneCentralEvents.LOAD_FAULT,this.loadFaultHandler,false,0,true);
         this.view.playButton.addEventListener(MouseEvent.CLICK,this.playClickHandler,false,0,true);
         this.view.trackWaveForm.addEventListener(Event.COMPLETE,this.waveImgLoadCompleteHandler,false,0,true);
         this.view.trackList.addEventListener(ToneCentralEvents.SELECT,this.trackSelectHandler,false,0,true);
         this.setContents();
      }
      
      override protected function onHide() : void
      {
         this.stop();
      }
      
      override protected function onVisibleHide() : void
      {
         this.stop();
      }
      
      private function loadFaultHandler(param1:ToneCentralEvents) : void
      {
         this.view.visible = false;
         this.view.includeInLayout = false;
      }
      
      private function loadCompleteHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:Object = this.scloader.data;
         var _loc3_:Array = _loc2_.tracks;
         this.data = _loc3_;
         this.view.visible = true;
         this.view.includeInLayout = true;
      }
      
      private function trackSelectHandler(param1:ToneCentralEvents) : void
      {
         this.setSong(this.view.trackList.selectedItem.data);
      }
      
      private function setSound() : void
      {
         this.pausePosition = 0;
         this.view.playTime.x = 100;
         var _loc1_:Graphics = this.view.playIndicator.graphics;
         _loc1_.clear();
         var _loc2_:String = this.song.stream_url + "?client_id=" + URLDefinition.SOUND_CLOUD_CLIENT_ID;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         this.sound = new Sound(_loc3_);
         this.sound.addEventListener(Event.COMPLETE,this.soundLoadCompleteHandler,false,0,true);
         this.sound.addEventListener(IOErrorEvent.IO_ERROR,this.soundLoadErrorHandler,false,0,true);
      }
      
      private function reset() : void
      {
         this.pausePosition = 0;
         this.view.playTime.x = 100;
         var _loc1_:Graphics = this.view.playIndicator.graphics;
         _loc1_.clear();
      }
      
      private function soundLoadCompleteHandler(param1:Event) : void
      {
         this.view.endTime.text = this.getPlayTime(this.sound.length);
      }
      
      private function getPlayTime(param1:Number) : String
      {
         var _loc2_:int = int(param1 / 60000);
         var _loc3_:int = int((param1 - _loc2_ * 60000) / 1000);
         var _loc4_:String = "";
         if(_loc2_ < 10)
         {
            _loc4_ += "0" + _loc2_;
         }
         else
         {
            _loc4_ += _loc2_.toString();
         }
         _loc4_ += ":";
         if(_loc3_ < 10)
         {
            _loc4_ += "0" + _loc3_;
         }
         else
         {
            _loc4_ += _loc3_.toString();
         }
         return _loc4_;
      }
      
      private function playClickHandler(param1:MouseEvent) : void
      {
         this.play();
         this.logMng.logSoundCloud(this.song.title);
      }
      
      private function play() : void
      {
         this.isPlaying = true;
         this.soundCh = this.sound.play(this.pausePosition);
         this.soundCh.addEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler,false,0,true);
         this.view.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
         this.view.playButton.enabled = false;
         this.view.stopButton.enabled = true;
         this.view.playButton.removeEventListener(MouseEvent.CLICK,this.playClickHandler);
         this.view.stopButton.addEventListener(MouseEvent.CLICK,this.stopHandler,false,0,true);
      }
      
      private function soundCompleteHandler(param1:Event) : void
      {
         this.stop();
         this.reset();
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         var _loc2_:Number = this.soundCh.position / this.sound.length * this.view.playIndicator.width;
         var _loc3_:Graphics = this.view.playIndicator.graphics;
         _loc3_.clear();
         _loc3_.beginFill(16711680,0.3);
         _loc3_.drawRect(0,0,_loc2_,this.view.playIndicator.height);
         _loc3_.endFill();
         _loc3_.lineStyle(1,16711680);
         _loc3_.moveTo(_loc2_,0);
         _loc3_.lineTo(_loc2_,this.view.playIndicator.height);
         this.view.playTime.text = this.getPlayTime(this.soundCh.position);
         this.view.playTime.x = _loc2_ + 100;
      }
      
      private function stopHandler(param1:MouseEvent) : void
      {
         this.stop();
      }
      
      private function stop() : void
      {
         this.isPlaying = false;
         if(this.soundCh)
         {
            this.pausePosition = this.soundCh.position;
            this.soundCh.stop();
         }
         this.view.playButton.enabled = true;
         this.view.stopButton.enabled = false;
         this.view.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.view.stopButton.removeEventListener(MouseEvent.CLICK,this.stopHandler);
         this.view.playButton.addEventListener(MouseEvent.CLICK,this.playClickHandler,false,0,true);
      }
      
      private function waveFormLoadErrorHandler(param1:IOErrorEvent) : void
      {
      }
      
      private function soundLoadErrorHandler(param1:IOErrorEvent) : void
      {
      }
   }
}

