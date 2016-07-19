// A_camera_fnc_get_target_marker

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_player"];
ARGV(0,_player);
([_player, "camera_target_marker"] call A_object_fnc_getVariable)
