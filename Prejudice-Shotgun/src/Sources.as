package  
{
	public class Sources 
	{		
		//IMPORTING GRAPHICS (.PNG)
		[Embed(source = 'Assets/background1720.png')] public static var ImgBackground:Class;
		[Embed(source = 'Assets/background.jpg')] public static var background:Class;
		[Embed(source = 'Assets/bullet.png')] public static var bullet:Class;
		[Embed(source = 'Assets/player.png')] public static var PlayerSprite:Class;
		[Embed(source = 'Assets/hooligan.png')] public static var HooliganNPC:Class;
		[Embed(source = 'Assets/mexican.png')] public static var MexicanNPC:Class;
		[Embed(source = 'Assets/brony.png')] public static var BronyNPC:Class;
		[Embed(source = 'Assets/irish.png')] public static var IrishNPC:Class;
		[Embed(source = 'Assets/chinese.png')] public static var ChineseNPC:Class;
		[Embed(source = 'Assets/girl.png')] public static var GirlNPC:Class;
		[Embed(source = 'Assets/Vending machine.png')] public static var VendingMachinePNG:Class;
		//IMPORTING GRAPHICS (.PNG)
		[Embed(source = 'Assets/tileset.png')] public static var tileset:Class;
		[Embed(source = 'Assets/test.png')] public static var test:Class;
		
		//IMPORTING SOUNDS AND MUSIC (.MP3)
		[Embed(source = 'Assets/crowd_talking.mp3')] public static var crowd_talking:Class;
		[Embed(source = 'Assets/collide.mp3')] public static var collide:Class;
		[Embed(source = 'Assets/scary_sounds.mp3')] public static var scary:Class;
		[Embed(source = 'Assets/cry.mp3')] public static var scream:Class;

		//[Embed(source = 'org/flixel/data/private/sounds/jump.mp3')] public static var Mp3Jump:Class;
		//IMPORTING TEXTS (.TXT)
		[Embed(source = 'Assets/levelMaze.txt', mimeType = "application/octet-stream")] public static var levelMazeTM:Class;
	
		
		//IMPORTING TEXTS (.TXT)
		//[Embed(source = 'org/flixel/data/private/texts/map.txt', mimeType = "application/octet-stream")] public static var TxtMap:Class;
	}
}