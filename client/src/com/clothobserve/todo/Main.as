package com.clothobserve.todo
{
	import flash.display.StageQuality;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import flash.system.Capabilities;
	import starling.core.Starling;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			stage.quality = StageQuality.MEDIUM;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			
			var starling:Starling = new Starling(App, stage);
			starling.start();
			starling.antiAliasing = 4;
			starling.skipUnchangedFrames = true;
			
			stage.color = starling.stage.color = (0xFF << 24) | ClientTheme.BACKGROUND;
			
			stage.nativeWindow.width = int(Capabilities.screenResolutionX * 0.9);
			stage.nativeWindow.height = int(Capabilities.screenResolutionY * 0.9);
			
			stage.removeChild(this);
		}
	}
}