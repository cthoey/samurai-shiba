/// @description flashy start game
randomize();
		
audio_play_sound(snd_taiko_6, 1, false);
audio_play_sound(snd_japanese_flute, 1, false);
obj_camera_controller.start_screen_flash(50); // 50ms

current_difficulty			= obj_room_arg_controller.get(ROOM_ARG_DIFFICULTY_ID_KEY);
switch(current_difficulty) {
	
	case 0:
		obj_btn_diff_expert.start_fade_out(1);
		obj_btn_diff_master.start_fade_out(1);
		obj_btn_diff_nightmare.start_fade_out(1);
		obj_bg_texture.start_fade_out(1);
	break;
	
	case 1:
		obj_btn_diff_normal.start_fade_out(1);
		obj_btn_diff_master.start_fade_out(1);
		obj_btn_diff_nightmare.start_fade_out(1);
		obj_bg_texture.start_fade_out(1);
	break;
	
	case 2:
		obj_btn_diff_normal.start_fade_out(1);
		obj_btn_diff_expert.start_fade_out(1);
		obj_btn_diff_nightmare.start_fade_out(1);
		obj_bg_texture.start_fade_out(1);
	break;
	
	case 3:
		obj_btn_diff_normal.start_fade_out(1);
		obj_btn_diff_expert.start_fade_out(1);
		obj_btn_diff_master.start_fade_out(1);
		obj_bg_texture.start_fade_out(1);
	break;
	
}

obj_btn_settings.start_fade_out(1);
obj_btn_quit.visible = false;
layer_set_visible("layer_background", false);
layer_set_visible("layer_tileset", false);