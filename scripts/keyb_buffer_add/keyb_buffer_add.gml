/// @function keyb_buffer_add(direction)
/// @description Add new direction value to keyb_buffer
/// @param {int} direction Direction to add (enum DIR).

// shift content of keyb_buffer and add new direction in front
for ( var i = array_length_1d( keyb_buffer ) - 1; i > 0; i--; ) {
	keyb_buffer[i] = keyb_buffer[i-1];
}
keyb_buffer[0] = argument0;
