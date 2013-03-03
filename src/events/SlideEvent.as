package events
{
	import flash.events.Event;
	
	import slides.SlideBase;
	
	public class SlideEvent extends Event
	{
		public static const COMPLETED: String = 'completed';
		
		public function SlideEvent(type:String)
		{
			super(type);
		}	
	}
}