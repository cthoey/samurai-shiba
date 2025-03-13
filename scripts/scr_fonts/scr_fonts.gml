
/*
	32x32
*/

global.font_map = ds_map_create();
ds_map_add(global.font_map, " ", 0);

ds_map_add(global.font_map, "0", 16);
ds_map_add(global.font_map, "1", 17);
ds_map_add(global.font_map, "2", 18);
ds_map_add(global.font_map, "3", 19);
ds_map_add(global.font_map, "4", 20);
ds_map_add(global.font_map, "5", 21);
ds_map_add(global.font_map, "6", 22);
ds_map_add(global.font_map, "7", 23);
ds_map_add(global.font_map, "8", 24);
ds_map_add(global.font_map, "9", 25);

ds_map_add(global.font_map, "A", 33);
ds_map_add(global.font_map, "B", 34);
ds_map_add(global.font_map, "C", 35);
ds_map_add(global.font_map, "D", 36);
ds_map_add(global.font_map, "E", 37);
ds_map_add(global.font_map, "F", 38);
ds_map_add(global.font_map, "G", 39);
ds_map_add(global.font_map, "H", 40);
ds_map_add(global.font_map, "I", 41);
ds_map_add(global.font_map, "J", 42);
ds_map_add(global.font_map, "K", 43);
ds_map_add(global.font_map, "L", 44);
ds_map_add(global.font_map, "M", 45);
ds_map_add(global.font_map, "N", 46);
ds_map_add(global.font_map, "O", 47);
ds_map_add(global.font_map, "P", 48);
ds_map_add(global.font_map, "Q", 49);
ds_map_add(global.font_map, "R", 50);
ds_map_add(global.font_map, "S", 51);
ds_map_add(global.font_map, "T", 52);
ds_map_add(global.font_map, "U", 53);
ds_map_add(global.font_map, "V", 54);
ds_map_add(global.font_map, "W", 55);
ds_map_add(global.font_map, "X", 56);
ds_map_add(global.font_map, "Y", 57);
ds_map_add(global.font_map, "Z", 58);

ds_map_add(global.font_map, "a", 65);
ds_map_add(global.font_map, "b", 66);
ds_map_add(global.font_map, "c", 67);
ds_map_add(global.font_map, "d", 68);
ds_map_add(global.font_map, "e", 69);
ds_map_add(global.font_map, "f", 70);
ds_map_add(global.font_map, "g", 71);
ds_map_add(global.font_map, "h", 72);
ds_map_add(global.font_map, "i", 73);
ds_map_add(global.font_map, "j", 74);
ds_map_add(global.font_map, "k", 75);
ds_map_add(global.font_map, "l", 76);
ds_map_add(global.font_map, "m", 77);
ds_map_add(global.font_map, "n", 78);
ds_map_add(global.font_map, "o", 79);
ds_map_add(global.font_map, "p", 80);
ds_map_add(global.font_map, "q", 81);
ds_map_add(global.font_map, "r", 82);
ds_map_add(global.font_map, "s", 83);
ds_map_add(global.font_map, "t", 84);
ds_map_add(global.font_map, "u", 85);
ds_map_add(global.font_map, "v", 86);
ds_map_add(global.font_map, "w", 87);
ds_map_add(global.font_map, "x", 88);
ds_map_add(global.font_map, "y", 89);
ds_map_add(global.font_map, "z", 90);

ds_map_add(global.font_map, "!", 1);
ds_map_add(global.font_map, "\"", 2);
ds_map_add(global.font_map, "#", 3);
ds_map_add(global.font_map, "$", 4);
ds_map_add(global.font_map, "%", 5);
ds_map_add(global.font_map, "&", 6);
ds_map_add(global.font_map, "'", 7);
ds_map_add(global.font_map, "(", 8);
ds_map_add(global.font_map, ")", 9);
ds_map_add(global.font_map, "*", 10);
ds_map_add(global.font_map, "+", 11);
ds_map_add(global.font_map, ",", 12);
ds_map_add(global.font_map, "-", 13);
ds_map_add(global.font_map, ".", 14);
ds_map_add(global.font_map, "/", 14);
ds_map_add(global.font_map, ":", 26);
ds_map_add(global.font_map, ";", 27);
ds_map_add(global.font_map, "<", 28);
ds_map_add(global.font_map, "=", 29);
ds_map_add(global.font_map, ">", 30);
ds_map_add(global.font_map, "?", 31);
ds_map_add(global.font_map, "@", 32);
ds_map_add(global.font_map, "_", 63);
ds_map_add(global.font_map, "~", 94);

