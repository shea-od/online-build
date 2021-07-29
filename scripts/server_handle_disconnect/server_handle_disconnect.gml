/// @description server_handle_disconnect(socket_id);
/// @param socket_id
function server_handle_disconnect(argument0) {

	var
	socket_id = argument0;

	with(clientmap[? (string(socket_id))]){
	    instance_destroy()
	}

	ds_map_delete(clientmap, string(socket_id));




}
