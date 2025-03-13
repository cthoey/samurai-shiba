
var _timing_secs = 1;

// EaseInOutCirc
// EaseOutExpo

TweenFire(obj_portrait_shiba, EaseOutExpo, TWEEN_MODE_ONCE, true, 0, // p1 portrait origin top-left
	_timing_secs,
	"x>", DRAMA_SHIBA_START_X + DRAMA_PADDING_2
);

TweenFire(obj_portrait_cat, EaseOutExpo, TWEEN_MODE_ONCE, true, 0,
	_timing_secs,
	"x>", DRAMA_CAT_START_X - DRAMA_PADDING_2
);




