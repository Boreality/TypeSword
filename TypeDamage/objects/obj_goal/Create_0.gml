
loading = false; //pause
game_over = false;
difficulty_multiplier = 1;
difficulty_rate = 0.01;
timermax = room_speed*30;
timer=timermax;
enemy_timer_boost = room_speed*2;
enemies_defeated=0;

playerhit=false;

playerhp = 3;
current_message="";

randomize();
//spawning enemy
enemytype[0][0] = obj_goblin; //enemy
enemytype[0][1] = 60; //luck weight
enemytype[1][0] = obj_ghoul;
enemytype[1][1] = 10;
enemytype[2][0] = obj_chief;
enemytype[2][1] = 10;
enemytype[3][0] = obj_brianiac;
enemytype[3][1] = 15;
enemytype[4][0] = obj_inwizard;
enemytype[4][1] = 3;
enemytype[5][0] = obj_censor;
enemytype[5][1] = 10;
enemytype[6][0] = obj_skeleton;
enemytype[6][1] = 10;

luckpool=0;
for(var u=0;u<array_length(enemytype);u++){
	luckpool+=enemytype[u,1];
}


SpawnEnemy();

roundOver = false;


//bannedlettersw
//for loop each time to access it.



//sound
clack[0] = sfx_Clack1;
clack[1] = sfx_Clack2;
clack[2] = sfx_Clack3;
clack[3] = sfx_Clack4;
clack[4] = sfx_Clack5;
audio_play_sound(bgm_funkychunk,1,true,-100);