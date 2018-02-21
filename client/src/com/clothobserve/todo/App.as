package com.clothobserve.todo 
{
	import flash.geom.Rectangle;
	import flash.display.NativeWindow;
	import flash.system.Capabilities;
	import starling.core.Starling;
	import starling.events.ResizeEvent;
	import starling.events.Event;
	import feathers.controls.ScreenNavigator;
	
	public final class App extends ScreenNavigator 
	{
		private static const _stageRectangle:Rectangle = new Rectangle();
		public static function get stageWidth():int { return _stageRectangle.width; }
		public static function get stageHeight():int { return _stageRectangle.height; }
		
		public function App() 
		{
			addEventListener(Event.ADDED_TO_STAGE, initialize);
			clipContent = false;
		}
		
		private function initialize():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
			stage.addEventListener(ResizeEvent.RESIZE, onResize);
		}
		
		private function onResize(event:ResizeEvent):void 
		{
			// Update Starling viewport and stage to reflect size change
			_stageRectangle.setTo(0, 0, event.width, event.height);
			Starling.current.viewPort = _stageRectangle;
			stage.stageWidth = event.width;
			stage.stageHeight = event.height;
			
			// Center the app on screen
			var nativeWindow:NativeWindow = Starling.current.nativeStage.nativeWindow;
			nativeWindow.x = int((Capabilities.screenResolutionX - nativeWindow.width) / 2);
			nativeWindow.y = int((Capabilities.screenResolutionY - nativeWindow.height) / 2);
		}
	}
}