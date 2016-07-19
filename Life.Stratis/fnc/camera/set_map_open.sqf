// A_camera_fnc_set_map_open

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_map_open);

[_player, "A_camera_fnc_map_open", _map_open] call A_object_fnc_setVariable;
