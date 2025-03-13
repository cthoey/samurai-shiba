/// @description Insert description here
if(!locked && !obj_rm_menu_controller.has_clicked_button) {
	
	var _args = instance_create_layer(0, 0, LAYER_NAME_LOGIC, obj_room_arg_controller);
	_args.set(ROOM_ARG_DIFFICULTY_ID_KEY, GAME_DIFFICULTY.EXPERT);
	_args.set(ROOM_ARG_PROGRESS_KEY, global.save_data.difficulty_unlocked);
	_args.set(ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY, global.save_data.all_time_record_round);
	_args.set(ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY, global.save_data.all_time_record_total);
	_args.set(ROOM_ARG_ENEMY_ID_KEY, 0);
	_args.set(ROOM_ARG_ELAPSED_TIME_KEY, get_all_time_record_arr());
	
	obj_timeline_controller.timeline_index = tl_start_game;
	obj_timeline_controller.timeline_position = 0;
	obj_timeline_controller.timeline_speed = global.timeline_speed;
	obj_timeline_controller.timeline_running = true;
	
	obj_rm_menu_controller.has_clicked_button = true;
}


