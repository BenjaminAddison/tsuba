package tonecentral.views.tccontents
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
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.effects.Fade;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class AddLivesetMsgArea extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1280032006arrowImg:BitmapImage;
      
      private var _93647166bgImg:BitmapImage;
      
      private var _108417msg:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml___assets_images_bgi_fukidasi_t_png_1973819467:Class;
      
      private var _embed_mxml___assets_images_bgi_fukidasi_png_344732932:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AddLivesetMsgArea()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml___assets_images_bgi_fukidasi_t_png_1973819467 = AddLivesetMsgArea__embed_mxml___assets_images_bgi_fukidasi_t_png_1973819467;
         this._embed_mxml___assets_images_bgi_fukidasi_png_344732932 = AddLivesetMsgArea__embed_mxml___assets_images_bgi_fukidasi_png_344732932;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._AddLivesetMsgArea_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_tonecentral_views_tccontents_AddLivesetMsgAreaWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AddLivesetMsgArea[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 200;
         this.height = 50;
         this.mxmlContent = [this._AddLivesetMsgArea_BitmapImage1_i(),this._AddLivesetMsgArea_BitmapImage2_i(),this._AddLivesetMsgArea_Label1_i()];
         this.addEventListener("creationComplete",this.___AddLivesetMsgArea_Group1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AddLivesetMsgArea._watcherSetupUtil = param1;
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
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
      }
      
      public function showMsg() : void
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         _loc1_.target = this;
         _loc1_.play();
         _loc1_.addEventListener(EffectEvent.EFFECT_END,this.showEffectEndHandler,false,0,true);
      }
      
      private function showEffectEndHandler(param1:EffectEvent) : void
      {
         this.visible = true;
      }
      
      public function hideMsg() : void
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 1;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 500;
         _loc1_.target = this;
         _loc1_.play();
         _loc1_.addEventListener(EffectEvent.EFFECT_END,this.hideEffectEndHandler,false,0,true);
      }
      
      private function hideEffectEndHandler(param1:EffectEvent) : void
      {
         this.visible = false;
      }
      
      private function _AddLivesetMsgArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 30;
         _loc1_.width = 10;
         _loc1_.height = 10;
         _loc1_.source = this._embed_mxml___assets_images_bgi_fukidasi_t_png_1973819467;
         _loc1_.rotation = 90;
         _loc1_.initialized(this,"arrowImg");
         this.arrowImg = _loc1_;
         BindingManager.executeBindings(this,"arrowImg",this.arrowImg);
         return _loc1_;
      }
      
      private function _AddLivesetMsgArea_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 10;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.source = this._embed_mxml___assets_images_bgi_fukidasi_png_344732932;
         _loc1_.initialized(this,"bgImg");
         this.bgImg = _loc1_;
         BindingManager.executeBindings(this,"bgImg",this.bgImg);
         return _loc1_;
      }
      
      private function _AddLivesetMsgArea_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 10;
         _loc1_.horizontalCenter = 0;
         _loc1_.height = 40;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "msg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.msg = _loc1_;
         BindingManager.executeBindings(this,"msg",this.msg);
         return _loc1_;
      }
      
      public function ___AddLivesetMsgArea_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      private function _AddLivesetMsgArea_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = ResourceManager.getInstance().getString("resource","dialog.tonecentral.addMsg");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"msg.text");
         result[1] = new Binding(this,function():Object
         {
            return ResourceManager.getInstance().getString("resource","dialog.msg.style3");
         },null,"msg.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowImg() : BitmapImage
      {
         return this._1280032006arrowImg;
      }
      
      public function set arrowImg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1280032006arrowImg;
         if(_loc2_ !== param1)
         {
            this._1280032006arrowImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgImg() : BitmapImage
      {
         return this._93647166bgImg;
      }
      
      public function set bgImg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._93647166bgImg;
         if(_loc2_ !== param1)
         {
            this._93647166bgImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgImg",_loc2_,param1));
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
   }
}

