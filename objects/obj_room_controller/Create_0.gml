target_room = room;

goto_room = function(_target_room, _fade_duration = 0.25) {
	target_room = _target_room;
	
	_room_change_fade_timer_source = time_source_create(time_source_game, _fade_duration, time_source_units_seconds, function() {
		room_goto(target_room);
	});
	
	obj_camera_controller.start_fade_out(_fade_duration);
	time_source_start(_room_change_fade_timer_source);
};

