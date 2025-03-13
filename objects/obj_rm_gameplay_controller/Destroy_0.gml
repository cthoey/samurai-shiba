/// @description Insert description here
// You can write your code in this editor

obj_timeline_controller.timeline_running = false;
//obj_sound_controller.stop_sound();
audio_stop_all();


if(time_source_exists(start_game_timer_source)) {
	time_source_destroy(start_game_timer_source)
}

if(time_source_exists(suspense_timer_source)) {
	time_source_destroy(suspense_timer_source)
}

if(time_source_exists(result_timer_source)) {
	time_source_destroy(result_timer_source)
}

if(time_source_exists(result_wait_timer_source)) {
	time_source_destroy(result_wait_timer_source)
}

if(time_source_exists(attack_timer_source)) {
	time_source_destroy(attack_timer_source)
}

if(time_source_exists(autoplay_timer_source)) {
	time_source_destroy(autoplay_timer_source)
}