/// @description Insert description here

is_vsync = !is_vsync;

global.settings_map[? GAME_SETTINGS.VSYNC] = is_vsync;
save_settings_file(global.settings_map);
apply_settings_file(global.settings_map);


if(is_vsync) {
	image_index = 0;
} else {
	image_index = 1;
}










