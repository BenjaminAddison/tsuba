package tonecentral.components.setting.detail
{
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.common.manager.SystemManager;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.SystemEvent;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.parametors.MidiParams;
   import tonecentral.parametors.SystemParams;
   import tonecentral.parametors.TemporaryParams;
   
   public class AbstractSettingDetailLogic extends ViewLogic
   {
      
      protected var settingName:String;
      
      protected var mediator:ToneCentralMediator;
      
      protected var addressMap:AddressMap;
      
      protected var systemParams:SystemParams;
      
      protected var midiParams:MidiParams;
      
      protected var systemMng:SystemManager;
      
      protected var tempParams:TemporaryParams;
      
      public function AbstractSettingDetailLogic()
      {
         super();
      }
      
      override protected function onCreationComplete() : void
      {
         this.init();
      }
      
      protected function init() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.systemMng = SystemManager.getInstance();
         this.addressMap = AddressMap.getInstance();
         this.systemParams = this.mediator.sysex.params.system;
         this.midiParams = this.mediator.sysex.params.midiParams;
         this.tempParams = this.mediator.sysex.params.temporaryParams;
         this.createParameter();
      }
      
      protected function createParameter() : void
      {
      }
      
      protected function createSettingParameterComponent(param1:Object, param2:Object) : SettingParameterComponent
      {
         var _loc3_:SettingParameterComponent = null;
         if(SystemSettingDefinitionGT.DROPDOWN_LIST.hasOwnProperty(param2.id) || this.isProgramMap())
         {
            _loc3_ = new SettingParameterComponent(360,25,190,25,30);
         }
         else
         {
            _loc3_ = new SettingParameterComponent(360,25,110,25,30);
            _loc3_.addUnitLabel(SystemSettingDefinitionGT.UNIT_LIST[param2.id]);
         }
         _loc3_.setdata(param1);
         _loc3_.setEffectType(param2.id);
         return _loc3_;
      }
      
      protected function createItemData(param1:Object) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         _loc3_ = param1.id;
         _loc4_ = _loc3_;
         _loc2_ = {};
         _loc2_.id = param1.id;
         _loc2_.name = param1.name;
         _loc2_.max = param1.max;
         _loc2_.min = param1.min;
         _loc2_.step = param1.step;
         _loc2_.midiOffset = param1.midiOffset;
         _loc2_.precision = param1.precision;
         if(this.isProgramMap())
         {
            _loc2_.address = this.addressMap.getProgramMapObj(_loc4_).address;
            _loc5_ = this.midiParams[_loc3_] * int(_loc2_.step);
         }
         else if(this.isMidiSetting())
         {
            _loc2_.address = this.addressMap[_loc4_].address;
            _loc5_ = ParameterUtil.getDoubleByteData(_loc2_.address,this.midiParams[_loc3_]) * int(_loc2_.step);
         }
         else
         {
            _loc2_.address = this.addressMap[_loc4_].address;
            _loc5_ = ParameterUtil.getDoubleByteData(_loc2_.address,this.systemParams[_loc3_]) * Number(_loc2_.step);
         }
         _loc2_.value = _loc5_;
         return _loc2_;
      }
      
      protected function isChangeParam(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         if(this.isProgramMap())
         {
            return SystemSettingDefinitionGT.PROGRAM_MAP_START_ADDRESS <= param1 && param1 <= SystemSettingDefinitionGT.PROGRAM_MAP_END_ADDRESS;
         }
         if(this.isMidiSetting())
         {
            return SystemSettingDefinitionGT.MIDI_SETTING_START_ADDRESS <= param1 && param1 <= SystemSettingDefinitionGT.MIDI_SETTING_END_ADDRESS;
         }
         _loc2_ = (SystemSettingDefinitionGT.PARAM_CHANGE_RANGE_SYSTEM[this.settingName] as Array).indexOf(param1);
         return _loc2_ != -1;
      }
      
      private function isProgramMap() : Boolean
      {
         if(this.settingName == "PROGRAM_MAP_SETTING")
         {
            return true;
         }
         return false;
      }
      
      private function isMidiSetting() : Boolean
      {
         if(this.settingName == "MIDI_SETTING")
         {
            return true;
         }
         return false;
      }
      
      protected function paramChangeHandler(param1:SystemEvent) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc2_:String = param1.data.address as String;
         var _loc3_:Array = param1.data.value as Array;
         if(!_loc2_ || !_loc3_)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = ToneCentralUtil.incrementAddress(_loc2_,_loc4_);
            _loc6_ = int(_loc3_[_loc4_]);
            if(this.isChangeParam(_loc5_))
            {
               this.paramUpdate(_loc5_,_loc6_);
            }
            _loc4_++;
         }
      }
      
      protected function paramUpdate(param1:String, param2:int) : void
      {
      }
   }
}

