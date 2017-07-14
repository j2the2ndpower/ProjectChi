event_inherited();

if (target == undefined) {
	target = owner;
	if (global.itembox != undefined) {
		if ((global.itembox.x > room_width/2 && owner.direct == -1) || 
			(global.itembox.x < room_width/2 && owner.direct == 1)) {
			target = global.itembox;
		}
	}
}