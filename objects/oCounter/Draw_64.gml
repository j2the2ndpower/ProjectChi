/// @description Draw Counter
draw_set_font(fontCounter);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x, y, text);

for(var i = 0; i < 5; i++) {
	draw_sprite_ext(counterBall, (value >= i+1), x+150+(i * 20), y, 1, 1, 0, c_white, 1);
}