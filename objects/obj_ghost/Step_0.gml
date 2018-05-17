/// @desc Move the ghost

// This is the code for a ghost after a move is complete (ie. ghost is not moving)
if ( is_moving == false ) {
	
	if ( mode == MODE.stray ) {
	
		/*
		 * Enemy is just walking around (no target)
		 */
		 
		var prev_dir = desired_dir;
		if ( prev_dir = DIR.none ) {
			desired_dir = irandom( 4 );
		} else {
			new_dir = random( 1.0 );
		
			if ( new_dir < 0.7 ) {
				desired_dir = prev_dir;
			} else if ( new_dir < 0.825 ) {
				desired_dir = ( prev_dir mod 4 ) + 1; 
			} else if (new_dir < 0.95 ) {
				desired_dir = ( ( 5 - prev_dir ) div 4 ) * 4 + ( prev_dir - 1 );
			} else {
				desired_dir = ( prev_dir + 2 ) - ( prev_dir div 3 ) * 4;
			}
		}
	} // end MODE.stray
	else
	if ( mode == MODE.chase ) {

	} // end MODE.chase
	
	// Ready to move
	if ( desired_dir == DIR.north ) {
		if ( place_free( x, y - global.grid_size ) ) {
			is_moving = true;
			to_move = global.grid_size;
			hsp = 0;
			vsp = -grid_speed;
		}
	} else if ( desired_dir == DIR.south ) {
		if ( place_free( x, y + global.grid_size ) ) {
			is_moving = true;
			to_move = global.grid_size;
			hsp = 0;
			vsp = grid_speed;
		}
	} else if ( desired_dir == DIR.west ) {
		if ( place_free( x - global.grid_size, y ) ) {
			is_moving = true;
			to_move = global.grid_size;
			hsp = -grid_speed;
			vsp = 0;
		}
	} else if ( desired_dir == DIR.east ) {
		if ( place_free( x + global.grid_size, y ) ) {
			is_moving = true;
			to_move = global.grid_size;
			hsp = grid_speed;
			vsp = 0;
		}
	}
} 

// Immediately check if we should move to create smooth movement
if ( is_moving == true ) {
	// Within a move
	if ( to_move > 0 ) {
		if ( ! place_free( x, y ) ) {
			// Turn around
			hsp *= -1;
			vsp *= -1;
			to_move = global.grid_size - to_move;
		}
			
		x += hsp;
		y += vsp;
		to_move -= grid_speed;
	} 
	
	// Detect end of a move directly, so we do not lose a frame standing still
	if ( to_move <= 0 ) {
		is_moving = false;
	}
}