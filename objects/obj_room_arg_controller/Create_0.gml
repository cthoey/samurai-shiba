
args = ds_map_create();

set = function(_key, _val) {
	ds_map_add(args, _key, _val);
}

get = function(_key) {
	return ds_map_find_value(args, _key);
}










