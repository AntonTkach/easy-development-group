package com.clothobserve.todo.controls.login 
{
	import feathers.controls.LayoutGroup;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class LoginForm extends LayoutGroup 
	{
		public function LoginForm() 
		{
			super();
			
			var verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.gap = 30;
			verticalLayout.horizontalAlign = HorizontalAlign.CENTER;
			verticalLayout.verticalAlign = VerticalAlign.MIDDLE;
			layout = verticalLayout;
			
			var data:AnchorLayoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);
			data.percentWidth = 50;
			layoutData = data;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			var loginButton:LoginButton = new LoginButton();
			loginButton.addEventListener(Event.TRIGGERED, checkLogin);
			
			addChild(new UsernameInput());
			addChild(new PasswordInput());
			addChild(loginButton);
			addChild(new LoginMessage());
		}
		
		private function checkLogin():void
		{
			var data:Object = {};
			dispatchEventWith(Event.COMPLETE, false, data);
		}
	}
}