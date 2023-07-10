if(keyboard_check_released(ord("R"))){
	game_restart();	
}

if(loading) return;

timer-=1*difficulty_multiplier;

if (timer <= 0)
{
	HurtPlayer(-1);
	
	if (!game_over){
		//var val = exp(rate*time) //exponential growth. Returns e^rate*time. 
		//Div result for smaller number.
		//timer += enemy_timer_boost*-exp(difficulty_rate*enemies_defeated);
		timer = timermax//*(difficulty_multiplier*-exp(difficulty_rate*enemies_defeated));
	}
}	


timer = clamp(timer,0,30*room_speed);