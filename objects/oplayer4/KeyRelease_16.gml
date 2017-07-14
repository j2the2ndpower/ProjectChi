/// @description FIRE!
if (state == "ulting" && !instance_exists(robotPirateUlt_object) && controlled) {
	ultObj = instance_create_depth(x+50*direct, y-100, 0, ultProjObj);
    ultObj.pspd = 20;
    ultObj.pdmg = 0;
    ultObj.direct = direct;
    ultObj.owner = id;
		
	//tell other people about stories of your fire
	var udata = ds_map_create();
	udata[? "uid"] = global.uid;
	udata[? "x"] = ultObj.x;
	udata[? "y"] = ultObj.y;
	udata[? "pspd"] = ultObj.pspd;
	udata[? "pvspd"] = ultObj.pvspd;
	udata[? "direct"] = ultObj.direct;
	udata[? "pdmg"] = ultObj.pdmg;
	udata[? "ulting"] = true;
	sendMsg(9, udata);
}