// A_camera_fnc_set_current_target

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


//player groupChat format["A_camera_fnc_set_current_target %1", _this];
ARGV(0,_player);
ARGV(1,_target);
[_player, "camera_current_target", _target] call A_object_fnc_setVariable;
