/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

//custom to goblin. 

enemyhp-=damage_recieved;

if(enemyhp>=0){
	KillsMe=true;
	Scoremod=1;
	image_index = 1; //but doesnt exist for a while so whatever??
	instance_create_layer(x-300,y,"EnemySprite",obj_skeleton_human);
}else{
	DamageToPlayer = -1;	
}

with(owner){
	EnemyToGoal(other.KillsMe,other.enemyhp,other.DamageToPlayer,other.Scoremod);
}
	

