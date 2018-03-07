package com.clothobserve.todo.screens 
{
	import feathers.controls.ScreenNavigatorItem;
	import feathers.core.FeathersControl;
	import com.clothobserve.code.screens.Welcome;
	import com.clothobserve.code.App;
	import com.clothobserve.code.AppTheme;
	import com.clothobserve.todo.ToDoTheme;
	import com.clothobserve.todo.controls.todowelcome.LogoImage;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoWelcome extends Welcome 
	{
		override protected function getLogoImage():FeathersControl 
		{
			return new LogoImage();
		}
		
		override protected function initializeTheme():AppTheme 
		{
			return new ToDoTheme();
		}
		
		override protected function addScreens(screenNavigator:App):void 
		{
			var loginScreen:ScreenNavigatorItem = new ScreenNavigatorItem(Login);
			loginScreen.setScreenIDForEvent(Event.COMPLETE, ToDoMenu.ID);
			screenNavigator.addScreen(Login.ID, loginScreen);
			
			var menuScreen:ScreenNavigatorItem = new ScreenNavigatorItem(ToDoMenu);
			menuScreen.setScreenIDForEvent(ToDoMenu.SHOW_TASKS, ToDoTasks.ID);
			menuScreen.setScreenIDForEvent(ToDoMenu.SHOW_STATISTICS, Statistics.ID);
			screenNavigator.addScreen(ToDoMenu.ID, menuScreen);
			
			var todoTasksScreen:ScreenNavigatorItem = new ScreenNavigatorItem(ToDoTasks);
			todoTasksScreen.setScreenIDForEvent(ToDoTasks.SHOW_TIMER, TaskPomodoro.ID);
			todoTasksScreen.setScreenIDForEvent(Event.COMPLETE, ToDoMenu.ID);
			screenNavigator.addScreen(ToDoTasks.ID, todoTasksScreen);
			
			var timerScreen:ScreenNavigatorItem = new ScreenNavigatorItem(TaskPomodoro);
			screenNavigator.addScreen(TaskPomodoro.ID, timerScreen);
			
			var statisticsScreen:ScreenNavigatorItem = new ScreenNavigatorItem(Statistics);
			screenNavigator.addScreen(Statistics.ID, statisticsScreen);
		}
	}
}