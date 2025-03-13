
var _timing_secs = 0.4;

TweenFire(obj_bar_top, EaseInOutSine, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, 
	"image_alpha", 1, 0
);

TweenFire(obj_bar_bottom, EaseInOutSine, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, 
	"image_alpha", 1, 0
);

TweenFire(obj_portrait_shiba, EaseInOutSine, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, 
	"image_alpha", 1, 0
);

TweenFire(obj_portrait_cat, EaseInOutSine, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, 
	"image_alpha", 1, 0
);

tween_out_overlay = TweenFire(obj_overlay_black, EaseInOutSine, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, 
	"image_alpha", 0.6, 0
);
