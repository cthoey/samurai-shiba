
// Optionally, check if the fullscreen mode has been changed by other means
// This is useful if there are other ways to toggle fullscreen in your game
if (global.settings_map[? GAME_SETTINGS.FULLSCREEN] != window_get_fullscreen()) {
	
	global.settings_map[? GAME_SETTINGS.FULLSCREEN] = window_get_fullscreen();
	save_settings_file(global.settings_map);
	//apply_settings_file(global.settings_map);
	
	if (instance_exists(obj_setting_fullscreen_on_off)) {
		
	    obj_setting_fullscreen_on_off.is_fullscreen = global.settings_map[? GAME_SETTINGS.FULLSCREEN];
		
		if(obj_setting_fullscreen_on_off.is_fullscreen) {
			obj_setting_fullscreen_on_off.image_index = 0;
		} else {
			obj_setting_fullscreen_on_off.image_index = 1;
		}
		
	}
	
}
