/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

//custom to goblin. 

//enemyhp-=damage_recieved;
//enemyhp="56 + ? = 100"

if(damage_recieved == eq2){
	KillsMe=true;
	Scoremod=1;	
	enemyhp= string("{0} + {1} = {2}",eq1,eq2,eq3);
}else{
	DamageToPlayer = -1;	
}

with(owner){
	EnemyToGoal(other.KillsMe,other.enemyhp,other.DamageToPlayer,other.Scoremod);
}
	

