package tonecentral.views.library
{
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.NativeDragEvent;
   import flash.filesystem.File;
   import flash.geom.Matrix;
   import flash.net.FileFilter;
   import mx.managers.DragManager;
   import mx.resources.ResourceManager;
   import tonecentral.common.data.LiveSetData;
   import tonecentral.common.view.ToneCentralViewLogic;
   import tonecentral.components.popup.ConfirmPopup;
   import tonecentral.events.ToneCentralEvents;
   
   public class LibEditAreaLogic extends ToneCentralViewLogic
   {
      
      private var view:LibEditArea;
      
      public var liveSetData:LiveSetData;
      
      public var file:File;
      
      public function LibEditAreaLogic()
      {
         super();
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LibEditArea(param1);
      }
      
      override protected function onCreationComplete() : void
      {
         this.view.setElementIndex(this.view.container,0);
         this.view.selectFile.addEventListener(MouseEvent.CLICK,this.selectFileHandler,false,0,true);
         this.view.customPreviewArtworkImage.addEventListener(ToneCentralEvents.PRESET_ARTWORK_SELECTED,this.customPreviewArtworkImageSelectedHandler,false,0,true);
         this.view.uploadArea.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.dragEnterHandler,false,0,true);
         this.view.uploadArea.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.dragDropHandler,false,0,true);
      }
      
      protected function dragDropHandler(param1:NativeDragEvent) : void
      {
         var _loc3_:Array = null;
         var _loc2_:Clipboard = param1.clipboard;
         if(_loc2_.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
         {
            _loc3_ = _loc2_.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
            if(!_loc3_ || _loc3_.length != 1)
            {
               return;
            }
            this.file = _loc3_[0];
            this.loadImage(this.file);
         }
      }
      
      protected function dragEnterHandler(param1:NativeDragEvent) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Boolean = false;
         var _loc5_:File = null;
         var _loc6_:String = null;
         var _loc2_:Clipboard = param1.clipboard;
         if(_loc2_.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
         {
            _loc3_ = _loc2_.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
            if(!_loc3_ || _loc3_.length != 1)
            {
               return;
            }
            _loc4_ = true;
            for each(_loc5_ in _loc3_)
            {
               _loc6_ = "";
               if(_loc5_)
               {
                  _loc6_ = _loc5_.extension.toLowerCase();
               }
               if(Boolean(_loc5_ && _loc6_ != "png") && Boolean(_loc6_ != "jpg") && _loc6_ != "gif")
               {
                  _loc4_ = false;
                  break;
               }
            }
            if(_loc4_)
            {
               DragManager.acceptDragDrop(this.view.uploadArea);
            }
         }
      }
      
      public function close() : void
      {
         var _loc1_:ConfirmPopup = new ConfirmPopup();
         _loc1_.setHeaderText("editLiveset.closeDialog.header");
         _loc1_.setMsgText("editLiveset.closeDialog.message");
         _loc1_.popup(Context.dialogMng.parent,true);
         Context.dialogMng.currentPopup = _loc1_;
         _loc1_.addEventListener(ToneCentralEvents.OK,this.closeOKHandler,false,0,true);
      }
      
      public function closeOKHandler(param1:ToneCentralEvents) : void
      {
         this.view.exeClose();
      }
      
      public function onOKClick() : void
      {
         var localFile:File = null;
         if(this.file)
         {
            try
            {
               localFile = File.applicationStorageDirectory.resolvePath("artwork/" + this.file.name);
               this.file.copyTo(localFile,true);
            }
            catch(error:Error)
            {
            }
            if(localFile.exists)
            {
               this.liveSetData.image = this.file.name;
            }
         }
         this.liveSetData.name = this.view.nameInput.text;
         this.view.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.EDIT_LIVESET_COMPLETE));
         this.view.exeClose();
      }
      
      private function selectFileHandler(param1:MouseEvent) : void
      {
         var _loc2_:File = File.documentsDirectory;
         var _loc3_:FileFilter = new FileFilter("Images","*.jpg;*.gif;*.png");
         _loc2_.browseForOpen(ResourceManager.getInstance().getString("resource","dialog.artwark.header"),[_loc3_]);
         _loc2_.addEventListener(Event.SELECT,this.artworkSelectHandler,false,0,true);
      }
      
      private function artworkSelectHandler(param1:Event) : void
      {
         this.file = param1.currentTarget as File;
         this.loadImage(this.file);
      }
      
      public function getData() : LiveSetData
      {
         return this.liveSetData;
      }
      
      public function setData(param1:LiveSetData) : void
      {
         var _loc8_:File = null;
         var _loc9_:LibEditPresetImage = null;
         this.view.nameInput.text = param1.name;
         this.liveSetData = param1;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("orgartwork/" + this.liveSetData.id + ".png");
         var _loc3_:File = File.applicationStorageDirectory.resolvePath("artwork/" + this.liveSetData.image);
         var _loc4_:Array = File.applicationStorageDirectory.resolvePath("presetArtwork/").getDirectoryListing();
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(_loc4_[_loc6_].name == _loc3_.name)
            {
               _loc5_ = true;
            }
            _loc6_++;
         }
         if(!_loc5_ && !_loc2_.exists && Boolean(_loc3_.exists) && !_loc3_.isDirectory)
         {
            _loc3_.copyTo(_loc2_);
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc8_ = _loc4_[_loc7_];
            if(_loc8_.name != ".DS_Store")
            {
               if(_loc8_.name == "image_01.png" && Boolean(_loc2_.exists))
               {
                  _loc8_ = _loc2_;
               }
               _loc9_ = new LibEditPresetImage();
               _loc9_.setData(_loc8_.url);
               _loc9_.addEventListener(ToneCentralEvents.PRESET_ARTWORK_SELECTED,this.presetArtworkSelectedHandler,false,0,true);
               this.view.presetImages.addElement(_loc9_);
            }
            _loc7_++;
         }
         if(this.liveSetData.image)
         {
            this.loadImage(File.applicationStorageDirectory.resolvePath("artwork/" + this.liveSetData.image));
         }
         else
         {
            this.loadImage(null);
         }
      }
      
      private function presetArtworkSelectedHandler(param1:ToneCentralEvents) : void
      {
         this.file = LibEditPresetImage(param1.currentTarget).getImage();
         this.loadImage(this.file);
      }
      
      private function customPreviewArtworkImageSelectedHandler(param1:ToneCentralEvents) : void
      {
         this.file = LibEditCustomPreviewImage(param1.currentTarget).getImage();
         if(this.file)
         {
            this.loadImage(this.file);
         }
      }
      
      private function resetImageSelected() : void
      {
         var _loc2_:LibEditPresetImage = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.view.presetImages.numElements)
         {
            _loc2_ = LibEditPresetImage(this.view.presetImages.getElementAt(_loc1_));
            _loc2_.resetSelected();
            _loc1_++;
         }
         this.view.customPreviewArtworkImage.resetSelected();
      }
      
      private function setImageSelected(param1:File) : void
      {
         var _loc4_:LibEditPresetImage = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.view.presetImages.numElements)
         {
            _loc4_ = LibEditPresetImage(this.view.presetImages.getElementAt(_loc3_));
            if(_loc4_.getImage().name == param1.name)
            {
               _loc2_ = true;
               _loc4_.selectedImage();
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            this.view.customPreviewArtworkImage.selectedImage();
            this.view.customPreviewArtworkImage.setData(param1.url);
         }
      }
      
      private function loadImage(param1:File) : void
      {
         var _loc2_:Object = null;
         this.resetImageSelected();
         if(Boolean(param1) && Boolean(param1.exists))
         {
            _loc2_ = param1.url;
            this.setImageSelected(param1);
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
         var _loc2_:BitmapData = new BitmapData(36,36);
         _loc2_.draw(this.view.ghostImage.bitmapData,new Matrix(36 / this.view.ghostImage.bitmapData.width,0,0,36 / this.view.ghostImage.bitmapData.height),null,null,null,true);
         this.view.artworkImage.source = _loc2_;
      }
   }
}

