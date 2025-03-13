/// @description initialize effects functions

/**********************************
			Screen Fade
***********************************/
tween_struct = { alpha_value: 0 };

start_fade_out = function(_fade_duration = 0.5) {
    TweenFire(tween_struct, EaseLinear, TWEEN_MODE_ONCE, true, 0, _fade_duration, "alpha_value", 0, 1);
}


start_fade_in = function(_fade_duration = 0.5) {
    TweenFire(tween_struct, EaseLinear, TWEEN_MODE_ONCE, true, 0, _fade_duration, "alpha_value", 1, 0);
}


/**********************************
			Screen Flash
***********************************/
flash_alpha = 0; // Transparency of the flash, 0 is fully transparent
flash_duration = 0; // Duration of the flash effect

start_screen_flash = function(_duration) {
    flash_alpha = 1;
    flash_duration = _duration;
};


/**********************************
			Screen Shake
***********************************/
camera_shake_intensity = 0;
camera_shake_duration = 0;

start_camera_shake = function(_intensity, _duration) {
    camera_shake_intensity = _intensity;
    camera_shake_duration = _duration;
};

// Store the original camera position
original_camera_x = camera_get_view_x(view_camera[0]);
original_camera_y = camera_get_view_y(view_camera[0]);


