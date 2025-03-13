/// @description init + fade-in

obj_setting_fullscreen_on_off.is_fullscreen = global.settings_map[? GAME_SETTINGS.FULLSCREEN];
obj_setting_fullscreen_on_off.image_index = obj_setting_fullscreen_on_off.is_fullscreen ? 0 : 1;

//obj_setting_vsync_on_off.is_vsync = global.settings_map[? GAME_SETTINGS.VSYNC];
//obj_setting_vsync_on_off.image_index = obj_setting_vsync_on_off.is_vsync ? 0 : 1;

//obj_setting_fps.fps_val = global.settings_map[? GAME_SETTINGS.FPS];

// if we're on android, hide the exit button
if(global.platform == SYSTEM_PLATFORM.ANDROID) {
	obj_setting_fullscreen_on_off.visible = false;
	obj_setting_fullscreen_on_off.is_disabled = true;
}

obj_camera_controller.start_fade_in();


