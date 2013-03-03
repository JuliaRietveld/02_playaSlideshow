package gui
{

	public class BackButton extends Button
	{
		public function BackButton()
		{
			super();
		}
		override protected function draw():void {
			graphics.clear();
			graphics.beginFill(0xD2D2D2,1);
			graphics.lineStyle(1, 0xD2D2D2);
			graphics.moveTo(0,22);
			graphics.lineTo(-22, 0);
			graphics.lineTo(0, -22);
			graphics.endFill();
		}
	}
}