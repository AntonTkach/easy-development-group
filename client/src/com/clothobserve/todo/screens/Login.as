package com.clothobserve.todo.screens 
{
	import com.clothobserve.code.App;
	import com.clothobserve.code.screens.BaseScreen;
	import com.clothobserve.todo.controls.login.LoginForm;
	import feathers.motion.Slide;
	import starling.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class Login extends BaseScreen 
	{
		public static const ID:String = "Login";
		
		private var loginForm:LoginForm;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			App.header.show("Login", "Exit")
				.setBackButtonHandler(backButtonHandler)
				.hideHelpButton();
			
			loginForm = new LoginForm();
			addChild(loginForm);
		}
		
		override protected function start():void 
		{
			super.start();
			
			(owner as App).transition = Slide.createSlideDownTransition(0.3);
			loginForm.addEventListener(Event.COMPLETE, showMenu);
		}
		
		private function showMenu():void
		{
			dispatchEventWith(Event.COMPLETE);
		}
	}
}