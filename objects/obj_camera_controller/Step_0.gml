/// @description apply effects

/**********************************
			Screen Shake
***********************************/
if (camera_shake_duration > 0) {
    // Apply shake effect
    var _shake_x = random_range(-camera_shake_intensity, camera_shake_intensity);
    var _shake_y = random_range(-camera_shake_intensity, camera_shake_intensity);
    camera_set_view_pos(view_camera[0], original_camera_x + _shake_x, original_camera_y + _shake_y);

    // Decrease duration
    camera_shake_duration--;
} else {
    // Reset camera position when shaking is over
    camera_set_view_pos(view_camera[0], original_camera_x, original_camera_y);
}

/**********************************
			Screen Flash
***********************************/
if (flash_duration > 0) {
    flash_duration--;
    flash_alpha -= (1 / flash_duration); // Adjust this for different fade-out speeds
    flash_alpha = max(0, flash_alpha); // Ensure alpha doesn't go below 0
} else {
    flash_alpha = 0;
}

