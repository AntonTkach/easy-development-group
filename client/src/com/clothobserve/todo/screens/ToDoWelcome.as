package com.clothobserve.todo.screens 
{
	import feathers.controls.ScreenNavigatorItem;
	import feathers.core.FeathersControl;
	import feathers.motion.Slide;
	import com.clothobserve.code.screens.Welcome;
	import com.clothobserve.code.App;
	import com.clothobserve.code.AppTheme;
	import com.clothobserve.todo.ToDoTheme;
	import com.clothobserve.todo.controls.todowelcome.LogoImage;
	
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
			screenNavigator.transition = Slide.createSlideDownTransition(0.3);
			
			var menuScreen:ScreenNavigatorItem = new ScreenNavigatorItem(ToDoMenu);
			screenNavigator.addScreen(ToDoMenu.ID, menuScreen);
		}
	}
}