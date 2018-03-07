package com.clothobserve.todo.screens 
{
	import com.clothobserve.code.App;
	import com.clothobserve.code.screens.BaseScreen;
	import com.clothobserve.todo.controls.CountDown;
	import feathers.controls.Label;
	import feathers.layout.AnchorLayoutData;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class TaskPomodoro extends BaseScreen 
	{
		public static const ID:String = "Task Pomodoro";
		
		private var countdown:Label;
		private var cdc:CountDown
		
		override protected function initialize():void
		{
			super.initialize();
			
			backButtonHandler = returnToTasks;
			
			App.header.show("Pomodoro Timer", "Tasks")
				.setBackButtonHandler(backButtonHandler)
				.hideHelpButton();
			
			var task:Label = new Label();
			task.styleName = Label.ALTERNATE_STYLE_NAME_HEADING;
			task.layoutData = new AnchorLayoutData(20, NaN, NaN, NaN, 0);
			task.text = "Task: " + ToDoTasks.activeTask.description;
			addChild(task);
			
			countdown = new Label();
			countdown.styleName = Label.ALTERNATE_STYLE_NAME_HEADING;
			countdown.layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);
			countdown.text = "25:00";
			addChild(countdown);
			
			cdc = new CountDown();
            cdc.TARGET_SECONDS = 1500;
            cdc.START();
            cdc.addEventListener(Event.CHANGE, onUpdate);
            cdc.addEventListener(Event.COMPLETE, onComplete)
        }
		
		private function onUpdate(evt:Event):void
        {
            var timeRemaining:Object = cdc.timeRemaining;
            countdown.text = timeRemaining.minutes + " : " + timeRemaining.seconds;
        }
 
        private function onComplete(evt:Event):void
        {
            trace ("Times up!");
        }
		
		private function returnToTasks():void
		{
			dispatchEventWith(Event.COMPLETE);
		}
	}
}