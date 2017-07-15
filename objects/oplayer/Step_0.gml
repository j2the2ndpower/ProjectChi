//dont do jack
if (!global.training) {
	if (global.paused) {
		image_xscale = direct  * 0.5;
		exit;
	}
}

///STAND BACK IM ABOUT TO DO PHYSICS!
//if (user == 2) {
if (controlled) {
    rkey = keyboard_check(ord("D"));
    lkey = keyboard_check(ord("A"));
    jkey = keyboard_check_pressed(ord("W"));
	tkey = true;
	if (!forcestand) {
		dkey = keyboard_check_pressed(ord("S"));
		tkey = keyboard_check_released(ord("S"));
	}
    ukey = keyboard_check_pressed(vk_lshift);
    skey = keyboard_check_pressed(vk_space);

	//Is that the ground?
	if (!nofall && !nomove) {
	    if (place_meeting(x, y+1, solid_object)) {
			vspd = 0;
			if (state == "jumping") {
				state = "standing";
			}
	        airjump = 1;
    
	        //JUMP!
	        if (jkey && controlled) {
	            vspd = -jspd;
				state = "jumping";
	        }
	    } else {
	        //Fall.
			state = "jumping";
	        if (vspd < (20) && !nomove && !nofall) {
	            vspd += grav;   
	        }
    
	        //defy gravity
	        if (airjump > 0) {
	            if (jkey) {
	                vspd = -jspd;
	                airjump -= 1;
	            }
	        }
	    }
	} else {
	    if (dkey) {
	        vspd = spd;
	    }
    
	    if (jkey) {
	        vspd = -spd;
	    }
	}

	//DUCK AND COVER
	if (dkey && !nomove) {
		if (!nofall) {
			spd = 0;
			jspd = 0;
			grav = 3;
		}
	    ducking = true;
	}

	//okay, now STAND UP STRAIGHT
	if (tkey && !nomove && !forcestand) {
	    state = "standing";
		if (!nofall) {
			spd = normalSpd;
			jspd = normalJSpd;
		}
	    ducking = false;
		grav = 2;
	}

	//starfe right
	if (rkey && !nomove) {
	    hspd = spd;
		if (state == "standing") {
			state = "walking";
		}
	}

	//"starfe" left
	if (lkey && !nomove) {
	    hspd = -spd;
		if (state == "standing") {
			state = "backing";
		}
	}

	//dont move an inch
	if (((!rkey && !lkey) || (rkey && lkey)) && !nomove) {
	    hspd = 0;
		if (state == "backing" || state == "walking") {
			state = "standing";
		}
	}

	//hittin' your head against the wall
	if (place_meeting(x+hspd, y-1, solid_object) && !nomove) {
	    while(!place_meeting(x+sign(hspd), y-1, solid_object)) {
	        x += sign(hspd);
	    }
	    hspd = 0;
		if (state == "backing" || state == "walking") {
			state = "standing";
		}	
	}

	//hittin' your head against the roof
	if (place_meeting(x, y+vspd, solid_object)) {
	    while(!place_meeting(x, y+sign(vspd), solid_object)) {
	        y += sign(vspd);
	    }
	    vspd = 0;
	}

	//Move horisontaly (i dont even care about spelling at this pont)
	if (!nomove) {
	    x += hspd;
	    y += vspd;
	}

	//fire ze missilez
	if (skey) {
	    if (shoot && !nomove && !burnout) { 
	        if (ducking = false) {
	            firbl = instance_create_depth(x+(firxoffset), y+firyoffset, 0, fireball_object);
	        } else {
	            firbl = instance_create_depth(x+(firxoffset), y+25+firyoffset, 0, fireball_object);
	            firbl.pvspd = (-5 );
	        }
			shooting = true;
			firbl.pspd = projSpd;
	        firbl.direct = direct;
	        firbl.owner = id;
	        firbl.sprite_index = fireSprite;
	        shoot = false;
	        alarm[0] = sspd;
			alarm[4] = 5;
			alarm[7] = room_speed;
			if (!nofall) {
				burn++;
				if (burn == 5) {
					burnout = true;
					alarm[7] = room_speed*3;
				}
			}
			
			//tell other people about stories of your fire
			if (!global.training) {
				var data = ds_map_create();
				data[? "uid"] = global.uid;
				data[? "x"] = firbl.x/global.scale;
				data[? "y"] = firbl.y/global.scale;
				data[? "pspd"] = firbl.pspd/global.scale;
				data[? "pvspd"] = firbl.pvspd/global.scale;
				data[? "direct"] = firbl.direct;
				data[? "pdmg"] = firbl.pdmg;
				data[? "ulting"] = false;
				sendMsg(GAME_PLAYER_FIRE, data);
			}
	    }
	}
	if (ukey && powerMeter.meterPower == 10) {
		state = "ulting";
	}
} else {
	if (!nomove) {
		x += hspd;
		y += vspd;
	}
}


//show my health to everybody
healthBar.image_index = clamp(3-wound, 0, 3);
	
//wait, wat
image_xscale = direct  * 0.5;

image_speed = 1;
if (state == "standing") {
	sprite_index = playerSprite;
	grounded = true;
} else if (state == "walking") {
	sprite_index = walkSprite;
	grounded = true;
} else if (state == "jumping") {
	sprite_index = jumpSprite;
	grounded = false;
} else if (state == "backing") {
	sprite_index = walkSprite;
	grounded = true;
	image_speed = -1;
} else if (state == "ulting") {
	sprite_index = ultSprite;
}

if (shooting) {
	sprite_index = shootSprite;
}
if (ducking && !nofall) {
	sprite_index = duckSprite;
}

//server this guy moved!
if (controlled && !global.training) {
	modifier = 0;
	if (shooting) { modifier += 1; }
	if (ducking) { modifier += 2; }
	if (nomove) { modifier += 4; }
	if (nofall) { modifier += 8; }
	
	if (last_hspd != hspd ||
		last_vspd != vspd ||
		last_health != wound ||
		last_power != powerMeter.meterPower ||
		last_state != state ||
		last_mod != modifier) {
		var data = ds_map_create();
		data[? "uid"] = global.uid;
		data[? "x"] = x/global.scale;
		data[? "y"] = y/global.scale;
		data[? "hspd"] = hspd/global.scale;
		data[? "vspd"] = vspd/global.scale;
		data[? "state"] = scriptStateGet(state);
		data[? "modifiers"] = modifier;
		data[? "health"] = wound;
		data[? "power"] = powerMeter.meterPower;
		sendMsg(GAME_UPDATE_PLAYER_POS, data);
		
		last_hspd = hspd;
		last_vspd = vspd;
		last_health = wound;
		last_power = powerMeter.meterPower;
		last_state = state;
		last_mod = modifier;
	}
}


