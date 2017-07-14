/// @description Update stuff
if (global.paused || !showMe) {
	visible = false;
} else if (showMe) {
	visible = true;
}
surrenderBtn.visible = visible;
exitBtn.visible = visible;