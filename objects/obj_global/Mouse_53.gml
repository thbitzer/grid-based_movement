/// @desc Set a new wall element

// Do not place new walls on the edge of the screen
if ( mouse_x >= global.grid_size and mouse_x < room_width - global.grid_size and 
     mouse_y >= global.grid_size and mouse_y < room_height - 2 * global.grid_size ) {
	
	// Calculate grid position from mouse pointer
	var instance_x = mouse_x - ( mouse_x mod global.grid_size );
	var instance_y = mouse_y - ( mouse_y mod global.grid_size );
	
	// Place new wall instance if grid position is empty
	if ( collision_rectangle( instance_x, instance_y, instance_x + global.grid_size - 1, instance_y + global.grid_size - 1, all, false, true) == noone ) {
		instance_create_layer( instance_x, instance_y, "Walls", obj_wall );
	}
}