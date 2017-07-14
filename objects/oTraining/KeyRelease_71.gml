/// @description Change Champion
with (guy) {
	if (playerSprite == blueguy_idle) {
		instance_destroy();
		instance_create_depth(x,y,depth,oplayer2)
	} else if (playerSprite == fifi_idle) {
		instance_destroy();
		instance_create_depth(x,y,depth,oplayer3);
	} else if (playerSprite == snowflake_idle) {
		instance_destroy();
		instance_create_depth(x,y,depth,oplayer4);
	} else if (playerSprite == robotPirate_idle) {
		instance_destroy();
		instance_create_depth(x,y,depth,oplayer1);
	}
}