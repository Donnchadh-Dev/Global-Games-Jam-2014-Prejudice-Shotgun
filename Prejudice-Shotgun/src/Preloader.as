package  
{
	import com.newgrounds.*;
	import com.newgrounds.components.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.media.SoundTransform;
	import org.flixel.system.FlxPreloader;
	
	/**
	 * ...
	 * @author Christy Carroll
	 */
	public class Preloader extends FlxPreloader 
	{
		private const id:String = "none";
		private const key:String = "none"; //KEEP THIS SECRET!
		
		public function Preloader()
		{
			className = "Main";
			super();
			hasAd = true;
		}
		
		override protected function create():void 
		{
			// The buffer, add every graphics on it.
			_min = minDisplayTime*100;
			_buffer = new Sprite();
			_buffer.width = stage.stageWidth;
			_buffer.height = stage.stageHeight;
			_buffer.scaleX = 1;
			_buffer.scaleY = 1;
			addChild(_buffer);
			
			// Background
			_width = stage.stageWidth/_buffer.scaleX;
			_height = stage.stageHeight/_buffer.scaleY;
			_buffer.addChild(new Bitmap(new BitmapData(_width, _height, false, 0x00ff00)));
			
			 var apiConnector:APIConnector = new APIConnector();
            apiConnector.className = "Main";
            apiConnector.apiId = id;
            apiConnector.encryptionKey = key;
            addChild(apiConnector);
			
            if(stage)
            {
                apiConnector.x = (stage.stageWidth - apiConnector.width) / 2;
                apiConnector.y = (stage.stageHeight - apiConnector.height) / 2;
				//apiConnector.width = 50;
				//apiConnector.height = 50;
            }
			
			var medalPopup:MedalPopup = new MedalPopup();
			medalPopup.soundTransform = new SoundTransform(0); //WILL MUTE THE MEDALPOPUP SOUND FROM NEWGROUNDS
			addChild(medalPopup);
		}

		override protected function update(Percent: Number): void 
		{
		}
		
	}

}