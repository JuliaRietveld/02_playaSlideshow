package slides
{
	import components.ImageLoader;
	
	import events.SlideEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	public class ImageSlide extends SlideBase
	{
		private var _container:Sprite;
		private var _duration:Number;
		private var _firstTime:Number;
		
		public function ImageSlide(url:String, duration:Number)
		{
			super(url);
			_container=new Sprite();
			addChild(_container);

			_container.addChild(new ImageLoader(url));
			
			_duration=duration;
			
			_container.addEventListener(Event.COMPLETE, handleComplete);
		}
		override public function get progress(): Number
		{	
			var newTime:Number=getTimer();
	
			trace(getTimer());

			if (newTime > (_duration * 1000+ _firstTime))
			{
				newTime= _duration * 1000 + _firstTime;
			}
			
			return (newTime -_firstTime) / (_duration * 1000);
		}
		override public function activate(): void
		{
			this.visible = true;
			_firstTime=getTimer();
		}		
		override public function deactivate(): void
		{
			this.visible = false;
			_firstTime=0;
		}				
		protected function handleComplete(event: Event): void
		{
			complete();	
		}			
	}
}