package com.clothobserve.todo.controls.todomenu 
{
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ArrayCollection;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.Direction;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class MenuButtons extends ButtonGroup 
	{
		public function MenuButtons(showTasks:Function, showStatistics:Function, showAbout:Function) 
		{
			gap = 20;
			
			dataProvider = new ArrayCollection([
				{ label: "ToDo Tasks", triggered: showTasks },
				{ label: "Statistics", triggered: showStatistics },
				{ label: "About", triggered: showAbout }
			]);
			
			customFirstButtonStyleName = Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON;
			direction = Direction.VERTICAL;
			layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);
		}
	}
}