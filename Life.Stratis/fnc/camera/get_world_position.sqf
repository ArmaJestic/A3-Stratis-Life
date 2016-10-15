// A_camera_fnc_get_world_position

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);

private["_pos"];
_pos = [_player] call A_camera_fnc_get_position;

private["_target"];
_target = [_player, "A_camera_fnc_target"] call A_object_fnc_getVariable;
_pos = if (UNDEFINED(_target)) then { _pos } else { _target modelToWorld _pos };
_pos
