// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpawnEnemy(){
	var i=0;
	var luckhit = irandom_range(0,luckpool);
	var luckindex=0;
	var found = false;
	while(!found){
		luckindex+= enemytype[i,1];
		if(luckhit <= luckindex){
			//correct
			found=true;
			current_enemy = instance_create_layer(room_width/2,room_height/2+20,"EnemySprite",enemytype[i,0]);
		}else{
			i++;
		}
	
	}

	//enemyhp = irandom_range(5,100);
	//current_enemy = instance_create_layer(room_width/2,room_height/2,"EnemySprite",obj_goblin);
	enemyhp = current_enemy.enemyhp;
	current_enemy.owner = self;

}