// A_camera_fnc_set_target_marker

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_set_target_marker %1", _this];
ARGV(0,_player);
ARGV(1,_marker);
[_player, "camera_target_marker", _marker] call A_object_fnc_setVariable;
