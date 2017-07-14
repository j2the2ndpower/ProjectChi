if (lkey) {
hspd -= spd;
}

if (rkey) {
hspd += spd;
}

//hittin' your head against the wall
if (place_meeting(x+hspd, y, ff_object1)) {
    while(!place_meeting(x+sign(hspd), y, ff_object1)) {
        x += sign(hspd);
    }
    hspd = 0;	
}

//hittin' your head against the wall
if (place_meeting(x+hspd, y, ff_object)) {
    while(!place_meeting(x+sign(hspd), y, ff_object)) {
        x += sign(hspd);
    }
    hspd = 0;	
}

if (ukey) {
	var wall = instance_create_depth(x,y,0,ulti2_object);
	//tell other people about stories of your fire
	var data = ds_map_create();
	data[? "uid"] = global.uid;
	data[? "x"] = x;
	data[? "y"] = y;
	data[? "pspd"] = 0;
	data[? "pvspd"] = 0;
	data[? "direct"] = 1;
	data[? "pdmg"] = 0;
	data[? "ulting"] = true;
	sendMsg(GAME_PLAYER_FIRE, data);
	wall.owner = owner;
	owner.nomove = false;
	owner.wal = wall;
	owner.powerMeter.meterPower = 0;
	owner.state = "standing";
	owner.pie = true;
	instance_destroy();
}

if ((!lkey && !rkey) || (lkey && rkey)) {
	hspd = 0;
}

x += hspd