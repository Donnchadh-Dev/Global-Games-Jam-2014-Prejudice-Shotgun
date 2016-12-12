package{ /** @author Donnchadh Murphy + David Ryan */
        import org.flixel.*;
        import org.flixel.system.FlxTile;
        import com.newgrounds.API;
		import org.flixel.plugin.photonstorm.FlxWeapon;
		import org.flixel.plugin.photonstorm.FlxCollision;
        
        public class Level1 extends FlxState
        {
			// FlxG.shake(0.05,0.5,null,true,2);
            private var map:FlxTilemap; 
			private var PlaySound:Boolean = true;
            private var player:Player;
			private var npc1:Npc;
			private var npc2:Npc;
			private var npc3:Npc;
			private var npc4:Npc;
			private var npc5:Npc;
			private var npc6:Npc;
			private var ghost:Npc;
			private var vm:VendingMachine;
			private var collision:Boolean = false;
			private var counter;
			private var follow:Boolean = false;
			var lazer:FlxWeapon;
			var background:FlxSprite;
                
            override public function create():void{
				background = new FlxSprite();
				background.x = 0;
				background.y = 0;
				background.loadGraphic(Sources.background, true, true, 640, 480);
				background.scrollFactor.x = 0;
				background.scrollFactor.y = 0;
				//background.addAnimation("bla", [0, 1, 2, 3],10,true);
				add(background); 
				
				FlxG.playMusic(Sources.crowd_talking);
				PlaySound = true;
				
				map = new FlxTilemap();
				map.loadMap(new Sources.levelMazeTM, Sources.tileset, 40, 40);
				add(map);
				
				player = new Player();
				player.x = 100;
				player.y =  100;
				add(player);
						
				npc1 = new Npc(Sources.HooliganNPC, 400, 80, 1, 1);
				add(npc1);
				
				npc2 = new Npc(Sources.MexicanNPC, 200, 3080, 2, 1);
				add(npc2);
				
				npc3 = new Npc(Sources.BronyNPC, 1700, 700, 3, 1);
				add(npc3);
				
				npc4 = new Npc(Sources.IrishNPC, 1400, 1300, 4, 1);
				add(npc4);
				
				npc5 = new Npc(Sources.ChineseNPC, 960, 3080, 5, 1);
				add(npc5);
				
				npc6 = new Npc(Sources.GirlNPC, 2160, 40, 6, 0);
				add(npc6);
				ghost= new Npc(Sources.GirlNPC, 2160, 40, 6, 0);
				ghost.alive = false;
				
				FlxG.worldBounds = new FlxRect(0, 0, 1000000, 1000000);
				FlxG.camera.setBounds(0, 0, 1000000, 1000000);
				FlxG.camera.follow(player);
				lazer = new FlxWeapon("lazer", player, "x", "y");
				lazer.bounds = new FlxRect(0, 0, map.width, map.height);
				lazer.makePixelBullet(1000, 8, 8, 0xff5C5C5C, 70, 70);
				lazer.setBulletLifeSpan(5);
				vm = new VendingMachine(100, 100);
				add(vm);
				add(lazer.group);
			}
			
			override public function update():void
			{
				if (player.health < 0) {
						FlxG.switchState(new GameOverScreen());
					}
					
			
				//FlxG.shake(.01, .05, null, true, 0);
				if (FlxG.keys.justPressed("SPACE") && player.invertfire==false){
					lazer.setBulletDirection(FlxWeapon.BULLET_RIGHT, 1000);
					lazer.fire();	
				}
				if (FlxG.keys.justPressed("SPACE") && player.invertfire==true) {
					lazer.setBulletDirection(FlxWeapon.BULLET_LEFT, 1000);
					lazer.fire();	
				}
				if (FlxG.keys.justPressed("R")) {
					FlxG.switchState(new Level1());
				}
				
				FlxG.collide(player, map);
				
				if (npc1.overlaps(map)){
					npc1.YSpeed = -npc1.YSpeed;
				}
				if (npc2.overlaps(map)){
					npc2.YSpeed = -npc2.YSpeed;
				}
				if (npc3.overlaps(map)){
						npc3.YSpeed = -npc3.YSpeed;
				}
				if (npc4.overlaps(map)){
					npc4.YSpeed = -npc4.YSpeed;
				}
				if (npc5.overlaps(map)){
					npc5.YSpeed = -npc5.YSpeed;
				}
				if (npc6.overlaps(map)){
					npc6.YSpeed = -npc6.YSpeed;
				}
				
				if (lazer.currentBullet != null) {
					if (FlxCollision.pixelPerfectCheck(vm, lazer.currentBullet)) {
						player.health = player.health + 10;
						vm.kill();
					}
					if (FlxCollision.pixelPerfectCheck(npc1, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill();
						npc1.health = 0;
					}
					if (FlxCollision.pixelPerfectCheck(ghost, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill();
						FlxG.play(Sources.scream);
					}
					if (FlxCollision.pixelPerfectCheck(npc2, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill();
						npc2.health = 0;
					}
					if (FlxCollision.pixelPerfectCheck(npc3, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill(); 
						npc3.health = 0;
					}
					if (FlxCollision.pixelPerfectCheck(npc4, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill(); 
						npc4.health = 0;
					}
					if (FlxCollision.pixelPerfectCheck(npc5, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill(); 
						npc5.health = 0;
					}
					if (FlxCollision.pixelPerfectCheck(npc6, lazer.currentBullet)){
						// bullet has made contact
						lazer.currentBullet.kill(); 
						npc6.health = 0;
						FlxG.playMusic(Sources.scary);
					}
				}
				
				if (npc1.health < 1) {
					npc1.y = 100;
					npc1.x = -100;	
				}
				if (npc2.health < 1) {
					npc2.y = 100;
					npc2.x = -100;
				}
				if (npc3.health < 1) {
					npc3.y = 100;
					npc3.x = -100;
				}
				if (npc4.health < 1) 
				{
					npc4.y = 100;
					npc4.x = -100;
				}
				if (npc5.health < 1) {
					npc5.y = 100;
					npc5.x = -100;
				}
				if (npc6.health < 1) {
					ghost.alive = true;
					npc6.hit = false;
					npc6.y = 100;
					npc6.x = -100;
				}
				
				if (npc1.health <= 0 && npc2.health <= 0 && npc3.health <= 0 && npc4.health <= 0 && npc5.health <= 0) {
					FlxG.switchState(new Menu());
					
				}
				if (ghost.alive == true) {
					add(ghost);
					if (ghost.y < player.y) {
						ghost.velocity.y = ghost.YSpeed;
						
						
					}
					if (ghost.x < player.x) {
						ghost.velocity.x=ghost.XSpeed;
						
					}
					if (ghost.y > player.y) {
						ghost.velocity.y=-ghost.YSpeed;
						
					}
					if (ghost.x > player.x) {
						ghost.velocity.x=-ghost.YSpeed;
						
					}
				}
				npc2.Update();
				npc1.Update();
				npc3.Update();
				npc4.Update();
				npc5.Update();
				npc6.Update();
				player.update();
				
				map.allowCollisions = FlxObject.ANY;
				
				if (player.isTouching(FlxObject.ANY)) {
					Boolean:collision = true;
					// used to put player in still animation after collision
					player.play("Still");      
					if(player.isTouching(FlxObject.LEFT)){
						player.velocity.x = -1;
						player.velocity.y = -1;
					}
					if(player.isTouching(FlxObject.RIGHT)){
						player.velocity.x = 1;
						player.velocity.y = 1;
					}
					FlxG.play(Sources.collide);
				}
				
				if (npc1.isTouching(FlxObject.ANY)) {
					npc1.velocity.x = -1;
					npc1.velocity.y = -1;
				}
						
				if (player.overlaps(npc1)) {
					npc1.hit = true;
					player.velocity.x = -1;
					player.velocity.y = -1;
					player.playHealth = player.playHealth -1; 
					npc1.conCount++;				 
				}
				if (player.overlaps(npc2)) {
					npc2.hit = true;
					player.velocity.x = -1;
					player.velocity.y = -1;
					player.playHealth = player.playHealth -1; 
					npc2.conCount++;				 
				}
				if (player.overlaps(npc3)) {
					npc3.hit = true;
					player.velocity.x = -1;
					player.velocity.y = -1;
					player.playHealth = player.playHealth -1; 
					npc3.conCount++;				 
				}
				if (player.overlaps(npc4)) {
					npc4.hit = true;
					player.velocity.x = -1;
					player.velocity.y = -1;
					player.playHealth = player.playHealth -1; 
					npc4.conCount++;				 
				}
				if (player.overlaps(npc5)) {
					npc5.hit = true;
					player.velocity.x = -1;
					player.velocity.y = -1;
					player.playHealth = player.playHealth -1; 
					npc5.conCount++;				 
				}
				if (player.overlaps(npc6)) {
					npc6.hit = true;
					player.velocity.x = -1;
					player.velocity.y = -1;
					player.playHealth = player.playHealth +1; 
					npc6.conCount++;		
				}
				
				if (npc6.hit == true) {
					following();
				}
						
				if (player.health <=0) {
					// Put in game end menu here.
					FlxG.switchState(new GameOverScreen());		 
				}
				
				if (!player.overlaps(npc1)) {
					npc1.hit = false;
				}
				if (!player.overlaps(npc2)) {
					npc2.hit = false;
				}
				if (!player.overlaps(npc3)) {
					npc3.hit = false;
				}
				if (!player.overlaps(npc4)) {
					npc4.hit = false;
				}
				if (!player.overlaps(npc5)) {
					npc5.hit = false;
				}
				if (!player.overlaps(npc6)) {
					//npc6.hit = false;
				}
				super.update();  
			}
			
			public function following():void {
				if (npc6.hit == true) {
					npc6.y = player.y;
					if (player.velocity.x < 0) {
						npc6.x = player.x + 80;
					}else if (player.velocity.x > 0) {
						npc6.x = player.x - 80;
					}
				}
				//	Boolean:collision = true;				
				// used to put player in still animation after collision
				npc6.play("Still");      
				if(npc6.isTouching(FlxObject.LEFT)){
					npc6.x = player.x + 80;
				}
				if(npc6.isTouching(FlxObject.RIGHT)){
					npc6.x = player.x - 80;
				}
				//FlxG.play(Sources.collide);
			}  
        }
	}
