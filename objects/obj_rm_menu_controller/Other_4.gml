/// @description initialize visuals before camera fade-in

var _difficulty_unlocked = global.save_data.difficulty_unlocked;
show_debug_message("_difficulty_unlocked: "+string(_difficulty_unlocked))

if(_difficulty_unlocked >= 1) {
	obj_btn_diff_expert.sprite_index = spr_btn_expert_1
	obj_btn_diff_expert.locked = false;
}

if(_difficulty_unlocked >= 2) {
	obj_btn_diff_master.sprite_index = spr_btn_master_1
	obj_btn_diff_master.locked = false;
}

if(_difficulty_unlocked >= 3) {
	obj_btn_diff_nightmare.sprite_index = spr_btn_nightmare_1
	obj_btn_diff_nightmare.locked = false;
}

// if we're on android, hide the exit button
if(global.platform == SYSTEM_PLATFORM.ANDROID) {
	obj_btn_quit.visible = false;
	obj_btn_quit.is_disabled = true;
	layer_set_visible("layer_tileset", false);
}

obj_camera_controller.start_fade_in(0.25); // Start fade in








