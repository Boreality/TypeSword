/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_defeated);
draw_set_color(c_white);
draw_set_halign(fa_middle);

//timers
//draw_text(room_width - 170,10,string(timer/60));
draw_text(room_width - 170,290,"DifficultMod: x"+string(difficulty_multiplier));
	//clock
	// r = 112. Magic numbers but just hardcoding is fine here. 32*7/2.
	// theta is timer/5. Because timer/360=5. So to get 1800->360 we div by 5
	var clocktheta = (timer/5)-180;
	var clockr =112;
	var clockx = clockr*dsin(clocktheta);
	var clocky = clockr*dcos(clocktheta);
	draw_line_width_color(1230,150,1227+clockx,150+clocky,10,c_white,c_black);


//relevant stats
draw_text (room_width/2,room_height/4,"Sword: "+ string(current_message));
draw_text (room_width/2,100,"EnemyHP: "+ string(enemyhp));
draw_text(room_width/2,600,"Lives: "+ string(playerhp));

if(roundOver){
	draw_text_color(room_width/2,room_height/2,"You defeated!",c_red,c_orange,c_purple,c_green,1);
	draw_text_color(1230,150,"+2s",c_green,c_green,c_green,c_green,1);
}
//Took damage
if(playerhit){
	draw_text(room_width/2,650,"You took Damage!");
}

//highscore
draw_text_color(120,room_height-50,"Score: "+string(global.score),c_yellow,c_yellow,c_yellow,c_yellow,1);

//banned words
for(var b=0;b<array_length(global.bannedsymbols);b++){
	draw_text_color(150,550,"Banned",c_white,c_white,c_white,c_white,1);
	draw_text_color(50+ (40*b),600 ,string(global.bannedsymbols[b]),c_white,c_white,c_white,c_white,1);	
}
