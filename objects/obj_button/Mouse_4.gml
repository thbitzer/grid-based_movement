/// @desc Left mouse button

switch ( button_name ) {
    case "idle":
        obj_ghost.mode = MODE.idle;
        break;
	case "stray":
		obj_ghost.mode = MODE.stray;
}