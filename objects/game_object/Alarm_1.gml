if (time <= 1) {
	global.paused = false;
	gameStarting = false;
	exit;
}
time--;
alarm[1] = room_speed;
