/// @description Insert description here

switch(current_state) {

	case GAME_STATE.NOT_STARTED:
		
	break;
	
	case GAME_STATE.GAMEPLAY_START:
		if(!intro_scene_started){
			obj_timeline_controller.timeline_index = tl_drama_scene_trailer;
			obj_timeline_controller.timeline_position = 0; // always reset
			obj_timeline_controller.timeline_speed = global.timeline_speed;
			obj_timeline_controller.timeline_running = true;
			
			intro_scene_started = true;
		}
	break;

	case GAME_STATE.START_SUSPENSE_TIMER:
		if (!suspense_timer_set) {
			obj_timeline_controller.timeline_index = -1;
			obj_timeline_controller.timeline_running = false;
			
			var _suspense_period_in_milli = irandom_range(2000, 5000) + 2000;
			var _suspense_period_in_seconds = _suspense_period_in_milli / 1000;
	

			if(is_debug_mode) {
				_suspense_period_in_seconds = 2;
			}

			//show_debug_message("suspense length: "+string(_suspense_period_in_seconds)+"s");
	
			suspense_timer_source = time_source_create(time_source_game, _suspense_period_in_seconds, time_source_units_seconds, function() {
				audio_play_sound(snd_ready, 1, false);
				obj_exclamation.visible = true;
				current_state = GAME_STATE.START_ATTACK_TIMER;
			});
			
			time_source_start(suspense_timer_source);
			suspense_timer_set = true;
		}
		
	break;
	
	case GAME_STATE.START_ATTACK_TIMER:
		if (!attack_timer_started) {
			
			var _difficulty_data = ds_map_find_value(global.difficulty_data, current_difficulty);
			var _enemy_speed_in_seconds = ds_map_find_value(_difficulty_data, current_enemy);
			
			if(is_debug_mode) {
				_enemy_speed_in_seconds = 10;
			}
			
			show_debug_message("enemy attacks in "+string(_enemy_speed_in_seconds)+"s");
			
			attack_timer_source = time_source_create(time_source_game, _enemy_speed_in_seconds, time_source_units_seconds, function() {
				show_debug_message("player has been defeated");
				audio_play_sound(snd_fight, 1, false);
				audio_play_sound(snd_smack, 1, false);
				obj_sound_controller.stop_sound();

				obj_exclamation.visible = false;

				obj_camera_controller.start_camera_shake(5, 10);
				obj_camera_controller.start_screen_flash(10);
				obj_shiba.set_character_defeated();
				obj_cat.set_character_attacked();
		
				round_result = ROUND_RESULT.LOSE;
				current_state = GAME_STATE.PLAYER_DEFEATED;

				var _layer_id = layer_get_id("layer_display_counter");
				layer_set_visible(_layer_id, false);
			
				result_timer_source = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
					audio_play_sound(snd_result_lose, 1, false);
					obj_lose.visible = true;
					current_state = GAME_STATE.READY_TO_CONTINUE;
				});
			
				attack_timer_started = false;
				time_source_destroy(attack_timer_source);
				time_source_start(result_timer_source);

			});
			
			var _layer_id = layer_get_id("layer_display_counter");
			layer_set_visible(_layer_id, true);
			
			time_source_start(attack_timer_source);
			
			/*
				 if we're in autoplay, start a timer to simulate the player reaction time
			*/
			
		    // Autoplay mode logic
		    if (autoplay_mode != AUTOPLAY_MODE.OFF) {
		        // Simulate a real player's input by selecting a random time within the appropriate range
				var _autoplay_response_time = 0;
				var _tie_margin = (_enemy_speed_in_seconds / 12);
				var _critical_attack_margin = 0.2;
		        switch (autoplay_mode) {
		            case AUTOPLAY_MODE.SUCCESS:
		                // Pick a random time between critical success and success margin
		                _autoplay_response_time = irandom_range(_critical_attack_margin * 1000, (_enemy_speed_in_seconds - _tie_margin) * 1000) / 1000;
		                break;

		            case AUTOPLAY_MODE.CRITICAL_SUCCESS:
		                // Pick a random time less than or equal to the critical success margin
		                _autoplay_response_time = irandom_range(0, _critical_attack_margin * 1000) / 1000;
		                break;

		            case AUTOPLAY_MODE.TIE:
		                // Pick a random time within the tie margin
		                _autoplay_response_time = irandom_range((_enemy_speed_in_seconds - _tie_margin) * 1000, _enemy_speed_in_seconds * 1000) / 1000;
		                break;
		        }
				
				autoplay_timer_source = time_source_create(time_source_game, _autoplay_response_time, time_source_units_seconds, function() {
					autoplay_input = true;
				});
				
				time_source_start(autoplay_timer_source);
        
		        // Simulate the input with the calculated time
		        show_debug_message("Simulated player response time: " + string(_autoplay_response_time));
		    }
			
			
			/*
				 end autoplay
			*/
			
			attack_timer_started = true;
			current_state = GAME_STATE.PLAYER_ATTACK_WINDOW;
		}
	break;

	case GAME_STATE.PLAYER_ATTACK_WINDOW:
		time_elapsed_label = time_source_get_period(attack_timer_source) - time_source_get_time_remaining(attack_timer_source);
	break;
	
	
	case GAME_STATE.PLAYER_TIE:

		if(!result_timer_set) {
					
			//show_debug_message("arr_elapsed_times "+string(arr_elapsed_times));
			
			audio_play_sound(snd_fight, 1, false);
			audio_play_sound(snd_sword_clash, 1, false, 1, 0, 1);
			obj_sound_controller.stop_sound();
		
			obj_exclamation.visible = false;
		
			obj_camera_controller.start_camera_shake(5, 10);
			obj_camera_controller.start_screen_flash(10);
			obj_shiba.set_character_tie();
			obj_cat.set_character_tie();


			round_result = ROUND_RESULT.TIE;
			
			var _layer_id = layer_get_id("layer_display_counter");
			layer_set_visible(_layer_id, false);
		
			
			result_timer_source = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
				audio_play_sound(snd_result_win, 1, false);
				//obj_win.visible = true;
				current_state = GAME_STATE.READY_TO_CONTINUE;
			});
			
			attack_timer_started = false;
			time_source_destroy(attack_timer_source);
			time_source_start(result_timer_source);
			
			if steam_stats_ready() {
				steam_set_stat_int("stat_Draw_Attacks", steam_get_stat_int("stat_Draw_Attacks") + 1);
			}
			
			result_timer_set = true;
		}
	
	break;
	
	case GAME_STATE.PLAYER_SUCCESS:
	
		if(!result_timer_set) {
			arr_elapsed_times[current_enemy] = time_source_get_period(attack_timer_source) - time_source_get_time_remaining(attack_timer_source);
			
			show_debug_message("arr_elapsed_times "+string(arr_elapsed_times));
			
			
			audio_play_sound(snd_fight, 1, false);
			audio_play_sound(snd_smack, 1, false);
			obj_sound_controller.stop_sound();
		
			obj_camera_controller.start_camera_shake(5, 10);
			obj_camera_controller.start_screen_flash(10);
			obj_shiba.set_character_attacked();
			obj_cat.set_character_defeated();
			obj_exclamation.visible = false;

			round_result = ROUND_RESULT.WIN;
		
			result_timer_source = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
				audio_play_sound(snd_result_win, 1, false);
				obj_win.visible = true;
				current_state = GAME_STATE.READY_TO_CONTINUE;
			});
			
			time_source_destroy(attack_timer_source);
			time_source_start(result_timer_source);
			
			result_timer_set = true;
		}
	break;
	
	case GAME_STATE.PLAYER_CRITICAL_SUCCESS:
		
		if(!result_timer_set) {
			
			arr_elapsed_times[current_enemy] = time_source_get_period(attack_timer_source) - time_source_get_time_remaining(attack_timer_source);
			show_debug_message("arr_elapsed_times "+string(arr_elapsed_times));
			
			audio_play_sound(snd_fight, 1, false);
			audio_play_sound(snd_smack, 1, false);
			
			obj_sound_controller.stop_sound();
		
			obj_camera_controller.start_camera_shake(5, 10);
			obj_camera_controller.start_screen_flash(10);
			obj_shiba.set_character_attacked();
			obj_cat.set_character_falling();
			obj_exclamation.visible = false;

			round_result = ROUND_RESULT.WIN;
		
			time_source_destroy(attack_timer_source);
			
			if steam_stats_ready() {
				steam_set_stat_int("stat_Critical_Attacks", steam_get_stat_int("stat_Critical_Attacks") + 1);
			}
			
			result_timer_source = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
				audio_play_sound(snd_result_win, 1, false);
				obj_win.visible = true;
				
				
				//obj_camera_controller.start_camera_shake(0.1, 100);
				
				//obj_red_overlay_controller.start_fade_in(0.1, 1, c_red);
				obj_overlay_crit.visible = true;
				
				obj_shiba.set_black_sprite(true);
				obj_cat.set_black_sprite(true);
				obj_bg_6.set_black_sprite(true);
				obj_cat.start_slow_motion();
				
				audio_play_sound(snd_critical_success, 1, false, 1);
				
				TweenSet(obj_bg_6.wind_tween, "time_scale", 0.5);
				
				current_state = GAME_STATE.READY_TO_CONTINUE;
			});
			
			time_source_start(result_timer_source);
			
			result_timer_set = true;
		}
		
	break;
	
	case GAME_STATE.PLAYER_DEFEATED:
		if(!result_timer_set) {
			result_timer_set = true;
		}

	break;
	
	case GAME_STATE.PLAYER_PLOPPED:
		if(!result_timer_set) {

			obj_exclamation.visible = false;
			audio_play_sound(snd_plop, 1, false);
			obj_shiba.set_character_plopped();
			obj_sound_controller.stop_sound();
		
			round_result = ROUND_RESULT.LOSE;
		
			time_source_destroy(suspense_timer_source);
			
			result_timer_source = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
				audio_play_sound(snd_result_lose, 1, false);
				obj_lose.visible = true;
				current_state = GAME_STATE.READY_TO_CONTINUE;
			});
			
			time_source_start(result_timer_source);
			
			result_timer_set = true;
		}
	break;

	case GAME_STATE.READY_TO_CONTINUE:
		if(!result_wait_timer_set) {
		
			result_wait_timer_source = time_source_create(time_source_game, 5, time_source_units_seconds, function() {
				time_source_destroy(result_timer_source);

				var _target_room = rm_gameplay;
				switch(round_result) {
					case ROUND_RESULT.TIE:
					break;
					case ROUND_RESULT.LOSE:
						_target_room = rm_results;
					break;
					case ROUND_RESULT.WIN:
						// if we just completed final enemy
						if(current_enemy == 4) {
							_target_room = rm_results;
						} else {
							current_enemy += 1
						}
					break;			
				}

				var _args = instance_create_layer(0, 0, LAYER_NAME_LOGIC, obj_room_arg_controller);
				_args.set(ROOM_ARG_DIFFICULTY_ID_KEY, current_difficulty);
				_args.set(ROOM_ARG_PROGRESS_KEY, current_difficulty_progress);
				_args.set(ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY, all_time_record_round);
				_args.set(ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY, all_time_record_total);
				_args.set(ROOM_ARG_ELAPSED_TIME_KEY, arr_elapsed_times);
				_args.set(ROOM_ARG_ENEMY_ID_KEY, current_enemy);

				prevent_exiting_to_menu = true;
				obj_room_controller.goto_room(_target_room, 2);
			
				// reset the game state, just to prevent this code from executing twice
				current_state = GAME_STATE.NOT_STARTED;

			});
		
			time_source_start(result_wait_timer_source);
				
			result_wait_timer_set = true;
		}
	break;

}


