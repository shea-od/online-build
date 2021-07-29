/// @description server_handle_connect(socket_id);
/// @param socket_id
function server_handle_connect(argument0) {

	var
	socket_id = argument0;

	l = instance_create(0, 0, oServerClient);
	l.socket_id = socket_id;
	l.client_id = client_id_counter++;

	if(client_id_counter >= 65000){
	    client_id_counter = 0;
	}

	clientmap[? string(socket_id)] = l;

	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_GETID);
	buffer_write (send_buffer, buffer_u16, l.client_id);
	network_send_raw(socket_id, send_buffer, buffer_tell(send_buffer));
	
	my_client_id = -1;


}
