package com.clothobserve.todo.controls.login 
{
	import feathers.controls.Label;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class LoginMessage extends Label 
	{
		
		public function LoginMessage() 
		{
			super();
			
			styleName = Label.ALTERNATE_STYLE_NAME_DETAIL;
			text = "Server is currently offline - this form is just for presentation";
		}
		
	}

}