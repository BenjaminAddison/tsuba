package tonecentral.components.setting
{
   import com.adobe.utils.LocaleUtil;
   import jp.co.site4d.infrastructure.so.SharedObjectUtil;
   import mx.collections.ArrayCollection;
   import mx.resources.ResourceManager;
   import spark.events.IndexChangeEvent;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class LanguageSettingLogic extends ToneCentralViewLogic
   {
      
      private var view:LanguageSetting;
      
      private var mediator:ToneCentralMediator;
      
      private var language:String;
      
      public function LanguageSettingLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LanguageSetting(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.setLangList();
         this.mediator = ToneCentralMediator.getInstance();
         this.view.language.addEventListener(IndexChangeEvent.CHANGE,this.settingHandler,false,0,true);
         this.loadCurrentLangSetting();
      }
      
      private function setLangList() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem({
            "name":ResourceManager.getInstance().getString("resource","setting.language.en"),
            "val":"0"
         });
         _loc1_.addItem({
            "name":ResourceManager.getInstance().getString("resource","setting.language.jp"),
            "val":"1"
         });
         this.view.language.dataProvider = _loc1_;
      }
      
      private function loadCurrentLangSetting() : void
      {
         var _loc1_:String = this.mediator.conf.confLanguage;
         var _loc2_:int = ToneCentralDefinition.LANG_TYPE.indexOf(_loc1_);
         if(_loc2_ != -1)
         {
            this.view.language.selectedIndex = _loc2_;
         }
      }
      
      private function settingHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:int = Number(this.view.language.selectedItem.val);
         this.language = ToneCentralDefinition.LANG_TYPE[_loc2_];
         this.mediator.conf.confLanguage = this.language;
         var _loc3_:Array = [this.language];
         var _loc4_:Array = LocaleUtil.sortLanguagesByPreference(ToneCentralDefinition.LANG_TYPE,_loc3_,ToneCentralDefinition.LANG_TYPE[0]);
         ResourceManager.getInstance().localeChain = _loc4_;
         this.view.callLater(this.reset);
         SharedObjectUtil.set(ToneCentralDefinition.CONF_LANGUAGE,this.language);
         this.mediator.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED));
      }
      
      private function reset() : void
      {
         this.setLangList();
         this.loadCurrentLangSetting();
         this.view.language.styleName = ResourceManager.getInstance().getString("resource","setting.dropdown.style");
      }
   }
}

