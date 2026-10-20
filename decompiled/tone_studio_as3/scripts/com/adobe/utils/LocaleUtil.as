package com.adobe.utils
{
   public final class LocaleUtil
   {
      
      public function LocaleUtil()
      {
         super();
      }
      
      public static function sortLanguagesByPreference(param1:Array, param2:Array, param3:String = null, param4:Boolean = false) : Array
      {
         var result:Array = null;
         var haveLocale:Object = null;
         var i:int = 0;
         var j:int = 0;
         var l:int = 0;
         var k:int = 0;
         var locale:String = null;
         var found:Boolean = false;
         var plocale:LocaleId = null;
         var appLocales:Array = param1;
         var systemPreferences:Array = param2;
         var ultimateFallbackLocale:String = param3;
         var addAll:Boolean = param4;
         var prepare:Function = function(param1:Array):Array
         {
            var _loc2_:Array = [];
            var _loc3_:int = 0;
            var _loc4_:int = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_.push(param1[_loc3_].toLowerCase().replace(/-/g,"_"));
               _loc3_++;
            }
            return _loc2_;
         };
         var promote:Function = function(param1:String):void
         {
            if(typeof haveLocale[param1] != "undefined")
            {
               result.push(appLocales[haveLocale[param1]]);
               delete haveLocale[param1];
            }
         };
         result = [];
         haveLocale = {};
         var locales:Array = prepare(appLocales);
         var preferenceLocales:Array = prepare(systemPreferences);
         if(Boolean(ultimateFallbackLocale) && ultimateFallbackLocale != "")
         {
            ultimateFallbackLocale = ultimateFallbackLocale.toLowerCase().replace(/-/g,"_");
            found = false;
            i = 0;
            l = int(preferenceLocales.length);
            while(i < l)
            {
               if(preferenceLocales[i] == ultimateFallbackLocale)
               {
                  found = true;
               }
               i++;
            }
            if(!found)
            {
               preferenceLocales.push(ultimateFallbackLocale);
            }
         }
         j = 0;
         k = int(locales.length);
         while(j < k)
         {
            haveLocale[locales[j]] = j;
            j++;
         }
         i = 0;
         l = int(preferenceLocales.length);
         while(i < l)
         {
            plocale = LocaleId.fromString(preferenceLocales[i]);
            promote(preferenceLocales[i]);
            promote(plocale.toString());
            while(plocale.transformToParent())
            {
               promote(plocale.toString());
            }
            plocale = LocaleId.fromString(preferenceLocales[i]);
            j = 0;
            while(j < l)
            {
               locale = preferenceLocales[j];
               if(plocale.isSiblingOf(LocaleId.fromString(locale)))
               {
                  promote(locale);
               }
               j++;
            }
            j = 0;
            k = int(locales.length);
            while(j < k)
            {
               locale = locales[j];
               if(plocale.isSiblingOf(LocaleId.fromString(locale)))
               {
                  promote(locale);
               }
               j++;
            }
            i++;
         }
         addAll = "boolean" == "undefined" ? true : addAll;
         if(addAll)
         {
            j = 0;
            k = int(locales.length);
            while(j < k)
            {
               promote(locales[j]);
               j++;
            }
         }
         return result;
      }
   }
}

