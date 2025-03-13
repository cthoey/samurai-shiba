
current_sound_id = snd_500_milliseconds_of_silence;

play_and_fade_in = function(_sound_id, _fade_duration, _target_volume) {
	
	// 1 for full volume
	// duration in millis
	current_sound_id = _sound_id
	var _snd = audio_play_sound(_sound_id, 10, true);
	audio_sound_gain(_snd, 0, 0);
	audio_sound_gain(_snd, _target_volume, _fade_duration);
	
};


stop_sound = function() {
	audio_stop_sound(current_sound_id);
}


audio_play_sound_swoosh = function() {
    // Randomly select and play a sound
    var _sound_index = irandom_range(1, 5);
    var _sound_index2 = irandom_range(1, 5);
    
    var _sound_name = "snd_swoosh_" + string(_sound_index);
    var _sound_asset_index = asset_get_index(_sound_name);

    var _sound_name2 = "snd_swoosh_" + string(_sound_index2);
    var _sound_asset_index2 = asset_get_index(_sound_name2);

    if (_sound_asset_index != -1) {
        var _sound_id = audio_play_sound(_sound_asset_index, 1, false);
        audio_sound_gain(_sound_id, 0, 1); // Play only on the right channel
    } else {
        // Handle error if the sound asset is not found
        show_debug_message("Sound asset not found: " + _sound_name);
    }

    if (_sound_asset_index2 != -1) {
        var _sound_id2 = audio_play_sound(_sound_asset_index2, 1, false);
        audio_sound_gain(_sound_id2, 1, 0); // Play only on the left channel
    } else {
        // Handle error if the sound asset is not found
        show_debug_message("Sound asset not found: " + _sound_name2);
    }
}





