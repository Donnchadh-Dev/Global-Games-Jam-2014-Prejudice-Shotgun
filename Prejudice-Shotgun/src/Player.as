package  /** @author David Ryan + Donnchadh Murphy */
{
        import org.flixel.FlxSprite;
        import org.flixel.*;
		import org.flixel.plugin.photonstorm.FlxWeapon;
        
        /**
         * ...
         * @author ...
         */
        public class Player extends FlxSprite
        {
            public var XSpeed:int=500;
			   public var YSpeed:int = 500;
			   public var playHealth: int = 100;
			   public var title:FlxText;
			   public var invertfire:Boolean = false;
               
				public function Player() 
                {
                        loadGraphic(Sources.PlayerSprite, true, true, 80, 160);
						
						title = new FlxText(0, 100, FlxG.width, "HEALTH");
						title.setFormat (null, 30, 0xFFFFFFFF, "center");
						title.allowCollisions = 0;
						title.scrollFactor.x = 0;
						title.scrollFactor.y = 0;
						title.x = 100;
						title.y = 30;
						
						FlxG.state.add(title);
                        //this.facing = RIGHT;
                        addAnimation("Left", [1]);
                        addAnimation("Right", [0]);
                        addAnimation("Up", [3]);
                        addAnimation("Down", [2]);
                        addAnimation("Animated", [0, 1, 2, 0, 1, 2], 5, true);
						addAnimation("AnimatedLeft", [0, 1, 2, 0, 1, 2], 5, true);
						addAnimation("Still", [0], 5, true);
						
                        
                }
                
                override public function update():void
                {
					if (health < 0) {
						FlxG.switchState(new GameOverScreen());
					}
					play("Animated");
					this.title.text = "HEALTH" + playHealth; 
					if (velocity.x > 0) {
						//this.facing = LEFT;
					}
					
					if (FlxG.keys.justPressed("W")) {
                        velocity.y = -YSpeed;
                        velocity.x = 0;
                    }
					if (FlxG.keys.justPressed("A")) {
                        velocity.y = 0;
						facing = LEFT;
						invertfire = true;
                        velocity.x = -XSpeed;
                    }
					if (FlxG.keys.justPressed("S")) {
						velocity.y = YSpeed;
                        velocity.x = 0;        
                    }
					if (FlxG.keys.justPressed("D")) {
						velocity.y = 0;
						facing = RIGHT;
						invertfire = false;
                        velocity.x = XSpeed;
                    }
					if (FlxG.keys.any()==false ) {
                        velocity.y = 0;
                        velocity.x = 0;
                        play("Still");          
                    }
					
                    // trace("Test");
                    super.update();
                }   
        }  
}