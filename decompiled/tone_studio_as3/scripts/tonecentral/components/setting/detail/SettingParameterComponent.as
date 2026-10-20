package tonecentral.components.setting.detail
{
   import mx.events.FlexEvent;
   import spark.components.Group;
   import spark.components.Label;
   import tonecentral.common.define.SystemSettingDefinitionGT;
   import tonecentral.common.util.ParameterUtil;
   import tonecentral.components.edit.ParameterComponent;
   
   public class SettingParameterComponent extends Group
   {
      
      private var paramNameLabel:Label;
      
      private var unitNameLabel:Label;
      
      private var parameterComponent:ParameterComponent;
      
      public var data:Object;
      
      public function SettingParameterComponent(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.width = param1;
         this.height = 25;
         this.parameterComponent = new ParameterComponent(param1,param2,param3,param4,param5);
         this.parameterComponent.isSystemSetting = true;
         this.parameterComponent.x = 180;
         this.parameterComponent.y = 0;
         addElement(this.parameterComponent);
         this.parameterComponent.addEventListener(FlexEvent.CREATION_COMPLETE,this.createCompleteHandler,false,0,true);
      }
      
      public function getAddress() : String
      {
         return this.parameterComponent.address;
      }
      
      private function createCompleteHandler(param1:FlexEvent) : void
      {
         this.parameterComponent.textBoxBgi.visible = false;
      }
      
      public function setdata(param1:Object) : void
      {
         this.data = param1;
         this.addLabel(param1.name);
         this.parameterComponent.setdata(this.data,SystemSettingDefinitionGT.DROPDOWN_LIST,new Object());
      }
      
      public function updateData(param1:Object) : void
      {
         this.data = param1;
         this.parameterComponent.updateFromMe80 = true;
         this.parameterComponent.changeStepperIsInit(true);
         this.parameterComponent.min = param1.min;
         this.parameterComponent.max = param1.max;
         this.parameterComponent.step = param1.step;
         this.parameterComponent.address = param1.address;
         this.parameterComponent.paramVal = param1.value;
         this.parameterComponent.updateFromMe80 = false;
      }
      
      public function setEffectType(param1:String) : void
      {
         this.parameterComponent.setEffectType(param1);
      }
      
      public function paramUpdateHandler(param1:Number) : void
      {
         this.parameterComponent.updateFromMe80 = true;
         param1 *= this.parameterComponent.step;
         param1 = ParameterUtil.getDoubleByteDataSetting(this.parameterComponent.address,param1,this.data.id);
         this.parameterComponent.paramVal = param1;
         this.parameterComponent.updateFromMe80 = false;
      }
      
      private function addLabel(param1:String) : void
      {
         this.paramNameLabel = new Label();
         this.paramNameLabel.styleName = "settingItem";
         this.paramNameLabel.width = 180;
         this.paramNameLabel.maxDisplayedLines = 1;
         this.paramNameLabel.height = 25;
         this.paramNameLabel.x = 0;
         this.paramNameLabel.y = 5;
         this.paramNameLabel.text = param1;
         addElement(this.paramNameLabel);
      }
      
      public function addUnitLabel(param1:String) : void
      {
         this.unitNameLabel = new Label();
         this.unitNameLabel.styleName = "unitNameStyle";
         this.unitNameLabel.width = 30;
         this.unitNameLabel.maxDisplayedLines = 1;
         this.unitNameLabel.height = 25;
         this.unitNameLabel.x = 295;
         this.unitNameLabel.y = 7;
         this.unitNameLabel.text = param1;
         addElement(this.unitNameLabel);
      }
   }
}

