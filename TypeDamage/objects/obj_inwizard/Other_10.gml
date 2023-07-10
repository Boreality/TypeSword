/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

//custom to goblin. 

enemyhp-=damage_recieved;

if(enemyhp>=0){
	KillsMe=true;
	Scoremod=1;
}else{
	DamageToPlayer = -1;	
}

with(owner){
	EnemyToGoal(other.KillsMe,other.enemyhp,other.DamageToPlayer,other.Scoremod);
}
	

