package tonecentral.views.info
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RichText;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class InfoItem extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _3141bg:UIComponent;
      
      private var _266978330dateLabel:Label;
      
      private var _1464533731descLabel:RichText;
      
      private var _103149406logic:InfoItemLogic;
      
      private var _222060102outLinkButton:UIComponent;
      
      private var _877342117outlinkImg:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__assets_images_sidearea_img_outlink_up_png_1322108409:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoItem()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__assets_images_sidearea_img_outlink_up_png_1322108409 = InfoItem__embed_mxml__assets_images_sidearea_img_outlink_up_png_1322108409;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._InfoItem_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_info_InfoItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoItem[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 360;
         this.mxmlContent = [this._InfoItem_UIComponent1_i(),this._InfoItem_UIComponent2_i(),this._InfoItem_BitmapImage1_i(),this._InfoItem_Label1_i(),this._InfoItem_RichText1_i()];
         this._InfoItem_InfoItemLogic1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InfoItem._watcherSetupUtil = param1;
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
      
      public function set data(param1:Object) : void
      {
         this.logic.data = param1;
      }
      
      public function set isManual(param1:Boolean) : void
      {
         this.logic.isManual = param1;
      }
      
      private function _InfoItem_InfoItemLogic1_i() : InfoItemLogic
      {
         var _loc1_:InfoItemLogic = new InfoItemLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _InfoItem_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "bg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bg = _loc1_;
         BindingManager.executeBindings(this,"bg",this.bg);
         return _loc1_;
      }
      
      private function _InfoItem_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentHeight = 100;
         _loc1_.width = 60;
         _loc1_.right = 0;
         _loc1_.buttonMode = true;
         _loc1_.id = "outLinkButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.outLinkButton = _loc1_;
         BindingManager.executeBindings(this,"outLinkButton",this.outLinkButton);
         return _loc1_;
      }
      
      private function _InfoItem_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__assets_images_sidearea_img_outlink_up_png_1322108409;
         _loc1_.verticalCenter = 0;
         _loc1_.right = 20;
         _loc1_.initialized(this,"outlinkImg");
         this.outlinkImg = _loc1_;
         BindingManager.executeBindings(this,"outlinkImg",this.outlinkImg);
         return _loc1_;
      }
      
      private function _InfoItem_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 10;
         _loc1_.styleName = "infoItemDateLabel";
         _loc1_.id = "dateLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dateLabel = _loc1_;
         BindingManager.executeBindings(this,"dateLabel",this.dateLabel);
         return _loc1_;
      }
      
      private function _InfoItem_RichText1_i() : RichText
      {
         var _loc1_:RichText = new RichText();
         _loc1_.left = 10;
         _loc1_.y = 35;
         _loc1_.right = 70;
         _loc1_.id = "descLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.descLabel = _loc1_;
         BindingManager.executeBindings(this,"descLabel",this.descLabel);
         return _loc1_;
      }
      
      private function _InfoItem_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","info.item.style");
         },null,"descLabel.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bg() : UIComponent
      {
         return this._3141bg;
      }
      
      public function set bg(param1:UIComponent) : void
      {
         var _loc2_:Object = this._3141bg;
         if(_loc2_ !== param1)
         {
            this._3141bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dateLabel() : Label
      {
         return this._266978330dateLabel;
      }
      
      public function set dateLabel(param1:Label) : void
      {
         var _loc2_:Object = this._266978330dateLabel;
         if(_loc2_ !== param1)
         {
            this._266978330dateLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dateLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get descLabel() : RichText
      {
         return this._1464533731descLabel;
      }
      
      public function set descLabel(param1:RichText) : void
      {
         var _loc2_:Object = this._1464533731descLabel;
         if(_loc2_ !== param1)
         {
            this._1464533731descLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : InfoItemLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:InfoItemLogic) : void
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
      public function get outLinkButton() : UIComponent
      {
         return this._222060102outLinkButton;
      }
      
      public function set outLinkButton(param1:UIComponent) : void
      {
         var _loc2_:Object = this._222060102outLinkButton;
         if(_loc2_ !== param1)
         {
            this._222060102outLinkButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outLinkButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outlinkImg() : BitmapImage
      {
         return this._877342117outlinkImg;
      }
      
      public function set outlinkImg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._877342117outlinkImg;
         if(_loc2_ !== param1)
         {
            this._877342117outlinkImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outlinkImg",_loc2_,param1));
            }
         }
      }
   }
}

