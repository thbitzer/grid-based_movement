/// @desc Insert button text

draw_self();
draw_set_colour( c_white );
draw_set_font( fnt_dashboard );
draw_set_halign( fa_center );
draw_set_valign( fa_center );
draw_text( x + sprite_width / 2, y + sprite_height / 2, button_name );
