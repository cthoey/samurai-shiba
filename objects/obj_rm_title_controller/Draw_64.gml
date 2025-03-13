/// @description display app info

draw_set_font(fnt_press_start_6);
draw_set_color(c_white);

var _padding = 4;

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_text(_padding, display_get_gui_height() - _padding, "v" + trim_version_number(GM_version));

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(display_get_gui_width() - _padding, display_get_gui_height() - _padding, "(c) 2024 choey");

