package slides
{
	import components.ImageLoader;
	
	import events.SlideEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	public class ImageSlide extends SlideBase
	{
		private var _contajner:Sprite;
		private var _duration:Number;
		private var _firstTime:Number;
		
		public function ImageSlide(url:String, duration:Number)
		{
			super(url);
			_contajner=new Sprite();
			addChild(_contajner);

			_contajner.addChild(new ImageLoader(url));
			
			_duration=duration;
			
			_contajner.addEventListener(Event.COMPLETE, handleComplete);
		}
		override public function get progress(): Number
		{	
			var NewHourtoMS:Number=getTimer();
	
			trace(getTimer());

			if (NewHourtoMS>(_duration*1000+ _firstTime))
			{NewHourtoMS=_duration*1000+ _firstTime}
			
			return (NewHourtoMS -_firstTime) / (_duration*1000);
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