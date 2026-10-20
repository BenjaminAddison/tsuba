package tonecentral.events
{
   import flash.events.Event;
   
   public class ToneCentralEvents extends Event
   {
      
      public static const STATUS_NATIVE_MIDI_EVENT:String = "native_midi_event";
      
      public static const ADDRESS_MAP_COMPLETE:String = "addressMapComplete";
      
      public static const WINDOW_RESIZE:String = "window_resize";
      
      public static const DEVICE_LIST_RECEIVED:String = "device_list_received";
      
      public static const DEVICE_LIST_SELECTED:String = "device_list_selected";
      
      public static const REQUEST_DATA_RECEIVED:String = "request_data_received";
      
      public static const SELECT_PATCH_NO_DATA_RECEIVED:String = "select_patch_no_data_received";
      
      public static const CONNECTED:String = "connected";
      
      public static const DISCONNECTED:String = "disconnected";
      
      public static const RECOGNIZED:String = "recognized";
      
      public static const CONNECT_FAULT:String = "connect_fault";
      
      public static const HEALTH_CHECK_OK:String = "healthCheckOK";
      
      public static const HEALTH_CHECK_NG:String = "healthCheckNG";
      
      public static const EDITOR_COMUNICATION_LEVEL_RECEIVED:String = "editor_comunication_level_received";
      
      public static const EDITOR_COMUNICATION_MODE_RECEIVED:String = "editor_comunication_mode_received";
      
      public static const PARAM_SETUP_RECEIVED:String = "param_setup_received";
      
      public static const PARAM_SYSTEM_RECEIVED:String = "param_system_received";
      
      public static const PARAM_TEMPORARY_PATCH_RECEIVED:String = "param_temporary_patch_received";
      
      public static const PARAM_PATCH_LIST_RECEIVED:String = "param_patch_list_received";
      
      public static const PARAM_PATCH_CHANGED:String = "param_patch_changed";
      
      public static const PARAM_PATCH_CLEAR:String = "param_patch_clear";
      
      public static const PARAM_CHAIN_CHANGED:String = "param_chain_changed";
      
      public static const INIT_PARAMS_RECEIVED:String = "init_params_received";
      
      public static const STARTING_PROCESS_COMPLETE:String = "starting_process_complete";
      
      public static const SET_TEMPORARY:String = "set_temporary";
      
      public static const SET_AMP_TEMPORARY:String = "setAmpTemporary";
      
      public static const PATCH_WRITE_DATASET:String = "patch_write_dataset";
      
      public static const CHANGE_MODE:String = "change_mode";
      
      public static const TUNER_PITCH:String = "tunerPitch";
      
      public static const TUNER_MULTI_PITCH:String = "tunerMultiPitch";
      
      public static const RUNNING_MODE:String = "runningMode";
      
      public static const GET_PATCH_DATA:String = "getPatchData";
      
      public static const GET_PATCH_MAP:String = "getPatchMap";
      
      public static const SORT_PATCH_MAP_SUCCESS:String = "sortPatchMapSuccess";
      
      public static const SORT_PATCH_MAP_FAULT:String = "sortPatchMapFault";
      
      public static const PATCH_PARAM_LOADED:String = "patchParamLoaded";
      
      public static const PATCH_WRITE:String = "patchWrite";
      
      public static const DATASET:String = "dataset";
      
      public static const DATASET_FROM_ME80:String = "dataset_from_me80";
      
      public static const TONE_CENTRAL_CLICK:String = "toneCentralClick";
      
      public static const MODE_CHANGE:String = "modeChange";
      
      public static const LIVE_SET_OPEN:String = "liveSetOpen";
      
      public static const LIVE_SET_CLOSE:String = "liveSetClose";
      
      public static const SELECT:String = "select";
      
      public static const UNSELECT:String = "unselect";
      
      public static const COPY:String = "copy";
      
      public static const PASTE:String = "paste";
      
      public static const DELETE:String = "delete";
      
      public static const EDIT_START:String = "editStart";
      
      public static const EDIT_END:String = "editEnd";
      
      public static const LOAD_COMPLETE:String = "loadComplete";
      
      public static const LOAD_FAULT:String = "loadFault";
      
      public static const MANUAL_LOAD_COMPLETE:String = "manual_load_complete";
      
      public static const MANUAL_LOAD_FAULT:String = "manual_load_fault";
      
      public static const START_DRAG:String = "startDrag";
      
      public static const STOP_DRAG:String = "stopDrag";
      
      public static const APPLY_LIVESET:String = "applyLiveset";
      
      public static const SET_PATCH_TOOLTIP:String = "setPatchTooltip";
      
      public static const RESET_PATCH_TOOLTIP:String = "resetPatchTooltip";
      
      public static const CHANGE_VISIBLE_MEMO:String = "changeVisibleMemo";
      
      public static const PLAY_END:String = "play_end";
      
      public static const SETTING_OK:String = "setting_ok";
      
      public static const SETTING_SYSTEM_LOADED:String = "setting_system_loaded";
      
      public static const SETTING_DEVICE_SELECTED:String = "setting_device_selected";
      
      public static const DEVICE_PORT_REFRESH:String = "devicePortRefresh";
      
      public static const SETTING_LANGUAGE_COMPLETED:String = "setting_language_completed";
      
      public static const SETTING_EQTYPE_COMPLETED:String = "setting_eqtype_completed";
      
      public static const SHOW_INFO:String = "showInfo";
      
      public static const HIDE_INFO:String = "hideInfo";
      
      public static const CHANGE_END:String = "changeEnd";
      
      public static const CHANGING:String = "changing";
      
      public static const NET_STATUS_CHANGE:String = "netStatusChange";
      
      public static const CHANGE_CURRENT_PATCH:String = "currentPatchChange";
      
      public static const PATCH_NAME_RECEIVED:String = "patchNameReceived";
      
      public static const PARAM_PATCH_LIST_FAULT:String = "paramPatchListFault";
      
      public static const TC_TAG_CHANGE:String = "TCTagChange";
      
      public static const KNOB_DRAG:String = "knobDrag";
      
      public static const WHEEL_START:String = "wheelStart";
      
      public static const DRAG_COMPLETE:String = "dragComplete";
      
      public static const DROP:String = "drop";
      
      public static const DRAG_START:String = "dragStart";
      
      public static const LIST_ITEM_CLICK:String = "listItemClick";
      
      public static const SELECTED_LIVE_SET:String = "selectedLiseSet";
      
      public static const OK:String = "ok";
      
      public static const CANCEL:String = "cancel";
      
      public static const DEVICE_SETTING:String = "deviceSetting";
      
      public static const REFRESH_COMPLETE_TC:String = "refreshCompleteTC";
      
      public static const SHOW_LOADING:String = "showLoading";
      
      public static const HIDE_LOADING:String = "hideLoading";
      
      public static const SHOW_ADD_LIVESET_MSG:String = "showAddLivesetMsg";
      
      public static const HIDE_ADD_LIVESET_MSG:String = "hideAddLivesetMsg";
      
      public static const DISCONNECT_ERROR:String = "disconnectError";
      
      public static const SET_TEMPORARY_START:String = "setTemporaryStart";
      
      public static const SET_TEMPORARY_END:String = "setTemporaryEnd";
      
      public static const SET_TEMPORARY_STOP:String = "setTemporaryStop";
      
      public static const SET_PATCH_PARAMS_END:String = "setPatchParamsEnd";
      
      public static const SET_PATCH_MAP_END:String = "setPatchMapEnd";
      
      public static const SET_QUICK_SETTING_END:String = "setQuickSettingEnd";
      
      public static const CLOSE_POPUP:String = "closePopup";
      
      public static const EDIT_LIVESET_COMPLETE:String = "editLivesetComplete";
      
      public static const PRESET_ARTWORK_SELECTED:String = "presetArtworkSelected";
      
      public static const CONNECTION_TEST:String = "connectionTest";
      
      public static const REQUEST_COMPLETE_TEMP_PRE_AMP_DATA:String = "resuestCompleteTempPreAmpData";
      
      public static const ERROR_EXIT:String = "errorExit";
      
      public static const LIVESET_DRAG_START:String = "livesetDragStart";
      
      public static const LIVESET_DRAG_END:String = "livesetDragEnd";
      
      public static const LIVESET_DROP:String = "livesetDrop";
      
      public static const UPDATE_CANCEL:String = "updateCancel";
      
      public static const UPDATE_OK:String = "updateOK";
      
      public static const ITEM_DRAG_ENTER:String = "itemDragEnter";
      
      public static const ITEM_DRAG_EXIT:String = "itemDragExit";
      
      public static const ITEM_DRAG_DROP:String = "itemDragDrop";
      
      public static const DIALOG_OK:String = "dialogOk";
      
      public static const DIALOG_CANCEL:String = "dialogCancel";
      
      public static const DIALOG_CLOSE:String = "dialogClose";
      
      public static const DEVICE_PORT_SELECTED:String = "devicePortSelected";
      
      public static const SYSTEM_CLOSE:String = "systemClose";
      
      public static const TEMPORARY_CLEAR:String = "temporaryClear";
      
      public static const OVERFLOW_OK:String = "overflowOK";
      
      public static const CHANGE_DEMO:String = "changeDemo";
      
      public static const CHAB_SUCCESS:String = "chabSuccess";
      
      public static const CHAB_LOAD_END:String = "chabLoadEnd";
      
      public static const CHANGE_EDIT_MODE:String = "changeEditMode";
      
      public static const CHANGE_DEVICE:String = "changeDevice";
      
      public static const RETRY_ERROR:String = "retryError";
      
      public static const SHOW_SELECT_DEVICE:String = "showSelectDevice";
      
      public static const LIB_LOADING_MOUSE_UP:String = "libLoadingMouseUp";
      
      public static const MANUAL_MODE_CHANGE:String = "manualModeChange";
      
      public static const CHANGE_EFFECT:String = "changeEffect";
      
      public static const DEBUG:String = "debug";
      
      private var _data:Object;
      
      private var _dropPos:String;
      
      public var key:Boolean;
      
      public function ToneCentralEvents(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get dropPos() : String
      {
         return this._dropPos;
      }
      
      public function set dropPos(param1:String) : void
      {
         this._dropPos = param1;
      }
   }
}

