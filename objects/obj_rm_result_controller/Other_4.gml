/// @description initialize visuals before camera fade-in

// pull args
current_difficulty_id				= obj_room_arg_controller.get(ROOM_ARG_DIFFICULTY_ID_KEY);
var _current_difficulty_progress	= obj_room_arg_controller.get(ROOM_ARG_PROGRESS_KEY);
var _all_time_record_round			= obj_room_arg_controller.get(ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY);
var _all_time_record_total			= obj_room_arg_controller.get(ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY);
var _arr_elapsed_times				= obj_room_arg_controller.get(ROOM_ARG_ELAPSED_TIME_KEY);
current_enemy_id						= obj_room_arg_controller.get(ROOM_ARG_ENEMY_ID_KEY);

is_game_won = (current_enemy_id >= 4 && _arr_elapsed_times[4] != 1000);

instance_destroy(obj_room_arg_controller);

// are we on final enemy and did we defeat it? Win condition.  Else, defeat.
if(is_game_won) {

	show_debug_message("Result - current_difficulty_id "+string(current_difficulty_id));
	show_debug_message("Result - highest diff player has beaten: "+string(_current_difficulty_progress));
	show_debug_message("Result - all_time_record (round) "+string(_all_time_record_round));
	show_debug_message("Result - all_time_record (total) "+string(_all_time_record_total));
	show_debug_message("Result - current_enemy_id "+string(current_enemy_id));
	show_debug_message("Result - arr_elapsed_times "+string(_arr_elapsed_times));

	var _current_best_time_round		= find_smallest_number_in_array(_arr_elapsed_times);
	var _total_time						= get_sum_of_array(_arr_elapsed_times);

	show_debug_message("Result - best reaction time this round: "+string(_current_best_time_round));
	show_debug_message("Result - sum of all reaction times this round: "+string(_total_time));

	var _ranking_data = ds_map_find_value(global.ranking_data, current_difficulty_id);

	// Iterate over ranking map
	var _key = ds_map_find_first(_ranking_data);
	while (!is_undefined(_key)) {
	
	    var _value = ds_map_find_value(_ranking_data, _key);
		show_debug_message("checking qualif for "+string(_value)+" rank");
	
	    show_debug_message(string(_total_time) + " <= " + string(_key)+"?");
	
		if(_total_time <= _key) {
		
			show_debug_message("rank awarded: "+string(_value))
			label_round_rank = _value;
			break;
		
		}
	
	    _key = ds_map_find_next(_ranking_data, _key); // Move to the next key
	}

	show_debug_message("best time this round: " + string(_current_best_time_round));

	/*
		Save Game
	*/
	var _final_progress = -1;
	var _final_record_time_round = -1;
	var _final_record_time_total = -1;


	load_shiba_data_results(current_difficulty_id);
	_final_progress = max(_current_difficulty_progress, current_difficulty_id + 1);

	is_new_record_round					= _current_best_time_round < _all_time_record_round;	
	_final_record_time_round			= min(_current_best_time_round, _all_time_record_round);

	is_new_record_total					= _total_time < _all_time_record_total;	
	_final_record_time_total			= min(_total_time, _all_time_record_total);

	save_state(_final_progress, _final_record_time_round, _final_record_time_total);

	/*
		Update Labels + Sprites
	*/
	label_total_time_val = string(_total_time)+"s";
	label_best_time_round_val = string(_current_best_time_round)+"s";

	if(steam_initialised()) {
		show_debug_message("steam_initialised is true");
	} else {
		show_debug_message("steam_initialised is FALSE");
	}
	
	/* award steam achievements */
	if steam_stats_ready() {
		show_debug_message("steam_stats_ready is true");
		
		switch(current_difficulty_id) {
			case GAME_DIFFICULTY.NORMAL:
		
				if !steam_get_achievement("ach_Normal_Diff_Complete") {
					show_debug_message("rewarding steam achievement: ach_Normal_Diff_Complete");
					steam_set_achievement("ach_Normal_Diff_Complete");
				} else {
					show_debug_message("user already has steam achievement: ach_Normal_Diff_Complete");
				}
		
			break;
		
			case GAME_DIFFICULTY.EXPERT:

				if !steam_get_achievement("ach_Expert_Diff_Complete") {
					steam_set_achievement("ach_Expert_Diff_Complete");
				} else {
					
				}
			
			break;
		
			case GAME_DIFFICULTY.MASTER:
		
				if !steam_get_achievement("ach_Master_Diff_Complete") {
					steam_set_achievement("ach_Master_Diff_Complete");
				} else {
					
				}
		
			break;
		
			case GAME_DIFFICULTY.NIGHTMARE:
		
				if !steam_get_achievement("ach_Nightmare_Diff_Complete") {
					steam_set_achievement("ach_Nightmare_Diff_Complete");
				} else {
					
				}
		
			break;
		}
		
		
    } else {
		show_debug_message("steam_stats_ready is FALSE");
	}




} else {
	load_shiba_data_results(-1);	
}


/*
	Start Room
*/
obj_camera_controller.start_fade_in(1);

if(is_game_won) {
	audio_play_sound(snd_final_results, 1, false);
} else {
	audio_play_sound(snd_final_results_defeat, 1, false);
}