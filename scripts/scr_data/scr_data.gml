
global.ranking_data = ds_map_create();

var _normal_ranks = ds_map_create(); // 4.368s total
ds_map_add(_normal_ranks, 2.397, "S+");	
ds_map_add(_normal_ranks, 2.983, "S");	
ds_map_add(_normal_ranks, 3.513, "A");
ds_map_add(_normal_ranks, 3.937, "B");
ds_map_add(_normal_ranks, 4.263, "C");

var _expert_ranks = ds_map_create(); // 2.976s total
ds_map_add(_expert_ranks, 1.648, "S+");	
ds_map_add(_expert_ranks, 2.135, "S");	
ds_map_add(_expert_ranks, 2.498, "A");
ds_map_add(_expert_ranks, 2.731, "B");
ds_map_add(_expert_ranks, 2.884, "C");

var _master_ranks = ds_map_create(); // 1.878s total
ds_map_add(_master_ranks, 0.967, "S+");	
ds_map_add(_master_ranks, 1.216, "S");	
ds_map_add(_master_ranks, 1.439, "A");
ds_map_add(_master_ranks, 1.615, "B");
ds_map_add(_master_ranks, 1.781, "C");

var _nightmare_ranks = ds_map_create(); // 1.366s total
ds_map_add(_nightmare_ranks, 0.663, "S+");	
ds_map_add(_nightmare_ranks, 0.878, "S");	
ds_map_add(_nightmare_ranks, 1.037, "A");
ds_map_add(_nightmare_ranks, 1.175, "B");
ds_map_add(_nightmare_ranks, 1.276, "C");

ds_map_add(global.ranking_data, GAME_DIFFICULTY.NORMAL, _normal_ranks);
ds_map_add(global.ranking_data, GAME_DIFFICULTY.EXPERT, _expert_ranks);
ds_map_add(global.ranking_data, GAME_DIFFICULTY.MASTER, _master_ranks);
ds_map_add(global.ranking_data, GAME_DIFFICULTY.NIGHTMARE, _nightmare_ranks);

/*

	These timings have been adjusted with the following goals:
	- 40-50% of people should be able to complete Normal
	- 10-15% can clear Expert
	- 5-10% can clear Master
	- 10% or fewer for Nightmare
	
	NOTE: in Kirby's Return to Dream Land Deluxe, if the player keeps trying, the enemies gradually 
			get slower, known as the mercy mechanic.  Does this belong in this game?

*/

global.difficulty_data = ds_map_create();

var _normal_settings = ds_map_create();
ds_map_add(_normal_settings, GAME_BOSSES.WADDLE, 1.533);
ds_map_add(_normal_settings, GAME_BOSSES.WHEELIE, 1.133);
ds_map_add(_normal_settings, GAME_BOSSES.CHEF, 0.753);
ds_map_add(_normal_settings, GAME_BOSSES.DEDEDE, 0.536);
ds_map_add(_normal_settings, GAME_BOSSES.META, 0.413);

var _expert_settings = ds_map_create();
ds_map_add(_expert_settings, GAME_BOSSES.WADDLE, 1.032);
ds_map_add(_expert_settings, GAME_BOSSES.WHEELIE, 0.713);
ds_map_add(_expert_settings, GAME_BOSSES.CHEF, 0.522);
ds_map_add(_expert_settings, GAME_BOSSES.DEDEDE, 0.403);
ds_map_add(_expert_settings, GAME_BOSSES.META, 0.306);

var _master_settings = ds_map_create();
ds_map_add(_master_settings, GAME_BOSSES.WADDLE, 0.563);
ds_map_add(_master_settings, GAME_BOSSES.WHEELIE, 0.446);
ds_map_add(_master_settings, GAME_BOSSES.CHEF, 0.362);
ds_map_add(_master_settings, GAME_BOSSES.DEDEDE, 0.285);
ds_map_add(_master_settings, GAME_BOSSES.META, 0.222);

var _nightmare_settings = ds_map_create();
ds_map_add(_nightmare_settings, GAME_BOSSES.WADDLE, 0.413); 
ds_map_add(_nightmare_settings, GAME_BOSSES.WHEELIE, 0.324); 
ds_map_add(_nightmare_settings, GAME_BOSSES.CHEF, 0.263); 
ds_map_add(_nightmare_settings, GAME_BOSSES.DEDEDE, 0.213);
ds_map_add(_nightmare_settings, GAME_BOSSES.META, 0.153); 

ds_map_add(global.difficulty_data, GAME_DIFFICULTY.NORMAL, _normal_settings);
ds_map_add(global.difficulty_data, GAME_DIFFICULTY.EXPERT, _expert_settings);
ds_map_add(global.difficulty_data, GAME_DIFFICULTY.MASTER, _master_settings);
ds_map_add(global.difficulty_data, GAME_DIFFICULTY.NIGHTMARE, _nightmare_settings);
