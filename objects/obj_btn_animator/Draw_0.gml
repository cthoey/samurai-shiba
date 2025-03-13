if(is_hovered_over && !locked && !obj_rm_menu_controller.has_clicked_button) {

	// draw sprite
	draw_sprite_ext(
	    sprite_index, image_index, 
	    x, y,
	    image_xscale, image_yscale, 0, c_white, 1
	);
	
	shader_reset();

	
} else {

	// Set the shader
	shader_set(sh_f_tint);

	// Example tint color (e.g., a light blue tint)
	//var r = 0.5, g = 0.8, b = 1.0, a = 1.0; // RGBA values normalized from 0 to 1
	
	// Gray
	var _r = 0.3, _g = 0.3, _b = 0.3, _a = 1.0; // RGBA values normalized from 0 to 1
	
	shader_set_uniform_f(shader_get_uniform(sh_f_tint, "tint_color"), _r, _g, _b, _a);

	// Example tint intensity
	var _intensity = 0.3; // Adjust the intensity as needed
	shader_set_uniform_f(shader_get_uniform(sh_f_tint, "tint_intensity"), _intensity);

	draw_sprite_ext(
	    sprite_index, image_index, 
	    x, y,
	    image_xscale, image_yscale, 0, c_white, tween_struct.alpha_value
	);

	shader_reset();

}






