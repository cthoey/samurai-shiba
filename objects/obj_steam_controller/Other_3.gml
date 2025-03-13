/// @description Insert description here

/*

This function is required to be called in order for the Steamworks extension to work. 
We recommend you place this function in the Game End Event of a controller object. 
You need to check if this is not a game_restart.

*/

// https://github.com/YoYoGames/GMEXT-Steamworks/wiki/management#steam_shutdown
steam_shutdown();

// DO NOT CALL game_restart(); DO THIS INSTEAD
//if (global.is_game_restarting == false) {
//    steam_shutdown();
//}
//global.is_game_restarting = false;