package /** @author David Ryan */
{
	import org.flixel.*;
	import flash.display.StageDisplayState;
    import flash.events.Event;
	import flash.display.*;
	import org.flixel.plugin.photonstorm.FlxColor;
	
	
	public class Credits extends FlxState
	{
		private var buttonFullScreen:FlxButton;
		
       
		var CreditsButton: FlxButton;
		var PlayGameButton:FlxButton;
		var colorVal:Number = 0xff000000;
		var background:FlxSprite;
		var _colours : Array = new Array();
		var _colourNum : int = 0;
		override public function create():void
		{
			
			
				background= new FlxSprite(0, 0, Sources.ImgBackground);
				
			FlxG.mouse.show();	
			
			
			add(background);
			var title:FlxText;
			title = new FlxText(0, 16, FlxG.width, "Predjudice Featuring Shotguns");
			title.setFormat (null, 30, 0xFFFFFFFF,"center");
			add(title);
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height/2,FlxG.width, "David Ryan\n Donnchadh Murphy\nJames Walsh\n Tom Ryder\n Declan Cordial\nTommaso Marenzi");
			instructions.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(instructions);
			 // Nothing special here! Just creating a fullscreen button that calls
            // the toggle_fullscreen when clicked (that's where the magic happens)
           // buttonFullScreen = new FlxButton(0, 0, "Fullscreen", toggle_fullscreen);
           // add(buttonFullScreen);
		   //CreditsButton = new FlxButton(10, 10, "Credits", GoToCredits);
		  // CreditsButton.label = new FlxText(10, 10, 100, "Credits");
		  // CreditsButton.label.setFormat(null, 18, 0x000000, "center");
//		   CreditsButton.scale.x = 5;
		   //CreditsButton.scale.y = 3;
		   _colours = FlxColor.getHSVColorWheel();
		  
		   
		  
		   add(CreditsButton);
		  
 
 
		} // end function create
		
			
			
			public function StartGame():void {
				FlxG.switchState(new Menu());
			}
 
 
		override public function update():void
		{
			super.update(); // calls update on everything you added to the game loop
			
			
			background.color = colorVal;
			
			background.color = _colours[_colourNum];
			_colourNum++;
			if (_colourNum > 360)
			{
				_colourNum = 0;
			}
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new Level1());
			}
			
 
		} // end function update
 
 
		public function Menu()
		{
			//Rules.resetPause();
			super();
 
		}  // end function MenuState
		
		
 
	} // end class
}// end package 