var state = argument0;
var stateMap = ds_map_create();
ds_map_set(stateMap, "standing", 0);
ds_map_set(stateMap, "walking", 1);
ds_map_set(stateMap, "backing", 2);
ds_map_set(stateMap, "jumping", 3);
ds_map_set(stateMap, "ulting", 4);
	
if (is_string(state)) {
	return ds_map_find_value(stateMap, state);
} else {
	var size = ds_map_size(stateMap);
	var key = ds_map_find_first(stateMap);
	for (var i = 0; i < size; i++) {
		if (ds_map_find_value(stateMap, key) == state) {
			return key;
		}
		key = ds_map_find_next(stateMap, key);
	}
	return "";
}

ds_map_destroy(stateMap);



