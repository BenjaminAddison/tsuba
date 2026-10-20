package tonecentral.components.setting
{
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.net.ManualLoader;
   import tonecentral.common.net.NetworkManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class ManualSettingLogic extends ToneCentralViewLogic
   {
      
      private var view:ManualSetting;
      
      private var mediator:ToneCentralMediator;
      
      private var manualLoader:ManualLoader;
      
      public function ManualSettingLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = ManualSetting(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.SETTING_OK,this.settingHandler,false,0,true);
         this.view.reference.addEventListener(MouseEvent.CLICK,this.referenceClickHandler,false,0,true);
         this.setManualData();
      }
      
      private function setManualData() : void
      {
         var _loc1_:Object = null;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA50);
               break;
            case 1:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA100);
               break;
            case 2:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA100_212);
               break;
            case 3:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA_HEAD);
               break;
            case 4:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA_ARTIST);
         }
      }
      
      private function formatUpdate(param1:String) : String
      {
         return param1.split(" ")[0];
      }
      
      private function referenceClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc2_ = this.mediator.manualUpdateKatana50;
               break;
            case 1:
               _loc2_ = this.mediator.manualUpdateKatana100;
               break;
            case 2:
               _loc2_ = this.mediator.manualUpdateKatana100_212;
               break;
            case 3:
               _loc2_ = this.mediator.manualUpdateKatanaHead;
               break;
            case 4:
               _loc2_ = this.mediator.manualUpdateKatanaArtist;
         }
         if(_loc2_)
         {
            this.view.reference.enabled = false;
            this.manualLoader = new ManualLoader();
            this.manualLoader.addEventListener(ToneCentralEvents.MANUAL_LOAD_COMPLETE,this.manualLoadCompleteHandler,false,0,true);
            this.manualLoader.addEventListener(ToneCentralEvents.MANUAL_LOAD_FAULT,this.manualLoadfaultHandler,false,0,true);
            this.manualLoader.load();
         }
         else if(!NetworkManager.getInstance().available)
         {
            this.openFileUnconnectedNetwork();
         }
         else
         {
            this.openFile();
         }
      }
      
      private function manualLoadCompleteHandler(param1:ToneCentralEvents) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA50;
               _loc2_ = this.mediator.updateXmlKatana50;
               this.mediator.manualUpdateKatana50 = false;
               break;
            case 1:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA100;
               _loc2_ = this.mediator.updateXmlKatana100;
               this.mediator.manualUpdateKatana100 = false;
               break;
            case 2:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA100_212;
               _loc2_ = this.mediator.updateXmlKatana100_212;
               this.mediator.manualUpdateKatana100_212 = false;
               break;
            case 3:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA_HEAD;
               _loc2_ = this.mediator.updateXmlKatanaHead;
               this.mediator.manualUpdateKatanaHead = false;
               break;
            case 4:
               _loc3_ = ToneCentralDefinition.MANUAL_VERSION_KATANA_ARTIST;
               _loc2_ = this.mediator.updateXmlKatanaArtist;
               this.mediator.manualUpdateKatanaArtist = false;
         }
         this.view.reference.enabled = true;
         this.manualLoader.removeEventListener(ToneCentralEvents.MANUAL_LOAD_COMPLETE,this.manualLoadCompleteHandler);
         this.manualLoader.removeEventListener(ToneCentralEvents.MANUAL_LOAD_FAULT,this.manualLoadfaultHandler);
         var _loc4_:String = String(_loc2_.manual.date);
         SharedObjectUtil.set(_loc3_,{
            "version":String(_loc2_.manual.date),
            "filename_en":String(_loc2_.manual.filename_en),
            "filename_jp":String(_loc2_.manual.filename_jp)
         });
         this.openFile();
      }
      
      private function manualLoadfaultHandler(param1:ToneCentralEvents) : void
      {
         this.view.reference.enabled = true;
         this.manualLoader.removeEventListener(ToneCentralEvents.MANUAL_LOAD_COMPLETE,this.manualLoadCompleteHandler);
         this.manualLoader.removeEventListener(ToneCentralEvents.MANUAL_LOAD_FAULT,this.manualLoadfaultHandler);
         this.openFileUnconnectedNetwork();
      }
      
      private function openFileUnconnectedNetwork() : void
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:File = null;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA50);
               break;
            case 1:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA100);
               break;
            case 2:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA100_212);
               break;
            case 3:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA_HEAD);
               break;
            case 4:
               _loc1_ = SharedObjectUtil.get(ToneCentralDefinition.MANUAL_VERSION_KATANA_ARTIST);
         }
         if(_loc1_)
         {
            if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
            {
               _loc2_ = String(_loc1_.filename_en);
            }
            else if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[1])
            {
               _loc2_ = String(_loc1_.filename_jp);
            }
            _loc3_ = new File(File.applicationStorageDirectory.nativePath + "/" + _loc2_);
            _loc3_.openWithDefaultApplication();
         }
      }
      
      private function openFile() : void
      {
         var _loc1_:XML = null;
         var _loc2_:String = null;
         switch(this.mediator.ampModel)
         {
            case 0:
               _loc1_ = this.mediator.updateXmlKatana50;
               break;
            case 1:
               _loc1_ = this.mediator.updateXmlKatana100;
               break;
            case 2:
               _loc1_ = this.mediator.updateXmlKatana100_212;
               break;
            case 3:
               _loc1_ = this.mediator.updateXmlKatanaHead;
               break;
            case 4:
               _loc1_ = this.mediator.updateXmlKatanaArtist;
         }
         if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            _loc2_ = String(_loc1_.manual.filename_en);
         }
         else if(this.mediator.conf.confLanguage == ToneCentralDefinition.LANG_TYPE[1])
         {
            _loc2_ = String(_loc1_.manual.filename_jp);
         }
         var _loc3_:File = new File(File.applicationStorageDirectory.nativePath + "/" + _loc2_);
         if(_loc3_.exists)
         {
            _loc3_.openWithDefaultApplication();
         }
         else
         {
            this.view.reference.enabled = false;
            this.manualLoader = new ManualLoader();
            this.manualLoader.addEventListener(ToneCentralEvents.MANUAL_LOAD_COMPLETE,this.manualLoadCompleteHandler,false,0,true);
            this.manualLoader.addEventListener(ToneCentralEvents.MANUAL_LOAD_FAULT,this.manualLoadfaultHandler,false,0,true);
            this.manualLoader.load();
         }
      }
      
      private function settingHandler(param1:ToneCentralEvents) : void
      {
         if(param1.data != SystemSettingDefinitionGT.MANUAL)
         {
            return;
         }
      }
   }
}

