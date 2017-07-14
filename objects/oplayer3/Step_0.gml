firxoffset = 120*direct;
event_inherited();

if (ukey && powerMeter.meterPower == 10 && !instance_exists(ulti2_object1) && controlled && !ducking) {
	if (direct == -1) {
		wal = instance_create_depth(room_width/4,room_height-(312),0,ulti2_object1);
	} else if (direct == 1) {
		wal = instance_create_depth(room_width/4*3,room_height-(312),0,ulti2_object1);
	}
	nomove = true;
	wal.owner = id;
}

if (wal != undefined && instance_exists(wal)) {
	wal.lkey = lkey;
	wal.rkey = rkey;
	wal.ukey = keyboard_check_released(vk_lshift);
}