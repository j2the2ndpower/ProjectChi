room_width = 1920;
room_height = 1080;

var forcefield = instance_create_depth(room_width/2, (384), -40, ff_object1);
forcefield.image_yscale = 1.08;

var ground = instance_create_depth(room_width/2, room_height-(152), 30, ground_object);

var ffLeft = instance_create_depth((-32 ), -room_height, 20, ff_object);
ffLeft.image_yscale = 67.5;

var ffRight = instance_create_depth(room_width, -room_height, 20, ff_object);
ffRight.image_yscale = 67.5;

var daRoof = instance_create_depth(0, (-32 ), 20, solid_object);
daRoof.image_xscale = 60;