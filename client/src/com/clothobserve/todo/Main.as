package com.clothobserve.todo
{
	import flash.system.Capabilities;
	import com.clothobserve.code.EntryPoint;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public class Main extends EntryPoint
	{
		public function Main()
		{
			// Set app window to 90% of the screen
			stage.nativeWindow.width = int(Capabilities.screenResolutionX * 0.9);
			stage.nativeWindow.height = int(Capabilities.screenResolutionY * 0.9);
			
			super(ToDoApp, 60);
		}
	}
}