/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hpRandomMin = 5;
hpRandomMax = 100;


//get random symbol
var possiblesymbols = ["1","2","3","4","5","7","8","9","0","+","-","*","/"];
var symboltoban = irandom_range(0,array_length(possiblesymbols)-1);

var found = false;

while(!found){ //will cause infinite loop if all symbols are banned. Will probably never happen
	if(!array_contains(global.bannedsymbols,possiblesymbols[symboltoban])){
		found=true;
	}else{
		//not found, try again	
		symboltoban = irandom_range(0,array_length(possiblesymbols));
	}
}

array_push(global.bannedsymbols,possiblesymbols[symboltoban])

enemyhp= string("Banned the following symbol: {0}",possiblesymbols[symboltoban]);
