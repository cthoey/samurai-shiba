
// Original game resolution
var _original_width = 640;
var _original_height = 360;

// Target display resolution
var _target_width = display_get_width();
var _target_height = display_get_height();

// TEST MODE
//var _target_width = 1920;
//var _target_height = 1080;

// Calculate scaling factors
var _scale_width = _target_width / _original_width;
var _scale_height = _target_height / _original_height;

// Use the smaller scaling factor to maintain aspect ratio
var _scale_factor = min(_scale_width, _scale_height);

// Calculate the new width and height based on the aspect ratio
var _new_width = _original_width * _scale_factor;
var _new_height = _original_height * _scale_factor;

surface_resize(application_surface, _new_width, _new_height);
display_set_gui_size(_original_width, _original_height);
