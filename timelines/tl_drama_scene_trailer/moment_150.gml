
audio_play_sound(snd_suspense_hyoushigi, 0, false, 0.4);

var _timing_secs = 0.8;

TweenFire(obj_overlay_black, EaseOutQuad, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, // in seconds
	"image_alpha", 0, 0.6
);

TweenFire(obj_bar_top, EaseOutQuad, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, // in seconds
	"image_alpha", 0, 1
);
	
TweenFire(obj_bar_bottom, EaseOutQuad, TWEEN_MODE_ONCE, true, 0,
	_timing_secs, // in seconds
	"image_alpha", 0, 1
);
	







