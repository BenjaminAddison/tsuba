package tonecentral.common.net
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import tonecentral.common.data.TCPageData;
   import tonecentral.common.define.URLDefinition;
   import tonecentral.events.ToneCentralEvents;
   
   public class DataAPILoader extends EventDispatcher
   {
      
      private var loader:URLLoader;
      
      private var pickupLoader:URLLoader;
      
      private var promotionLoader:URLLoader;
      
      private var pickupData:Array = [];
      
      private var promotionData:Array = [];
      
      public function DataAPILoader(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function loadEntry() : void
      {
         this.pickupLoader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = URLDefinition.TC_PICKUP_URL;
         this.pickupLoader.addEventListener(Event.COMPLETE,this.pickupLoadCompleteHandler,false,0,true);
         this.pickupLoader.addEventListener(IOErrorEvent.IO_ERROR,this.pickupLoadFaultHandler,false,0,true);
         this.pickupLoader.load(_loc1_);
      }
      
      private function pickupLoadFaultHandler(param1:IOErrorEvent) : void
      {
         var _loc3_:FileStream = null;
         var _loc4_:String = null;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("tc/pickup.json");
         if(_loc2_.exists)
         {
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.READ);
            _loc4_ = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
            _loc3_.close();
            this.pickupData = JSON.parse(_loc4_).pickup;
            this.promotionLoad();
            return;
         }
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
      
      private function pickupLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:Object = JSON.parse(this.pickupLoader.data.toString());
         if(_loc2_)
         {
            this.pickupData = _loc2_.pickup;
         }
         var _loc3_:File = File.applicationStorageDirectory.resolvePath("tc/pickup.json");
         var _loc4_:FileStream = new FileStream();
         _loc4_.open(_loc3_,FileMode.WRITE);
         _loc4_.writeUTFBytes(this.pickupLoader.data.toString());
         _loc4_.close();
         this.promotionLoad();
      }
      
      private function promotionLoad() : void
      {
         this.promotionLoader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = URLDefinition.TC_PROMOTION_URL;
         this.promotionLoader.addEventListener(Event.COMPLETE,this.promotionLoadCompleteHandler,false,0,true);
         this.promotionLoader.addEventListener(IOErrorEvent.IO_ERROR,this.promotionLoadFaultHandler,false,0,true);
         this.promotionLoader.load(_loc1_);
      }
      
      private function promotionLoadFaultHandler(param1:IOErrorEvent) : void
      {
         var _loc3_:FileStream = null;
         var _loc4_:String = null;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("tc/promotion.json");
         if(_loc2_.exists)
         {
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.READ);
            _loc4_ = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
            _loc3_.close();
            this.promotionData = JSON.parse(_loc4_).pickup;
         }
         this.entryLoad();
      }
      
      private function promotionLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:Object = JSON.parse(this.promotionLoader.data.toString());
         if(_loc2_)
         {
            this.promotionData = _loc2_.pickup;
         }
         var _loc3_:File = File.applicationStorageDirectory.resolvePath("tc/promotion.json");
         var _loc4_:FileStream = new FileStream();
         _loc4_.open(_loc3_,FileMode.WRITE);
         _loc4_.writeUTFBytes(this.promotionLoader.data.toString());
         _loc4_.close();
         this.entryLoad();
      }
      
      private function entryLoad() : void
      {
         this.loader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = URLDefinition.DATA_API_URL;
         var _loc2_:URLVariables = new URLVariables();
         _loc1_.data = _loc2_;
         this.loader.addEventListener(Event.COMPLETE,this.entryLoadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.entryLoadFaultHandler,false,0,true);
         this.loader.load(_loc1_);
      }
      
      private function entryLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:Object = JSON.parse(this.loader.data.toString());
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE);
         _loc3_.data = this.createData(_loc2_);
         dispatchEvent(_loc3_);
         var _loc4_:File = File.applicationStorageDirectory.resolvePath("tc/entries.json");
         var _loc5_:FileStream = new FileStream();
         _loc5_.open(_loc4_,FileMode.WRITE);
         _loc5_.writeUTFBytes(this.loader.data.toString());
         _loc5_.close();
      }
      
      private function entryLoadFaultHandler(param1:IOErrorEvent) : void
      {
         var _loc3_:FileStream = null;
         var _loc4_:String = null;
         var _loc5_:ToneCentralEvents = null;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("tc/entries.json");
         if(_loc2_.exists)
         {
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.READ);
            _loc4_ = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
            _loc3_.close();
            _loc5_ = new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE);
            _loc5_.data = this.createData(JSON.parse(_loc4_));
            dispatchEvent(_loc5_);
         }
         else
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
         }
      }
      
      public function loadTags() : void
      {
         this.loader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = URLDefinition.TC_TAGS_URL;
         this.loader.addEventListener(Event.COMPLETE,this.tagsLoadCompleteHandler,false,0,true);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.tagsLoadFaultHandler,false,0,true);
         this.loader.load(_loc1_);
      }
      
      private function tagsLoadFaultHandler(param1:IOErrorEvent) : void
      {
         var _loc3_:FileStream = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:ToneCentralEvents = null;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("tc/tags.json");
         if(_loc2_.exists)
         {
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.READ);
            _loc4_ = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
            _loc3_.close();
            _loc5_ = JSON.parse(_loc4_);
            _loc6_ = new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE);
            _loc6_.data = _loc5_;
            dispatchEvent(_loc6_);
         }
         else
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
         }
      }
      
      private function tagsLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:Object = JSON.parse(this.loader.data.toString());
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LOAD_COMPLETE);
         _loc3_.data = _loc2_;
         dispatchEvent(_loc3_);
         var _loc4_:File = File.applicationStorageDirectory.resolvePath("tc/tags.json");
         var _loc5_:FileStream = new FileStream();
         _loc5_.open(_loc4_,FileMode.WRITE);
         _loc5_.writeUTFBytes(this.loader.data.toString());
         _loc5_.close();
      }
      
      private function createData(param1:Object) : Vector.<TCPageData>
      {
         var _loc5_:Object = null;
         var _loc6_:TCPageData = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc2_:Vector.<TCPageData> = new Vector.<TCPageData>();
         if(!param1.items)
         {
            return _loc2_;
         }
         var _loc3_:Array = param1.items;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = new TCPageData();
            _loc6_.date = _loc5_.date;
            _loc6_.modifiedDate = _loc5_.modifiedDate;
            _loc6_.basename = _loc5_.basename;
            _loc6_.permalinkEN = URLDefinition.TC_PERMALINK_EN + _loc5_.basename + "/";
            _loc6_.permalinkJA = URLDefinition.TC_PERMALINK_JP + _loc5_.basename + "/";
            _loc6_.entryId = _loc5_.id;
            _loc6_.tags = _loc5_.tags;
            _loc6_.livesetURL = URLDefinition.LIVESET_DL_URL + _loc5_.basename + ".tsl";
            _loc7_ = _loc5_.customFields;
            _loc8_ = 0;
            while(_loc8_ < _loc7_.length)
            {
               if(_loc5_.customFields[_loc8_].basename == "title_en")
               {
                  _loc6_.titleEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "title_ja")
               {
                  _loc6_.titleJA = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "description_en")
               {
                  _loc6_.descriptionEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "description_ja")
               {
                  _loc6_.descriptionJA = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "image_en")
               {
                  _loc6_.imageEN = this.getImageURL(_loc5_.customFields[_loc8_].value);
               }
               else if(_loc5_.customFields[_loc8_].basename == "image_ja")
               {
                  _loc6_.imageJA = this.getImageURL(_loc5_.customFields[_loc8_].value);
               }
               else if(_loc5_.customFields[_loc8_].basename == "text_en")
               {
                  _loc6_.textEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "text_ja")
               {
                  _loc6_.textJA = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "soundcloudurl_en")
               {
                  _loc6_.soundcloudurlEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "soundcloudurl_ja")
               {
                  _loc6_.soundcloudurlJA = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "youtubeurl_en")
               {
                  _loc6_.youtubeurlEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "youtubeurl_ja")
               {
                  _loc6_.youtubeurlJA = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "youtubethumburl_en")
               {
                  _loc6_.youtubeThumbEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "youtubethumburl_ja")
               {
                  _loc6_.youtubeThumbJA = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "caption_en")
               {
                  _loc6_.captionEN = _loc5_.customFields[_loc8_].value;
               }
               else if(_loc5_.customFields[_loc8_].basename == "caption_ja")
               {
                  _loc6_.captionJA = _loc5_.customFields[_loc8_].value;
               }
               _loc8_++;
            }
            _loc2_.push(_loc6_);
            _loc4_++;
         }
         this.checkPickUpAndPromotion(_loc2_);
         return _loc2_;
      }
      
      private function checkPickUpAndPromotion(param1:Vector.<TCPageData>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this.pickupData.length)
            {
               if(param1[_loc2_].permalinkEN == this.pickupData[_loc3_].url_en)
               {
                  param1[_loc2_].pickup = true;
                  break;
               }
               _loc3_++;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this.promotionData.length)
            {
               if(param1[_loc2_].permalinkEN == this.promotionData[_loc3_].url_en)
               {
                  param1[_loc2_].promotion = true;
                  break;
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      private function getImageURL(param1:String) : String
      {
         var _loc2_:int = param1.indexOf("http://");
         var _loc3_:int = param1.indexOf(".png") + 4;
         var _loc4_:String = param1.substring(_loc2_,_loc3_);
         return _loc4_.replace("%2C",",");
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.LOAD_FAULT));
      }
   }
}

