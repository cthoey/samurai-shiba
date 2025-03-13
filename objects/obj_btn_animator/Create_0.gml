/*
	Button
*/
is_hovered_over = false;
locked = true;

/*
	Fade stuff
*/
tween_struct = { alpha_value: 1 };
start_fade_out = function(_fade_duration = 0.5) {
    TweenFire(tween_struct, EaseLinear, TWEEN_MODE_ONCE, true, 0, _fade_duration, "alpha_value", 1, 0);
}