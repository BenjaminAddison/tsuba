package tonecentral.components.popup
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RadioButtonGroup;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import tonecentral.components.ImageLabelButton;
   import tonecentral.skin.ScrollerSkin;
   
   use namespace mx_internal;
   
   public class ConnectPortSelectPopup extends ToneCentralPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _661256293audioIn:VGroup;
      
      private var _1995776091audioInRadioGrp:RadioButtonGroup;
      
      private var _1928336629audioInScroller:Scroller;
      
      private var _975897496audioOut:VGroup;
      
      private var _1223258462audioOutRadioGrp:RadioButtonGroup;
      
      private var _1594113038audioOutScroller:Scroller;
      
      private var _103149406logic:ConnectPortSelectPopupLogic;
      
      private var _1074337754midiIn:VGroup;
      
      private var _1924400432midiInRadioGrp:RadioButtonGroup;
      
      private var _1553545856midiInScroller:Scroller;
      
      private var _1055274093midiOut:VGroup;
      
      private var _43129463midiOutRadioGrp:RadioButtonGroup;
      
      private var _327725113midiOutScroller:Scroller;
      
      private var _108417msg:Label;
      
      private var _501248986typeLabel:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var refreshButton:ImageLabelButton;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ConnectPortSelectPopup()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ConnectPortSelectPopup_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_components_popup_ConnectPortSelectPopupWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ConnectPortSelectPopup[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 580;
         this.height = 505;
         this.mxmlContent = [this._ConnectPortSelectPopup_Label1_i(),this._ConnectPortSelectPopup_Label2_i(),this._ConnectPortSelectPopup_HGroup1_c(),this._ConnectPortSelectPopup_HGroup2_c(),this._ConnectPortSelectPopup_HGroup3_c(),this._ConnectPortSelectPopup_HGroup4_c()];
         this._ConnectPortSelectPopup_RadioButtonGroup3_i();
         this._ConnectPortSelectPopup_RadioButtonGroup4_i();
         this._ConnectPortSelectPopup_ConnectPortSelectPopupLogic1_i();
         this._ConnectPortSelectPopup_RadioButtonGroup1_i();
         this._ConnectPortSelectPopup_RadioButtonGroup2_i();
         this.addEventListener("creationComplete",this.___ConnectPortSelectPopup_ToneCentralPopup1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ConnectPortSelectPopup._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function addDialog() : void
      {
         super.addDialog();
         setDialogSize(580,505);
      }
      
      public function setMessage() : void
      {
         this.msg.text = ResourceManager.getInstance().getString("resource","dialog.connectPortMsg2");
      }
      
      override protected function addButton() : void
      {
         okButton = new ImageLabelButton();
         okButton.styleName = "dialogOKButton";
         okButton.horizontalCenter = 0;
         okButton.bottom = 23;
         okButton.width = 80;
         okButton.height = 25;
         okButton.label = "OK";
         okButton.setFocus();
         container.addElement(okButton);
         okButton.addEventListener(MouseEvent.CLICK,this.logic.okButtonClickHandler,false,0,true);
         closeButton = new ImageLabelButton();
         closeButton.styleName = "dialogCloseButton";
         closeButton.x = 15;
         closeButton.bottom = 23;
         closeButton.width = 80;
         closeButton.height = 25;
         closeButton.label = "CLOSE";
         container.addElement(closeButton);
         closeButton.addEventListener(MouseEvent.CLICK,onCloseClick,false,0,true);
         this.refreshButton = new ImageLabelButton();
         this.refreshButton.styleName = "dialogOKButton";
         this.refreshButton.setStyle("right",15);
         this.refreshButton.bottom = 23;
         this.refreshButton.width = 80;
         this.refreshButton.height = 25;
         this.refreshButton.label = "REFRESH";
         this.refreshButton.setFocus();
         container.addElement(this.refreshButton);
         this.refreshButton.addEventListener(MouseEvent.CLICK,this.refreshButtonClickHandler,false,0,true);
      }
      
      override protected function drawBackground() : void
      {
         super.drawBackground();
         if(!backgoundLayer)
         {
            return;
         }
         backgoundLayer.graphics.lineStyle(1,0);
         backgoundLayer.graphics.moveTo(2,40);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,40);
         backgoundLayer.graphics.moveTo(2,90);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,90);
         backgoundLayer.graphics.moveTo(2,130);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,130);
         backgoundLayer.graphics.moveTo(2,265);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,265);
         backgoundLayer.graphics.moveTo(2,305);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,305);
         backgoundLayer.graphics.moveTo(2,dialogHeight - 65);
         backgoundLayer.graphics.lineTo(dialogWidth - 2,dialogHeight - 65);
      }
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.setElementIndex(container,0);
      }
      
      private function refreshButtonClickHandler(param1:MouseEvent) : void
      {
         this.logic.refreshButtonClickHandler();
      }
      
      private function _ConnectPortSelectPopup_RadioButtonGroup3_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"audioInRadioGrp");
         this.audioInRadioGrp = _loc1_;
         BindingManager.executeBindings(this,"audioInRadioGrp",this.audioInRadioGrp);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_RadioButtonGroup4_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"audioOutRadioGrp");
         this.audioOutRadioGrp = _loc1_;
         BindingManager.executeBindings(this,"audioOutRadioGrp",this.audioOutRadioGrp);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_ConnectPortSelectPopupLogic1_i() : ConnectPortSelectPopupLogic
      {
         var _loc1_:ConnectPortSelectPopupLogic = new ConnectPortSelectPopupLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"midiInRadioGrp");
         this.midiInRadioGrp = _loc1_;
         BindingManager.executeBindings(this,"midiInRadioGrp",this.midiInRadioGrp);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_RadioButtonGroup2_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"midiOutRadioGrp");
         this.midiOutRadioGrp = _loc1_;
         BindingManager.executeBindings(this,"midiOutRadioGrp",this.midiOutRadioGrp);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "dialogConnectPortTitleLabel";
         _loc1_.x = 10;
         _loc1_.y = 12;
         _loc1_.text = "CONNECTION";
         _loc1_.id = "typeLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.typeLabel = _loc1_;
         BindingManager.executeBindings(this,"typeLabel",this.typeLabel);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 53;
         _loc1_.id = "msg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.msg = _loc1_;
         BindingManager.executeBindings(this,"msg",this.msg);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 10;
         _loc1_.top = 90;
         _loc1_.height = 40;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Group1_c(),this._ConnectPortSelectPopup_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 280;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Label3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "dialogConnectPortItemLabel";
         _loc1_.text = "MIDI IN";
         _loc1_.x = 23;
         _loc1_.verticalCenter = -2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 280;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Label4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "dialogConnectPortItemLabel";
         _loc1_.text = "MIDI OUT";
         _loc1_.x = 23;
         _loc1_.verticalCenter = -2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 10;
         _loc1_.top = 130;
         _loc1_.height = 135;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Scroller1_i(),this._ConnectPortSelectPopup_Scroller2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.width = 280;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._ConnectPortSelectPopup_VGroup1_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "midiInScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.midiInScroller = _loc1_;
         BindingManager.executeBindings(this,"midiInScroller",this.midiInScroller);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_UIComponent1_c()];
         _loc1_.id = "midiIn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.midiIn = _loc1_;
         BindingManager.executeBindings(this,"midiIn",this.midiIn);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_UIComponent1_c() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.height = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Scroller2_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.width = 280;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._ConnectPortSelectPopup_VGroup2_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "midiOutScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.midiOutScroller = _loc1_;
         BindingManager.executeBindings(this,"midiOutScroller",this.midiOutScroller);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_UIComponent2_c()];
         _loc1_.id = "midiOut";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.midiOut = _loc1_;
         BindingManager.executeBindings(this,"midiOut",this.midiOut);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_UIComponent2_c() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.height = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 10;
         _loc1_.top = 265;
         _loc1_.height = 40;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Group3_c(),this._ConnectPortSelectPopup_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 280;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Label5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "dialogConnectPortItemLabel";
         _loc1_.text = "AUDIO IN";
         _loc1_.x = 23;
         _loc1_.verticalCenter = -2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 280;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Label6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.styleName = "dialogConnectPortItemLabel";
         _loc1_.text = "AUDIO OUT";
         _loc1_.x = 23;
         _loc1_.verticalCenter = -2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 10;
         _loc1_.top = 305;
         _loc1_.height = 135;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_Scroller3_i(),this._ConnectPortSelectPopup_Scroller4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Scroller3_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.width = 280;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._ConnectPortSelectPopup_VGroup3_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "audioInScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.audioInScroller = _loc1_;
         BindingManager.executeBindings(this,"audioInScroller",this.audioInScroller);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_UIComponent3_c()];
         _loc1_.id = "audioIn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.audioIn = _loc1_;
         BindingManager.executeBindings(this,"audioIn",this.audioIn);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_UIComponent3_c() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.height = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_Scroller4_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.width = 280;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._ConnectPortSelectPopup_VGroup4_i();
         _loc1_.setStyle("skinClass",ScrollerSkin);
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "audioOutScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.audioOutScroller = _loc1_;
         BindingManager.executeBindings(this,"audioOutScroller",this.audioOutScroller);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ConnectPortSelectPopup_UIComponent4_c()];
         _loc1_.id = "audioOut";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.audioOut = _loc1_;
         BindingManager.executeBindings(this,"audioOut",this.audioOut);
         return _loc1_;
      }
      
      private function _ConnectPortSelectPopup_UIComponent4_c() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.height = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ConnectPortSelectPopup_ToneCentralPopup1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      private function _ConnectPortSelectPopup_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","dialog.connectPortMsg");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"msg.text");
         result[1] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","dialog.msg.style");
         },null,"msg.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get audioIn() : VGroup
      {
         return this._661256293audioIn;
      }
      
      public function set audioIn(param1:VGroup) : void
      {
         var _loc2_:Object = this._661256293audioIn;
         if(_loc2_ !== param1)
         {
            this._661256293audioIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"audioIn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get audioInRadioGrp() : RadioButtonGroup
      {
         return this._1995776091audioInRadioGrp;
      }
      
      public function set audioInRadioGrp(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1995776091audioInRadioGrp;
         if(_loc2_ !== param1)
         {
            this._1995776091audioInRadioGrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"audioInRadioGrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get audioInScroller() : Scroller
      {
         return this._1928336629audioInScroller;
      }
      
      public function set audioInScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._1928336629audioInScroller;
         if(_loc2_ !== param1)
         {
            this._1928336629audioInScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"audioInScroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get audioOut() : VGroup
      {
         return this._975897496audioOut;
      }
      
      public function set audioOut(param1:VGroup) : void
      {
         var _loc2_:Object = this._975897496audioOut;
         if(_loc2_ !== param1)
         {
            this._975897496audioOut = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"audioOut",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get audioOutRadioGrp() : RadioButtonGroup
      {
         return this._1223258462audioOutRadioGrp;
      }
      
      public function set audioOutRadioGrp(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1223258462audioOutRadioGrp;
         if(_loc2_ !== param1)
         {
            this._1223258462audioOutRadioGrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"audioOutRadioGrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get audioOutScroller() : Scroller
      {
         return this._1594113038audioOutScroller;
      }
      
      public function set audioOutScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._1594113038audioOutScroller;
         if(_loc2_ !== param1)
         {
            this._1594113038audioOutScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"audioOutScroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ConnectPortSelectPopupLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ConnectPortSelectPopupLogic) : void
      {
         var _loc2_:Object = this._103149406logic;
         if(_loc2_ !== param1)
         {
            this._103149406logic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get midiIn() : VGroup
      {
         return this._1074337754midiIn;
      }
      
      public function set midiIn(param1:VGroup) : void
      {
         var _loc2_:Object = this._1074337754midiIn;
         if(_loc2_ !== param1)
         {
            this._1074337754midiIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"midiIn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get midiInRadioGrp() : RadioButtonGroup
      {
         return this._1924400432midiInRadioGrp;
      }
      
      public function set midiInRadioGrp(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1924400432midiInRadioGrp;
         if(_loc2_ !== param1)
         {
            this._1924400432midiInRadioGrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"midiInRadioGrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get midiInScroller() : Scroller
      {
         return this._1553545856midiInScroller;
      }
      
      public function set midiInScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._1553545856midiInScroller;
         if(_loc2_ !== param1)
         {
            this._1553545856midiInScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"midiInScroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get midiOut() : VGroup
      {
         return this._1055274093midiOut;
      }
      
      public function set midiOut(param1:VGroup) : void
      {
         var _loc2_:Object = this._1055274093midiOut;
         if(_loc2_ !== param1)
         {
            this._1055274093midiOut = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"midiOut",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get midiOutRadioGrp() : RadioButtonGroup
      {
         return this._43129463midiOutRadioGrp;
      }
      
      public function set midiOutRadioGrp(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._43129463midiOutRadioGrp;
         if(_loc2_ !== param1)
         {
            this._43129463midiOutRadioGrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"midiOutRadioGrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get midiOutScroller() : Scroller
      {
         return this._327725113midiOutScroller;
      }
      
      public function set midiOutScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._327725113midiOutScroller;
         if(_loc2_ !== param1)
         {
            this._327725113midiOutScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"midiOutScroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get msg() : Label
      {
         return this._108417msg;
      }
      
      public function set msg(param1:Label) : void
      {
         var _loc2_:Object = this._108417msg;
         if(_loc2_ !== param1)
         {
            this._108417msg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get typeLabel() : Label
      {
         return this._501248986typeLabel;
      }
      
      public function set typeLabel(param1:Label) : void
      {
         var _loc2_:Object = this._501248986typeLabel;
         if(_loc2_ !== param1)
         {
            this._501248986typeLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeLabel",_loc2_,param1));
            }
         }
      }
   }
}