function init_font_widths_map() {
	
	global.font_widths_map = ds_map_create();
	ds_map_add(global.font_widths_map, spr_800_24sz_24x24_cleartype, read_csv("800-24sz-24x24.csv"));
	ds_map_add(global.font_widths_map, spr_800_30sz_30x30_cleartype, read_csv("800-30sz-30x30.csv"));
	ds_map_add(global.font_widths_map, spr_800_36sz_36x36_cleartype, read_csv("800-36sz-36x36.csv"));
	ds_map_add(global.font_widths_map, spr_800_48sz_48x48_cleartype, read_csv("800-48sz-48x48.csv"));
	ds_map_add(global.font_widths_map, spr_800_72sz_48x72_cleartype, read_csv("800-72sz-48x72.csv"));
	ds_map_add(global.font_widths_map, spr_800_84sz_84x84_cleartype, read_csv("800-84sz-84x84.csv"));
	ds_map_add(global.font_widths_map, spr_800_96sz_96x96_cleartype, read_csv("800-96sz-96x96.csv"));
	ds_map_add(global.font_widths_map, spr_800_164sz_131x164_cleartype, read_csv("800-164sz-131x164.csv"));
	ds_map_add(global.font_widths_map, spr_800_131sz_131x131_cleartype, read_csv("800-131sz-131x131.csv"));
	
}

function draw_sprite_text(_x, _y, _str, _font, _alpha = 1, _halign = "left", _angle = 0) {

    var _scale_factor = 1;
    var _total_width = 0;
    var _char_width_map = ds_map_find_value(global.font_widths_map, _font);

    // Calculate total width of the string
    for (var _i = 0; _i < string_length(_str); _i++) {
        var _character = string_char_at(_str, _i + 1);
        var _char_width = ds_map_find_value(_char_width_map, _character);
        _total_width += _char_width * _scale_factor;
    }

    // Adjust _x based on the horizontal alignment
    switch(_halign) {
        case "center":
            _x -= _total_width / 2;
            break;
        case "right":
            _x -= _total_width;
            break;
        case "left":
        default:
            // No adjustment needed for left alignment
            break;
    }

    var _current_x = _x; // Start drawing at the adjusted x position
    var _current_y = _y; // Start drawing at the y position

    // Calculate the rotation components
    var _cos = cos(_angle * pi / 180);
    var _sin = sin(_angle * pi / 180);

    // Draw each character of the string
    for (var _i = 0; _i < string_length(_str); _i++) {
        var _character = string_char_at(_str, _i + 1);
        var _sprite_index = ds_map_find_value(global.font_map, _character);
        var _char_width = ds_map_find_value(_char_width_map, _character);

        // Calculate the new position after rotation
        var _draw_x = _current_x - _x;
        var _draw_y = _current_y - _y;

        var _rotated_x = _draw_x * _cos - _draw_y * _sin + _x;
        var _rotated_y = _draw_x * _sin + _draw_y * _cos + _y;

        // Draw the character with rotation
        draw_sprite_ext(_font, _sprite_index, _rotated_x, _rotated_y, _scale_factor, _scale_factor, -_angle, c_white, _alpha);

        // Increment _current_x by the scaled character width
        _current_x += _char_width * _scale_factor;
    }
}

function read_csv(_filename) {

	// Define a variable for the file path
	var _file_path = working_directory + _filename;

	// Open the file for reading
	var _file = file_text_open_read(_file_path);
	
	var _line_num = 0;
	var _char_widths = ds_map_create();

	// Check if the file was successfully opened
	if (_file != -1)
	{
	    // Read the file line by line
	    while (!file_text_eof(_file))
	    {
			_line_num++;
			
	        // Read the next line
	        var _line = file_text_read_string(_file);
	        file_text_readln(_file); // Move to the next line

			// Check if the line contains character width info
			if (string_pos("Char ", _line) == 1 && string_pos(" Base Width", _line) > 0) {
					
	            // Extract the character index and its base width
	            var _parts = string_split(_line, ",");
	            if (array_length(_parts) >= 2) {
				
	                var _char_info = string_replace(_parts[0], "Char ", ""); // "0 Base Width"
	                _char_info = string_replace(_char_info, " Base Width", ""); // "0"
	                var _char_index = real(_char_info);
	                var _char_width = real(_parts[1]);
                
					var _character = chr(_char_index);
				
	                // Store the character's width in the map
	                ds_map_add(_char_widths, _character, _char_width);
				
	            }
					
			}

	    }
    
	    // Close the file when done
	    file_text_close(_file);
		
	}
	else
	{
	    // Handle the error (e.g., file not found)
	    show_debug_message("Failed to open file.");
	}
	
	return _char_widths;

}
