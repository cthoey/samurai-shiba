
enum SYSTEM_PLATFORM {
	PC,
	ANDROID,
	IOS,
	MOBILE,
	CONSOLE
}

enum GAME_DIFFICULTY {
	NORMAL,
	EXPERT,
	MASTER,
	NIGHTMARE
}

enum GAME_BOSSES {
	WADDLE,
	WHEELIE,
	CHEF,
	DEDEDE,
	META
}

enum GAME_SETTINGS {
	FULLSCREEN,
	VSYNC,
	FPS
}

// Macros have 1) No memory allocation, 2) Fast access, 3) No runtime overhead

// Room Argument Keys
#macro LAYER_NAME_LOGIC "layer_logic"

// Settings Macros
#macro SETTINGS_FILENAME "shiba.ini"
#macro SETTINGS_SECTION_KEY "settings"

#macro SETTINGS_KEY_FULLSCREEN "fullscreen"
#macro SETTINGS_KEY_VSYNC "vsync"
#macro SETTINGS_KEY_FPS "fps"

// Save Data
#macro GAME_SECTION_KEY "game"
#macro SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND 1000
#macro SAVEDATA_DEFAULT_ALLTIMERECORD_TOTAL 1000
#macro SAVEDATA_DEFAULT_DIFFUNLOCKED 0

function get_all_time_record_arr() {
	return [SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND,
			SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND,
			SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND,
			SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND,
			SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND];	
}

// Room Argument Keys
#macro ROOM_ARG_DIFFICULTY_ID_KEY "difficulty_id"
#macro ROOM_ARG_PROGRESS_KEY "difficulty_progress"
#macro ROOM_ARG_ENEMY_ID_KEY "current_enemy"
#macro ROOM_ARG_ELAPSED_TIME_KEY "arr_elapsed_times"
#macro ROOM_ARG_ALL_TIME_RECORD_ROUND_KEY "all_time_record_round"
#macro ROOM_ARG_ALL_TIME_RECORD_TOTAL_KEY "all_time_record_total"

// Gameplay
#macro FLOOR_Y_POS 227

// Dramatic Scene
#macro DRAMA_SHIBA_START_X 0
#macro DRAMA_CAT_START_X room_width

#macro DRAMA_PADDING_1 5
#macro DRAMA_PADDING_2 25