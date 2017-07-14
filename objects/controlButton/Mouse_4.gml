/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(controls_object)) {
	cont = instance_create_depth(room_width/2, room_height/2, -1000, controls_object);
	cont.visible=true;
}