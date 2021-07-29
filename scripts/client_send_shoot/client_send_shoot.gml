// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function client_send_shoot(argument0){
	var dir = argument0;
	
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_SHOOT);
	buffer_write(send_buffer, buffer_u16, dir);
	
	network_send_raw(socket, send_buffer, buffer_tell(send_buffer));
}