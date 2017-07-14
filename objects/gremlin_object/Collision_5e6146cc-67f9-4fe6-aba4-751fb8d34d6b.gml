if (other.type == 1 && owner.wound < 3) {
	owner.wound += 1;
	global.itembox = undefined;
	with (other) {
		instance_destroy();
	}
} else if (other.type == 2 && owner.powerMeter.meterPower) {
	owner.powerMeter.meterPower += 3;
	global.itembox = undefined;
	with (other) {
		instance_destroy();
	}
}