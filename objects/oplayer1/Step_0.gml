firxoffset = 120*direct;

fireSprite = blueguy_proj;

if (wound == 1) {
	fireSprite = blueguy_massiveShot;
}

event_inherited();

//Ultimate Atack!
/*if playing as*/
if (ukey && controlled && !ducking) {
    if (powerMeter.meterPower == 10) {
        nomove = true;
		alarm[2] = 40;
        ulti = instance_create_depth(x, y-(250), 0,ulti1_object);
        ulti.pspd = 0;
        ulti.pdmg = 2;
        ulti.direct = direct;
        ulti.owner = id;
        ulti.sprite_index = ulti1_sprite;        
        powerMeter.meterPower = 0;
		
		//tell other people about stories of your fire
		var udata = ds_map_create();
		udata[? "uid"] = global.uid;
		udata[? "x"] = ulti.x/global.scale;
		udata[? "y"] = ulti.y/global.scale;
		udata[? "pspd"] = ulti.pspd/global.scale;
		udata[? "pvspd"] = ulti.pvspd/global.scale;
		udata[? "direct"] = ulti.direct;
		udata[? "pdmg"] = ulti.pdmg;
		udata[? "ulting"] = true;
		sendMsg(9, udata);
    }
}