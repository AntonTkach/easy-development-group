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
			screenNavigator.addScreen(ToDoMenu.ID, menuScreen);
		}
	}
}