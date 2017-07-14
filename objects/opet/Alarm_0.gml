/// @description Update
if (target != undefined && instance_exists(target)) {
	lastKnownX = target.x;
} else {
	lastKnownX = x;
}

alarm[0] = rSpd;
