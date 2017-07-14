//dont do jack
if (global.paused) {
	exit;
}

///ONWARD

x += (sign(direct) * pspd); 
y -= pvspd;

//destroy self
if (x > room_width || place_meeting(x,y-40,ground_object) || x < 0) {
	instance_destroy();
}