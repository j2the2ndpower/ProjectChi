if (global.evilchar == 1 ) {
	evilPlayer = oplayer1;
} else if (global.evilchar == 2) {
	evilPlayer = oplayer2;
} else if (global.evilchar == 3) {
	evilPlayer = oplayer3;
} else if (global.evilchar == 4) {
	evilPlayer = oplayer4;
} else if (global.evilchar == 5) {
	evilPlayer = oplayer5;
}

///Spawn the players, yknow nbd or anything
if (global.direct == 0) {  //WE ON THE LEFT
	global.playerInst = instance_create_depth(getX(64),getY(734),0,global.player);
	global.enemyInst = instance_create_depth(getX(-64),getY(734),0,evilPlayer);
	global.playerInst.direct = 1;
	global.playerInst.healthBar = instance_create_depth(getX(32),getY(894),-100,health_object);
	global.playerInst.powerMeter = instance_create_depth(getX(32),getY(990),-101,meter_object);
	
	global.enemyInst.direct = -1;
	global.enemyInst.healthBar = instance_create_depth(getX(-32),getY(894),-100,health_object);
	global.enemyInst.powerMeter = instance_create_depth(getX(-32),getY(990),-101,meter_object);
} else { // WE ON RIGHT
	global.playerInst = instance_create_depth(getX(-64),getY(734),0,global.player);
	global.enemyInst = instance_create_depth(getX(64),getY(734),0,evilPlayer);
	global.playerInst.direct = -1;
	global.playerInst.healthBar = instance_create_depth(getX(-32),getY(894),-100,health_object);
	global.playerInst.powerMeter = instance_create_depth(getX(-32),getY(990),-101,meter_object);	
	
	global.enemyInst.direct = 1;
	global.enemyInst.healthBar = instance_create_depth(getX(32),getY(894),-100,health_object);
	global.enemyInst.powerMeter = instance_create_depth(getX(32),getY(990),-101,meter_object);
}

global.playerInst.healthBar.image_xscale = global.playerInst.direct;
global.playerInst.powerMeter.image_xscale = global.playerInst.direct;
global.enemyInst.healthBar.image_xscale = global.enemyInst.direct;
global.enemyInst.powerMeter.image_xscale = global.enemyInst.direct;

global.playerInst.controlled = true;
global.paused = true;
gameStarting = true;
alarm[1] = room_speed;
time = 3;


/*global.u1inst.direct = -1;
global.u1inst.user = 1;
global.u1inst.firxoffset *= -1
global.u1inst.healthBar = instance_create_depth(1358,535,-100,health_object);
global.u1inst.powerMeter = instance_create_depth(1250,675,-101,meter_object);
*/

//start an unending loop
alarm[0] = (room_speed*3);

global.itembox = undefined;