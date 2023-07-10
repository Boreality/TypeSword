// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer(_amount){
var amount = argument0;
	playerhit = true;	
	alarm[1]=1*room_speed;
	
	
	playerhp+=amount;
		
	if(playerhp<=0){
		game_over = true;	
		room_goto(rm_GameOver); 
	}

}