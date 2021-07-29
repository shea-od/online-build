// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_get_object(argument0){
	var client_id = argument0;
	
	if (client_id == my_client_id)
	{	
		if !(instance_exists(oPlayer))
		{
			instance_create_layer(0,0,"Instances",oPlayer)
		}
		return oPlayer.id;	
	}
	
		//if we received a message from the client before
	if(ds_map_exists(clientmap, string(client_id))){
	    return clientmap[? string(client_id)];
	}else{
	    var l = instance_create(0, 0, oOtherClient);
	    clientmap[? string(client_id)] = l;
		return l;
	}
}