// A_camera_fnc_save_heading

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_heading);
[_player, "camera_heading", _heading] call A_object_fnc_setVariable;
