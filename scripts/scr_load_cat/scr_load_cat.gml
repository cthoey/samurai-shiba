
function load_cat_data(_sprite_id, _difficulty_index){

	var _sprite_name = "spr_cat_" + string(_sprite_id) + "_" + string(_difficulty_index);
	var _sprite_index = asset_get_index(_sprite_name);
	
	var _sprite_portrait_name = "spr_portrait_cat_" + string(_sprite_id) + "_" + string(_difficulty_index);
	var _sprite_portrait_index = asset_get_index(_sprite_portrait_name);

	if (_sprite_index != -1) {
		obj_cat.sprite_index = _sprite_index;
		obj_portrait_cat.sprite_index = _sprite_portrait_index;
		
		if(_difficulty_index == 2) {
			obj_cat.set_green_sprite(true);	
		}
		
		if(_difficulty_index == 3) {
			obj_cat.set_smoke_sprite(true);	
		}
		
		
	} else {
		show_debug_message("Sprite not found: " + sprite_name);
	}

}

function load_shiba_data_results(_difficulty_index){

	var _sprite_name = ""

	if(_difficulty_index == -1) {
		_sprite_name = "spr_result_shiba_defeat"
	} else {
		_sprite_name = "spr_result_shiba_" + string(_difficulty_index);	
	}
	
	var _sprite_index = asset_get_index(_sprite_name);

	if (_sprite_index != -1) {
		obj_result_shiba.sprite_index = _sprite_index;
		
		switch(_sprite_name) {
			case "spr_result_shiba_0":
				obj_result_shiba.x = -16;
				obj_result_shiba.y = 32;
			break;
			case "spr_result_shiba_1":
				obj_result_shiba.x = -32;
				obj_result_shiba.y = 0;
			break;
			case "spr_result_shiba_2":
				obj_result_shiba.x = -48;
				obj_result_shiba.y = 0;
			break;
			case "spr_result_shiba_3":
				obj_result_shiba.x = -64;
				obj_result_shiba.y = 16;
			break;
			case "spr_result_shiba_defeat":
				obj_result_shiba.x = -16;
				obj_result_shiba.y = 32;
			break;
		
		}
		
	} else {
		show_debug_message("Sprite not found: " + sprite_name);
	}

}

function load_bg_data(_difficulty_index){

	if(_difficulty_index >= 2) {
		
		//obj_bg_6.image_speed = 2;
		
		var _layer_id_1 = layer_get_id("layer_bg1");
		var _bg_id_1 = layer_background_get_id(_layer_id_1);
		if layer_background_get_sprite(_bg_id_1) != spr_night_bg_1 {
		    layer_background_sprite(_bg_id_1, spr_night_bg_1);
		}
		
		var _layer_id_2 = layer_get_id("layer_bg2");
		var _bg_id_2 = layer_background_get_id(_layer_id_2);
		if layer_background_get_sprite(_bg_id_2) != spr_night_bg_2 {
		    layer_background_sprite(_bg_id_2, spr_night_bg_2);
		}
	
		var _layer_id_3 = layer_get_id("layer_bg3");
		var _bg_id_3 = layer_background_get_id(_layer_id_3);
		if layer_background_get_sprite(_bg_id_3) != spr_night_bg_3 {
		    layer_background_sprite(_bg_id_3, spr_night_bg_3);
		}
		
		var _layer_id_4 = layer_get_id("layer_bg4");
		var _bg_id_4 = layer_background_get_id(_layer_id_4);
		if layer_background_get_sprite(_bg_id_4) != spr_night_bg_4 {
		    layer_background_sprite(_bg_id_4, spr_night_bg_4);
		}
	
		var _sprite_index = asset_get_index("spr_night_bg_5a");
		obj_bg_5.sprite_index = _sprite_index;
		
	}
	
}