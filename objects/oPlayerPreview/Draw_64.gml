/// @description Draw stuff
//draw_rectangle_color(x, y, x+(310), y+(600), c_dkgray, c_dkgray, c_dkgray,c_dkgray, c_black)
draw_set_font(font_name);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x+155, y+50, charName, c_yellow, c_yellow, c_red, c_red, 1);
draw_set_font(font_Title);
draw_text_color(x+155, y+90, title, c_blue, c_blue, c_blue, c_blue, 1);

draw_sprite_ext(charSprite, 0, x+180, y+435, 1, 1, 0, c_white, 1);



draw_set_font(font_ability);
draw_set_color(c_white);
draw_text(x+65, y+122, "normal");
draw_text(x+65, y+232, "ultimate");
draw_text(x+65, y+342, "passive");