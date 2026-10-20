package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.system.*;
   import flash.utils.*;
   import mx.accessibility.AlertAccImpl;
   import mx.accessibility.ButtonAccImpl;
   import mx.accessibility.PanelAccImpl;
   import mx.accessibility.UIComponentAccProps;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.managers.systemClasses.ChildManager;
   import mx.messaging.config.ConfigMap;
   import mx.messaging.messages.AcknowledgeMessage;
   import mx.messaging.messages.AcknowledgeMessageExt;
   import mx.messaging.messages.AsyncMessage;
   import mx.messaging.messages.AsyncMessageExt;
   import mx.messaging.messages.CommandMessage;
   import mx.messaging.messages.CommandMessageExt;
   import mx.messaging.messages.ErrorMessage;
   import mx.messaging.messages.HTTPRequestMessage;
   import mx.messaging.messages.MessagePerformanceInfo;
   import mx.styles.IStyleManager2;
   import mx.styles.StyleManagerImpl;
   import mx.utils.ObjectProxy;
   import spark.accessibility.ButtonBaseAccImpl;
   import spark.accessibility.CheckBoxAccImpl;
   import spark.accessibility.DataGridAccImpl;
   import spark.accessibility.DropDownListBaseAccImpl;
   import spark.accessibility.ListAccImpl;
   import spark.accessibility.ListBaseAccImpl;
   import spark.accessibility.NumericStepperAccImpl;
   import spark.accessibility.RadioButtonAccImpl;
   import spark.accessibility.RichEditableTextAccImpl;
   import spark.accessibility.SliderBaseAccImpl;
   import spark.accessibility.SpinnerAccImpl;
   import spark.accessibility.TextBaseAccImpl;
   import spark.accessibility.ToggleButtonAccImpl;
   
   public class _BOSS_TONE_STUDIO_for_KATANA_FlexInit
   {
      
      public function _BOSS_TONE_STUDIO_for_KATANA_FlexInit()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var styleNames:Array;
         var i:int;
         var styleManager:IStyleManager2 = null;
         var fbs:IFlexModuleFactory = param1;
         new ChildManager(fbs);
         styleManager = new StyleManagerImpl(fbs);
         EffectManager.mx_internal::registerEffectTrigger("addedEffect","added");
         EffectManager.mx_internal::registerEffectTrigger("closeEffect","windowClose");
         EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect","creationComplete");
         EffectManager.mx_internal::registerEffectTrigger("focusInEffect","focusIn");
         EffectManager.mx_internal::registerEffectTrigger("focusOutEffect","focusOut");
         EffectManager.mx_internal::registerEffectTrigger("hideEffect","hide");
         EffectManager.mx_internal::registerEffectTrigger("minimizeEffect","windowMinimize");
         EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect","mouseDown");
         EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect","mouseUp");
         EffectManager.mx_internal::registerEffectTrigger("moveEffect","move");
         EffectManager.mx_internal::registerEffectTrigger("removedEffect","removed");
         EffectManager.mx_internal::registerEffectTrigger("resizeEffect","resize");
         EffectManager.mx_internal::registerEffectTrigger("resizeEndEffect","resizeEnd");
         EffectManager.mx_internal::registerEffectTrigger("resizeStartEffect","resizeStart");
         EffectManager.mx_internal::registerEffectTrigger("rollOutEffect","rollOut");
         EffectManager.mx_internal::registerEffectTrigger("rollOverEffect","rollOver");
         EffectManager.mx_internal::registerEffectTrigger("showEffect","show");
         EffectManager.mx_internal::registerEffectTrigger("unminimizeEffect","windowUnminimize");
         if(Capabilities.hasAccessibility)
         {
            PanelAccImpl.enableAccessibility();
            SliderBaseAccImpl.enableAccessibility();
            SpinnerAccImpl.enableAccessibility();
            NumericStepperAccImpl.enableAccessibility();
            DataGridAccImpl.enableAccessibility();
            ButtonBaseAccImpl.enableAccessibility();
            RadioButtonAccImpl.enableAccessibility();
            ToggleButtonAccImpl.enableAccessibility();
            ListBaseAccImpl.enableAccessibility();
            AlertAccImpl.enableAccessibility();
            RichEditableTextAccImpl.enableAccessibility();
            TextBaseAccImpl.enableAccessibility();
            CheckBoxAccImpl.enableAccessibility();
            ListAccImpl.enableAccessibility();
            ButtonAccImpl.enableAccessibility();
            DropDownListBaseAccImpl.enableAccessibility();
            UIComponentAccProps.enableAccessibility();
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayCollection") != ArrayCollection)
            {
               registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayList") != ArrayList)
            {
               registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
         }
         try
         {
            if(getClassByAlias("flex.messaging.config.ConfigMap") != ConfigMap)
            {
               registerClassAlias("flex.messaging.config.ConfigMap",ConfigMap);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.config.ConfigMap",ConfigMap);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.AcknowledgeMessage") != AcknowledgeMessage)
            {
               registerClassAlias("flex.messaging.messages.AcknowledgeMessage",AcknowledgeMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.AcknowledgeMessage",AcknowledgeMessage);
         }
         try
         {
            if(getClassByAlias("DSK") != AcknowledgeMessageExt)
            {
               registerClassAlias("DSK",AcknowledgeMessageExt);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("DSK",AcknowledgeMessageExt);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.AsyncMessage") != AsyncMessage)
            {
               registerClassAlias("flex.messaging.messages.AsyncMessage",AsyncMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.AsyncMessage",AsyncMessage);
         }
         try
         {
            if(getClassByAlias("DSA") != AsyncMessageExt)
            {
               registerClassAlias("DSA",AsyncMessageExt);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("DSA",AsyncMessageExt);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.CommandMessage") != CommandMessage)
            {
               registerClassAlias("flex.messaging.messages.CommandMessage",CommandMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.CommandMessage",CommandMessage);
         }
         try
         {
            if(getClassByAlias("DSC") != CommandMessageExt)
            {
               registerClassAlias("DSC",CommandMessageExt);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("DSC",CommandMessageExt);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.ErrorMessage") != ErrorMessage)
            {
               registerClassAlias("flex.messaging.messages.ErrorMessage",ErrorMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.ErrorMessage",ErrorMessage);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.HTTPMessage") != HTTPRequestMessage)
            {
               registerClassAlias("flex.messaging.messages.HTTPMessage",HTTPRequestMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.HTTPMessage",HTTPRequestMessage);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.MessagePerformanceInfo") != MessagePerformanceInfo)
            {
               registerClassAlias("flex.messaging.messages.MessagePerformanceInfo",MessagePerformanceInfo);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.MessagePerformanceInfo",MessagePerformanceInfo);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ObjectProxy") != ObjectProxy)
            {
               registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
         }
         styleNames = ["lineHeight","unfocusedTextSelectionColor","kerning","caretColor","textRollOverColor","showErrorSkin","digitCase","inactiveTextSelectionColor","listAutoPadding","showErrorTip","justificationRule","textDecoration","dominantBaseline","fontThickness","textShadowColor","trackingRight","blockProgression","leadingModel","listStylePosition","textAlignLast","textShadowAlpha","textAlpha","letterSpacing","chromeColor","rollOverColor","fontSize","baselineShift","focusedTextSelectionColor","paragraphEndIndent","fontWeight","breakOpportunity","leading","symbolColor","renderingMode","barColor","fontSharpness","modalTransparencyDuration","paragraphStartIndent","layoutDirection","justificationStyle","footerColors","wordSpacing","listStyleType","contentBackgroundColor","paragraphSpaceAfter","contentBackgroundAlpha","fontAntiAliasType","textRotation","errorColor","cffHinting","direction","locale","backgroundDisabledColor","digitWidth","modalTransparencyColor","showPromptWhenFocused","touchDelay"
         ,"ligatureLevel","textIndent","firstBaselineOffset","themeColor","clearFloats","modalTransparency","fontLookup","tabStops","paragraphSpaceBefore","headerColors","textAlign","fontFamily","textSelectedColor","interactionMode","lineThrough","whiteSpaceCollapse","fontGridFitType","alignmentBaseline","trackingLeft","fontStyle","dropShadowColor","accentColor","selectionColor","disabledColor","modalTransparencyBlur","downColor","focusColor","textJustify","color","alternatingItemColors","typographicCase"];
         i = 0;
         while(i < styleNames.length)
         {
            styleManager.registerInheritingStyle(styleNames[i]);
            i++;
         }
      }
   }
}

TextFieldFactory;

