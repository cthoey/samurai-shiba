/// @description Insert description here

var _text_x = display_get_gui_width() - 24;
var _text_y = 11;

if(attack_timer_started) {
	
	var _formatted = string(time_elapsed_label) + "s";
	draw_sprite_text(_text_x, _text_y, _formatted, spr_800_36sz_36x36_cleartype, 1, "right");
	
}

/*

if(time_source_exists(attack_timer_source)) {
	
	var _formatted = string(time_elapsed_label) + "s";
	draw_sprite_text(_text_x, _text_y, _formatted, spr_800_36sz_36x36_cleartype, 1, "right");
	
} else if(arr_elapsed_times[current_enemy] != SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND) {
	
	//var _formatted = string(round(arr_elapsed_times[current_enemy]  * 1000)) + "ms";
	var _formatted = string(arr_elapsed_times[current_enemy]) + "s";
	draw_sprite_text(_text_x, _text_y, _formatted, spr_800_36sz_36x36_cleartype, 1, "right");
	
}

*/










