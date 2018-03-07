package com.clothobserve.todo.screens 
{
	import com.clothobserve.code.App;
	import com.clothobserve.code.screens.BaseScreen;
	import com.clothobserve.todo.controls.todomenu.MenuButtons;
	import feathers.controls.Alert;
	import feathers.data.ArrayCollection;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoMenu extends BaseScreen 
	{
		public static const ID:String = "ToDo Menu";
		
		public static const SHOW_TASKS:String = "show tasks";
		
		public static const SHOW_STATISTICS:String = "show statistics";
		
		override protected function initialize():void 
		{
			super.initialize();
			
			App.header.show("Cool App", "Exit")
				.setBackButtonHandler(backButtonHandler)
				.hideHelpButton();
			
			addChild(new MenuButtons(showTasks, showStatistics, showAbout));
		}
		
		private function showTasks():void { dispatchEventWith(SHOW_TASKS); }
		private function showStatistics():void { dispatchEventWith(SHOW_STATISTICS); }
		private function showAbout():void
		{
			var message:String = "ToDo + Pomodoro productivity App\n"
				+ "Written in ActionScript 3.0 on Adobe AIR\n"
				+ "Using Starling with Feathers\n\n"
			
			Alert.show(message, "About App", new ArrayCollection([{ label: "OK" }]));
		}
	}
}