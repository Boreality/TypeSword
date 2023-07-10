/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

//Chief.
//Need to attack lower than full score in order to undress, then defeat


if(derobed){
	enemyhp-=damage_recieved;	
	if(enemyhp<=0){
		KillsMe=true;
		Scoremod=1;
	}else{
		DamageToPlayer = -1;	
	}
}else{
	
	//check if derobe
	if(damage_recieved<enemyhp){
		derobed=true;
		image_index = 1;
	}else{
		//Missed!
		DamageToPlayer = -1;
	}
	

}





with(owner){
	EnemyToGoal(other.KillsMe,other.enemyhp,other.DamageToPlayer,other.Scoremod);
}
	

