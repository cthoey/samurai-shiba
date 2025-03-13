
function get_sum_of_array(_arr) {
	var _sum = 0; // Initialize sum

	for (var _i = 0; _i < array_length(_arr); _i++) {
	    _sum += _arr[_i];
	}	
	
	return _sum;
}

function find_smallest_number_in_array(_arr) {

	// Assume first element is the smallest at the start
	var _smallest = _arr[0];

	// Loop through the array starting from the second element
	for (var _i = 1; _i < array_length(_arr); _i++) {
	    if (_arr[_i] < _smallest) {
	        _smallest = _arr[_i];
	    }
	}

	return _smallest;
	
}

function trim_version_number(_version_string) {
    // Split the version string into an array using the dot as a delimiter
    var _version_array = string_split(_version_string, ".");

    // Loop backward through the array and remove trailing zeros
    for (var _i = array_length(_version_array) - 1; _i > 0; _i--) {
        if (_version_array[_i] == "0") {
            array_delete(_version_array, _i, 1);
        } else {
            break; // Stop when we hit a non-zero value
        }
    }

    // Rebuild the version string by joining the array elements manually
    var _trimmed_version = _version_array[0];
    for (var j = 1; j < array_length(_version_array); j++) {
        _trimmed_version += "." + _version_array[j];
    }

    return _trimmed_version;
}