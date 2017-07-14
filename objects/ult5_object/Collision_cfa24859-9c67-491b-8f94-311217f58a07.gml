if (other.owner != owner && controlled) {
	instance_destroy();
		
	//Hay Guys! I Died!
	var data = ds_map_create();
	data[? "uid"] = global.uid;
	data[? "x"] = x;
	data[? "state"] = scriptStateGet(state);
	data[? "alive"] = false;
	data[? "direct"] = direct;
	data[? "attacking"] = false;
	data[? "spawn"] = false;
	sendMsg(GAME_UPDATE_PLAYERLIKE_PET, data);
}