switch(current_state) {

	case GAME_STATE.START_SUSPENSE_TIMER:
	case GAME_STATE.PLAYER_ATTACK_WINDOW:
	case GAME_STATE.READY_TO_CONTINUE:
	
	var _input_detected = false;
	
	// accept mouse left click
	if (mouse_check_button_pressed(mb_left)) {
		_input_detected = true
	}
	
	// accept keyboard space button
	if (keyboard_check_pressed(vk_space)) {
		_input_detected = true;
	}
	
	// accept any face button on gamepad
	if (gamepad_button_check_pressed(0, gp_face1) ||
	    gamepad_button_check_pressed(0, gp_face2) ||
	    gamepad_button_check_pressed(0, gp_face3) ||
	    gamepad_button_check_pressed(0, gp_face4)) {
		_input_detected = true
	}
	
	
	if(_input_detected or autoplay_input) {
		autoplay_input = false;
		
		if(current_state == GAME_STATE.PLAYER_ATTACK_WINDOW) {
			
			// if the enemy timer is too low, it's a tie.
			var _attack_time_seconds_remaining = time_source_get_time_remaining(attack_timer_source);
			
			var _time_elapsed = time_source_get_period(attack_timer_source) - time_source_get_time_remaining(attack_timer_source);
			show_debug_message("player response time: "+string(_time_elapsed));
			show_debug_message("player had " + string(_attack_time_seconds_remaining) + "s left to react");
			
			var _difficulty_data = ds_map_find_value(global.difficulty_data, current_difficulty);
			var _enemy_speed_in_seconds = ds_map_find_value(_difficulty_data, current_enemy);
			
			if(is_debug_mode) {
				_enemy_speed_in_seconds = 10;
			}
			
			var _tie_margin = (_enemy_speed_in_seconds / 12);
		
			show_debug_message("enemy response time: "+string(_enemy_speed_in_seconds));
			show_debug_message("1/12 of enemy speed: "+string(_tie_margin));
			show_debug_message("player would tie if their response time was >= "+string(_enemy_speed_in_seconds - _tie_margin) + "s");
			
			var _critical_attack_margin = 0.2;
			if(is_debug_mode) {
				_critical_attack_margin = 0.4;
			}
			
			if(_time_elapsed >= (_enemy_speed_in_seconds - _tie_margin)) {
				current_state = GAME_STATE.PLAYER_TIE;
			} else if(_time_elapsed < _critical_attack_margin) {
				current_state = GAME_STATE.PLAYER_CRITICAL_SUCCESS;
			} else {
				
				// TEST MODE
				// if the player presses with ample time remaining, they've clearly won
				current_state = GAME_STATE.PLAYER_SUCCESS; // normal
				//current_state = GAME_STATE.PLAYER_TIE; // debug
				
			}
			
			
		} else if(current_state == GAME_STATE.START_SUSPENSE_TIMER) {
			current_state = GAME_STATE.PLAYER_PLOPPED;
		} else if(current_state == GAME_STATE.READY_TO_CONTINUE) {
			
			// if clicked, stop the auto advance timer
			time_source_destroy(result_wait_timer_source);
			
			var _target_room = rm_gameplay;
			switch(round_result) {
				case ROUND_RESULT.TIE:
				break;
				case ROUND_RESULT.LOSE:
					_target_room = rm_results;
				break;
				case ROUND_RESULT.WIN:
					// if we just completed final enemy
					if(current_enemy == 4) {
						_target_room = rm_results;
					} else {
						current_enemy += 1
					}
				break;			
			}

			var _args = instance_create_layer(0, 0, LAYER_NAME_LOGIC, obj_room_arg_controller);
			_args.set(ROOM_ARG_DIFFICULTY_ID_KEY, current_difficulty);
			_args.set(ROOM_ARG_PROGRESS_KEY, current_difficulty_progress);
			_args.set(ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY, all_time_record_round);
			_args.set(ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY, all_time_record_total);
			_args.set(ROOM_ARG_ELAPSED_TIME_KEY, arr_elapsed_times);
			_args.set(ROOM_ARG_ENEMY_ID_KEY, current_enemy);

			prevent_exiting_to_menu = true;
			obj_room_controller.goto_room(_target_room, 2);
			
			// reset the game state, just to prevent this code from executing twice
			current_state = GAME_STATE.NOT_STARTED;	
			
		}
		
	}

	break;
	
}












