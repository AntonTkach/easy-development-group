package com.clothobserve.todo.controls.login 
{
	import feathers.controls.TextInput;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class UsernameInput extends TextInput 
	{
		public function get username():String { return text; }
		
		public function UsernameInput() 
		{
			super();
			prompt = "E-Mail";
			maxChars = 30;
		}
	}
}