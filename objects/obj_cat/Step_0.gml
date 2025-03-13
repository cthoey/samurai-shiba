
// Apply gravity and vertical motion
if (in_slow_motion) {
    y += y_speed; 
	x += x_speed; 
    vspeed += gravity_val; // Apply gravity
	
	// Slow counter-clockwise rotation
    image_angle += rot_speed; // Adjust this value as needed for desired rotation speed

}

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


// Get the collision mask dimensions and position
if(apply_smoke) {

	var mask_left = bbox_left;
	var mask_right = bbox_right;
	var mask_top = bbox_top;
	var mask_bottom = bbox_bottom;

	var attempts = 0;
	var max_attempts = 100; // Maximum number of attempts to find valid points

	// Emit particles around the collision mask area
	for (var i = 0; i < 1; i++) {
	    var valid_point = false;
	    while (!valid_point && attempts < max_attempts)
	    {
	        // Randomize the position within the collision mask
	        var px = random_range(mask_left, mask_right);
	        var py = random_range(mask_top, mask_bottom);

	        part_particles_create(psystem_smoke, px, py, ptype_smoke, 1);
	        valid_point = true;

	        attempts++;
	    }
	}

}

/*
if(apply_green) {
	
	// Coordinates of the character's eyes (adjust as needed)
	
	var mask_left = bbox_left;
	var mask_right = bbox_right;
	var mask_top = bbox_top;
	var mask_bottom = bbox_bottom;

	var attempts = 0;
	var max_attempts = 100; // Maximum number of attempts to find valid points

	// Emit particles around the collision mask area
	for (var i = 0; i < 1; i++) {
	    var valid_point = false;
	    while (!valid_point && attempts < max_attempts)
	    {
	        // Randomize the position within the collision mask
	        var px = random_range(mask_left, mask_right);
	        var py = random_range(mask_top, mask_bottom);
			
			var _eye_1_x = x;
			var _eye_1_y = y - 30;

	        // Check if the point is within the precise collision mask
	        //if (check_collision_with_sprite(x, y))
			//if (place_meeting(px, py, id))
	        //{
	            part_particles_create(psystem_green, _eye_1_x, _eye_1_y, ptype_green, 1);
	            valid_point = true;
	        //}
	        attempts++;
	    }
	}
	
}
*/


