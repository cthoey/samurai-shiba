/// @description Insert description here

enum GAME_STATE {
	NOT_STARTED,
	GAMEPLAY_START,
	START_SUSPENSE_TIMER,
	START_ATTACK_TIMER,
	PLAYER_ATTACK_WINDOW,
	PLAYER_DEFEATED,
	PLAYER_SUCCESS,	
	PLAYER_CRITICAL_SUCCESS,
	PLAYER_PLOPPED,
	PLAYER_TIE,
	READY_TO_CONTINUE
}

enum ROUND_RESULT {
	WIN,
	LOSE,
	TIE//,
	//PLOPPED
}

// Define autoplay options
enum AUTOPLAY_MODE {
    OFF,
    SUCCESS,
    CRITICAL_SUCCESS,
    TIE
}

// Set the autoplay mode somewhere in your initialization code or demo settings
autoplay_mode = AUTOPLAY_MODE.OFF; // Default to OFF
autoplay_input = false;

current_state				= -1;
current_difficulty			= -1;
current_difficulty_progress = -1;
current_enemy				=  0;
round_result				= -1;
arr_elapsed_times			= []; // overwritten by room start

all_time_record_round		= 1000;
all_time_record_total		= 1000;

time_elapsed_label         = "";

// flip flags
is_debug_mode				= false;
intro_scene_started			= false;
crit_scene_started			= false;
suspense_timer_set			= false;
suspense_timer_set			= false;
attack_timer_started		= false;
result_timer_set			= false;
result_wait_timer_set		= false;

// detect ESC button to leave game
prevent_exiting_to_menu = false;

// timers
start_game_timer_source		= noone;
suspense_timer_source		= noone;
result_timer_source			= noone;
result_wait_timer_source	= noone;
attack_timer_source			= noone;
autoplay_timer_source		= noone;


