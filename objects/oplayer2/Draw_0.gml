event_inherited();

if (nofall && controlled) {
	draw_text(powerMeter.x+(200)*direct, powerMeter.y-(50), string(ceil(alarm[2]/room_speed)));
}