/// @description Insert description here
// You can write your code in this editor
if (global.ready.sprite_index == readyButton) {
	with oselect {
		var character = undefined;
		for (i = 0; i < instance_count; i++) {
			character = instance_find(oselect, i);
			if (character) {
				character.picked = false;
			}
		}
	}

	picked = true;
	global.player = playerObj;
	global.charId = char
	
	global.preview.charName = charName;
	global.preview.title = title;
	global.preview.charSprite = charSprite;
	global.preview.iconSprite = iconSprite;
	global.preview.speedValue = speedValue;
	global.preview.powerValue = powerValue;
	global.preview.difficulty = difficulty;
	global.preview.normalAbility.title = normalTitle;
	global.preview.normalAbility.desc = normalDesc;
	global.preview.normalAbility.sprite_index = iconSprite;
	global.preview.ultimateAbility.title = ultimateTitle;
	global.preview.ultimateAbility.desc = ultimateDesc;
	global.preview.ultimateAbility.sprite_index = iconSprite;
	global.preview.passiveAbility.title = passiveTitle;
	global.preview.passiveAbility.desc = passiveDesc;
	global.preview.passiveAbility.sprite_index = iconSprite;
	global.preview.visible = true;
}