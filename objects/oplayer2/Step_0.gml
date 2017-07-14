firxoffset = 80 * direct;
event_inherited();

//ULITMATE ATTACK!!!!
if (ukey && !ducking) {
    if (powerMeter.meterPower == 10) {
		alarm[2] = room_speed*8;
        nofall = true;
        sspd -= 7;
        spd += 11;
        powerMeter.meterPower = 0;
    }
}


if (nofall && !shooting) {
	sprite_index = jumpSprite;
}