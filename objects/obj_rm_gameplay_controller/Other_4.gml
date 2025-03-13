/// @description initialize visuals before camera fade-in

current_difficulty			= obj_room_arg_controller.get(ROOM_ARG_DIFFICULTY_ID_KEY);
current_difficulty_progress = obj_room_arg_controller.get(ROOM_ARG_PROGRESS_KEY);
all_time_record_round		= obj_room_arg_controller.get(ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY);
all_time_record_total		= obj_room_arg_controller.get(ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY);
current_enemy				= obj_room_arg_controller.get(ROOM_ARG_ENEMY_ID_KEY);
arr_elapsed_times			= obj_room_arg_controller.get(ROOM_ARG_ELAPSED_TIME_KEY);
instance_destroy(obj_room_arg_controller);

//
// setup sprites
show_debug_message("loading cat id "+string(current_enemy) + ", difficulty id "+string(current_difficulty));
load_cat_data(current_enemy, current_difficulty);
load_bg_data(current_difficulty);

// setup other sprites
obj_overlay_crit.visible = false;
obj_overlay_black.image_alpha = 0;
obj_bar_top.image_alpha = 0;
obj_bar_bottom.image_alpha = 0;

//
// finally, fade in camera
var _fade_duration = 2;
obj_camera_controller.start_fade_in(_fade_duration);

// don't allow escaping until the game starts (b/c it'll mess with the camera fade in)
prevent_exiting_to_menu = true;

start_game_timer_source = time_source_create(time_source_game, _fade_duration, time_source_units_seconds, function() {
	obj_rm_gameplay_controller.current_state = GAME_STATE.GAMEPLAY_START;
	prevent_exiting_to_menu = false;
});

if(current_difficulty >= 2) {
	obj_sound_controller.play_and_fade_in(snd_wind_synthetic_wind_artificial, 4, 0.1);
} else {
	obj_sound_controller.play_and_fade_in(snd_wind_synthetic_wind_artificial, 4, 0.1);	
}



time_source_start(start_game_timer_source);
show_debug_message("---------- Round Start -------------")
