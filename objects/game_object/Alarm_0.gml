///more power
if (!global.paused) {
	global.playerInst.powerMeter.meterPower = clamp(global.playerInst.powerMeter.meterPower+1, 0, 10);
}
//global.u2inst.powerMeter.image_index += 1; 

alarm[0] = (room_speed*3)