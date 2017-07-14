if (meterPower == 10) {
	sprite_index = meterMax_sprite;
	image_speed = 4;
} else {
	sprite_index = meter_sprite;
	image_speed = 0;
	image_index = meterPower;
}