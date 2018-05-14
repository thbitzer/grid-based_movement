/// @desc Player Movement

// Set movement, as soon as one of the arrow keys is pressed
if ( keyboard_check_pressed( vk_up ) ) {
	keyb_buffer_add( DIR.north );
}
if ( keyboard_check_pressed( vk_down ) ) {
	keyb_buffer_add( DIR.south );
}
if ( keyboard_check_pressed( vk_left ) ) {
	keyb_buffer_add( DIR.west );
}
if ( keyboard_check_pressed( vk_right ) ) {
	keyb_buffer_add( DIR.east );
}

// Reset movement, if the key matching desired_dir is released
if ( keyboard_check_released( vk_up ) ) {
	keyb_buffer_del( DIR.north );
}
if ( keyboard_check_released( vk_down ) ) {
	keyb_buffer_del( DIR.south );
}
if ( keyboard_check_released( vk_left ) ) {
	keyb_buffer_del( DIR.west );
}
if ( keyboard_check_released( vk_right ) ) {
	keyb_buffer_del( DIR.east );
}

if ( is_moving == false ) {
	
	// Ready to move
	if ( keyb_buffer[0] == DIR.north ) {
		is_moving = true;
		to_move = global.grid_size;
		hsp = 0;
		vsp = -grid_speed;
	} else if ( keyb_buffer[0] == DIR.south ) {
		is_moving = true;
		to_move = global.grid_size;
		hsp = 0;
		vsp = grid_speed;
	} else if ( keyb_buffer[0] == DIR.west ) {
		is_moving = true;
		to_move = global.grid_size;
		hsp = -grid_speed;
		vsp = 0;
	} else if ( keyb_buffer[0] == DIR.east ) {
		is_moving = true;
		to_move = global.grid_size;
		hsp = grid_speed;
		vsp = 0;
	}		
} 

// Immediately check if we should move to create smooth movement
if ( is_moving == true ) {
	// Within a move
	if ( to_move > 0 ) {
		x += hsp;
		y += vsp;
		to_move -= grid_speed;
	} 
	
	// Detect end of a move directly, so we do not lose a frame standing still
	if ( to_move <= 0 ) {
		is_moving = false;
	}
}
