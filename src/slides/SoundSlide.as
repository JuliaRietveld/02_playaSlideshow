package slides
{
	import flash.media.*;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	import components.ImageLoader;
	import events.SlideEvent;
	
	public class SoundSlide extends SlideBase
	{
		private var _soundChannel: SoundChannel;
		private var _sound: Sound;
		private var _container:Sprite;
		
		public function SoundSlide(url:String, coverurl:String)
		{
			super(url);
			_sound = new Sound();
			_sound.load(new URLRequest(url));
			_soundChannel = _sound.play();
			
			_container=new Sprite();
			addChild(_container);

		_container.addChild(new ImageLoader(coverurl));
		
		
		_sound.addEventListener(Event.COMPLETE, handleComplete);
		_sound.addEventListener(IOErrorEvent.IO_ERROR, ioErrorComplete);
		
		}
		
		override public function get progress(): Number
		{
			if(_sound.length == 0) return 0;
			return _soundChannel.position / _sound.length;
		}
		override public function activate(): void
		{
			this.visible = true;
			_soundChannel = _sound.play();
		}	
		override public function deactivate(): void
		{
			this.visible = false;
            _soundChannel.stop();
		}
		protected function handleComplete(event: Event): void
		{
			complete();
		}
		protected function ioErrorComplete(event: IOErrorEvent): void
		{
			trace("The sound could not be loaded");
		}
	}
}