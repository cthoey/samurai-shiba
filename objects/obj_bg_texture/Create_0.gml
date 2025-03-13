scroll_x = 0;
scroll_y = 0;
speed_x = -20; // Negative for left, positive for right
speed_y = -20; // Positive for down, negative for up

tween_struct = { alpha_value: 1 };
start_fade_out = function(_fade_duration = 0.5) {
    TweenFire(tween_struct, EaseLinear, TWEEN_MODE_ONCE, true, 0, _fade_duration, "alpha_value", 1, 0);
}

