
if(enable_debug_overlay) {

	// Rectangle Padding
	var _rect_width = 310;
	var _rect_height = 60;

	// Set Background Color for the Rectangle
	draw_set_colour(c_black); // Change c_black to any color you prefer for the background
	draw_set_alpha(0.65); // Set transparency of the rectangle (0 = fully transparent, 1 = fully opaque)

	// Draw Rectangle behind the text
	// Adjust the rectangle size based on the text size and desired padding
	draw_rectangle(0, 0, _rect_width, _rect_height, false);

	// Set the font and color (optional)
	draw_set_font(fnt_press_start_6);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var _x_pos = 10; // X position for the debug text
	var _y_pos = 10; // Y position for the debug text
	var _line_height = 15; // Space between lines

	var _debug_str = "" + string(game_get_speed(gamespeed_fps));
	_debug_str += " (" + string(game_get_speed(gamespeed_fps)) +  " fps)";
	
	var _game_width = surface_get_width(application_surface);
	var _game_height = surface_get_height(application_surface);
	_debug_str += " " + string(_game_width) + "x" + string(_game_height);
	
	_debug_str += " " + string(room_get_name(room));
	
	draw_text(_x_pos, _y_pos, _debug_str);
	
	_y_pos += _line_height;
	if (instance_exists(obj_rm_gameplay_controller)) {
	    var my_instance = obj_rm_gameplay_controller;
		draw_text(_x_pos, _y_pos, ""+string(state_to_state_name(my_instance.current_state)));
	} else {
		draw_text(_x_pos, _y_pos, "no gameplay");
	}
	
	_debug_str = "";
	var _timeline_index = obj_timeline_controller.timeline_index;

	_y_pos += _line_height;
	if(_timeline_index != -1) {
		_debug_str += timeline_get_name(_timeline_index);
		_debug_str += " " + string(_timeline_index);

		if(obj_timeline_controller.timeline_position > 0) {
			_debug_str += " " + string(timeline_max_moment(_timeline_index));
			_debug_str += " " + string(obj_timeline_controller.timeline_position);
			draw_text(_x_pos, _y_pos, _debug_str);
		}
	} else {
		draw_text(_x_pos, _y_pos, "no timeline");
	}
	

}

