/// @desc Remove wall element

// Do not place new walls on the edge of the screen
if ( mouse_x >= global.grid_size and mouse_x < room_width - global.grid_size and 
     mouse_y >= global.grid_size and mouse_y < room_height - 2 * global.grid_size ) {
	
	// Calculate grid position from mouse pointer
	var instance_x = mouse_x - ( mouse_x mod global.grid_size );
	var instance_y = mouse_y - ( mouse_y mod global.grid_size );
	
	// Place new wall instance if grid position is empty
	if ( position_meeting( instance_x + global.grid_size / 2, instance_y + global.grid_size / 2, obj_wall ) ) {
		var inst_id = instance_nearest( instance_x, instance_y, obj_wall );
		instance_destroy( inst_id );
	}
}

