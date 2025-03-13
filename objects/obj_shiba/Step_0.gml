/// @description Insert description here

/**********************************
			Char Shake
***********************************/
if (shake_duration > 1) {
    // Apply shake effect
    var _shake_x = random_range(-shake_intensity, shake_intensity);
    var _shake_y = random_range(-shake_intensity, shake_intensity);
	x = original_x + _shake_x;
	y =  original_y + _shake_y;

    // Decrease duration
    shake_duration--;
} else if(shake_duration == 1) {
    // Reset camera position when shaking is over
    x = original_x
	y = original_y;
	shake_duration = 0;
}
