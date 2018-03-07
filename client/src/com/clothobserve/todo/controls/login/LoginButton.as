package com.clothobserve.todo.controls.login 
{
	import feathers.controls.Button;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class LoginButton extends Button 
	{
		public function LoginButton() 
		{
			super();
			
			styleName = Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON;
			label = "Login";
		}
	}
}