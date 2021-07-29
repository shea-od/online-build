// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function server_handle_shoot(argument0, argument1){
	var shootdirection = argument0;
	var tempObject = argument1;
	hit = false;
	obj = noone;
	
	with (tempObject)
	{
		instance_create(75,75,oBullet);	
	}
}