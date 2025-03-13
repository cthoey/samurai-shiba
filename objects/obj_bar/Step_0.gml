/// @description Insert description here

// You can write your code in this editor

// Step event of obj_tiling
//x += 5; // Adjust this value as needed for your game's movement speed

// Wrap the x position if it goes beyond the screen limits
if (x > room_width) {
    x = 0;
} else if (x < 0) {
    x = room_width;
}
