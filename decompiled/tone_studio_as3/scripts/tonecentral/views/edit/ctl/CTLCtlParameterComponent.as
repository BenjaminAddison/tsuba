package tonecentral.views.edit.ctl
{
   import mx.events.FlexEvent;
   import spark.components.Group;
   import spark.components.Label;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.components.edit.ParameterComponent;
   
   public class CTLCtlParameterComponent extends Group
   {
      
      private var paramNameLabel:Label;
      
      private var parameterComponent:ParameterComponent;
      
      private var _assignParamAddress:String;
      
      private var _assignParamName:String;
      
      public var data:Object;
      
      private var baseHeight:Number;
      
      public function CTLCtlParameterComponent(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.width = param1;
         this.height = 45;
         this.baseHeight = this.height;
         this.parameterComponent = new ParameterComponent(param1,param2,param3,param4,param5);
         this.parameterComponent.y = 15;
         addElement(this.parameterComponent);
      }
      
      public function addHeight(param1:int) : void
      {
         this.height += param1;
         this.baseHeight = this.height;
      }
      
      public function changeEnable(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         if(param1)
         {
            _loc2_ = 1;
         }
         else
         {
            _loc2_ = 0.5;
         }
         this.paramNameLabel.alpha = _loc2_;
         this.parameterComponent.changeEnable(param1);
      }
      
      public function getAddress() : String
      {
         return this.parameterComponent.address;
      }
      
      public function getAssignParamAddress() : String
      {
         return this._assignParamAddress;
      }
      
      public function setdata(param1:Object, param2:Boolean) : void
      {
         this.data = param1;
         if(param2)
         {
            this.addLabel(param1.effect);
         }
         this.parameterComponent.setdata(this.data,ParameterDefinitionGT.DROPDOWN_LIST,{});
         this._assignParamAddress = param1.assignParamAddress;
         this._assignParamName = param1.assignParamName;
      }
      
      public function updateData(param1:Object, param2:String) : void
      {
         this.data = param1;
         this.parameterComponent.updateFromMe80 = true;
         this.parameterComponent.changeStepperIsInit(true);
         this.parameterComponent.min = param1.min;
         this.parameterComponent.max = param1.max;
         this.parameterComponent.step = param1.step;
         this.parameterComponent.address = param1.address;
         this.parameterComponent.updateDropDownList(param2);
         this.parameterComponent.paramVal = param1.value;
         this.height = this.baseHeight;
         this.parameterComponent.updateFromMe80 = false;
      }
      
      public function paramUpdateHandler(param1:Number) : void
      {
         this.parameterComponent.updateFromMe80 = true;
         param1 = ParameterUtil.getDoubleByteData(this.parameterComponent.address,param1);
         param1 *= this.parameterComponent.step;
         this.parameterComponent.paramVal = param1;
         this.parameterComponent.updateFromMe80 = false;
      }
      
      public function getDoubleByteValue(param1:int) : String
      {
         return this.parameterComponent.getDoubleByteValue(param1);
      }
      
      public function setEffectType(param1:String) : void
      {
         this.parameterComponent.setEffectType(param1);
      }
      
      private function addLabel(param1:String) : void
      {
         this.paramNameLabel = new Label();
         this.paramNameLabel.buttonMode = true;
         this.paramNameLabel.styleName = "ctlParamName";
         this.paramNameLabel.width = this.width;
         this.paramNameLabel.maxDisplayedLines = 1;
         this.paramNameLabel.height = 15;
         this.paramNameLabel.x = 0;
         this.paramNameLabel.y = 2;
         this.paramNameLabel.text = param1;
         this.paramNameLabel.addEventListener(FlexEvent.CREATION_COMPLETE,this.labelCreateCompleteHandler,false,0,true);
         addElement(this.paramNameLabel);
      }
      
      private function labelCreateCompleteHandler(param1:FlexEvent) : void
      {
         ToneCentralUtil.setToolTipData(this.paramNameLabel);
      }
   }
}

