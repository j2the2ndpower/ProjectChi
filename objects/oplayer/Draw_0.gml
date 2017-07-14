/// @description Insert description here
// You can write your code in this editor
if (iamouch && drawCol == c_white) {
	drawCol = c_red;
	iamouch--;
} else {
	drawCol = c_white;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, drawCol, 1);
if (burnout) {
	draw_sprite(sprite66,0,x,y-firyoffset-100);
}