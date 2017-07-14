/// @description Kick punch chop
if (attacking && !other.iframe) {
    other.wound -= 1;
    other.iframe = true;
    other.alarm[1] = 25;
    if (other.powerMeter.meterPower >  6) {
        other.powerMeter.meterPower += (10 - other.powerMeter.meterPower)
    } else {
        other.powerMeter.meterPower += 4;
    }
	other.iamouch = 10;
}

