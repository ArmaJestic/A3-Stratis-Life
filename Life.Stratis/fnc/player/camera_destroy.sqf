// A_player_fnc_camera_destroy

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_camera"];
_camera = [_player, "self_camera"] call A_object_fnc_getVariable;
if (undefined(_camera)) exitWith {null};

[_player, "self_camera", null] call A_object_fnc_setVariable;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
