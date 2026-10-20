package tonecentral.views.info
{
   import flash.desktop.NativeApplication;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.events.ResizeEvent;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.net.InfoLoader;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class InfoAreaLogic extends ToneCentralViewLogic
   {
      
      private var view:InfoArea;
      
      private var infoLoader:InfoLoader;
      
      public var infoCount:int = 0;
      
      private var listHeight:int = 0;
      
      private var mediator:ToneCentralMediator;
      
      public function InfoAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = InfoArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.infoCount = 0;
         this.listHeight = 0;
         this.view.addEventListener(ResizeEvent.RESIZE,this.resizeHandler,false,0,true);
         this.view.modalArea.addEventListener(MouseEvent.CLICK,this.modalAreaClickHandler,false,0,true);
         this.drawModal();
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED,this.languageSetting,false,0,true);
      }
      
      public function loadData() : void
      {
         this.infoCount = 0;
         this.listHeight = 0;
         this.view.infoList.removeAllElements();
         this.infoLoader = new InfoLoader();
         this.infoLoader.addEventListener(ToneCentralEvents.LOAD_COMPLETE,this.infoLoadCompleteHandler,false,0,true);
         this.infoLoader.load();
      }
      
      private function languageSetting(param1:Event) : void
      {
         var _loc3_:InfoItem = null;
         this.listHeight = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.infoCount)
         {
            _loc3_ = this.view.infoList.getElementAt(_loc2_) as InfoItem;
            this.listHeight += _loc3_.height;
            _loc2_++;
         }
         this.view.popupArea.height = this.listHeight + 6;
      }
      
      private function resizeHandler(param1:ResizeEvent) : void
      {
         this.drawModal();
      }
      
      private function modalAreaClickHandler(param1:MouseEvent) : void
      {
         this.view.visible = false;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.HIDE_INFO));
      }
      
      private function drawModal() : void
      {
         var _loc1_:Graphics = this.view.modalArea.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.4);
         _loc1_.drawRect(0,0,this.view.width,this.view.height);
         _loc1_.endFill();
      }
      
      private function infoLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         switch(this.mediator.ampModel)
         {
            case 0:
               this.createVersionInfo(this.mediator.updateXmlKatana50);
               this.createManualInfo(this.mediator.updateXmlKatana50,true);
               break;
            case 1:
               this.createVersionInfo(this.mediator.updateXmlKatana100);
               this.createManualInfo(this.mediator.updateXmlKatana100,true);
               break;
            case 2:
               this.createVersionInfo(this.mediator.updateXmlKatana100_212);
               this.createManualInfo(this.mediator.updateXmlKatana100_212,true);
               break;
            case 3:
               this.createVersionInfo(this.mediator.updateXmlKatanaHead);
               this.createManualInfo(this.mediator.updateXmlKatanaHead,true);
               break;
            case 4:
               this.createVersionInfo(this.mediator.updateXmlKatanaArtist);
               this.createManualInfo(this.mediator.updateXmlKatanaArtist,true);
         }
         this.view.popupArea.height = this.listHeight + 6;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE));
      }
      
      private function createVersionInfo(param1:XML) : void
      {
         var _loc2_:InfoItem = null;
         if(this.checkVersion(param1))
         {
            _loc2_ = new InfoItem();
            this.view.infoList.addElement(_loc2_);
            _loc2_.data = {
               "date":String(param1.app.date),
               "descJP":String(param1.app.description_jp),
               "descEN":String(param1.app.description_en),
               "urlJP":String(param1.app.url_jp),
               "urlEN":String(param1.app.url_en)
            };
            ++this.infoCount;
            this.listHeight += _loc2_.height;
         }
      }
      
      private function createManualInfo(param1:XML, param2:Boolean) : void
      {
         var _loc3_:InfoItem = null;
         if(this.checkManualVersion(param1,param2))
         {
            _loc3_ = new InfoItem();
            _loc3_.isManual = true;
            this.view.infoList.addElement(_loc3_);
            _loc3_.data = {
               "date":String(param1.manual.date),
               "descJP":String(param1.manual.description_jp),
               "descEN":String(param1.manual.description_en),
               "urlJP":String(param1.manual.url_jp),
               "urlEN":String(param1.manual.url_en)
            };
            ++this.infoCount;
            this.listHeight += _loc3_.height;
         }
      }
      
      private function checkManualVersion(param1:XML, param2:Boolean) : Boolean
      {
         var _loc3_:String = null;
         var _loc5_:String = null;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA50;
               break;
            case 1:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA100;
               break;
            case 2:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA100_212;
               break;
            case 3:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA_HEAD;
               break;
            case 4:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA_ARTIST;
         }
         var _loc4_:Object = SharedObjectUtil.get(_loc3_);
         if(_loc4_)
         {
            _loc5_ = _loc4_.version;
         }
         else
         {
            _loc5_ = "0";
         }
         var _loc6_:String = String(param1.manual.date);
         switch(this.mediator.ampModel)
         {
            case 0:
               this.mediator.manualUpdateKatana50 = _loc5_ < _loc6_;
               break;
            case 1:
               this.mediator.manualUpdateKatana100 = _loc5_ < _loc6_;
               break;
            case 2:
               this.mediator.manualUpdateKatana100_212 = _loc5_ < _loc6_;
               break;
            case 3:
               this.mediator.manualUpdateKatanaHead = _loc5_ < _loc6_;
               break;
            case 4:
               this.mediator.manualUpdateKatanaArtist = _loc5_ < _loc6_;
         }
         return _loc5_ < _loc6_;
      }
      
      private function checkVersion(param1:XML) : Boolean
      {
         var _loc2_:int = this.toInt(this.getThisVersion());
         var _loc3_:int = this.toInt(String(param1.app.version));
         return _loc2_ < _loc3_;
      }
      
      private function toInt(param1:String) : int
      {
         var _loc2_:Array = param1.split(".");
         if(_loc2_.length == 4)
         {
            _loc2_.pop();
         }
         var _loc3_:Number = parseInt(_loc2_[0]) * 10000;
         var _loc4_:Number = parseInt(_loc2_[1]) * 100;
         var _loc5_:Number = parseInt(_loc2_[2]);
         return _loc3_ + _loc4_ + _loc5_;
      }
      
      public function getThisVersion() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::versionNumber;
      }
   }
}

