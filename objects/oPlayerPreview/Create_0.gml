/// @description Good stuff
global.preview = id;
charName = "Azul";
title = "The Test";
normalTitle = "Fireball";
normalDesc = "Summon a fireball";
ultimateTitle = "Ultimate";
ultimateDesc = "Summon ultimate";
passiveTitle = "Passive";
passiveDesc = "Passively do things";
charSprite = blueguy_idle;
iconSprite = blueguy_icons;
speedValue = 4;
powerValue = 3;
difficulty = 2;

speedCounter = instance_create_depth(x+30, y+476, -50, oCounter);
speedCounter.text = "Speed";

powerCounter = instance_create_depth(x+30, y+516, -50, oCounter);
powerCounter.text = "Power";

diffCounter = instance_create_depth(x+30, y+556, -50, oCounter);
diffCounter.text = "Difficulty";

normalAbility = instance_create_depth(x+30, y+133, -50, icon_object);
normalAbility.sprite_index = iconSprite;
normalAbility.image_index = 0;
normalAbility.title = normalTitle;
normalAbility.desc = normalDesc;

ultimateAbility = instance_create_depth(x+30, y+243, -50, icon_object);
ultimateAbility.sprite_index = iconSprite;
ultimateAbility.image_index = 1;
ultimateAbility.title = ultimateTitle;
ultimateAbility.desc = ultimateDesc;

passiveAbility = instance_create_depth(x+30, y+353, -50, icon_object);
passiveAbility.sprite_index = iconSprite;
passiveAbility.image_index = 2;
passiveAbility.title = passiveTitle;
passiveAbility.desc = passiveDesc;