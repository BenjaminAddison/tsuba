package tonecentral.common.manager
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayList;
   import tonecentral.common.define.Mode;
   import tonecentral.common.util.CTLParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.EditorEvent;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.AddressMap;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class CTLManager extends EventDispatcher
   {
      
      private var _ctlName:String;
      
      private var mediator:ToneCentralMediator;
      
      private var addressMap:AddressMap;
      
      private var _pedalFunc:String;
      
      private var _pedalFuncList:ArrayList;
      
      private var _pedalFuncIndex:int;
      
      private var _pedalFuncAddress:String;
      
      public function CTLManager(param1:IEventDispatcher = null)
      {
         super(param1);
         this.init();
      }
      
      public function get pedalFunc() : String
      {
         return this._pedalFunc;
      }
      
      public function set pedalFunc(param1:String) : void
      {
         this._pedalFunc = param1;
      }
      
      public function get pedalFuncList() : ArrayList
      {
         return this._pedalFuncList;
      }
      
      public function set pedalFuncList(param1:ArrayList) : void
      {
         this._pedalFuncList = param1;
      }
      
      public function get pedalFuncIndex() : int
      {
         return this._pedalFuncIndex;
      }
      
      public function set pedalFuncIndex(param1:int) : void
      {
         this._pedalFuncIndex = param1;
         this.mediator.sysex.setDataFunc(this._pedalFuncAddress,ToneCentralUtil.convertHexaDecimal(this._pedalFuncList.getItemAt(param1).val));
      }
      
      public function get ctlName() : String
      {
         return this._ctlName;
      }
      
      public function set ctlName(param1:String) : void
      {
         this._ctlName = param1;
         this.getCTLData();
      }
      
      private function init() : void
      {
         this.mediator = ToneCentralMediator.getInstance();
         this.mediator.sysex.addUpdateTemporaryCallback(this.updateTemporaryParams);
         this.mediator.sysex.addEventListener(ToneCentralEvents.PARAM_PATCH_CHANGED,this.paramPatchChangedHandler,false,0,true);
         this.addressMap = AddressMap.getInstance();
      }
      
      private function paramPatchChangedHandler(param1:ToneCentralEvents) : void
      {
         if(!this.mediator.sysex.connected)
         {
            dispatchEvent(new ToneCentralEvents(ToneCentralEvents.PARAM_PATCH_CHANGED));
         }
      }
      
      public function getCTLData() : void
      {
         this._pedalFunc = CTLParameterUtil.getPedalFunc(this.ctlName);
         this._pedalFuncList = new ArrayList(CTLParameterUtil.getPedalFuncList());
         this._pedalFuncIndex = this.getIndex(this.pedalFunc,this.pedalFuncList,true);
         this._pedalFuncAddress = this.addressMap.getCTLPedalFuncAddress(this.ctlName);
      }
      
      private function getIndex(param1:String, param2:ArrayList, param3:Boolean) : int
      {
         var _loc5_:Object = null;
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            _loc5_ = param2.getItemAt(_loc4_);
            if(param3)
            {
               if(_loc5_.name == param1)
               {
                  return _loc4_;
               }
            }
            else if(_loc5_ == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function getTmpData(param1:String) : int
      {
         return this.mediator.sysex.params.temporaryParams[param1];
      }
      
      private function updateTemporaryParams(param1:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:EditorEvent = null;
         if(this.mediator.selectedMode != Mode.EDITOR || this.mediator.contentsAreaMode == Mode.TONE_CENTRAL)
         {
            return;
         }
         var _loc2_:String = param1.address as String;
         var _loc3_:Array = param1.value as Array;
         if(!_loc2_ || !_loc3_)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = ToneCentralUtil.incrementAddress(_loc2_,_loc4_);
            _loc6_ = int(_loc3_[_loc4_]);
            if(_loc5_ == this._pedalFuncAddress)
            {
               this.getCTLData();
               dispatchEvent(new EditorEvent(EditorEvent.CTL_PEDAL_FUNC_CHANGE));
            }
            else
            {
               this.getCTLData();
               _loc7_ = new EditorEvent(EditorEvent.CTL_ASSIGN_PARAMS_CHANGE);
               _loc7_.data = {
                  "address":_loc5_,
                  "value":_loc6_
               };
               dispatchEvent(_loc7_);
            }
            _loc4_++;
         }
      }
      
      public function isChangeParam(param1:String) : Boolean
      {
         return CTLParameterUtil.isChangeAssignParamTemp(this.ctlName,param1);
      }
   }
}

