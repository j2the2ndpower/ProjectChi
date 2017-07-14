event_inherited();
owner.sprite_index = robotPirate_ult2;

if (attached) {
	attached.nomove = true;
	attached.hspd = 0;
	attached.ducking = false;
	if (place_meeting(x-pspd, y, ff_object1)) {
		attached.alarm[5] = room_speed;
		owner.alarm[2] = room_speed/15;
		owner.attached = attached;
		attached.kb = 5;
		attached.forcestand = false;
		instance_destroy();
	} else {
		x -= pspd * 4 * direct;
		attached.x = x;
	}
}