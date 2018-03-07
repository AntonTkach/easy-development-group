package com.clothobserve.todo.model 
{
	/**
	 * @author Igor Nehoroshev
	 */
	public final class TodoItem 
	{
		public function TodoItem(description:String, isCompleted:Boolean = false)
		{
			this.description = description;
			this.isCompleted = isCompleted;
		}
		
		public var description:String;
		public var isCompleted:Boolean;
	}
}