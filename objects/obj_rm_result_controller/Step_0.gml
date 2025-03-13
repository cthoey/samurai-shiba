/// @description Insert description here

// accept mouse left click
if (mouse_check_button_pressed(mb_left)) {
	if(!input_detected) {
		obj_room_controller.goto_room(rm_menu, 2);
		input_detected = true;
	}
}


// Update the alpha value
text_alpha += fade_speed * alpha_direction;

// Check for bounds and reverse direction if necessary
if (text_alpha <= 0) {
    text_alpha = 0;
    alpha_direction = 1; // Start fading in
} else if (text_alpha >= 1) {
    text_alpha = 1;
    alpha_direction = -1; // Start fading out
}




