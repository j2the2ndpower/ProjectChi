/// @description Is pop up time?
if (hover) {
	var left = x + sprite_width;
	draw_set_alpha(0.5);
	draw_rectangle_color(left+10, y, left+300, y+150, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle_color(left+10, y, left+300, y+150, c_black, c_black, c_black, c_black, true);
	draw_set_font(font_ability);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_yellow);
	draw_text_ext(left+15, y+5, title, 20, 290);
	draw_set_color(c_white);
	draw_text_ext(left+15, y+25, desc, 20, 290);
}