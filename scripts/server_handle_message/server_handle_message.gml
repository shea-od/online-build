/// @description server_handle_message(socket_id_buffer);
/// @param socket_id_buffer
function server_handle_message(argument0, argument1) {

	var
	socket_id = argument0,
	buffer = argument1,
	clientObject = clientmap[? string(socket_id)],
	client_id_current = clientObject.client_id;

	while(true)
	{

	    var
	    message_id = buffer_read(buffer, buffer_u8);
    
	    switch(message_id)
	    {
    
	        case MESSAGE_MOVE:
        
	            var
	            xx = buffer_read(buffer, buffer_u16),
	            yy = buffer_read(buffer, buffer_u16);
            
	            buffer_seek(send_buffer, buffer_seek_start, 0);
	            buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
	            buffer_write(send_buffer, buffer_u16, client_id_current);
	            buffer_write(send_buffer, buffer_u16, xx);
	            buffer_write(send_buffer, buffer_u16, yy);
            
            
	            with(oServerClient){
            
	                if(client_id != client_id_current){
	                    network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer)); //self and other
	                }
            
	            }
                
	        break;
			case MESSAGE_JOIN:
				username = buffer_read(buffer, buffer_string);
				clientObject.name = username;
				
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
				buffer_write(send_buffer, buffer_u16, client_id_current);
				buffer_write(send_buffer, buffer_string, username);
				
				//sending the newly joining name to all other clients
				with (oServerClient)
				{
					if (client_id != client_id_current)
					{
						network_send_raw(self.socket_id, other.send_buffer,buffer_tell(other.send_buffer));	
					}
				}	
				
				//send the newly joined client the name of all other clients
				with (oServerClient)
				{
					if (client_id != client_id_current)
					{
						buffer_seek(other.send_buffer, buffer_seek_start, 0);
						buffer_write(other.send_buffer, buffer_u8, MESSAGE_JOIN);
						buffer_write(other.send_buffer, buffer_u16, client_id);
						buffer_write(other.send_buffer, buffer_string, name);		
						network_send_raw(socket_id, other.send_buffer, buffer_tell(other.send_buffer));
					}
				}
			break;
			
			case MESSAGE_SHOOT:
				var shootdirection = buffer_read(buffer,buffer_u16);
				
				server_handle_shoot(shootdirection, clientObject);
			break;
	    }

	    if(buffer_tell(buffer) == buffer_get_size(buffer)){
	        break;
	    }
    
	}




}
