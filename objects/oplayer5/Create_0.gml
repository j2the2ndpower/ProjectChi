event_inherited();

playerSprite = bones_idle;
walkSprite = bones_walk;
duckSprite = bones_crouch;
damageSprite = bones_idle;
fireSprite = bones_proj;
jumpSprite = bones_jump;
shootSprite = bones_shoot;
ultSprite = bones_idle;
ultProjObj = ult5_object;
firxoffset = 120;
firyoffset = -75;
pet = undefined;

//SUMMON THE GREMLIN!!!
gremlin = instance_create_depth(x+(60*direct),room_height-(323),0,gremlin_object);
gremlin.owner = id;
gremlin.powerMeter = powerMeter;