/// @description draw menu

var _text_x = 160;
var _text_y = 40;

if(global.platform != SYSTEM_PLATFORM.ANDROID) {
	draw_sprite_text(_text_x, _text_y, "Fullscreen", spr_800_36sz_36x36_cleartype);
} else {
	draw_sprite_text(_text_x, _text_y, "System: Android v"+string(os_version), spr_800_24sz_24x24_cleartype);
}

/*
_text_x = 160;
_text_y = 80;

draw_sprite_text(_text_x, _text_y, "Vsync", spr_800_36sz_36x36_cleartype);
*/
var _text_highscore_y = 150;
var _text_highscore_x = 160;

draw_sprite_text(_text_highscore_x, _text_highscore_y, "Record Time (Round)", spr_800_24sz_24x24_cleartype);

_text_highscore_x = 160;
_text_highscore_y += 30;

var _all_time_record_round_str = "none"
if(global.save_data.all_time_record_round != 1000) {
	_all_time_record_round_str = string(global.save_data.all_time_record_round);
}
draw_sprite_text(_text_highscore_x, _text_highscore_y, _all_time_record_round_str, spr_800_30sz_30x30_cleartype);

_text_highscore_x = 360;
_text_highscore_y = 150;

draw_sprite_text(_text_highscore_x, _text_highscore_y, "Record Time (Total)", spr_800_24sz_24x24_cleartype);

_text_highscore_x = 380;
_text_highscore_y += 30;

var _all_time_record_total_str = "none"
if(global.save_data.all_time_record_round != 1000) {
	_all_time_record_total_str = string(global.save_data.all_time_record_total);
}
draw_sprite_text(_text_highscore_x, _text_highscore_y, _all_time_record_total_str, spr_800_30sz_30x30_cleartype);

var _text_credits_y = 246;

draw_sprite_text(_text_x, _text_credits_y, "Code", spr_800_36sz_36x36_cleartype);

_text_x = 160;
_text_credits_y += 30;

draw_sprite_text(_text_x, _text_credits_y, "choey", spr_800_30sz_30x30_cleartype);

_text_x = 380;
_text_credits_y = 246;

draw_sprite_text(_text_x, _text_credits_y, "Art", spr_800_36sz_36x36_cleartype);

_text_x = 380;
_text_credits_y += 30;

draw_sprite_text(_text_x, _text_credits_y, "@cecihoney", spr_800_30sz_30x30_cleartype);

