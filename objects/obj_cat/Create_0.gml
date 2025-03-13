
y = FLOOR_Y_POS;

set_character_idle = function() {
	image_index = 0	;

	x = 447
	y = FLOOR_Y_POS;
	
}

set_character_ready = function() {
	image_index = 1;
}

set_character_attacked = function() {
	image_index = 2;
	x = 193
}

set_character_falling = function() {
	image_index = 3;
	image_xscale = -1;
	x = 212;
	y = 180;
	start_character_shake(0.2, 20);
}

set_character_defeated = function() {
	image_index = 4;
	x = 238
	
	var _sprite_name = sprite_get_name(sprite_index);
	var _sprite_name_trim = string_copy(_sprite_name, 1, string_length(_sprite_name) - 2);

	switch (_sprite_name_trim) {
		case "spr_cat_3":
			y = FLOOR_Y_POS + 10;
			break;
		case "spr_cat_4":
			y = FLOOR_Y_POS + 15;
			break;
		
	}
	
}

set_character_tie = function() {
	image_index = 5;
	
	var _sprite_name = sprite_get_name(sprite_index);
	var _sprite_name_trim = string_copy(_sprite_name, 1, string_length(_sprite_name) - 2);

	switch (_sprite_name_trim) {
		case "spr_cat_0":
			x = 401;
			break;
		case "spr_cat_1":
			x = 344;
			break;
		case "spr_cat_2":
			x = 354;
			break;
		case "spr_cat_3":
			x = 366;
			break;
		case "spr_cat_4":
			x = 360;
			break;
	}

}

_apply_shader = false;
set_black_sprite = function(_enabled) {
	_apply_shader = _enabled;
}

apply_smoke = false;
set_smoke_sprite = function(_enabled) {
	apply_smoke = _enabled;
}

apply_green = false;
set_green_sprite = function(_enabled) {
	apply_green = _enabled;
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

/*
	END
*/

// Initialize variables
y_speed = 0;
x_speed = 0;
rot_speed = 0.02;
gravity_val = 0.0002;    // Gravity effect
in_slow_motion = false; // Flag to control slow motion

// Function to trigger slow-motion effect
function start_slow_motion() {
    y_speed = -0.04;       // Initial upward speed
	x_speed = -0.08;
    in_slow_motion = true;
}


/* particles (smoke) */

// Create a particle system
psystem_smoke = part_system_create_layer("layer_characters");

// Create a particle type for smokiness
ptype_smoke = part_type_create();

// Set particle type properties for smokiness
part_type_shape(ptype_smoke, pt_shape_pixel);
part_type_size(ptype_smoke, 1, 1, 0, 0); // Adjust size as needed
part_type_color1(ptype_smoke, make_color_rgb(30, 30, 30)); // Very dark gray
part_type_alpha3(ptype_smoke, 0, 0.5, 0); // Fade out
part_type_life(ptype_smoke, 30, 60); // Lifespan
part_type_speed(ptype_smoke, 0.1, 0.1, 0, 0); // Speed
part_type_direction(ptype_smoke, 85, 95, 0, 0);
part_type_blend(ptype_smoke, false); // Disable additive blending




// Create a particle system

/*
psystem_green = part_system_create_layer("layer_characters");

// Create a particle type for smokiness
ptype_green = part_type_create();

// Set particle type properties for smokiness
part_type_shape(ptype_green, pt_shape_sphere);
part_type_size(ptype_green, .1, .1, 0, 0); // Adjust size as needed
//part_type_color1(ptype_green, make_color_rgb(138,201,101));
part_type_color3(ptype_green, make_color_rgb(138,201,101), make_color_rgb(160, 254, 120), make_color_rgb(230, 234, 206));
part_type_alpha3(ptype_green, 0, 0.5, 0); // Fade out
part_type_life(ptype_green, 30, 60); // Lifespan
part_type_speed(ptype_green, 0.1, 0.1, 0, 0); // Speed
part_type_direction(ptype_green, 85, 95, 0, 0);
part_type_blend(ptype_green, false);
*/

