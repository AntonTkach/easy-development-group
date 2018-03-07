package com.clothobserve.todo.screens 
{
	import com.clothobserve.code.App;
	import com.clothobserve.code.screens.BaseScreen;
	import com.clothobserve.todo.controls.todotasks.TodoItemRenderer;
	import com.clothobserve.todo.model.TodoItem;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.text.StageTextTextEditor;
	import feathers.core.FeathersControl;
	import feathers.core.ITextEditor;
	import feathers.data.ArrayCollection;
	import feathers.data.VectorCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalLayoutData;
	import flash.events.TouchEvent;
	import flash.text.ReturnKeyLabel;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoTasks extends BaseScreen 
	{
		public static const ID:String = "ToDo Tasks";
		
		public static const SHOW_TIMER:String = "show timer";
		
		private static var _activeTask:TodoItem;
		public static function get activeTask():TodoItem { return _activeTask; }
		
		private var tabs:TabBar;
		private var items:VectorCollection;
		private var list:List;
		private var toolbar:LayoutGroup;
		private var input:TextInput;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			backButtonHandler = returnToMenu;
			
			App.header.show("ToDo Tasks", "Menu")
				.setBackButtonHandler(backButtonHandler)
				.hideHelpButton();
			
			tabs = new TabBar();
			tabs.dataProvider = new ArrayCollection([
				{label: "Active"},
				{label: "Completed"},
			]);
			
			tabs.addEventListener(Event.CHANGE, tabs_changeHandler);
			addChild(tabs);
			
			items = new VectorCollection(new <TodoItem>[]);

			list = new List();
			list.dataProvider = items;
			list.itemRendererType = TodoItemRenderer;
			list.addEventListener(Event.UPDATE, refreshFilterFunction);
			list.addEventListener(ToDoTasks.SHOW_TIMER, showTimer);
			addChild(list);
			
			toolbar = new LayoutGroup();
			toolbar.styleName = LayoutGroup.ALTERNATE_STYLE_NAME_TOOLBAR;
			addChild(toolbar);
			
			input = new TextInput();
			input.prompt = "What needs to be done?";
			input.textEditorFactory = function():ITextEditor
			{
				var textEditor:StageTextTextEditor = FeathersControl.defaultTextEditorFactory() as StageTextTextEditor;
				if(textEditor)
				{
					textEditor.returnKeyLabel = ReturnKeyLabel.GO;
				}
				
				return textEditor;
			};
			
			input.layoutData = new HorizontalLayoutData(100);
			input.addEventListener(FeathersEventType.ENTER, input_enterHandler);
			toolbar.addChild(input);
			
			var toolbarLayoutData:AnchorLayoutData = new AnchorLayoutData();
			toolbarLayoutData.top = 0;
			toolbarLayoutData.right = 0;
			toolbarLayoutData.left = 0;
			toolbar.layoutData = toolbarLayoutData;
			
			var tabsLayoutData:AnchorLayoutData = new AnchorLayoutData();
			tabsLayoutData.bottom = 0;
			tabsLayoutData.right = 0;
			tabsLayoutData.left = 0;
			tabs.layoutData = tabsLayoutData;
			
			var listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.top = 0;
			listLayoutData.topAnchorDisplayObject = toolbar;
			listLayoutData.right = 0;
			listLayoutData.bottom = 0;
			listLayoutData.bottomAnchorDisplayObject = tabs;
			listLayoutData.left = 0;
			list.layoutData = listLayoutData;
		}
		
		private function includeActiveItems(item:TodoItem):Boolean
		{
			return !item.isCompleted;
		}

		private function includeCompletedItems(item:TodoItem):Boolean
		{
			return item.isCompleted;
		}
		
		private function refreshFilterFunction():void
		{
			if(tabs.selectedIndex === 0)
			{
				items.filterFunction = includeActiveItems;
			}
			else if(tabs.selectedIndex === 1)
			{
				items.filterFunction = includeCompletedItems;
			}
		}
		
		private function input_enterHandler():void
		{
			if(!input.text) { return; }
			
			items.addItem(new TodoItem(input.text));
			input.text = "";
		}
		
		private function tabs_changeHandler(event:Event):void
		{
			refreshFilterFunction();
		}
		
		override protected function start():void 
		{
			super.start();
		}
		
		private function showTimer(event:Event):void
		{
			_activeTask = list.dataProvider.getItemAt(event.data.index) as TodoItem;
			dispatchEventWith(SHOW_TIMER);
		}
		
		private function returnToMenu():void
		{
			dispatchEventWith(Event.COMPLETE);
		}
	}
}