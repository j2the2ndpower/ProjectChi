///Only hit 1 tiem
if (other != owner) {
    other.wound -= pdmg;
    other.iframe = true;
    other.alarm[1] = 25;
    if (other.powerMeter.meterPower >  6) {
        other.powerMeter.meterPower += (10 - other.powerMeter.meterPower)
    } else {
        other.powerMeter.meterPower += 4;
    }
	other.iamouch = 10;
	if (sprite_index == snowflake_proj) {
		other.spd -= 1;
	}
    instance_destroy();
}

