/// @description Insert description here
// You can write your code in this editor
var cList = ds_list_create();
var space = 160;

x = 672;
y = 96;

// ADD CHARACTERS HERE
cList[|0] = selectp1_object;
cList[|1] = selectp2_object;
cList[|2] = selectp3_objet;
cList[|3] = selectp4_object;
cList[|4] = selectp5_object;

var row = 0;
var col = 0;
for (i = 0; i < ds_list_size(cList); i++) {
	if (col > 6) {
		row++;
		col = 0;
	}
	
	var char = instance_create_depth(x, y, 0, cList[|i]);
	char.x = x + (space*col);
	char.y = y + (space*row);
	col++;
}
ds_list_destroy(cList);