/// @description Im over there now!
//SUMMON THE GREMLIN!!! (again)
owner.gremlin = instance_create_depth(owner.x+(60*direct),owner.y,0,gremlin_object);
owner.gremlin.owner = owner;
owner.gremlin.powerMeter = owner.powerMeter;