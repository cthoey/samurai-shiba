//var _expiration_date = date_create_datetime(2024, 9, 1, 0, 0, 0);

//if (date_current_datetime() > _expiration_date) {
//	show_message("This development build has expired.");
//	game_end();
//}

// system essentials

// disable filtering no matter what
gpu_set_texfilter(false);
TweenEasyUseDelta(true);

// TEST MODE
//debug_clear_settings();
//debug_clear_stats_and_achievements();

//initialize font data, save data, settings data
init_font_widths_map();

load_save();
	
global.settings_map = load_settings_file();
apply_settings_file(global.settings_map);
	
switch (os_type) {
	case os_windows: 
	case os_linux: 
	case os_macosx: 
	case os_unknown: 
		show_debug_message("OS Type: Desktop ("+string(os_type)+")");
		global.platform = SYSTEM_PLATFORM.PC; 
		break;
	case os_android: 
		show_debug_message("OS Type: Android ("+string(os_type)+")");
		global.platform = SYSTEM_PLATFORM.ANDROID; 
		break;
	case os_ios: 
		show_debug_message("OS Type: iOS ("+string(os_type)+")");
		global.platform = SYSTEM_PLATFORM.IOS; 
		break;
	case os_winphone: 
	case os_tvos: 
		show_debug_message("OS Type: Mobile ("+string(os_type)+")");
		global.platform = SYSTEM_PLATFORM.MOBILE; 
		break;
	case os_ps4:
	case os_ps5: 
	case os_xboxseriesxs: 
	case os_switch: 
	show_debug_message("OS Type: Console ("+string(os_type)+")");
		global.platform = SYSTEM_PLATFORM.CONSOLE; 
		break;
}
	
	
show_debug_message("OS Version: "+string(os_version));

room_goto(rm_title);

// TEST MODE
/*
var _args = instance_create_layer(0, 0, LAYER_NAME_LOGIC, obj_room_arg_controller);
_args.set(ROOM_ARG_DIFFICULTY_ID_KEY, GAME_DIFFICULTY.NORMAL);
_args.set(ROOM_ARG_PROGRESS_KEY, global.save_data.difficulty_unlocked);
_args.set(ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY, global.save_data.all_time_record_round);
_args.set(ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY, global.save_data.all_time_record_total);
_args.set(ROOM_ARG_ENEMY_ID_KEY, 0);
_args.set(ROOM_ARG_ELAPSED_TIME_KEY, get_all_time_record_arr());
room_goto(rm_gameplay);
*/
