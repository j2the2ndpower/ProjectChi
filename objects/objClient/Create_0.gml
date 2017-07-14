/// @description Initialize CLIENT
global.scale = 1; //display_get_width()/room_width;
global.yOffset = 0; //(room_height - (display_get_height()))/2;
global.socket = network_create_socket(network_socket_tcp);
global.direct = undefined;
global.uid = 0;
global.training = false;
server = network_connect(global.socket, "pounce.house", 4050);
if (server < 0) {
	show_message("Can't connect to server");
	connected = "false";
} else {
	connected = "true";
}

clients = 0;
global.players = ds_map_create();

//hello world
window_set_fullscreen(true);