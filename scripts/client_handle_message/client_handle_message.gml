/// @description client_handle_message(buffer);
/// @param buffer
function client_handle_message(argument0) {

	var
	buffer = argument0;

	while(true)
	{

	    var
	    message_id = buffer_read(buffer, buffer_u8);
    
	    switch(message_id)
	    {
			case MESSAGE_GETID:
				my_client_id = buffer_read(buffer, buffer_u16);
			break;
			
	        case MESSAGE_MOVE:
        
	            var 
				client = buffer_read(buffer, buffer_u16),
	            xx = buffer_read(buffer, buffer_u16),
	            yy = buffer_read(buffer, buffer_u16),
				clientObject = client_get_object(client);
				
				clientObject.time = 0;
				clientObject.prev_x = clientObject.x;
				clientObject.prev_y = clientObject.y;
				clientObject.tox = xx;
				clientObject.toy = yy;
				//clientObject.x = xx;
				//clientObject.y = yy;
            
	            //if we received a message from the client before
	            if(ds_map_exists(clientmap, string(client))){
	                var clientObject = clientmap[? string(client)];
					clientObject.time = 0;
					clientObject.prev_x = clientObject.x;
					clientObject.prev_y = clientObject.y;
					clientObject.tox = xx;
					clientObject.toy = yy;
	            }else{
	                var l = instance_create(xx, yy, oOtherClient);
	                clientmap[? string(client)] = l;
	            }
            
	            with(oServerClient){
	                if(client_id != client_id_current){
	                    network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
	                }
	            }
        
	        break;
			case MESSAGE_JOIN:
				var client = buffer_read(buffer, buffer_u16);
				var username = buffer_read(buffer, buffer_string);
				var clientObject = client_get_object(client);
				
				clientObject.name = username;
				
			break;
			case MESSAGE_SHOOT:
				instance_create(75,75,oBullet)
			break;			
			
			
			
			
	    }

	    if(buffer_tell(buffer) == buffer_get_size(buffer)){
	        break;
	    }
    
	}




}
