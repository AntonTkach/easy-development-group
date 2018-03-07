package com.clothobserve.todo 
{
	import com.clothobserve.todo.controls.todotasks.TodoItemRenderer;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import com.clothobserve.code.AppTheme;
	import starling.display.Image;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class ToDoTheme extends AppTheme 
	{
		public function ToDoTheme()
		{
			getStyleProviderForClass(TodoItemRenderer).defaultStyleFunction = setTodoItemRendererStyles;
		}
		
		override protected function getAtlasBitmapData(atlasSprite:Sprite = null):BitmapData 
		{
			return super.getAtlasBitmapData(new ThemeAtlas());
		}
		
		private function setTodoItemRendererStyles(itemRenderer:TodoItemRenderer):void
		{
			var backgroundSkin:Image = new Image(itemRendererUpTexture);
			backgroundSkin.scale9Grid = LIST_ITEM_SCALE9_GRID;
			itemRenderer.backgroundSkin = backgroundSkin;
			
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = smallGutterSize;
			layout.padding = smallGutterSize;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			itemRenderer.layout = layout;
		}
	}
}