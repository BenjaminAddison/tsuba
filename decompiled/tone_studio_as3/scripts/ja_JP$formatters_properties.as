package
{
   import mx.resources.ResourceBundle;
   
   public class ja_JP$formatters_properties extends ResourceBundle
   {
      
      public function ja_JP$formatters_properties()
      {
         super("ja_JP","formatters");
      }
      
      override protected function getContent() : Object
      {
         return {
            "zipCodeFormat":"#####",
            "useNegativeSignInCurrency":"true",
            "useNegativeSignInNumber":"true",
            "defaultInvalidFormatError":"無効な形式",
            "pm":"午後",
            "useThousandsSeparator":"true",
            "am":"午前",
            "areaCode":"-1",
            "validPatternChars":"+()#- .",
            "phoneNumberFormat":"(###) ###-####",
            "defaultInvalidValueError":"無効な値",
            "areaCodeFormat":"(###)",
            "monthNamesShort":"1,2,3,4,5,6,7,8,9,10,11,12",
            "numberFormatterPrecision":"-1",
            "dayNamesShort":"日, 月, 火, 水, 木, 金, 土",
            "rounding":"none",
            "currencyFormatterPrecision":"-1"
         };
      }
   }
}

