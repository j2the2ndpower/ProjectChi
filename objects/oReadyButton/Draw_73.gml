if (sprite_index == cancelButton) {
	var s = string_replace(string_format(seconds % 60,2,0)," ","0");
	draw_set_font(font_queue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(x, y-60, "Queued " + string(floor(seconds/60)) + ":" + s);
}