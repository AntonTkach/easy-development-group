package com.clothobserve.todo.screens 
{
	import com.clothobserve.code.App;
	import com.clothobserve.code.screens.BaseScreen;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoMenu extends BaseScreen 
	{
		public static const ID:String = "ToDo Menu";
		
		override protected function initialize():void 
		{
			super.initialize();
			
			App.header.show("Cool App", "Exit")
				.setBackButtonHandler(backButtonHandler)
				.hideHelpButton();
			
			addChild(new MenuButtons());
		}
	}
}