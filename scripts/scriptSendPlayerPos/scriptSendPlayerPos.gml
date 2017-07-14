var t_buffer = buffer_create(9, buffer_grow, 1);
buffer_seek(t_buffer, buffer_seek_start, 0);
buffer_write(t_buffer, buffer_u8, GAME_UPDATE_PLAYER_POS);		//MSG_TYPE
buffer_write(t_buffer, buffer_u32, uid);
buffer_write(t_buffer, buffer_u16, x);
buffer_write(t_buffer, buffer_u16, y);						//CLIENT COUNT
network_send_packet(global.socket, t_buffer, buffer_tell(t_buffer));
buffer_delete(t_buffer);
