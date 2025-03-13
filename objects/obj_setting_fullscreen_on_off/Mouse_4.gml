if(not is_disabled) {

	is_fullscreen = !is_fullscreen;

	global.settings_map[? GAME_SETTINGS.FULLSCREEN] = is_fullscreen;
	save_settings_file(global.settings_map);
	apply_settings_file(global.settings_map);

	if(is_fullscreen) {
		image_index = 0;
	} else {
		image_index = 1;
	}

}






