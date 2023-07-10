/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hpRandomMin = 5;
hpRandomMax = 100;

//create equation
enemyhp= irandom_range(hpRandomMin,hpRandomMax);
eq1 = irandom_range(hpRandomMin,hpRandomMax);
eq2 = irandom_range(hpRandomMin,hpRandomMax);
eq3 = eq1+eq2;

enemyhp= string("{0} + ? = {1}",eq1,eq3);
