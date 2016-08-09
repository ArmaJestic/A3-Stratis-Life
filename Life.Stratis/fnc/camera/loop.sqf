// A_camera_fnc_loop

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


if (!(camera_loop_active)) exitWith {};
if (isNil "camera_unit" || {typeName camera_unit != "OBJECT" || {isNull camera_unit}}) exitWith {};


private["_target", "_player"];
_player = camera_unit;
if (!([_player] call A_camera_fnc_enabled)) exitWith {};
_target = [_player] call A_camera_fnc_get_target;
[_player, _target] call A_camera_fnc_set_current_target;	
