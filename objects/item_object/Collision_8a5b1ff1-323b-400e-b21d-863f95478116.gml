if (type == 1 && other.wound < 3) {
	other.wound += 1;
	instance_destroy();
} else if (type == 2 && other.powerMeter.meterPower < 8) {
	other.powerMeter.meterPower += 3;
	instance_destroy();
}
