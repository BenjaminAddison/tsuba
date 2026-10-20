package tonecentral.views.tccontents
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import mx.events.ResizeEvent;
   import tonecentral.common.data.TCPageData;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.common.manager.LogManager;
   import tonecentral.common.net.NetworkManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class TCInfoAreaLogic extends ToneCentralViewLogic
   {
      
      private var view:TCInfoArea;
      
      public var _pageData:TCPageData;
      
      private var player:Object;
      
      private var youtubeLoader:Loader;
      
      private var mediator:ToneCentralMediator;
      
      private var netMng:NetworkManager;
      
      private var logMng:LogManager;
      
      public function TCInfoAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = TCInfoArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.netMng = NetworkManager.getInstance();
         this.logMng = LogManager.getInstance();
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED,this.changeLanguageHandler,false,0,true);
         this.view.permaLinkButton.addEventListener(MouseEvent.CLICK,this.permaLinkButtonClickHandler,false,0,true);
         this.view.addEventListener(ResizeEvent.RESIZE,this.resizeHandler,false,0,true);
         this.view.youtubePlayButton.addEventListener(MouseEvent.CLICK,this.youtubePlayClickHandler,false,0,true);
         this.resizeHandler(null);
      }
      
      private function resizeHandler(param1:ResizeEvent) : void
      {
         var _loc2_:Number = NaN;
         this.view.playlistName.width = this.view.width - 300;
         this.view.container.width = this.view.width - 10;
         if(this.youtubeLoader)
         {
            _loc2_ = (this.view.container.width - 60) / this.youtubeLoader.width;
            this.youtubeLoader.width *= _loc2_;
            this.youtubeLoader.height *= _loc2_;
            this.view.youtubePlayer.width = this.youtubeLoader.width;
            this.view.youtubePlayer.height = this.youtubeLoader.height;
         }
      }
      
      override protected function onHide() : void
      {
         if(this.player)
         {
            this.player.stopVideo();
         }
      }
      
      private function changeLanguageHandler(param1:ToneCentralEvents) : void
      {
         this.setPageData();
      }
      
      private function onLoaderInit(param1:Event) : void
      {
         this.view.youtubePlayer.addChild(this.youtubeLoader);
         this.youtubeLoader.content.addEventListener("onReady",this.onPlayerReady,false,0,true);
         this.youtubeLoader.content.addEventListener("onError",this.onPlayerError,false,0,true);
         this.youtubeLoader.content.addEventListener("onStateChange",this.onPlayerStateChange,false,0,true);
         this.youtubeLoader.content.addEventListener("onPlaybackQualityChange",this.onVideoPlaybackQualityChange,false,0,true);
      }
      
      private function onPlayerReady(param1:Event) : void
      {
         this.player = this.youtubeLoader.content;
         this.player.autoplay = 0;
         this.player.setSize(this.view.container.width - 60,this.view.container.width / 4 * 3 - 60);
         this.view.youtubePlayer.width = this.view.container.width - 60;
         this.view.youtubePlayer.height = this.view.container.width / 4 * 3 - 60;
      }
      
      private function onPlayerError(param1:Event) : void
      {
      }
      
      private function onPlayerStateChange(param1:Event) : void
      {
      }
      
      private function onVideoPlaybackQualityChange(param1:Event) : void
      {
      }
      
      public function set pageData(param1:TCPageData) : void
      {
         var _loc3_:InfoTagItem = null;
         if(param1 == null)
         {
            this.view.visible = false;
            return;
         }
         this.view.visible = true;
         this._pageData = param1;
         this.view.scrollArea.verticalScrollBar.value = 0;
         this.setPageData();
         this.view.tagList.removeAllElements();
         var _loc2_:int = 0;
         while(_loc2_ < this._pageData.tags.length)
         {
            _loc3_ = new InfoTagItem();
            this.view.tagList.addElement(_loc3_);
            _loc3_.tagName = this._pageData.tags[_loc2_];
            _loc2_++;
         }
         this.view.tagArea.visible = true;
         this.view.validateNow();
         this.view.tagArea.height = this.view.tagList.rowCount * 30 + 15;
         this.view.tagArea.y = this.view.playlistTextLabel.y + this.view.playlistTextLabel.height + 20;
         if(this.netMng.available)
         {
            this.view.player.visible = true;
            this.view.player.includeInLayout = true;
         }
      }
      
      private function setPageData() : void
      {
         if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            this.setEnglishData();
         }
         else
         {
            this.setJapaneseData();
         }
      }
      
      private function setEnglishData() : void
      {
         var captionXML:XML = null;
         this.view.playlistName.text = this._pageData.titleEN;
         this.view.playlistDescLabel.styleName = "tcInfoDesc";
         this.view.playlistDescLabel.text = this._pageData.descriptionEN;
         this.view.playlistTextLabel.styleName = "tcInfoText";
         this.view.playlistTextLabel.text = this._pageData.textEN;
         this.view.playlistArtWork.source = "";
         this.view.playlistArtWork.source = this._pageData.imageEN;
         try
         {
            captionXML = XML("<root>" + this._pageData.captionEN + "</root>");
            this.view.patchDescTable.data = captionXML;
            this.view.patchDescTable.visible = true;
            this.view.patchDescTable.includeInLayout = true;
         }
         catch(e:Error)
         {
            view.patchDescTable.visible = false;
            view.patchDescTable.includeInLayout = false;
            LogManager.getInstance().logError("XML Parse Error",_pageData.captionEN);
         }
         if(this._pageData.youtubeurlEN == "")
         {
            if(this.player)
            {
               this.player.stopVideo();
            }
            this.view.youtubeArea.visible = false;
            this.view.youtubeArea.includeInLayout = false;
         }
         else
         {
            this.loadYouTubeThumb(this._pageData.youtubeThumbEN);
            this.view.youtubeArea.visible = true;
            this.view.youtubeArea.includeInLayout = true;
         }
         this.view.player.url = this._pageData.soundcloudurlEN;
      }
      
      private function setJapaneseData() : void
      {
         var captionXML:XML = null;
         this.view.playlistName.text = this._pageData.titleJA;
         this.view.playlistDescLabel.styleName = "tcInfoDescJP";
         this.view.playlistDescLabel.text = this._pageData.descriptionJA;
         this.view.playlistTextLabel.styleName = "tcInfoTextJP";
         this.view.playlistTextLabel.text = this._pageData.textJA;
         this.view.playlistArtWork.source = "";
         this.view.playlistArtWork.source = this._pageData.imageJA;
         try
         {
            captionXML = XML("<root>" + this._pageData.captionJA + "</root>");
            this.view.patchDescTable.data = captionXML;
            this.view.patchDescTable.visible = true;
            this.view.patchDescTable.includeInLayout = true;
         }
         catch(e:Error)
         {
            view.patchDescTable.visible = false;
            view.patchDescTable.includeInLayout = false;
            LogManager.getInstance().logError("XML Parse Error",_pageData.captionJA);
         }
         if(this._pageData.youtubeurlJA == "")
         {
            if(this.player)
            {
               this.player.stopVideo();
            }
            this.view.youtubeArea.visible = false;
            this.view.youtubeArea.includeInLayout = false;
         }
         else
         {
            this.loadYouTubeThumb(this._pageData.youtubeThumbJA);
            this.view.youtubeArea.visible = true;
            this.view.youtubeArea.includeInLayout = true;
         }
         this.view.player.url = this._pageData.soundcloudurlJA;
      }
      
      private function loadYouTubeThumb(param1:String) : void
      {
         this.view.youtubePlayer.removeChildren();
         this.youtubeLoader = new Loader();
         this.youtubeLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.youtubeThumbLoadCompleteHandler,false,0,true);
         this.youtubeLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.youtubeThumbLoadErrorHandler,false,0,true);
         this.youtubeLoader.load(new URLRequest(param1));
         this.youtubeLoader.addEventListener(MouseEvent.CLICK,this.youtubePlayClickHandler,false,0,true);
      }
      
      private function youtubeThumbLoadErrorHandler(param1:IOErrorEvent) : void
      {
         this.view.youtubePlayer.removeChildren();
         this.youtubeLoader = null;
         this.view.youtubeArea.visible = false;
      }
      
      private function youtubeThumbLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:Number = (this.view.container.width - 60) / this.youtubeLoader.width;
         this.youtubeLoader.width *= _loc2_;
         this.youtubeLoader.height *= _loc2_;
         this.view.youtubePlayer.width = this.youtubeLoader.width;
         this.view.youtubePlayer.height = this.youtubeLoader.height;
         this.view.youtubePlayer.addChild(this.youtubeLoader);
         this.view.youtubeArea.visible = true;
      }
      
      private function youtubePlayClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = null;
         if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc2_ = new URLRequest(this._pageData.permalinkEN + "#movies");
         }
         else
         {
            _loc2_ = new URLRequest(this._pageData.permalinkJA + "#movies");
         }
         navigateToURL(_loc2_);
         this.logMng.logYouTube("1");
      }
      
      private function loadYouTubePlayer(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         if(this.player)
         {
            this.player.stopVideo();
         }
         if(this.netMng.available)
         {
            _loc2_ = this._pageData.youtubeurlJA.split("/");
            _loc3_ = _loc2_[_loc2_.length - 1];
            param1 = URLDefinition.YOUTUBE_API + _loc3_ + "?version=3";
            if(this.player)
            {
               this.player.stopVideo();
            }
            if(this.youtubeLoader)
            {
               this.view.youtubePlayer.removeChild(this.youtubeLoader);
            }
            this.youtubeLoader = new Loader();
            this.youtubeLoader.contentLoaderInfo.addEventListener(Event.INIT,this.onLoaderInit,false,0,true);
            this.youtubeLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.errorHandler,false,0,true);
            this.youtubeLoader.load(new URLRequest(param1));
         }
         else
         {
            this.view.youtubePlayer.visible = false;
            this.view.youtubePlayer.includeInLayout = false;
         }
      }
      
      private function errorHandler(param1:IOErrorEvent) : void
      {
         this.youtubeLoader = null;
      }
      
      private function permaLinkButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = null;
         if(this._pageData)
         {
            if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
            {
               _loc2_ = new URLRequest(this._pageData.permalinkEN);
            }
            else
            {
               _loc2_ = new URLRequest(this._pageData.permalinkJA);
            }
            navigateToURL(_loc2_);
         }
      }
      
      public function changeEnablePermaLinkButton(param1:Boolean) : void
      {
         this.view.permaLinkButton.enabled = param1;
      }
   }
}

