/// @description Insert description here

y = FLOOR_Y_POS;

set_character_idle = function() {
	image_index = 0	
	
	x = 193;
	y = FLOOR_Y_POS;
	
}

set_character_ready = function() {
	image_index = 1	
}

set_character_attacked = function() {
	image_index = 2	
	x = 447;
}

set_character_defeated = function() {
	image_index = 3	
	x = 320;
}

set_character_plopped = function() {
	image_index = 4	
	x = 220;
}

set_character_tie = function() {
	image_index = 5;
	x = 229;
	start_character_shake(1, 20);
}

_apply_shader = false;
set_black_sprite = function(_enabled) {
	_apply_shader = _enabled;
}


/**********************************
	Character Shake Effect
***********************************/

// Variables for camera shake
shake_intensity = 0;
shake_duration = 0;

original_x = x
original_y = y

// Function to start camera shake
start_character_shake = function(_intensity, _duration) {
	original_x = x
	original_y = y
    shake_intensity = _intensity;
    shake_duration = _duration;
};


set_character_idle();
