package com.clothobserve.todo.controls 
{
	import starling.events.EventDispatcher;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
    import flash.events.Event;
	
	/**
	 * @author Igor Nehoroshev
	 */
	public final class CountDown extends EventDispatcher
	{
		private var secondsRemaining:int;
        private var _timeRemaining:Object = {}
        private var countdownTimer:Timer;
		
		public function CountDown()
		{
            countdownTimer = new Timer(1000);
            countdownTimer.addEventListener(TimerEvent.TIMER, onCountdown);
        }
 
        public function set TARGET_SECONDS(seconds:int):void
        {
            secondsRemaining = seconds;
        }
 
        public function set TARGET_DATE(target:Date):void
        {
            var currentDate:Date = new Date();
            var currentSeconds = currentDate.valueOf();
 
            var targetSeconds = target.valueOf();
 
            var difference:int = (targetSeconds - currentSeconds) / 1000;
            secondsRemaining = difference;
        }
 
        public function START():void
        {
            countdownTimer.start();
        }
 
        public function STOP():void
        {
            countdownTimer.stop();
        }
 
        private function onCountdown(evt:TimerEvent):void
        {
            secondsRemaining--;
            var days:int = Math.floor(secondsRemaining / (3600 * 24));
            var hours:int = Math.floor((secondsRemaining / 3600) % 24);
            var minutes:int = Math.floor((secondsRemaining / 60) % 60);
            var seconds:int = secondsRemaining%60;
 
            timeRemaining.days = days;
            timeRemaining.hours = hours;
            timeRemaining.minutes = minutes;
            timeRemaining.seconds = seconds;
 
            if(secondsRemaining < 0)
            {
                dispatchEventWith(Event.COMPLETE);
                countdownTimer.stop();
                countdownTimer.removeEventListener(TimerEvent.TIMER, onCountdown);
            }
            else
            {
                dispatchEventWith(Event.CHANGE, true);
            }
        }
 
        public function get timeRemaining():Object
        {
            return _timeRemaining;
        }
	}
}