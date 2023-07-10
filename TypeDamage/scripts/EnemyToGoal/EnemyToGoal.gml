// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyToGoal(ifKillsEnemy, newEnemyHp, playerAffectedHp, scoreValue){
	//show_debug_message("Chaffeur");
	if(playerAffectedHp!=0) HurtPlayer(playerAffectedHp);
		
	enemyhp = newEnemyHp;
	if(ifKillsEnemy){
		//killenemy
		instance_destroy(current_enemy);
		difficulty_multiplier-=1-exp(difficulty_rate*global.score);
		global.score++;
		timer+= 2* room_speed;
		//pause for 0.7 seconds with text, then next round.


		roundOver=true;
		alarm[2] = room_speed * (1*difficulty_multiplier);
	}
	
}