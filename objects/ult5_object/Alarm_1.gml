/// @description Post Initialization Engine (PIE)
if (owner.gremlin != undefined && instance_exists(owner.gremlin)) {
	with (owner.gremlin) {
		instance_destroy();
		owner.gremlin = undefined;
	}
}