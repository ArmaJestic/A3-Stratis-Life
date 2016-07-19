// A_camera_fnc_draw_helpers

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


if (undefined(camera_unit)) exitWith {};
if (not([camera_unit] call A_camera_fnc_enabled)) exitWith {};
private["_target", "_ltarget"];
_ltarget = [camera_unit] call A_camera_fnc_get_left_click_target;
_target = cursorTarget;

[_ltarget, [1,0,0,1]] call A_camera_fnc_draw_bounding_box;
if (_target != _ltarget) then {
	[_target, [0,0,1,1]] call A_camera_fnc_draw_bounding_box;
};
