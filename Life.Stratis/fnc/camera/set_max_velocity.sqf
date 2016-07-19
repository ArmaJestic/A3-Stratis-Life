// A_camera_fnc_set_max_velocity

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_velocity);
[_player, "camera_max_velocity", _velocity] call A_object_fnc_setVariable;
