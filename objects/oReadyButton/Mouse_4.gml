//Start the super long queue
if (sprite_index == cancelButton) {
	var data = ds_map_create();
	data[? "uid"] = global.uid;
	sendMsg(GAME_PLAYER_CANCEL_QUEUE, data);
	sprite_index = readyButton;
} else {
	if (global.charId != 0) {
		var data = ds_map_create();
		data[? "uid"] = global.uid;
		data[? "charId"] = global.charId;
		sendMsg(GAME_PLAYER_QUEUE, data);

		sprite_index = cancelButton;
		alarm[0] = room_speed;
	} else {
		show_message("No you freaking aren't.");
	}
}
