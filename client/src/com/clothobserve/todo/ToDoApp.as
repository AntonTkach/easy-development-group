package com.clothobserve.todo 
{
	import starling.events.Event;
	import feathers.controls.ScreenNavigatorItem;
	import com.clothobserve.code.App;
	import com.clothobserve.todo.screens.ToDoWelcome;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoApp extends App 
	{
		public function ToDoApp() 
		{
			var welcomeScreen:ScreenNavigatorItem = new ScreenNavigatorItem(ToDoWelcome);
			welcomeScreen.setScreenIDForEvent(Event.COMPLETE, ToDoMenu.ID);
			super(welcomeScreen);
		}
	}
}