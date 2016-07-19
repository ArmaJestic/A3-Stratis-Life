// A_camera_fnc_save_position

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_position);
[_player, "camera_pos", _position] call A_object_fnc_setVariable;
