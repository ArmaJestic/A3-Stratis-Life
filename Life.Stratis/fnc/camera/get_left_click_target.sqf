// A_camera_fnc_get_left_click_target

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);
([_player, "camera_left_click_target", objNull] call A_object_fnc_getVariable)
