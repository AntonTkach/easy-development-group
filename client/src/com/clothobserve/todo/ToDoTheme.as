package com.clothobserve.todo 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import com.clothobserve.code.AppTheme;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoTheme extends AppTheme 
	{
		override protected function getAtlasBitmapData(atlasSprite:Sprite = null):BitmapData 
		{
			return super.getAtlasBitmapData(new ThemeAtlas());
		}
	}
}