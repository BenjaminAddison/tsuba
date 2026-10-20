package com.adobe.utils
{
   internal final class LocaleId
   {
      
      private var privateLangs:Boolean = false;
      
      private var script:String = "";
      
      private var variants:Array = [];
      
      private var privates:Array = [];
      
      private var extensions:Object = {};
      
      private var lang:String = "";
      
      private var region:String = "";
      
      private var extended_langs:Array = [];
      
      public function LocaleId()
      {
         super();
      }
      
      public static function fromString(param1:String) : LocaleId
      {
         var _loc5_:Array = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc2_:LocaleId = new LocaleId();
         var _loc3_:int = LocaleParserState.PRIMARY_LANGUAGE;
         var _loc4_:Array = param1.replace(/-/g,"_").split("_");
         var _loc6_:int = 0;
         var _loc7_:int = int(_loc4_.length);
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc4_[_loc6_].toLowerCase();
            if(_loc3_ == LocaleParserState.PRIMARY_LANGUAGE)
            {
               if(_loc8_ == "x")
               {
                  _loc2_.privateLangs = true;
               }
               else if(_loc8_ == "i")
               {
                  _loc2_.lang += "i-";
               }
               else
               {
                  _loc2_.lang += _loc8_;
                  _loc3_++;
               }
            }
            else
            {
               _loc9_ = _loc8_.length;
               if(_loc9_ != 0)
               {
                  _loc10_ = _loc8_.charAt(0).toLowerCase();
                  if(_loc3_ <= LocaleParserState.EXTENDED_LANGUAGES && _loc9_ == 3)
                  {
                     _loc2_.extended_langs.push(_loc8_);
                     if(_loc2_.extended_langs.length == 3)
                     {
                        _loc3_ = LocaleParserState.SCRIPT;
                     }
                  }
                  else if(_loc3_ <= LocaleParserState.SCRIPT && _loc9_ == 4)
                  {
                     _loc2_.script = _loc8_;
                     _loc3_ = LocaleParserState.REGION;
                  }
                  else if(_loc3_ <= LocaleParserState.REGION && (_loc9_ == 2 || _loc9_ == 3))
                  {
                     _loc2_.region = _loc8_;
                     _loc3_ = LocaleParserState.VARIANTS;
                  }
                  else if(_loc3_ <= LocaleParserState.VARIANTS && (_loc10_ >= "a" && _loc10_ <= "z" && _loc9_ >= 5 || _loc10_ >= "0" && _loc10_ <= "9" && _loc9_ >= 4))
                  {
                     _loc2_.variants.push(_loc8_);
                     _loc3_ = LocaleParserState.VARIANTS;
                  }
                  else if(_loc3_ < LocaleParserState.PRIVATES && _loc9_ == 1)
                  {
                     if(_loc8_ == "x")
                     {
                        _loc3_ = LocaleParserState.PRIVATES;
                        _loc5_ = _loc2_.privates;
                     }
                     else
                     {
                        _loc3_ = LocaleParserState.EXTENSIONS;
                        _loc5_ = _loc2_.extensions[_loc8_] || [];
                        _loc2_.extensions[_loc8_] = _loc5_;
                     }
                  }
                  else if(_loc3_ >= LocaleParserState.EXTENSIONS)
                  {
                     _loc5_.push(_loc8_);
                  }
               }
            }
            _loc6_++;
         }
         _loc2_.canonicalize();
         return _loc2_;
      }
      
      public function equals(param1:LocaleId) : Boolean
      {
         return this.toString() == param1.toString();
      }
      
      public function canonicalize() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.extensions)
         {
            if(this.extensions.hasOwnProperty(_loc1_))
            {
               if(this.extensions[_loc1_].length == 0)
               {
                  delete this.extensions[_loc1_];
               }
               else
               {
                  this.extensions[_loc1_] = this.extensions[_loc1_].sort();
               }
            }
         }
         this.extended_langs = this.extended_langs.sort();
         this.variants = this.variants.sort();
         this.privates = this.privates.sort();
         if(this.script == "")
         {
            this.script = LocaleRegistry.getScriptByLang(this.lang);
         }
         if(this.script == "" && this.region != "")
         {
            this.script = LocaleRegistry.getScriptByLangAndRegion(this.lang,this.region);
         }
         if(this.region == "" && this.script != "")
         {
            this.region = LocaleRegistry.getDefaultRegionForLangAndScript(this.lang,this.script);
         }
      }
      
      public function toString() : String
      {
         var _loc2_:String = null;
         var _loc1_:Array = [this.lang];
         Array.prototype.push.apply(_loc1_,this.extended_langs);
         if(this.script != "")
         {
            _loc1_.push(this.script);
         }
         if(this.region != "")
         {
            _loc1_.push(this.region);
         }
         Array.prototype.push.apply(_loc1_,this.variants);
         for(_loc2_ in this.extensions)
         {
            if(this.extensions.hasOwnProperty(_loc2_))
            {
               _loc1_.push(_loc2_);
               Array.prototype.push.apply(_loc1_,this.extensions[_loc2_]);
            }
         }
         if(this.privates.length > 0)
         {
            _loc1_.push("x");
            Array.prototype.push.apply(_loc1_,this.privates);
         }
         return _loc1_.join("_");
      }
      
      public function isSiblingOf(param1:LocaleId) : Boolean
      {
         return this.lang == param1.lang && this.script == param1.script;
      }
      
      public function transformToParent() : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         if(this.privates.length > 0)
         {
            this.privates.splice(this.privates.length - 1,1);
            return true;
         }
         var _loc1_:String = null;
         for(_loc2_ in this.extensions)
         {
            if(this.extensions.hasOwnProperty(_loc2_))
            {
               _loc1_ = _loc2_;
            }
         }
         if(_loc1_)
         {
            _loc3_ = this.extensions[_loc1_];
            if(_loc3_.length == 1)
            {
               delete this.extensions[_loc1_];
               return true;
            }
            _loc3_.splice(_loc3_.length - 1,1);
            return true;
         }
         if(this.variants.length > 0)
         {
            this.variants.splice(this.variants.length - 1,1);
            return true;
         }
         if(this.script != "")
         {
            if(LocaleRegistry.getScriptByLang(this.lang) != "")
            {
               this.script = "";
               return true;
            }
            if(this.region == "")
            {
               _loc4_ = LocaleRegistry.getDefaultRegionForLangAndScript(this.lang,this.script);
               if(_loc4_ != "")
               {
                  this.region = _loc4_;
                  this.script = "";
                  return true;
               }
            }
         }
         if(this.region != "")
         {
            if(!(this.script == "" && LocaleRegistry.getScriptByLang(this.lang) == ""))
            {
               this.region = "";
               return true;
            }
         }
         if(this.extended_langs.length > 0)
         {
            this.extended_langs.splice(this.extended_langs.length - 1,1);
            return true;
         }
         return false;
      }
   }
}

