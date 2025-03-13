/// @description draw effects

if (flash_alpha > 0) {
	
    draw_set_alpha(flash_alpha);
	draw_set_color(c_white);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1); // Reset alpha to default
	
} else {

	draw_set_alpha(tween_struct.alpha_value);
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
	draw_set_alpha(1); // Reset alpha to default	
	
}

