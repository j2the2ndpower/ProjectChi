event_inherited();

if (pie) {
	draw_text(powerMeter.x+(200)*direct, powerMeter.y-(50), string(ceil(wal.alarm[0]/room_speed)));
}