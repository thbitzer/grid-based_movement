/// @desc Print the current move mode

draw_set_colour( c_white );
draw_set_font( fnt_dashboard );
draw_set_halign( fa_center );
draw_set_valign( fa_center );
draw_text( room_width / 2, room_height - global.grid_size / 2, obj_ghost.mode_text + " @ " + string( fps ) + " fps" );
