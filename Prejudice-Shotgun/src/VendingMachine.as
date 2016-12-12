package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author David Ryan
	 */
	public class VendingMachine extends FlxSprite
	{
		
		public function VendingMachine(x:int,y:int) 
		{
			loadGraphic(Sources.VendingMachinePNG, false, false, 40, 40, false);
			this.x = x;
			this.y = y;
		}
		
		
		
	}

}