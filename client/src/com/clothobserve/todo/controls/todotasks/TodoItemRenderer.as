package com.clothobserve.todo.controls.todotasks 
{
	import com.clothobserve.todo.model.TodoItem;
	import com.clothobserve.todo.screens.ToDoTasks;
	import feathers.controls.Alert;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.renderers.LayoutGroupListItemRenderer;
	import feathers.data.ArrayCollection;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.HorizontalLayoutData;
	import feathers.skins.IStyleProvider;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class TodoItemRenderer extends LayoutGroupListItemRenderer 
	{
		public static var globalStyleProvider:IStyleProvider;
		
		private var check:Check;
		private var deleteButton:Button;
		private var pomodoro:Button;
		private var label:Label;
		
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return globalStyleProvider;
		}
		
		private var _isEditable:Boolean = false;
		
		public function get isEditable():Boolean
		{
			return _isEditable;
		}
		
		public function set isEditable(value:Boolean):void
		{
			if(_isEditable == value) { return; }
			
			_isEditable = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}

		override public function dispose():void
		{
			super.dispose();
			
			check = null;
			label = null;
			pomodoro = null;
			deleteButton = null;
		}
		
		override protected function initialize():void
		{
			check = new Check();
			check.addEventListener(Event.CHANGE, check_changeHandler);
			check.hasLabelTextRenderer = false;
			check.horizontalAlign = HorizontalAlign.CENTER;
			addChild(check);
			
			label = new Label();
			label.layoutData = new HorizontalLayoutData(100);
			addChild(label);
			
			pomodoro = new Button();
			pomodoro.styleName = Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON;
			pomodoro.label = "Pomodoro";
			pomodoro.addEventListener(Event.TRIGGERED, pomodoro_triggeredHandler);
			addChild(pomodoro);
			
			deleteButton = new Button();
			deleteButton.styleName = Button.ALTERNATE_STYLE_NAME_DANGER_BUTTON;
			deleteButton.label = "Delete";
			deleteButton.addEventListener(Event.TRIGGERED, deleteButton_triggeredHandler);
			addChild(deleteButton);
		}

		override protected function commitData():void
		{
			super.commitData();
			
			var item:TodoItem = _data as TodoItem;
			if(!item) { return; }
			
			label.text = item.description;
			check.isSelected = item.isCompleted;
		}

		protected function check_changeHandler(event:Event):void
		{
			var item:TodoItem = _data as TodoItem;
			if(!item) { return; }
			item.isCompleted = check.isSelected;
			(owner as List).dispatchEventWith(Event.UPDATE);
		}

		protected function deleteButton_triggeredHandler(event:Event):void
		{
			Alert.show("Are you sure that you want to delete this item? This action cannot be undone!", "Confirm delete",
				new ArrayCollection(
				[
					{ label: "Cancel" },
					{ label: "Delete", triggered: confirmButton_triggeredHandler },
				]));
		}
		
		protected function pomodoro_triggeredHandler(event:Event):void
		{
			(owner as List).dispatchEventWith(ToDoTasks.SHOW_TIMER, false, { index:index });
		}

		private function confirmButton_triggeredHandler(event:Event):void
		{
			(owner as List).dataProvider.removeItemAt(index);
		}
	}
}