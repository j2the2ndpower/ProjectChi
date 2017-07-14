imgColor = c_gray;
if (picked) {
	imgColor = c_white;
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, imgColor, image_alpha);
