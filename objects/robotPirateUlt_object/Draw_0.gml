/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_line_width(orig_x, orig_y, x+(direct*-70), y+10, 2);