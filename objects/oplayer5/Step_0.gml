firxoffset = 120*direct;
event_inherited();

//Go over there!
if (ukey && powerMeter.meterPower == 10 && controlled && !(pet != undefined && instance_exists(pet))) {
	if (direct == -1) {
		pet = instance_create_depth(room_width/4,room_height-(312),0,ult5_object);
	} else if (direct == 1) {
		pet = instance_create_depth(room_width/4*3,room_height-(312),0,ult5_object);
	}
	pet.controlled = controlled;
	pet.owner = id;
	pet.direct = direct;
	
	//bye power!
	powerMeter.meterPower = 0;
	
	//tell other people about stories of your gremlin
	var data = ds_map_create();
	data[? "uid"] = global.uid;
	data[? "x"] = x;
	data[? "state"] = scriptStateGet(pet.state);
	data[? "alive"] = true;
	data[? "direct"] = direct;
	data[? "spawn"] = true;
	data[? "attacking"] = false;
	sendMsg(GAME_UPDATE_PLAYERLIKE_PET, data);
}

//un-ult e-cauze it's not healthy for bones like milk is
if (state = "ulting") {
	state = "standing";
}

//why you no looky right
if (gremlin != undefined && instance_exists(gremlin)) {
	gremlin.direct = direct;
}