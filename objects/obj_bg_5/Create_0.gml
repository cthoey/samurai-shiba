/// @description Insert description here
// You can write your code in this editor

_apply_shader = false;
set_black_sprite = function(_enabled) {
	_apply_shader = _enabled;
}


wind_tween = TweenEasyImage(1, 4, 0.2, 3, EaseOutBounce, TWEEN_MODE_PATROL);

