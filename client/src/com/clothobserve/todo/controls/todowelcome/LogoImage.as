package com.clothobserve.todo.controls.todowelcome 
{
	import flash.display.DisplayObject;
	import flash.display.BitmapData;
	import flash.display.StageQuality;
	import starling.textures.Texture;
	import feathers.layout.AnchorLayoutData;
	import feathers.controls.ImageLoader;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public class LogoImage extends ImageLoader 
	{
		public function LogoImage() 
		{
			var logo:DisplayObject = new Logo();
			layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);
			
			var bitmapData:BitmapData = new BitmapData(logo.width, logo.height, true, 0);
			bitmapData.drawWithQuality(logo, null, null, null, null, true, StageQuality.HIGH);
			
			source = Texture.fromBitmapData(bitmapData);
			bitmapData.dispose();
		}
	}
}