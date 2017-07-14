if (controlled) {
	//do pointless things all the time
    rkey = keyboard_check(vk_right);
    lkey = keyboard_check(vk_left);
    skey = owner.shooting;
	
	//move.
	var newx = x;
	if (rkey) {
		newx += spd;
		direct = 1;
		state = "walking";
	} else if (lkey) {
		newx -= spd;
		direct = -1;
		state = "walking";
	} else if ((lkey && tkey) || (!lkey && !rkey)) {
		state = "standing";
		
	}
	
	//Dont smack your face into walls.
	if (!place_meeting(newx, y, ff_object)) {
		x = newx;
	} else {
		while (!place_meeting(x+direct, y, ff_object)) {
			x += direct;
		}
	}
	
	//Do smack people.
	if (skey) {
		alarm[0] = 6;
		attacking = true;
	}
	
	//Hay Guys! I moved!
	var data = ds_map_create();
	data[? "uid"] = global.uid;
	data[? "x"] = x;
	data[? "state"] = scriptStateGet(state);
	data[? "alive"] = true;
	data[? "direct"] = direct;
	data[? "attacking"] = attacking;
	data[? "spawn"] = false;
	sendMsg(GAME_UPDATE_PLAYERLIKE_PET, data);
	
}

//Wait, Wat
image_xscale = direct*scale;

//Look like you mean it;
if (state == "standing") {
	sprite_index = idleSprite;
} else if (state == "walking") {
	sprite_index = walkSprite;
}
if (attacking) {
	sprite_index = attackSprite;
}

		

