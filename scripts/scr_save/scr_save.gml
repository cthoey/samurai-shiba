
enum SAVE_STATE {
	DIFF_UNLOCKED,
	ALL_TIME_RECORD_ROUND,
	ALL_TIME_RECORD_TOTAL
}

function load_save(){
    ini_open(SETTINGS_FILENAME);
	
    var _difficulty_unlocked = ini_read_real(GAME_SECTION_KEY, 
		SAVE_STATE.DIFF_UNLOCKED, 
		SAVEDATA_DEFAULT_DIFFUNLOCKED
	);
	
    var _all_time_record_round = ini_read_real(GAME_SECTION_KEY, 
		SAVE_STATE.ALL_TIME_RECORD_ROUND, 
		SAVEDATA_DEFAULT_ALLTIMERECORD_ROUND
	);
	
	var _all_time_record_total = ini_read_real(GAME_SECTION_KEY, 
		SAVE_STATE.ALL_TIME_RECORD_TOTAL, 
		SAVEDATA_DEFAULT_ALLTIMERECORD_TOTAL
	);
	
	global.save_data = {};
	global.save_data.difficulty_unlocked = _difficulty_unlocked;
	global.save_data.all_time_record_round = _all_time_record_round;
	global.save_data.all_time_record_total = _all_time_record_total;
	
    ini_close();
}

function save_state(_difficulty_unlocked, _all_time_record_round, _all_time_record_total) {
	ini_open(SETTINGS_FILENAME);
	
	ini_write_real(GAME_SECTION_KEY, SAVE_STATE.DIFF_UNLOCKED, _difficulty_unlocked);	
	ini_write_real(GAME_SECTION_KEY, SAVE_STATE.ALL_TIME_RECORD_ROUND, _all_time_record_round);	
	ini_write_real(GAME_SECTION_KEY, SAVE_STATE.ALL_TIME_RECORD_TOTAL, _all_time_record_total);	
	
	global.save_data.difficulty_unlocked = _difficulty_unlocked;
	global.save_data.all_time_record_round = _all_time_record_round;
	global.save_data.all_time_record_total = _all_time_record_total;
	
    ini_close();
}

