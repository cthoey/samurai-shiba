
if (_apply_shader) {
    // Set the shader
    shader_set(sh_f_black_silhouette);

    // Draw the player
    draw_self();

    // Reset the shader
    shader_reset();
} else {
	
	draw_self();

}


