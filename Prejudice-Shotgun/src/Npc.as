package /** @author Donnchadh Murphy */
{
	
	import org.flixel.FlxSprite;
    import org.flixel.*;
	
	/**
	 * ...
	 * @author Donnchadh Murphy
	 */
	public class Npc extends FlxSprite
	{
		
		
		
		 var XSpeed:int=90;
		 var YSpeed:int = 90;
		// var health:int = 100;
		 var hit:Boolean = false;
		 public var type:Class;
		 public var title:FlxText;
		 public var typevar:int;
		 public var behaviour:int;
		 public var conCount:int = 0;
	  
		 
				
				
		
				
			public function Npc(type:Class, x:int, y:int,typevar:int,behaviour:int) {
		    loadGraphic(type, true, true, 80, 160);
			addAnimation("Animated", [0, 1, 2], 5, true);
			addAnimation("Still", [0], 5, true);
            this.x = x;
			this.y = y;
			health = 100;
			this.health = health;
			this.behaviour = behaviour;
			this.type = type;
			this.typevar = typevar;
			this.conCount = -1;
			title = new FlxText(0, 100, FlxG.width, "XCVB");
            title.setFormat (null, 10, 0xFFFFFFFF, "center");
			title.allowCollisions = 0;
            FlxG.state.add(title);
		}
		public function Update():void {
			if (this.behaviour == 0) {
				this.velocity.y = 0;
			} else if (this.behaviour == 1) {
				this.velocity.y = YSpeed;
			}
			
			play("Animated");
			if (typevar == 1 && hit == true) {
				//title.text = "If you look at me any longer, I’ll stab you, boy.";
				
				this.conCount++;
				title.x = this.x -200;
				title.y = this.y + 160;
				
				 if (typevar == 1 &&  conCount == 1) {
								 
								  this.title.text = "If you look at me any longer, I’ll stab you, boy!";
								 
							 }
							 
							 if (typevar == 1 && conCount >= 200) {
								 
								  this.title.text = "There's only one Emile Heskey. One Emile Heskey. He used to be sh**e, but now he's all right, walking in a Heskey wonderland!";
								 
							 }
							 
							 if (typevar == 1 &&  conCount >= 300) {
								 
								  this.title.text = "From Uruguay it was a trek, Suarez, Suarez! He'll bite you on the f*****g neck, Suarez, Suarez!";
								 
							 }
							 
							 if (typevar == 1 &&  conCount >= 400) {
								 
								  this.title.text = "He's bald! He's sh*t! He gets a game when no-one's fit! Pascal Cygan, Pascal Cygan.";
								 
							 }
							 
							 if (typevar == 1 &&  conCount >= 500) {
								 
								  this.title.text = "He’s big, he’s red. His feet stick out the bed. Peter Crouch, Peter Crouch.";
								 
							 }
							 
							 if (typevar == 1 &&  conCount >= 600) {
								 
								  this.title.text = "Your head’s too big for you! Your head’s too big for you! Your head’s too big for you! Your head’s too big for you!";
								 
							 }
							 
							 if (typevar == 1 &&  conCount >= 700) {
								 
								  this.title.text =="So, you’re the new guy, huh? So… how about that local sports team?";
								 
							 }
							 
							 if (typevar == 1 &&  conCount >= 800 && conCount <=900) {
								 
								  this.title.text = "He’s big, he’s red. His feet stick out the bed. Peter Crouch, Peter Crouch.";
								 
							 }
			}
			 else {
				
				this.title.text = "";
			}
		}
				
		
			
	}
}
	

                   
                
        
        
        

	
	
