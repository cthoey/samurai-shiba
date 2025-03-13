
function show_map_contents(_map) {
	
    var _key = ds_map_find_first(_map);
	
    while (!is_undefined(_key)) {
        var _value = ds_map_find_value(_map, _key);
        show_debug_message(string(_key) + ": " + string(_value));
        _key = ds_map_find_next(_map, _key);
    }
}

function list_working_directory_files() {
	show_debug_message("dumping all files in working directory: ");
	
	// Start searching for any file or directory within the working directory
	var _search_pattern = working_directory + "*.*";
	//var _search_handle = file_find_first(_search_pattern, fa_none);
	var _file_name = file_find_next();

	// Loop through all files and directories found
	while (_file_name != "") {
	    show_debug_message(_file_name); // Print the name of each file or directory
	    _file_name = file_find_next(); // Move to the next file or directory
	}

	// Close the search to free up resources
	file_find_close();	
}

function state_to_state_name(_state_id) {
	var _ret_str = "";
	switch (_state_id) {
	    case 0:
	        _ret_str = "NOT_STARTED";
			break;
	    case 1:
	        _ret_str = "GAMEPLAY_START";
			break;
	    case 2:
	        _ret_str = "START_SUSPENSE_TIMER";
			break;
		case 3:
	        _ret_str = "START_ATTACK_TIMER";
			break;
		case 4:
	        _ret_str = "PLAYER_ATTACK_WINDOW";
			break;
		case 5:
	        _ret_str = "PLAYER_DEFEATED";
			break;
		case 6:
	        _ret_str = "PLAYER_SUCCESS";
			break;
		case 7:
	        _ret_str = "PLAYER_CRITICAL_SUCCESS";
			break;
		case 8:
	        _ret_str = "PLAYER_PLOPPED";
			break;
		case 9:
	        _ret_str = "PLAYER_TIE";
			break;
		case 10:
	        _ret_str = "READY_TO_CONTINUE";
			break;
		default:
	        _ret_str = "NO STATE " + string(_state_id);
			break;
	}	
	return _ret_str + " " + string(_state_id);
	
}