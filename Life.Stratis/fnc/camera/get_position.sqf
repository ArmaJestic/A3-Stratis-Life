// A_camera_fnc_get_position

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);

private["_target"];
_target = [_player, "A_camera_fnc_target"] call A_object_fnc_getVariable;

private["_position", "_relative", "_default"];
_relative = [0,-3,3];
_default = if (undefined(_target)) then {_player modelToWorld _relative} else {_relative};

_position = [_player, "camera_pos"] call A_object_fnc_getVariable;
_position = if (undefined(_position)) then {_default} else {_position};
_position
