/// @description Insert description here

label_round_rank = "D";

label_best_time_round_val = "";
label_total_time_val = "";

input_detected = false;
fade_timer_source = noone;

current_enemy_id = -1;
is_new_record_round = false;
is_new_record_total = false;

current_difficulty_id = -1;
is_game_won = false;

text_alpha = 1; // Alpha value of the text, starts fully opaque
alpha_direction = 1; // Direction of the fade, 1 for fading in, -1 for fading out
fade_speed = 0.015; // Speed of the fade, adjust as needed for faster or slower fades