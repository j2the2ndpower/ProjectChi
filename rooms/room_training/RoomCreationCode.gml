room_width = display_get_width();
room_height = display_get_height();
var forcefield = instance_create_depth(room_width/2, (384), -40, ff_object1);
forcefield.image_xscale = global.scale;
forcefield.image_yscale = 1.08 ;

var ground = instance_create_depth(room_width/2, room_height-(152), 30, ground_object);
ground.image_xscale = global.scale;
ground.image_yscale = global.scale;

var ffLeft = instance_create_depth((-32 ), -room_height, 20, ff_object);
ffLeft.image_yscale = 67.5 ;
ffLeft.image_xscale = global.scale;

var ffRight = instance_create_depth(room_width, -room_height, 20, ff_object);
ffRight.image_yscale = 67.5 ;
ffRight.image_xscale = global.scale;

var daRoof = instance_create_depth(0, (-32 ), 20, solid_object);
daRoof.image_yscale = global.scale;
daRoof.image_xscale = 60 ;