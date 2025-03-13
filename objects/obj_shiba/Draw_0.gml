/// @description Insert description here

draw_set_font(fnt_press_start_6);
draw_set_color(c_white);
//draw_text(x, y - 80, "(" + string(x) + "," + string(y) + ")");

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




