package com.clothobserve.todo.screens 
{
	import com.clothobserve.code.App;
	import com.clothobserve.code.screens.BaseScreen;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class Statistics extends BaseScreen 
	{
		public static const ID:String = "Statistics";
		
		override protected function initialize():void 
		{
			super.initialize();
			
			backButtonHandler = returnToMenu;
			
			App.header.show("Statistics", "Menu")
				.setBackButtonHandler(backButtonHandler)
				.hideHelpButton();
		}
		
		private function returnToMenu():void
		{
			dispatchEventWith(Event.COMPLETE);
		}
	}
}