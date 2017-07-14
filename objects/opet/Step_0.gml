/// @description Update frame

if (target != undefined && instance_exists(target)) {
	distance = clamp(lastKnownX-x, -spd, spd);
	x += distance;

	if (distance == 0) {
		target = undefined;
		sprite_index = petSprite;
	} else {
		sprite_index = walkSprite;
		direct = sign(distance);
	}
}

//wait, wat?
image_yscale = scale;
image_xscale = scale * direct;

//colision removed the instance
if (target != undefined && !instance_exists(target)) {
	target = undefined;
	sprite_index = petSprite;
}