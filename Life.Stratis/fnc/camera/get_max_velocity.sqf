// A_camera_fnc_get_max_velocity

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_player"];
ARGV(0,_player);

private["_velocity"];
_velocity = [_player, "camera_max_velocity"] call A_object_fnc_getVariable;
_velocity = if (undefined(_velocity)) then {0} else {_velocity};
_velocity
