///Only hit 1 tiem
if (other != owner) {
	attached = other;
	attached.hspd = 0;
	attached.forcestand = true;
	attached.state = "standing";
	owner.powerMeter.meterPower = 0;
}

