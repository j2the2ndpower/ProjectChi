/// @description resize txt

if (image_xscale <= 1 && !stop) {
	image_xscale += 0.1;
	image_yscale += 0.1;
} else if (!stop) {
	image_yscale = 1;
	image_xscale = 1;
	stop = true;
	var backBtn = instance_create_depth(room_width/2, 384, -125, oBackButton);
}