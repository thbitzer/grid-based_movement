/// @function whats_free(x,y,obj[,obj])
/// @description Determine free positions
/// @param {real} x x position
/// @param {real} y y position
/// @param {object} obj Object obstacle

var xpos = argument[0];
var ypos = argument[1];

// We need to use 5 directions here, as DIR.none (index 0) counts as well
var isfree = [ false, true, true, true, true ];

// DIR.north
for ( i=2; i<argument_count; i++ ) {
	if ( place_meeting( xpos, ypos-global.grid_size, argument[i] ) ) {
		isfree[DIR.north] = false;
	}
}

// DIR.east
for ( i=2; i<argument_count; i++ ) {
	if ( place_meeting( xpos+global.grid_size, ypos, argument[i] ) ) {
		isfree[DIR.east] = false;
	}
}

// DIR.south
for ( i=2; i<argument_count; i++ ) {
	if ( place_meeting( xpos, ypos+global.grid_size, argument[i] ) ) {
		isfree[DIR.south] = false;
	}
}

// DIR.west
for ( i=2; i<argument_count; i++ ) {
	if ( place_meeting( xpos-global.grid_size, ypos, argument[i] ) ) {
		isfree[DIR.west] = false;
	}
}

return isfree;