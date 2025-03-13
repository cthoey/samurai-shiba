/// @description Insert description here

switch(fps_val) {
	case 30:
		fps_val = 60;
	break;
	case 60:
		fps_val = 120;
	break;
	case 120:
		fps_val = 600;
	break;
	case 600:
		fps_val = 30;
	break;
}

global.settings_map[? GAME_SETTINGS.FPS] = fps_val;
save_settings_file(global.settings_map);
apply_settings_file(global.settings_map);









