if(loading || game_over) return;

//allows interupting 'defeated' with enter for impatient speedrunners
if(roundOver){
	if(keyboard_lastkey == vk_enter){
		alarm[2]=1;
	}else{
		return;	
	}
}
//remove shift bug
if(keyboard_lastkey ==16){
	return;	
}



var latestinput = string_digits(keyboard_lastchar);


//banned symbols. BUG: Doesnt work with -

for(var j=0;j<array_length(global.bannedsymbols);j++){
	if(global.bannedsymbols[j] = latestinput){
			show_debug_message("BANNED");
			show_debug_message("j: "+string(global.bannedsymbols[j]));
			return;
	}
}

/*
if(array_contains(global.bannedsymbols,latestinput)){
	
	for(var j=0;j<array_length(global.bannedsymbols);j++){
		show_debug_message(global.bannedsymbols[j]);	
	}
	show_debug_message(latestinput);
	
	
	
	return;
}
	*/




current_message += string(latestinput);


//just submitting
if(keyboard_lastkey == vk_enter){
	show_debug_message("Enter");	
	
	//submit it.
	if(current_message = "") return;
	//play sfx.
	//var toDeal = real(current_message);
	var toDeal = string_parse_math(current_message); //thank you kind programmer
	
	
	#region //single object system
	//enemyhp-=toDeal;
	

	#endregion
	
	#region // send to enemy, send back system
	current_enemy.damage_recieved = toDeal;	
	with(current_enemy){
		event_user(0);
	}
	
	
	#endregion
	
	current_message = "";
}
else{
	//Every other key
	

	
	
	var clacktoplay = clack[irandom_range(0,4)];
	audio_play_sound(clacktoplay,2,false);
	
	//exceptions
	if(keyboard_lastkey == 189){
		current_message+= "-";
	}
	
	if(keyboard_lastchar == "*"){
		current_message+= "*";
	}
	if(keyboard_lastchar == "+"){
		current_message+= "+";
	}
	if(keyboard_lastchar == "/"){
		current_message+= "/";
	}	
	


	//show_debug_message(keyboard_lastkey);

	if(keyboard_lastkey == vk_backspace){
		var inputlength = string_length(current_message);
		current_message = string_delete(current_message,inputlength,1);
	}

}