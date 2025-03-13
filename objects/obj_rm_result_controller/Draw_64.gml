/// @description Insert description here

var _text_x = 480;
var _text_y = 50;

if(is_game_won) {
	draw_sprite_text(_text_x, _text_y, "Congratulations", spr_800_36sz_36x36_cleartype, 1, "center");
	
	_text_y += 29;

	shader_set(sh_f_set_color);
	shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
	draw_sprite_text(_text_x, _text_y, "You are a fast Shiba", spr_800_30sz_30x30_cleartype, 1, "center");
	shader_reset();
	
	_text_y += 33;

	draw_sprite_text(_text_x, _text_y, "Best Reaction Time:", spr_800_24sz_24x24_cleartype, 1, "center");

	_text_y += 20;

	shader_set(sh_f_set_color);
	shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
	draw_sprite_text(_text_x, _text_y, label_best_time_round_val, spr_800_30sz_30x30_cleartype, 1, "center");
	shader_reset();
	
	if(is_new_record_round) {
	
		shader_set(sh_f_set_color);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, text_alpha);
		draw_sprite_text(_text_x + 100, _text_y - 35, "(New Record!)", spr_800_24sz_24x24_cleartype, text_alpha, "center", 45);
		shader_reset();
	
	}

	_text_y += 26;

	draw_sprite_text(_text_x, _text_y, "Total Reaction Time:", spr_800_24sz_24x24_cleartype, 1, "center");

	_text_y += 20;

	shader_set(sh_f_set_color);
	shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
	draw_sprite_text(_text_x, _text_y, label_total_time_val, spr_800_30sz_30x30_cleartype, 1, "center");
	shader_reset();

	if(is_new_record_total) {
	
		shader_set(sh_f_set_color);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, text_alpha);
		draw_sprite_text(_text_x + 100, _text_y - 35, "(New Record!)", spr_800_24sz_24x24_cleartype, text_alpha, "center", 45);
		shader_reset();
	
	}


	_text_y += 0;


	
	draw_sprite_text(_text_x, _text_y, label_round_rank, spr_800_131sz_131x131_cleartype, 1, "center");


/*
	_text_y += 9;


	
	draw_sprite_text(_text_x, _text_y, label_round_rank, spr_800_96sz_96x96_cleartype, 1, "center");
	
	_text_y += 85;
	
	if(current_difficulty_id == 0) {
		
		shader_set(sh_f_set_color);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
		draw_sprite_text(_text_x, _text_y, "EXPERT MODE UNLOCKED", spr_800_24sz_24x24_cleartype, 1, "center");
		shader_reset();
		
	} else if(current_difficulty_id == 1) {
		
		shader_set(sh_f_set_color);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
		draw_sprite_text(_text_x, _text_y, "MASTER MODE UNLOCKED", spr_800_24sz_24x24_cleartype, 1, "center");
		shader_reset();
		
	} else if(current_difficulty_id == 2) {
		
		shader_set(sh_f_set_color);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
		draw_sprite_text(_text_x, _text_y, "NIGHTMARE MODE UNLOCKED", spr_800_24sz_24x24_cleartype, 1, "center");
		shader_reset();
		
	} else if(current_difficulty_id == 3) {
		
		shader_set(sh_f_set_color);
		shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, 1);
		draw_sprite_text(_text_x, _text_y, "Incredible", spr_800_24sz_24x24_cleartype, 1, "center");
		shader_reset();
		
	}
	

*/
	
} else {
	
	_text_y = 140;
	
	//shader_set(sh_f_set_color);
	//shader_set_uniform_f(shader_get_uniform(sh_f_set_color, "targetColor"), 1.0, 0.0, 0.0, text_alpha);
	draw_sprite_text(_text_x, _text_y, "Defeat", spr_800_36sz_36x36_cleartype, 1, "center");
	//shader_reset();
	
	//_text_y += 27;

}











