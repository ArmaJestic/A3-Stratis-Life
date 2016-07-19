// A_camera_fnc_get_heading

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);

private["_camera"];
_camera = [_player, "camera"] call A_object_fnc_getVariable;

private["_heading"];
_heading = [_player, "camera_heading"] call A_object_fnc_getVariable;
_heading = if (undefined(_heading)) then {[_player, [0,0,0]] call A_camera_fnc_heading_modelToWorld} else {_heading};
_heading
