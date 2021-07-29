/// @description client_connect(ip, port, name);
/// @param ip
/// @param  port
function client_connect(argument0, argument1, argument2) {

	var
	ip = argument0,
	port = argument1,
	name = argument2;

	socket = network_create_socket(network_socket_tcp);
	var connect = network_connect_raw(socket, ip, port);

	send_buffer = buffer_create(256, buffer_fixed, 1);

	clientmap = ds_map_create();

	if(connect < 0)
	    show_error("Could not connect to server", true);

	buffer_seek(send_buffer, buffer_seek_start,0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
	buffer_write(send_buffer, buffer_string, name);
	network_send_raw(socket, send_buffer, buffer_tell(send_buffer));


}
