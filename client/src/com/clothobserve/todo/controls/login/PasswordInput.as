package com.clothobserve.todo.controls.login 
{
	import feathers.controls.TextInput;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class PasswordInput extends TextInput 
	{
		public function get password():String { return text }
		
		public function PasswordInput() 
		{
			super();
			prompt = "Password";
			displayAsPassword = true;
			maxChars = 40;
		}
	}
}