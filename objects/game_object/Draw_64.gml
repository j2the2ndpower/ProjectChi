if (time < 1) {
	exit;
}

if (gameStarting) {
	draw_set_font(font_timer);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_color(room_width/2, y, string(time), c_green, c_blue, c_blue, c_green, 1);
}