/// @description Insert description here
// You can write your code in this editor



// Only Kills on Exact Number
event_inherited();
if(enemyhp==damage_recieved){
	//hit
	KillsMe=true;
	Scoremod=1;
	enemyhp-=damage_recieved;

}else{
	//nothit
	DamageToPlayer = -1;	
	//sprite change
	image_index=1;
	alarm[0] = 0.2 * fps;
}

with(owner){
	EnemyToGoal(other.KillsMe,other.enemyhp,other.DamageToPlayer,other.Scoremod);
}
	
