// A_camera_fnc_get_current_target

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


private["_player"];
ARGV(0,_player);
([_player, "camera_current_target"] call A_object_fnc_getVariable)
