if(not prevent_exiting_to_menu) {
	obj_room_controller.goto_room(rm_menu);	
	instance_destroy();
	prevent_exiting_to_menu = true;
}