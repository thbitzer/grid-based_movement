/// @function keyb_buffer_del(direction)
/// @description Remove dir value from keyb_buffer and fill up.
/// @param {int} direction Direction to remove from keyb_buffer (enum DIR).

var arr_len = array_length_1d( keyb_buffer );
var i = 0;
while ( keyb_buffer[i] != argument0 && i < arr_len ) {
	i++;
}
for ( var j = i+1; j < arr_len; j++; ) {
	keyb_buffer[i] = keyb_buffer[j];
	i++;
}
keyb_buffer[arr_len-1] = DIR.none;
