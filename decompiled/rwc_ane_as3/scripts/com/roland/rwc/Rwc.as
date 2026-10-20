package com.roland.rwc
{
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.external.ExtensionContext;
   
   [Event(name="status",type="flash.events.StatusEvent")]
   public class Rwc extends EventDispatcher
   {
      
      private var _context:ExtensionContext;
      
      public function Rwc()
      {
         super();
         this._context = ExtensionContext.createExtensionContext("com.roland.rwc",null);
         this._context.addEventListener(StatusEvent.STATUS,this.onStatusEvent);
      }
      
      public function getMessageTest(text:String) : String
      {
         var returnStr:String = null;
         try
         {
            returnStr = this._context.call("GetMessageTest",text) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function getMessageTest2(text:String) : String
      {
         var returnStr:String = null;
         try
         {
            returnStr = this._context.call("GetMessageTest2",text) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function getMessageTest3(text1:String = "", text2:String = "") : String
      {
         var returnStr:String = null;
         try
         {
            returnStr = this._context.call("GetMessageTest3",text1,text2) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function getMessageTest4(text:String) : Number
      {
         var returnNum:Number = NaN;
         try
         {
            returnNum = this._context.call("GetMessageTest4",text) as Number;
         }
         catch(error:Error)
         {
            returnNum = 999;
         }
         return returnNum;
      }
      
      public function DEVICE_currentAudioInputDevice() : String
      {
         var retStr:String = new String("");
         retStr = this._context.call("DEVICE_currentAudioInputDevice","","") as String;
         return this.xReplace(retStr,">(null)<","><");
      }
      
      public function DEVICE_searchAudioInputDevice() : void
      {
         this._context.call("DEVICE_searchAudioInputDevice","","");
      }
      
      public function DEVICE_audioInputDevices() : String
      {
         var retStr:String = new String("");
         retStr = this._context.call("DEVICE_audioInputDevices","","") as String;
         return this.xReplace(retStr,">(null)<","><");
      }
      
      public function DEVICE_selectAudioInputDevice(sendStr:String) : Boolean
      {
         var retBool:Boolean = false;
         if(Boolean(this._context.call("DEVICE_selectAudioInputDevice",sendStr,"")))
         {
            retBool = true;
         }
         else
         {
            retBool = false;
         }
         return retBool;
      }
      
      public function DEVICE_currentAudioOutputDevice() : String
      {
         var retStr:String = new String("");
         retStr = this._context.call("DEVICE_currentAudioOutputDevice","","") as String;
         return this.xReplace(retStr,">(null)<","><");
      }
      
      public function DEVICE_searchAudioOutputDevice() : void
      {
         this._context.call("DEVICE_searchAudioOutputDevice","","");
      }
      
      public function DEVICE_audioOutputDevices() : String
      {
         var retStr:String = new String("");
         retStr = this._context.call("DEVICE_audioOutputDevices","","") as String;
         return this.xReplace(retStr,">(null)<","><");
      }
      
      public function DEVICE_selectAudioOutputDevice(sendStr:String) : Boolean
      {
         var retBool:Boolean = false;
         if(Boolean(this._context.call("DEVICE_selectAudioOutputDevice",sendStr,"")))
         {
            retBool = true;
         }
         else
         {
            retBool = false;
         }
         return retBool;
      }
      
      public function DEVICE_currentMidiInputEndpoint() : String
      {
         var returnStr:String = new String("");
         var text1:String = new String("");
         try
         {
            returnStr = this._context.call("DEVICE_currentMidiInputEndpoint",text1) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function DEVICE_searchMidiInputEndpoints() : void
      {
         var returnStr:String = new String("");
         var text1:String = new String("");
         try
         {
            returnStr = this._context.call("DEVICE_searchMidiInputEndpoints",text1) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
      }
      
      public function DEVICE_midiInputEndpoints() : String
      {
         var returnStr:String = new String("");
         var text1:String = new String("");
         try
         {
            returnStr = this._context.call("DEVICE_midiInputEndpoints",text1) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function DEVICE_selectMidiInputEndpoint(text1:String = "") : Boolean
      {
         var returnBool:Boolean = new Boolean(false);
         try
         {
            returnBool = this._context.call("DEVICE_selectMidiInputEndpoint",text1) as Boolean;
         }
         catch(error:Error)
         {
            returnBool = false;
         }
         return returnBool;
      }
      
      public function DEVICE_currentMidiOutputEndpoint() : String
      {
         var returnStr:String = new String("");
         var text1:String = new String("");
         try
         {
            returnStr = this._context.call("DEVICE_currentMidiOutputEndpoint",text1) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function DEVICE_searchMidiOutputEndpoints() : void
      {
         var returnStr:String = new String("");
         var text1:String = new String("");
         try
         {
            returnStr = this._context.call("DEVICE_searchMidiOutputEndpoints",text1) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
      }
      
      public function DEVICE_midiOutputEndpoints() : String
      {
         var returnStr:String = new String("");
         var text1:String = new String("");
         try
         {
            returnStr = this._context.call("DEVICE_midiOutputEndpoints",text1) as String;
         }
         catch(error:Error)
         {
            returnStr = error.message;
         }
         return returnStr;
      }
      
      public function DEVICE_selectMidiOutputEndpoint(text1:String = "") : Boolean
      {
         var returnBool:Boolean = new Boolean(false);
         try
         {
            returnBool = this._context.call("DEVICE_selectMidiOutputEndpoint",text1) as Boolean;
         }
         catch(error:Error)
         {
            returnBool = false;
         }
         return returnBool;
      }
      
      public function DEVICE_midiOutput(text1:String = "") : String
      {
         var returnBool:String = new String("");
         try
         {
            returnBool = this._context.call("DEVICE_midiOutput",text1) as String;
         }
         catch(error:Error)
         {
            returnBool = "error";
         }
         return returnBool;
      }
      
      public function PLAYER_openSoundWithURL(fileUrl:String) : Boolean
      {
         var retBool:Boolean = false;
         if(Boolean(this._context.call("PLAYER_openSoundWithURL",fileUrl,"")))
         {
            retBool = true;
         }
         return retBool;
      }
      
      public function PLAYER_closeSound() : void
      {
         this._context.call("PLAYER_closeSound","","");
      }
      
      public function PLAYER_playSound() : void
      {
         this._context.call("PLAYER_playSound","","");
      }
      
      public function PLAYER_pauseSound() : void
      {
         this._context.call("PLAYER_pauseSound","","");
      }
      
      public function PLAYER_stopSound() : void
      {
         this._context.call("PLAYER_stopSound","","");
      }
      
      public function PLAYER_soundURL() : String
      {
         return this._context.call("PLAYER_soundURL","","") as String;
      }
      
      public function PLAYER_status() : Number
      {
         return this._context.call("PLAYER_status","","") as Number;
      }
      
      public function PLAYER_numberOfSoundChannels() : Number
      {
         return this._context.call("PLAYER_numberOfSoundChannels","","") as Number;
      }
      
      public function PLAYER_totalTime() : Number
      {
         return this._context.call("PLAYER_totalTime","","") as Number;
      }
      
      public function PLAYER_currentTime() : Number
      {
         return this._context.call("PLAYER_currentTime","","") as Number;
      }
      
      public function PLAYER_setCurrentTime(setTimeValue:Number) : void
      {
         var sendStr:String = setTimeValue.toString();
         this._context.call("PLAYER_setCurrentTime",sendStr,"");
      }
      
      public function PLAYER_soundSpeed() : Number
      {
         return this._context.call("PLAYER_soundSpeed","","") as Number;
      }
      
      public function PLAYER_setSoundSpeed(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("PLAYER_setSoundSpeed",sendStr,"");
      }
      
      public function PLAYER_soundPitch() : Number
      {
         return this._context.call("PLAYER_soundPitch","","") as Number;
      }
      
      public function PLAYER_setSoundPitch(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("PLAYER_setSoundPitch",sendStr,"");
      }
      
      public function PLAYER_repeatA() : Number
      {
         return this._context.call("PLAYER_repeatA","","") as Number;
      }
      
      public function PLAYER_repeatB() : Number
      {
         return this._context.call("PLAYER_repeatB","","") as Number;
      }
      
      public function PLAYER_setRepeatA(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("PLAYER_setRepeatA",sendStr,"");
      }
      
      public function PLAYER_setRepeatB(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("PLAYER_setRepeatB",sendStr,"");
      }
      
      public function PLAYER_setRepeatBtoSongEnd() : void
      {
         this._context.call("PLAYER_setRepeatBtoSongEnd","","");
      }
      
      public function PLAYER_setRepeatMode(setFlg:Boolean) : void
      {
         var sendStr:String = "false";
         if(setFlg)
         {
            sendStr = "true";
         }
         this._context.call("PLAYER_setRepeatMode",sendStr,"");
      }
      
      public function PLAYER_soundVolume() : Number
      {
         return this._context.call("PLAYER_soundVolume","","") as Number;
      }
      
      public function PLAYER_setSoundVolume(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("PLAYER_setSoundVolume",sendStr,"");
      }
      
      public function PLAYER_updateSoundMeters() : void
      {
         this._context.call("PLAYER_updateSoundMeters","","");
      }
      
      public function PLAYER_soundPeakPower(chNum:int) : Number
      {
         var sendStr:String = chNum.toString();
         return this._context.call("PLAYER_soundPeakPower",sendStr,"") as Number;
      }
      
      public function RECORDER_createRecordingWithURL(fileUrl:String) : Boolean
      {
         var retBool:Boolean = false;
         if(Boolean(this._context.call("RECORDER_createRecordingWithURL",fileUrl,"")))
         {
            retBool = true;
         }
         return retBool;
      }
      
      public function RECORDER_recording() : void
      {
         this._context.call("RECORDER_recording","","");
      }
      
      public function RECORDER_pauseRecording() : void
      {
         this._context.call("RECORDER_pauseRecording","","");
      }
      
      public function RECORDER_stopRecording() : void
      {
         this._context.call("RECORDER_stopRecording","","");
      }
      
      public function RECORDER_soundURL() : String
      {
         return this._context.call("RECORDER_soundURL","","") as String;
      }
      
      public function RECORDER_status() : Number
      {
         return this._context.call("RECORDER_status","","") as Number;
      }
      
      public function RECORDER_numberOfRecordingChannels() : Number
      {
         return this._context.call("RECORDER_numberOfRecordingChannels","","") as Number;
      }
      
      public function RECORDER_currentRecordingTime() : Number
      {
         return this._context.call("RECORDER_currentRecordingTime","","") as Number;
      }
      
      public function RECORDER_recordingVolume() : Number
      {
         return this._context.call("RECORDER_recordingVolume","","") as Number;
      }
      
      public function RECORDER_setRecordingVolume(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("RECORDER_setRecordingVolume",sendStr,"");
      }
      
      public function RECORDER_setRecordingFormat(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("RECORDER_setRecordingFormat",sendStr,"");
      }
      
      public function RECORDER_setRecordingMode(setValue:Number) : void
      {
         var sendStr:String = setValue.toString();
         this._context.call("RECORDER_setRecordingMode",sendStr,"");
      }
      
      public function RECORDER_updateRecordingMeters() : void
      {
         this._context.call("RECORDER_updateRecordingMeters","","");
      }
      
      public function RECORDER_recordingPeakPower(chNum:int) : Number
      {
         var sendStr:String = chNum.toString();
         return this._context.call("RECORDER_recordingPeakPower",sendStr,"") as Number;
      }
      
      public function PLAYER_playStartTimeStamp() : Number
      {
         return this._context.call("PLAYER_playStartTimeStamp","","") as Number;
      }
      
      public function APPLICATION_applicationDidBecomeActive() : void
      {
         var resStr:String = this._context.call("APPLICATION_applicationDidBecomeActive","","") as String;
      }
      
      public function APPLICATION_applicationDidEnterBackground() : void
      {
         var resStr:String = this._context.call("APPLICATION_applicationDidEnterBackground","","") as String;
      }
      
      public function APPLICATION_applicationDidEnterBackgroundWithStop() : void
      {
         var resStr:String = this._context.call("APPLICATION_applicationDidEnterBackgroundWithStop","","") as String;
      }
      
      public function APPLICATION_ContextReset() : String
      {
         return this._context.call("APPLICATION_ContextReset","","") as String;
      }
      
      public function dispose() : void
      {
         return this._context.dispose();
      }
      
      private function onStatusEvent(event:StatusEvent) : void
      {
         var curEvent:StatusEvent = event;
         var curEventCode:String = curEvent.code.toLocaleLowerCase();
         var curEventLevel:String = this.xReplace(curEvent.level,">(null)<","><");
         var curEventType:String = curEvent.type;
         curEvent.level = this.xReplace(curEvent.level,">(null)<","><");
         dispatchEvent(curEvent);
      }
      
      protected function xReplace(source_str:String, find_str:String, replace_str:String) : String
      {
         var end:int = 0;
         var numChar:uint = uint(find_str.length);
         var result_str:String = "";
         for(var i:uint = 0; -1 < (end = source_str.indexOf(find_str,i)); )
         {
            result_str += source_str.substring(i,end) + replace_str;
            i = end + numChar;
         }
         return result_str + source_str.substring(i);
      }
   }
}

