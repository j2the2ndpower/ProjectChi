///Do pointless things
state = "standing";
sspd = (room_speed / 2);
iframe = false;
wound = 3;
shoot = true;
grav = 2 ;
projSpd = 9 ;
normalSpd = 9 ;
normalJSpd = 30 ;
spd = normalSpd;
jspd = normalJSpd;
hspd = 0;
vspd = 0;
airjump = 1;
ducking = false;
direct = 1;
healthBar = undefined;
powerMeter = undefined;
user = undefined;
nomove = false;
nofall = false;
randomval = 0;
shooting = false;
controlled = false;
grounded = false;
kb = 0;
iamouch = 0;
drawCol = c_white;
forcestand = false;
burnout = false;
burn = 0;

image_yscale = global.scale * 0.5;

//Make Timr Vars
timr1 = 0;
timr2 = 0;

//Initialize in sub-class please
playerSprite = undefined;
walkSprite = undefined;
jumpSprite = undefined;
duckSprite = undefined;
damageSprite = undefined;
fireSprite = undefined;
shootSprite = undefined;
ultSprite = undefined;
ultProjObj = undefined;
firxoffset = 0;
firyoffset = 0;

rkey = undefined;
lkey = undefined;
jkey = undefined;
dkey = undefined;
tkey = undefined;
ukey = undefined;
skey = undefined;

//network deltas
last_hspd = 0;
last_vspd = 0;
last_state = "";
last_mod = 0;
last_health = 0;
last_power = 0;
