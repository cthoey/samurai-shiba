/// @description advance on any input

var _input_detected = false;

/*
	Keyboard Input
*/
if (keyboard_check_pressed(vk_space)) {
	if(!_input_detected) {
		_input_detected = true;
	}
}

/*
	Mouse Input
*/
if (mouse_check_button_pressed(mb_left)) {
	if(!_input_detected) {
		_input_detected = true;
	}
}

/*
	Gamepad Input
*/

// Define the gamepad index (0 for the first gamepad)
var _gamepad_index = 0;

// Define the range of buttons to check (you might need to adjust these based on your gamepad's specific button indices)
var _first_button = gp_face1;
var _last_button = gp_select;

for (var _btn = _first_button; _btn <= _last_button; _btn++) {
    if (gamepad_button_check(_gamepad_index, _btn)) {
		
		if(!_input_detected) {
			_input_detected = true;
		}
		
		// Exit the loop if a button is pressed
        break;
    }
}


if(_input_detected && !has_clicked_button) {
	obj_room_controller.goto_room(rm_menu);
	//obj_room_controller.goto_room(rm_menu, 2);
	has_clicked_button = true;
}

