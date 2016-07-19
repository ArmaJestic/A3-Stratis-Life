// A_camera_fnc_get_map_open

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);

private["_map_open"];
_map_open = [_player, "A_camera_fnc_map_open"] call A_object_fnc_getVariable;
_map_open = if (undefined(_map_open)) then {false} else {_map_open};
_map_open
