/// @description Insert description here

draw_set_font(fnt_press_start_6);
draw_set_color(c_white);
var _sprite_name = sprite_get_name(sprite_index);
//draw_text(x - 80, y - 80, "(" + string(x) + "," + string(y) + ") - "+_sprite_name);

if (_apply_shader) {
    // Set the shader
    shader_set(sh_f_black_silhouette);

    // Draw the player
    draw_self();

    // Reset the shader
    shader_reset();
	
} else {
	
	// Draw the particle system for smokiness
	if(apply_smoke) {
		part_system_drawit(psystem_smoke);
		draw_self();
	
	} else if(apply_green) {	
		//part_system_drawit(psystem_green);
		draw_self();
	
		/*
		// In the Draw event of your object
		var glowColor = c_green; // Set the desired glow color

		// Draw the sprite normally
		draw_self();

		// Apply the glow shader and draw the sprite again for the glow effect
		shader_set(sh_f_set_glow);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_glow, "glowColor"), color_get_red(glowColor) / 255.0, color_get_green(glowColor) / 255.0, color_get_blue(glowColor) / 255.0, 1.0);

		// Draw the sprite for the glow effect
		draw_sprite(sprite_index, image_index, x, y);

		shader_reset(); // Reset the shader after drawing
		*/
	
	} else {
		draw_self();
	}

	// Reset blending mode to normal
	//gpu_set_blendmode(bm_normal);

	
	
}


if(false) {
	
	
// Draw the bounding box
//var bbox_left = bbox_left;
//var bbox_right = bbox_right;
//var bbox_top = bbox_top;
//var bbox_bottom = bbox_bottom;

// Set the draw color to something visible, like red
draw_set_color(c_red);
draw_set_alpha(0.2);

// Draw the bounding box
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);

// Reset the draw color to white (or any default color)
draw_set_color(c_white);	
draw_set_alpha(1);
	
	
}


