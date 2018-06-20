/// @desc Move the ghost

// This is the code for a ghost after a move is complete (ie. ghost is not moving)
if ( is_moving == false ) {
	
	if ( mode == MODE.idle ) {
		
		/*
		 * Enemy stops
		 */
		 
		mode_text = "idle";
		desired_dir = DIR.none;
	}
	else
	if ( mode == MODE.stray ) {
	
		/*
		 * Enemy is just walking around (no target)
		 */
		
		mode_text = "stray";
		
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
	if ( mode == MODE.direct ) {
		
		/*
		 * Enemy works directly towards the player, does not look for obstacles
		 */
		
		mode_text = "direct";
		
		// Determine distance to door
		xdist = obj_player.x - x;
		ydist = obj_player.y - y;
		
		// Still searching the door, determine move possibilities, then move
		var free_pos = whats_free( x, y, obj_wall );
			
		// Determine desired horizontal direction
		var desired_hor_dir = DIR.none;
		if ( xdist > 0 ) {
			desired_hor_dir = DIR.east;
		} else if ( xdist < 0 ) {
			desired_hor_dir = DIR.west;
		}
			
		// Determine desired vertical direction
		var desired_ver_dir = DIR.none;
		if ( ydist > 0 ) {
			desired_ver_dir = DIR.south;
		} else if ( ydist < 0 ) {
			desired_ver_dir = DIR.north;
		}
			
		// Prioritize moving direction
		desired_dir = DIR.none;
		if ( free_pos[desired_hor_dir] and free_pos[desired_ver_dir] ) {
			// Both desired directions are available, choose the most distant one
			if ( ( abs( xdist ) >= abs( ydist ) ) ) {
				desired_dir = desired_hor_dir;
			} else {
				desired_dir = desired_ver_dir;
			}
		} else if ( free_pos[desired_hor_dir] ) {
			// Only horizontal movement in desired direction is possible
			desired_dir = desired_hor_dir;
		} else if ( free_pos[desired_ver_dir] ) {
			// Only vertical movement in desired direction is possible
			desired_dir = desired_ver_dir;
		} else {
			// No movement in desired direction is possible
			desired_dir = DIR.none;
		}
		
	}
	else
	if ( mode == MODE.breadth ) {
		
		/*
		 * Enemy is seeking the player
		 */
		
		mode_text = "breadth";

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