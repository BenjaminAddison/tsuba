package tonecentral.views.info
{
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flashx.textLayout.conversion.TextConverter;
   import tonecentral.common.define.ToneCentralDefinition;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.Setting;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class InfoItemLogic extends ToneCentralViewLogic
   {
      
      private var view:InfoItem;
      
      private var _isManual:Boolean;
      
      private var _data:Object;
      
      private var mediator:ToneCentralMediator;
      
      public function InfoItemLogic()
      {
         super();
      }
      
      public function set isManual(param1:Boolean) : void
      {
         this._isManual = param1;
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = InfoItem(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.addEventListener(ToneCentralEvents.SETTING_LANGUAGE_COMPLETED,this.languageSetting,false,0,true);
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         this.view.dateLabel.text = this.formatDate(param1.date);
         this.setDescription();
         this.drawBG();
         this.drawButton();
         this.view.outLinkButton.addEventListener(MouseEvent.CLICK,this.outLinkClickHandler,false,0,true);
      }
      
      private function languageSetting(param1:ToneCentralEvents) : void
      {
         this.setDescription();
         this.drawBG();
         this.drawButton();
      }
      
      private function setDescription() : void
      {
         if(ToneCentralMediator.getInstance().conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
         {
            this.view.descLabel.textFlow = TextConverter.importToFlow(this._data.descEN,TextConverter.TEXT_FIELD_HTML_FORMAT);
         }
         else
         {
            this.view.descLabel.textFlow = TextConverter.importToFlow(this._data.descJP,TextConverter.TEXT_FIELD_HTML_FORMAT);
         }
         this.view.validateNow();
         this.view.height = this.view.descLabel.y + this.view.descLabel.height + 10;
      }
      
      private function outLinkClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Setting = null;
         var _loc3_:URLRequest = null;
         if(this._isManual)
         {
            _loc2_ = new Setting();
            _loc2_.popup(Context.dialogMng.parent,true);
            _loc2_.setSelectManual();
         }
         else
         {
            _loc3_ = new URLRequest();
            if(ToneCentralMediator.getInstance().conf.confLanguage == ToneCentralDefinition.LANG_TYPE[0])
            {
               _loc3_.url = this._data.urlEN;
            }
            else
            {
               _loc3_.url = this._data.urlJP;
            }
            navigateToURL(_loc3_);
         }
      }
      
      private function drawButton() : void
      {
         var _loc1_:Graphics = this.view.outLinkButton.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,60,this.view.height);
         _loc1_.endFill();
      }
      
      private function drawBG() : void
      {
         var _loc1_:Graphics = this.view.bg.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,0);
         _loc1_.moveTo(0,this.view.height);
         _loc1_.lineTo(this.view.width,this.view.height);
         _loc1_.lineStyle(1,3092271);
         _loc1_.moveTo(this.view.width - 60,0);
         _loc1_.lineTo(this.view.width - 60,this.view.height);
      }
      
      private function formatDate(param1:String) : String
      {
         var _loc2_:Array = param1.split("/");
         var _loc3_:int = int(_loc2_[0]);
         var _loc4_:int = int(_loc2_[1] - 1);
         var _loc5_:int = int(_loc2_[2].split(" ")[0]);
         var _loc6_:Date = new Date(_loc3_,_loc4_,_loc5_);
         return this.getDateString(_loc6_.getDay()) + "." + _loc5_ + " " + this.getMonthString(_loc6_.getMonth()) + "." + _loc6_.getFullYear();
      }
      
      private function getMonthString(param1:Number) : String
      {
         switch(param1)
         {
            case 0:
               return "Jan";
            case 1:
               return "Feb";
            case 2:
               return "Mar";
            case 3:
               return "Apr";
            case 4:
               return "May";
            case 5:
               return "Jun";
            case 6:
               return "July";
            case 7:
               return "Aug";
            case 8:
               return "Sept";
            case 9:
               return "Oct";
            case 10:
               return "Nov";
            case 10:
               return "Dec";
            default:
               return "";
         }
      }
      
      private function getDateString(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return "SUN";
            case 1:
               return "MON";
            case 2:
               return "TUE";
            case 3:
               return "WED";
            case 4:
               return "THU";
            case 5:
               return "FRI";
            default:
               return "SAT";
         }
      }
   }
}

