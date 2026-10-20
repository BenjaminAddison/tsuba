package tonecentral.components.popup
{
   import flash.events.MouseEvent;
   import spark.components.RadioButton;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.skin.CustomRadioButtonSkin;
   
   public class ConnectPortSelectPopupLogic extends ViewLogic
   {
      
      private var view:ConnectPortSelectPopup;
      
      private var midiIn:Array;
      
      private var midiOut:Array;
      
      private var audioIn:Array;
      
      private var audioOut:Array;
      
      private var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      private var appMng:ApplicationManager = ApplicationManager.getInstance();
      
      public function ConnectPortSelectPopupLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = param1 as ConnectPortSelectPopup;
      }
      
      override protected function onCreationComplete() : void
      {
         var _loc1_:int = 0;
         var _loc2_:RadioButton = null;
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         this.mediator.sysex.searchDevice();
         this.midiIn = this.mediator.sysex.getMidiInputDeviceList();
         this.midiOut = this.mediator.sysex.getMidiOutputDeviceList();
         this.audioIn = this.mediator.sysex.getAudioInputDeviceList();
         this.audioOut = this.mediator.sysex.getAudioOutputDeviceList();
         _loc1_ = 0;
         while(_loc1_ < this.midiIn.length)
         {
            if(this.midiIn[_loc1_])
            {
               _loc3_ = XML(this.midiIn[_loc1_]);
               _loc5_ = "";
               if(_loc3_.dict.children().length() != 0)
               {
                  for each(_loc4_ in _loc3_.dict.children())
                  {
                     if(_loc5_ == "RWCCoreMidiDeviceEndPointNameKey")
                     {
                        _loc6_ = _loc4_;
                        _loc5_ = "";
                     }
                     else if(_loc5_ == "RWCCoreMidiDeviceEndPointRefKey")
                     {
                        _loc7_ = _loc4_;
                        _loc5_ = "";
                     }
                     if(_loc4_ == "RWCCoreMidiDeviceEndPointNameKey" || _loc4_ == "RWCCoreMidiDeviceEndPointRefKey")
                     {
                        _loc5_ = _loc4_;
                     }
                  }
                  _loc2_ = new RadioButton();
                  _loc2_.label = _loc6_;
                  _loc2_.height = 20;
                  _loc2_.width = 280;
                  _loc2_.styleName = "dialogConnectPortRadioButton";
                  _loc2_.setStyle("skinClass",CustomRadioButtonSkin);
                  _loc2_.group = this.view.midiInRadioGrp;
                  _loc2_.value = {
                     "name":_loc6_,
                     "val":_loc7_
                  };
                  if(Boolean(this.mediator.sysex.selectedDeviceData) && this.mediator.sysex.selectedDeviceData.midiInKey == _loc7_)
                  {
                     _loc2_.selected = true;
                  }
                  this.view.midiIn.addElement(_loc2_);
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.midiOut.length)
         {
            if(this.midiOut[_loc1_])
            {
               _loc3_ = XML(this.midiOut[_loc1_]);
               _loc5_ = "";
               if(_loc3_.dict.children().length() != 0)
               {
                  for each(_loc4_ in _loc3_.dict.children())
                  {
                     if(_loc5_ == "RWCCoreMidiDeviceEndPointNameKey")
                     {
                        _loc6_ = _loc4_;
                        _loc5_ = "";
                     }
                     else if(_loc5_ == "RWCCoreMidiDeviceEndPointRefKey")
                     {
                        _loc7_ = _loc4_;
                        _loc5_ = "";
                     }
                     if(_loc4_ == "RWCCoreMidiDeviceEndPointNameKey" || _loc4_ == "RWCCoreMidiDeviceEndPointRefKey")
                     {
                        _loc5_ = _loc4_;
                     }
                  }
                  _loc2_ = new RadioButton();
                  _loc2_.label = _loc6_;
                  _loc2_.group = this.view.midiOutRadioGrp;
                  _loc2_.height = 20;
                  _loc2_.width = 270;
                  _loc2_.value = {
                     "name":_loc6_,
                     "val":_loc7_
                  };
                  _loc2_.styleName = "dialogConnectPortRadioButton";
                  _loc2_.setStyle("skinClass",CustomRadioButtonSkin);
                  if(Boolean(this.mediator.sysex.selectedDeviceData) && this.mediator.sysex.selectedDeviceData.midiOutKey == _loc7_)
                  {
                     _loc2_.selected = true;
                  }
                  this.view.midiOut.addElement(_loc2_);
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.audioIn.length)
         {
            if(this.audioIn[_loc1_])
            {
               _loc3_ = XML(this.audioIn[_loc1_]);
               _loc5_ = "";
               if(_loc3_.dict.children().length() != 0)
               {
                  for each(_loc4_ in _loc3_.dict.children())
                  {
                     if(_loc5_ == "RWCCoreAudioDeviceNameKey")
                     {
                        _loc6_ = _loc4_;
                        break;
                     }
                     if(_loc5_ == "RWCCoreAudioDeviceIdKey")
                     {
                        _loc7_ = _loc4_;
                        _loc5_ = "";
                     }
                     if(_loc4_ == "RWCCoreAudioDeviceNameKey" || _loc4_ == "RWCCoreAudioDeviceIdKey")
                     {
                        _loc5_ = _loc4_;
                     }
                  }
                  _loc2_ = new RadioButton();
                  _loc2_.label = _loc6_;
                  _loc2_.group = this.view.audioInRadioGrp;
                  _loc2_.height = 20;
                  _loc2_.width = 270;
                  _loc2_.value = {
                     "name":_loc6_,
                     "val":_loc7_
                  };
                  _loc2_.styleName = "dialogConnectPortRadioButton";
                  _loc2_.setStyle("skinClass",CustomRadioButtonSkin);
                  this.view.audioIn.addElement(_loc2_);
                  if(Boolean(this.mediator.sysex.selectedDeviceData) && this.mediator.sysex.selectedDeviceData.audioInKey == _loc7_)
                  {
                     _loc2_.selected = true;
                  }
                  this.view.audioIn.addElement(_loc2_);
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.audioOut.length)
         {
            if(this.audioOut[_loc1_])
            {
               _loc3_ = XML(this.audioOut[_loc1_]);
               _loc5_ = "";
               if(_loc3_.dict.children().length() != 0)
               {
                  for each(_loc4_ in _loc3_.dict.children())
                  {
                     if(_loc5_ == "RWCCoreAudioDeviceNameKey")
                     {
                        _loc6_ = _loc4_;
                        _loc5_ = "";
                     }
                     else if(_loc5_ == "RWCCoreAudioDeviceIdKey")
                     {
                        _loc7_ = _loc4_;
                        _loc5_ = "";
                     }
                     if(_loc4_ == "RWCCoreAudioDeviceNameKey" || _loc4_ == "RWCCoreAudioDeviceIdKey")
                     {
                        _loc5_ = _loc4_;
                     }
                  }
                  _loc2_ = new RadioButton();
                  _loc2_.label = _loc6_;
                  _loc2_.group = this.view.audioOutRadioGrp;
                  _loc2_.height = 20;
                  _loc2_.width = 270;
                  _loc2_.value = {
                     "name":_loc6_,
                     "val":_loc7_
                  };
                  _loc2_.styleName = "dialogConnectPortRadioButton";
                  _loc2_.setStyle("skinClass",CustomRadioButtonSkin);
                  if(Boolean(this.mediator.sysex.selectedDeviceData) && this.mediator.sysex.selectedDeviceData.audioOutKey == _loc7_)
                  {
                     _loc2_.selected = true;
                  }
                  this.view.audioOut.addElement(_loc2_);
               }
            }
            _loc1_++;
         }
      }
      
      public function okButtonClickHandler(param1:MouseEvent) : void
      {
         this.mediator.showLoading();
         var _loc2_:Object = {
            "deviceName":"connectPortSelect",
            "midiInKey":NaN,
            "midiInName":"",
            "midiOutKey":NaN,
            "midiOutName":"",
            "audioInKey":NaN,
            "audioInName":"",
            "audioOutKey":NaN,
            "audioOutName":""
         };
         if(this.view.midiInRadioGrp.selectedValue)
         {
            _loc2_.midiInKey = this.view.midiInRadioGrp.selectedValue.val;
            _loc2_.midiInName = this.view.midiInRadioGrp.selectedValue.name;
         }
         if(this.view.midiOutRadioGrp.selectedValue)
         {
            _loc2_.midiOutKey = this.view.midiOutRadioGrp.selectedValue.val;
            _loc2_.midiOutName = this.view.midiOutRadioGrp.selectedValue.name;
         }
         if(this.view.audioInRadioGrp.selectedValue)
         {
            _loc2_.audioInKey = this.view.audioInRadioGrp.selectedValue.val;
            _loc2_.audioInName = this.view.audioInRadioGrp.selectedValue.name;
         }
         if(this.view.audioOutRadioGrp.selectedValue)
         {
            _loc2_.audioOutKey = this.view.audioOutRadioGrp.selectedValue.val;
            _loc2_.audioOutName = this.view.audioOutRadioGrp.selectedValue.name;
         }
         var _loc3_:Object = _loc2_;
         var _loc4_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DEVICE_PORT_SELECTED);
         _loc4_.data = _loc3_;
         this.view.dispatchEvent(_loc4_);
         this.view.close();
      }
      
      public function refreshButtonClickHandler() : void
      {
         var _loc1_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.DEVICE_PORT_REFRESH);
         this.view.dispatchEvent(_loc1_);
      }
   }
}

