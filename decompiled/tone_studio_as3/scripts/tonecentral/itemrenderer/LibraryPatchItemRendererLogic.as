package tonecentral.itemrenderer
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.geom.Point;
   import jp.co.site4d.ns.develop;
   import mx.events.DragEvent;
   import mx.events.ToolTipEvent;
   import mx.managers.DragManager;
   import mx.utils.ObjectUtil;
   import mx.utils.StringUtil;
   import spark.components.IItemRenderer;
   import tonecentral.common.data.PatchData;
   import tonecentral.common.define.EnvSetting;
   import tonecentral.common.manager.ApplicationManager;
   import tonecentral.common.util.DataUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.ToneCentralEvents;
   import tonecentral.mediator.ToneCentralMediator;
   import tonecentral.views.library.PatchList;
   
   public class LibraryPatchItemRendererLogic extends ViewLogic
   {
      
      private var view:LibraryPatchItemRenderer;
      
      private var mediator:ToneCentralMediator = ToneCentralMediator.getInstance();
      
      private var _editMode:Boolean;
      
      private var isChangeEditMode:Boolean = false;
      
      private var isEdited:Boolean = false;
      
      public function LibraryPatchItemRendererLogic()
      {
         super();
      }
      
      private function changeVisibleMemoHandler(param1:ToneCentralEvents) : void
      {
         this.changeMemoArea();
         this.changeVisibleEditBotton();
         this.drawDropArea();
      }
      
      private function changeEditModeHandler(param1:ToneCentralEvents) : void
      {
         if(!this.isChangeEditMode)
         {
            this.cancelEditMode();
         }
         this.isChangeEditMode = false;
      }
      
      private function changeMemoArea() : void
      {
         if(this.editMode)
         {
            this.endEditMode();
         }
         if(this.mediator.hideMemo)
         {
            this.hideMemoArea();
         }
         else
         {
            this.showMemoArea();
         }
      }
      
      private function showMemoArea() : void
      {
         this.view.toolTip = "";
         this.view.height = 96;
         if(this.view.dragArea)
         {
            this.view.dragArea.height = 95;
         }
         if(this.view.dragAreaHoverd)
         {
            this.view.dragAreaHoverd.height = 95;
         }
         if(this.view.dragAreaSelected)
         {
            this.view.dragAreaSelected.height = 95;
         }
         this.view.noteBG.visible = true;
         if(!this.editMode)
         {
            this.view.memoLable.visible = true;
         }
         this.view.dropArea.height = 70;
         this.view.callLater(this.delayIncludeInlayout,[true]);
      }
      
      private function hideMemoArea() : void
      {
         this.view.toolTip = this.view.memoLable.text;
         this.view.height = 30;
         if(this.view.dragArea)
         {
            this.view.dragArea.height = 29;
         }
         if(this.view.dragAreaHoverd)
         {
            this.view.dragAreaHoverd.height = 29;
         }
         if(this.view.dragAreaSelected)
         {
            this.view.dragAreaSelected.height = 29;
         }
         this.view.noteBG.visible = false;
         this.view.memoLable.visible = false;
         this.view.dropArea.height = 15;
         this.view.callLater(this.delayIncludeInlayout,[false]);
      }
      
      private function delayIncludeInlayout(param1:Boolean) : void
      {
         this.view.noteBG.includeInLayout = param1;
         this.view.memoLable.includeInLayout = param1;
         this.view.memoInput.includeInLayout = param1;
      }
      
      public function get editMode() : Boolean
      {
         return this._editMode;
      }
      
      public function set editMode(param1:Boolean) : void
      {
         if(!this.view.data)
         {
            return;
         }
         this._editMode = param1;
         if(this._editMode)
         {
            this.view.editButton.visible = false;
            this.view.okButton.visible = true;
            this.view.deleteButton.visible = true;
            this.view.noteBG.visible = false;
            this.view.nameLabel.visible = false;
            this.view.memoLable.visible = false;
            this.view.nameInput.visible = true;
            this.view.nameInput.text = DataUtil.trimSpaceEnd(PatchData(this.view.data).name);
            this.view.memoInput.visible = true;
            this.view.memoInput.text = this.view.memoLable.text;
            this.view.dropArea.visible = false;
         }
         else
         {
            this.changeVisibleEditBotton();
            this.view.okButton.visible = false;
            this.view.deleteButton.visible = false;
            this.view.noteBG.visible = true;
            this.view.nameLabel.visible = true;
            this.view.memoLable.visible = true;
            this.view.nameInput.visible = false;
            this.view.nameInput1.visible = false;
            this.view.nameInput2.visible = false;
            this.view.memoInput.visible = false;
            this.view.nameLabel.text = this.getPatchName();
            this.view.memoLable.text = this.view.data.note;
            this.view.dropArea.visible = true;
         }
      }
      
      private function getPatchName() : String
      {
         if(this.view.data)
         {
            if(!(this.view.data as PatchData))
            {
               this.view.data = PatchData.restore(this.view.data);
            }
            return PatchData(this.view.data).name;
         }
         return "";
      }
      
      override protected function setView(param1:Object) : void
      {
         this.view = LibraryPatchItemRenderer(param1);
      }
      
      public function set data(param1:Object) : void
      {
         if(this.view.data)
         {
            this.editMode = false;
         }
         if(this.view.currentState != "selected" || this.mediator.hideMemo)
         {
            this.view.editButton.visible = false;
         }
         if(Boolean(this.view.memoLable) && Boolean(param1))
         {
            this.view.memoLable.text = param1.note;
         }
         if(Boolean(this.view.nameLabel) && Boolean(param1))
         {
            this.view.nameLabel.text = this.getPatchName();
         }
         if(Boolean(this.view.noLabel) && Boolean(param1))
         {
            this.view.noLabel.text = this.addZero(param1.orderNumber);
         }
         this.setListSelectedColor();
         this.changeMemoArea();
      }
      
      private function addZero(param1:Number) : String
      {
         if(param1 < 10)
         {
            return "0" + param1;
         }
         return param1.toString();
      }
      
      override protected function onCreationComplete() : void
      {
         this.view.editButton.addEventListener(MouseEvent.CLICK,this.editButtonClickHandler,false,0,true);
         this.view.okButton.addEventListener(MouseEvent.CLICK,this.okButtonClickHandler,false,0,true);
         this.view.deleteButton.addEventListener(MouseEvent.CLICK,this.deleteButtonClickHandler,false,0,true);
         this.view.addEventListener(MouseEvent.CLICK,this.itemClickHandler,false,0,true);
         this.view.addEventListener(MouseEvent.RIGHT_CLICK,this.rightClickHandler,false,0,true);
         this.view.addEventListener(MouseEvent.DOUBLE_CLICK,this.itemDoubleClickHandler,false,0,true);
         (this.view.owner as PatchList).addEventListener(ToneCentralEvents.SELECTED_LIVE_SET,this.selectedLiveSetHandler,false,0,true);
         (this.view.owner as PatchList).addEventListener(ToneCentralEvents.LIST_ITEM_CLICK,this.selectedListItemClickHandler,false,0,true);
         (this.view.owner as PatchList).addEventListener(ToneCentralEvents.CHANGE_VISIBLE_MEMO,this.changeVisibleMemoHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.SET_PATCH_TOOLTIP,this.setPatchTooltipHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.RESET_PATCH_TOOLTIP,this.resetPatchTooltipHandler,false,0,true);
         this.mediator.addEventListener(ToneCentralEvents.CHANGE_EDIT_MODE,this.changeEditModeHandler,false,0,true);
         this.view.addEventListener(ToolTipEvent.TOOL_TIP_SHOW,this.toolTipShowHandler,false,0,true);
         this.view.dropArea.addEventListener(MouseEvent.CLICK,this.dropAreaMouseDownHandler,false,0,true);
         this.view.dropArea.addEventListener(DragEvent.DRAG_ENTER,this.dragEnterHandler,false,0,true);
         this.view.dropArea.addEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler,false,0,true);
         this.view.dropArea.addEventListener(DragEvent.DRAG_DROP,this.dropHandler,false,0,true);
         this.changeMemoArea();
         this.drawDropArea();
      }
      
      private function rightClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:File = null;
         var _loc3_:FileStream = null;
         if(EnvSetting.ns == develop)
         {
            _loc2_ = File.applicationStorageDirectory.resolvePath("debug/" + this.view.data.params.patchname + ".txt");
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.WRITE);
            _loc3_.writeUTFBytes(ObjectUtil.toString(this.view.data.params));
            _loc3_.close();
         }
      }
      
      private function toolTipShowHandler(param1:ToolTipEvent) : void
      {
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         param1.toolTip.y = _loc2_.y + 100 - (this.view.owner as PatchList).layout.verticalScrollPosition;
      }
      
      private function setPatchTooltipHandler(param1:ToneCentralEvents) : void
      {
         if(this.mediator.hideMemo)
         {
            this.view.toolTip = this.view.memoLable.text;
         }
      }
      
      private function resetPatchTooltipHandler(param1:ToneCentralEvents) : void
      {
         if(this.mediator.hideMemo)
         {
            this.view.toolTip = "";
         }
      }
      
      private function dropHandler(param1:DragEvent) : void
      {
         var _loc2_:Object = param1.dragSource.dataForFormat(param1.dragSource.formats[0]);
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.ITEM_DRAG_DROP);
         _loc3_.data = {
            "index":this.view.itemIndex,
            "data":param1.dragSource.dataForFormat(param1.dragSource.formats[0])
         };
         (this.view.owner as PatchList).dispatchEvent(_loc3_);
         ApplicationManager.getInstance().isItemDrop = true;
      }
      
      private function drawDropArea() : void
      {
         var _loc1_:Graphics = this.view.dropArea.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0.01);
         _loc1_.drawRect(0,0,this.view.dropArea.width,this.view.dropArea.height);
         _loc1_.endFill();
      }
      
      private function dragExitHandler(param1:DragEvent) : void
      {
         (this.view.owner as PatchList).dispatchEvent(new ToneCentralEvents(ToneCentralEvents.ITEM_DRAG_EXIT));
         DragManager.acceptDragDrop(this.view.owner as PatchList);
      }
      
      private function dragEnterHandler(param1:DragEvent) : void
      {
         var _loc2_:Object = param1.dragSource.dataForFormat(param1.dragSource.formats[0]);
         DragManager.acceptDragDrop(this.view.dropArea);
         var _loc3_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.ITEM_DRAG_ENTER);
         _loc3_.data = {
            "pos":(this.view.owner as PatchList).localToGlobal(new Point(this.view.x,this.view.y)),
            "count":_loc2_.length,
            "height":this.view.height
         };
         (this.view.owner as PatchList).dispatchEvent(_loc3_);
      }
      
      public function stateChanged() : void
      {
         this.changeVisibleEditBotton();
      }
      
      private function selectedListItemClickHandler(param1:ToneCentralEvents) : void
      {
         this.view.callLater(this.changeVisibleEditBotton);
         if(this.view.currentState == this.view.selectedState.name && this._editMode)
         {
            this.cancelEditMode();
         }
      }
      
      private function selectedLiveSetHandler(param1:ToneCentralEvents) : void
      {
         this.setListSelectedColor();
         if(!(this.view.owner as PatchList).selected && this._editMode)
         {
            this.cancelEditMode();
         }
      }
      
      private function setListSelectedColor() : void
      {
         if(this.view.bgColor)
         {
            if((this.view.owner as PatchList).selected)
            {
               this.view.bgColor.color = 3092271;
            }
            else
            {
               this.view.bgColor.color = 3092271;
            }
         }
      }
      
      private function itemClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralEvents = null;
         if(!this._editMode && param1.target is IItemRenderer)
         {
            _loc2_ = new ToneCentralEvents(ToneCentralEvents.LIST_ITEM_CLICK);
            _loc2_.data = this.view.data;
            _loc2_.key = param1.shiftKey || param1.ctrlKey;
            this.view.owner.dispatchEvent(_loc2_);
         }
      }
      
      private function itemDoubleClickHandler(param1:MouseEvent) : void
      {
         if(this.mediator.hideMemo)
         {
            this.isChangeEditMode = true;
            this.editButtonClickHandler(null);
         }
      }
      
      private function dropAreaMouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.LIST_ITEM_CLICK);
         if(!this._editMode && !param1.ctrlKey && !param1.shiftKey)
         {
            _loc2_.data = this.view.data;
         }
         this.view.owner.dispatchEvent(_loc2_);
      }
      
      private function deleteButtonClickHandler(param1:MouseEvent) : void
      {
         if(this._editMode)
         {
            this.view.owner.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.DELETE));
         }
      }
      
      private function okButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:String = "";
         if(this.view.data.note)
         {
            _loc2_ = this.view.data.note;
         }
         _loc3_ = this.view.nameInput.text;
         _loc4_ = StringUtil.trim(this.view.data.name);
         if(_loc4_ != _loc3_ || _loc2_ != this.view.memoInput.text)
         {
            this.isEdited = true;
         }
         this.view.data.name = this.view.nameInput.text;
         ToneCentralUtil.sendPatchName(this.view.data.name);
         this.view.data.note = this.view.memoInput.text;
         this.view.memoLable.text = this.view.memoInput.text;
         this.endEditMode();
         if(this.mediator.hideMemo)
         {
            this.hideMemoArea();
         }
      }
      
      private function endEditMode() : void
      {
         this.editMode = false;
         var _loc1_:ToneCentralEvents = new ToneCentralEvents(ToneCentralEvents.EDIT_END);
         _loc1_.data = this.isEdited;
         this.view.owner.dispatchEvent(_loc1_);
      }
      
      private function changeVisibleEditBotton() : void
      {
         this.view.editButton.visible = false;
         if(!this.mediator.hideMemo)
         {
            if(this.view.currentState == this.view.selectedState.name && (Boolean(PatchList(this.view.owner).selectedIndices) && Boolean(PatchList(this.view.owner).selectedIndices.length < 2)))
            {
               this.view.editButton.visible = true;
            }
         }
      }
      
      private function cancelEditMode() : void
      {
         if(!this._editMode)
         {
            return;
         }
         this._editMode = false;
         this.changeVisibleEditBotton();
         this.view.okButton.visible = false;
         this.view.deleteButton.visible = false;
         this.view.noteBG.visible = true;
         this.view.nameLabel.visible = true;
         this.view.memoLable.visible = true;
         this.view.nameInput.visible = false;
         this.view.nameInput1.visible = false;
         this.view.nameInput2.visible = false;
         this.view.memoInput.visible = false;
         if(this.mediator.hideMemo)
         {
            this.hideMemoArea();
         }
         this.view.owner.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.EDIT_END));
      }
      
      private function editButtonClickHandler(param1:MouseEvent) : void
      {
         this.isChangeEditMode = true;
         this.editStart();
      }
      
      private function editStart() : void
      {
         if(this._editMode)
         {
            return;
         }
         this.editMode = true;
         this.mediator.changeEditMode();
         if(this.mediator.hideMemo)
         {
            this.showMemoArea();
         }
         this.view.owner.dispatchEvent(new ToneCentralEvents(ToneCentralEvents.EDIT_START));
      }
   }
}

