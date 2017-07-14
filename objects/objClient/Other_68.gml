/// @description Handle Network Data

var n_id = ds_map_find_value(async_load, "id");

if (n_id == global.socket) {
	var type = ds_map_find_value(async_load, "type");
	var sock = ds_map_find_value(async_load, "socket");
	if (type == network_type_data) {
		//handle data here later
		var t_buffer = ds_map_find_value(async_load, "buffer");
		var buffer_size = ds_map_find_value(async_load, "size");
		
		var eof = false;
		while (!eof) {
			if (buffer_size < buffer_get_size(t_buffer)) {
				var this_msg_buffer = buffer_create(buffer_size, buffer_grow, 1);
				var next_msg_buffer = buffer_create(buffer_get_size(t_buffer)-buffer_size, buffer_grow, 1);
				buffer_copy(t_buffer, 0, buffer_size, this_msg_buffer, 0);
				buffer_copy(t_buffer, buffer_size, buffer_get_size(t_buffer)-buffer_size, next_msg_buffer, 0);
				handleMsg(this_msg_buffer, buffer_size);
				t_buffer = next_msg_buffer;
			} else {
				handleMsg(t_buffer, buffer_size);
				eof = true;
			}
		}
		
		buffer_delete(t_buffer);
	} else if (type == network_type_disconnect) {
		connected = "false";
		clients = 0;
	}
}