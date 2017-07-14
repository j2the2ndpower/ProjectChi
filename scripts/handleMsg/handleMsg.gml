var buffer = argument0;
var bufferSize = argument1;

var mapData = getMsg(buffer, bufferSize);
var msgType = mapData[? "msgType"];
		
switch (msgType) {
	case GAME_UPDATE_CLIENT_COUNT:
		clients = buffer_read(buffer, buffer_u8);
		break;
	case GAME_PLAYER_SET_UID:
		global.uid = mapData[? "uid"];
		break;
	case GAME_START:
		global.eviluid = mapData[? "uid"];
		global.evilchar = mapData[? "charId"];
		global.direct = mapData[? "direct"];
		room = room_test;
		break;
	case GAME_UPDATE_PLAYER_POS:
		if (is_undefined(global.enemyInst)) {
			break;
		}

		global.enemyInst.x = mapData[? "x"];
		global.enemyInst.y = mapData[? "y"];
		global.enemyInst.hspd = mapData[? "hspd"];
		global.enemyInst.vspd = mapData[? "vspd"];
				
		var stateNum = mapData[? "state"];
		var state = scriptStateGet(stateNum);
		global.enemyInst.state = state;
		var modifier = mapData[? "modifiers"];
		global.enemyInst.shooting = false;
		global.enemyInst.ducking = false;
		global.enemyInst.nomove = false;
		global.enemyInst.nofall = false;
		if (modifier & 1) {
			global.enemyInst.shooting = true;
		}
		if (modifier & 2) {
			global.enemyInst.ducking = true;
		}
		if (modifier & 4) {
			global.enemyInst.nomove = true;
		}
		if (modifier & 8) {
			global.enemyInst.nofall = true;
		}
		global.enemyInst.wound = mapData[? "health"];
		global.enemyInst.healthBar.image_index = clamp(3 - mapData[? "health"], 0, 3);
		global.enemyInst.powerMeter.meterPower = mapData[? "power"];
		break;
	case GAME_PLAYER_FIRE:
		var firblObj = fireball_object;
		if (mapData[? "ulting"] == true) {
			firblObj = global.enemyInst.ultProjObj;
		}
		var fbx = mapData[? "x"];
		var fby = mapData[? "y"];
		var firbl = instance_create_depth (fbx,fby,0,firblObj);
		firbl.owner = global.enemyInst;
		if (mapData[? "ulting"] == false) {
			firbl.sprite_index = global.enemyInst.fireSprite;
		}
		firbl.pspd = mapData[? "pspd"];
		firbl.pvspd = mapData[? "pvspd"];
		firbl.direct = mapData[? "direct"];
		firbl.pdmg = mapData[? "pdmg"];
		break;
	case GAME_OVER:
		var win = mapData[? "won"];
		var endGame = instance_create_depth(room_width/2, room_height/4, -100, endGameText);
		if (!win) { endGame.sprite_index = loseText; }
		break;
	case GAME_SPAWN_ITEM:
		var xp = mapData[? "x"];
		var type = mapData[? "type"];
		var box = mapData[? "box"];
		item = instance_create_depth(xp*room_width, 0, 0, item_object);
		item.type = type;
		if (box) {
			item.image_index = 0;
		} else {
			item.image_index = type;
		}
		break;
	case GAME_UPDATE_PLAYERLIKE_PET:
		if (mapData[? "spawn"] == true) {
			global.enemyInst.pet = instance_create_depth(global.enemyInst.x, room_height-(323), 0, global.enemyInst.ultProjObj);
			global.enemyInst.pet.owner = global.enemyInst;
		}
		
		if (mapData[? "alive"] == false) {
			with (global.enemyInst.pet) {
				instance_destroy();
			}
		} else if (global.enemyInst.pet != undefined && instance_exists(global.enemyInst.pet)) {
			global.enemyInst.pet.x = mapData[? "x"];
			global.enemyInst.pet.state = scriptStateGet(mapData[? "state"]);
			global.enemyInst.pet.direct = mapData[? "direct"];
			global.enemyInst.pet.attacking = mapData[? "attacking"];
		}
		break;
				
	/* case GAME_PLAYER_JOINED:
		var op = instance_create_depth(400, 400, 0, otherplayer);
		var uid = buffer_read(t_buffer, buffer_u32);
		ds_map_add(global.players, uid, op);
		break; */
} 