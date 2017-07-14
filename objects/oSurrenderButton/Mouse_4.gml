/// @description Bye bye
if (visible) {
	var data = ds_map_create();
	data[? "uid"] = global.uid;
	sendMsg(GAME_PLAYER_SURRENDER, data);
	room_goto_previous();
}