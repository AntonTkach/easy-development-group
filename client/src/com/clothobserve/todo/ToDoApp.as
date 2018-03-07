package com.clothobserve.todo 
{
	import starling.events.Event;
	import feathers.controls.ScreenNavigatorItem;
	import com.clothobserve.code.App;
	import com.clothobserve.todo.screens.ToDoWelcome;
	import com.clothobserve.todo.screens.Login;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoApp extends App 
	{
		public function ToDoApp() 
		{
			var welcomeScreen:ScreenNavigatorItem = new ScreenNavigatorItem(ToDoWelcome);
			welcomeScreen.setScreenIDForEvent(Event.COMPLETE, Login.ID);
			super(welcomeScreen);
		}
	}
}