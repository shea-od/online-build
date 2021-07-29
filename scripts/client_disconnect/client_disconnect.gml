/// @description client_disconnect();
function client_disconnect() {

	ds_map_destroy(clientmap);
	network_destroy(socket);




}
