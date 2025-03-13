
function load_settings_file() {
	ini_open(SETTINGS_FILENAME);
	
	var _settings_map = ds_map_create();
	
    var _setting_fullscreen = ini_read_real(SETTINGS_SECTION_KEY, SETTINGS_KEY_FULLSCREEN, false);
    ds_map_add(_settings_map, GAME_SETTINGS.FULLSCREEN, _setting_fullscreen);
	
    var _setting_vsync = ini_read_real(SETTINGS_SECTION_KEY, SETTINGS_KEY_VSYNC, true);
    ds_map_add(_settings_map, GAME_SETTINGS.VSYNC, _setting_vsync);
	
	var _user_display_frequency = 60;// display_get_frequency();
	var _setting_fps = ini_read_real(SETTINGS_SECTION_KEY, SETTINGS_KEY_FPS, _user_display_frequency);
	
    ds_map_add(_settings_map, GAME_SETTINGS.FPS, _setting_fps);
	
	ini_close();
	
	return _settings_map;
}

function save_settings_file(_settings_map) {
	ini_open(SETTINGS_FILENAME);
	
	//show_map_contents(_settings_map)
	
	ini_write_real(SETTINGS_SECTION_KEY, SETTINGS_KEY_FULLSCREEN, 
		_settings_map[? GAME_SETTINGS.FULLSCREEN]);	
	
	ini_write_real(SETTINGS_SECTION_KEY, SETTINGS_KEY_VSYNC, 
		_settings_map[? GAME_SETTINGS.VSYNC]);	
	
	ini_write_real(SETTINGS_SECTION_KEY, SETTINGS_KEY_FPS, 
		_settings_map[? GAME_SETTINGS.FPS]);	
	
	ini_close();
}

function apply_settings_file(_settings_map) {

    // Apply Screen Mode
    window_set_fullscreen(_settings_map[? GAME_SETTINGS.FULLSCREEN]);

    // Apply vsync
	display_reset(0, _settings_map[? GAME_SETTINGS.VSYNC]);

	// Apply FPS
	var _display_frequency = _settings_map[? GAME_SETTINGS.FPS]
	
	// set the game's fps to run at this frequency
	game_set_speed(_display_frequency, gamespeed_fps);
	
	// adjust the timeline speed to accomodate the game speed
	// moments are currently timed for 60fps, so a 120hz will run at 2x speed
	global.timeline_speed =  60 / _display_frequency;

}

function debug_clear_settings() {
	if (file_exists(SETTINGS_FILENAME)) {
		show_debug_message("WIPING SETTINGS FILE")
	    file_delete(SETTINGS_FILENAME);
	} else {
		show_debug_message("SETTINGS FILE NOT FOUND")
	}
}

function debug_clear_stats_and_achievements() {
	steam_reset_all_stats();
	steam_reset_all_stats_achievements();
}


