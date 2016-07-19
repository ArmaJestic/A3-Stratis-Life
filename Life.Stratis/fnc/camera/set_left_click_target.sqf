// A_camera_fnc_set_left_click_target

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


camera_unit groupChat format["A_camera_fnc_set_left_click_target %1", _this];
ARGV(0,_player);
ARGV(1,_target);

[_player, "camera_left_click_target", _target] call A_object_fnc_setVariable;
[[_target, _player], "A_object_fnc_set_owner", true, false] call BIS_fnc_MP;
