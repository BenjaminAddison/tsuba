package tonecentral.views.library
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.geom.Matrix;
   import mx.core.DragSource;
   import mx.events.DragEvent;
   import mx.managers.DragManager;
   import spark.components.Group;
   import tonecentral.common.data.LiveSetData;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.events.ToneCentralEvents;
   
   public class LibraryLiveSetItemLogic extends ToneCentralViewLogic
   {
      
      private var view:LibraryLiveSetItem;
      
      private var _data:LiveSetData;
      
      private var _selected:Boolean;
      
      private var libEditArea:LibEditArea;
      
      private var appMng:ApplicationManager;
      
      private var mouseDownX:int;
      
      public function LibraryLiveSetItemLogic()
      {
         super();
      }
      
      public function get data() : LiveSetData
      {
         return this._data;
      }
      
      public function set data(param1:LiveSetData) : void
      {
         this._data = param1;
         this.setContents();
      }
      
      private function setContents() : void
      {
         if(!this.view.nameLabel)
         {
            return;
         }
         this.view.nameLabel.text = this._data.name;
         this.loadImage(this._data.image);
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.view.editButton.visible = this._selected;
         this.view.deleteButton.visible = this._selected;
         if(this._selected)
         {
            this.view.nameBG.width = 110;
            this.view.nameLabel.width = 103;
            this.view.bgColor.color = 218985;
            this.view.nameLabel.styleName = "libraryItemLabelSelect";
         }
         else
         {
            this.view.nameBG.width = 172;
            this.view.nameLabel.width = 165;
            this.view.bgColor.color = 7171437;
            this.view.nameLabel.styleName = "libraryItemLabel";
         }
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LibraryLiveSetItem(param1);
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
         if(!this._selected)
         {
            this.view.bgColor.color = 222114;
         }
      }
      
      private function mouseOutHandler(param1:MouseEvent) : void
      {
         if(!this._selected)
         {
            this.view.bgColor.color = 7171437;
         }
      }
      
      override protected function onCreationComplete() : void
      {
         this.appMng = ApplicationManager.getInstance();
         this.view.addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverHandler,false,0,true);
         this.view.addEventListener(MouseEvent.MOUSE_OUT,this.mouseOutHandler,false,0,true);
         this.view.addEventListener(MouseEvent.MOUSE_DOWN,this.previewMouseDownHandler,false,0,true);
         this.view.bgClickArea.addEventListener(MouseEvent.CLICK,this.bgClickHandler,false,0,true);
         this.view.editButton.addEventListener(MouseEvent.CLICK,this.editButtonClickHandler,false,0,true);
         this.view.deleteButton.addEventListener(MouseEvent.CLICK,this.deleteClickHandler,false,0,true);
         this.view.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,false,0,true);
         this.view.addEventListener(DragEvent.DRAG_COMPLETE,this.dragCompleteHandler,false,0,true);
         this.setContents();
         this.drawClickArea();
         this.loadImage(this._data.image);
      }
      
      private function previewMouseDownHandler(param1:MouseEvent) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECTED_LIVE_SET));
      }
      
      private function editButtonClickHandler(param1:MouseEvent) : void
      {
         this.libEditArea = new LibEditArea();
         this.libEditArea.setData(this.data);
         this.libEditArea.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = this.libEditArea;
         this.libEditArea.addEventListener(ToneCentralEvents.EDIT_LIVESET_COMPLETE,this.editLivesetHandler,false,0,true);
      }
      
      private function editLivesetHandler(param1:ToneCentralEvents) : void
      {
         this._data.name = this.libEditArea.getData().name;
         this._data.image = this.libEditArea.getData().image;
         this.setContents();
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.EDIT_END));
      }
      
      private function deleteClickHandler(param1:MouseEvent) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DELETE));
      }
      
      private function bgClickHandler(param1:MouseEvent) : void
      {
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.SELECT));
      }
      
      private function loadImage(param1:String) : void
      {
         var _loc2_:Object = null;
         var _loc3_:File = null;
         var _loc4_:File = null;
         var _loc5_:Array = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:File = null;
         var _loc9_:File = null;
         if(param1)
         {
            _loc3_ = File.applicationStorageDirectory.resolvePath("artwork/" + param1);
            if(_loc3_.exists)
            {
               _loc2_ = File.applicationStorageDirectory.resolvePath("artwork/" + param1).url;
            }
            else
            {
               _loc4_ = File.applicationStorageDirectory.resolvePath("presetArtwork");
               _loc5_ = _loc4_.getDirectoryListing();
               _loc6_ = false;
               _loc7_ = 0;
               while(_loc7_ < _loc5_.length)
               {
                  _loc8_ = _loc5_[_loc7_];
                  if(_loc8_.name == param1)
                  {
                     _loc6_ = true;
                     _loc9_ = File.applicationStorageDirectory.resolvePath("artwork/" + _loc8_.name);
                     _loc8_.copyTo(_loc9_,true);
                  }
                  _loc7_++;
               }
               if(_loc6_)
               {
                  _loc2_ = File.applicationStorageDirectory.resolvePath("artwork/" + param1).url;
               }
               else
               {
                  _loc2_ = File.applicationDirectory.resolvePath("_assets/images/img_libdefo.png").url;
               }
            }
         }
         else
         {
            _loc2_ = File.applicationDirectory.resolvePath("_assets/images/img_libdefo.png").url;
         }
         this.view.ghostImage.source = _loc2_;
         this.view.ghostImage.addEventListener(Event.COMPLETE,this.imageCompleteHandler,false,0,true);
      }
      
      private function imageCompleteHandler(param1:Event) : void
      {
         var _loc2_:BitmapData = new BitmapData(27,27);
         _loc2_.draw(this.view.ghostImage.bitmapData,new Matrix(27 / this.view.ghostImage.bitmapData.width,0,0,27 / this.view.ghostImage.bitmapData.height),null,null,null,true);
         this.view.artworkImage.source = _loc2_;
      }
      
      private function drawClickArea() : void
      {
         var _loc1_:Graphics = this.view.bgClickArea.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.width,this.view.height);
         _loc1_.endFill();
      }
      
      private function dragCompleteHandler(param1:DragEvent) : void
      {
         this.appMng.livesetDragEnd();
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         this.view.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,false,0,true);
         this.view.addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler,false,0,true);
         this.view.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,false,0,true);
         this.mouseDownX = param1.localX;
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         this.mouseDownX = -1;
         this.view.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         this.view.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         this.view.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      private function rollOutHandler(param1:MouseEvent) : void
      {
         this.mouseDownX = -1;
         this.view.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         this.view.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         this.view.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:DragSource = null;
         if(Math.abs(param1.localX - this.mouseDownX) >= 5)
         {
            _loc2_ = new DragSource();
            _loc2_.dataForFormat("liveset");
            _loc2_.addData({"value":this._data},"liveset");
            DragManager.doDrag(this.view,_loc2_,param1,Group(this.view.parent));
            this.appMng.livesetDragStart();
         }
      }
   }
}

