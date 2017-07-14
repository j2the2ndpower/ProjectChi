/*room_width = 1920 ;
room_height = 1080 ;

global.preview = instance_create_depth(150 , 140 , 0, oPlayerPreview);
global.ready = instance_create_depth(room_width/2, room_height - (150), 0, oReadyButton);
instance_create_depth(96, room_height - (56), 0, controlButton);
instance_create_depth(room_width - (96), room_height - (88), 0, oExitGame2Button);*/

var cam = camera_get_active();
display_set_gui_size(1920, 1080);
//camera_set_view_size(cam, display_get_width(), display_get_height());

global.preview = instance_create_depth(150, 140, 0, oPlayerPreview);
global.ready = instance_create_depth(room_width/2, room_height - 150, 0, oReadyButton);
instance_create_depth(96, room_height - 56, 0, controlButton);
instance_create_depth(room_width - 96, room_height - 88, 0, oExitGame2Button);