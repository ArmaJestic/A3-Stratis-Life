// A_camera_fnc_set_heading

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


params["_player","_heading"];

private _camera = [_player, "camera"] call A_object_fnc_getVariable;
if UNDEFINED(_camera) exitWith {null};

[_player, _heading] call A_camera_fnc_save_heading;
_heading = [_player] call A_camera_fnc_get_heading;

private _vectors = [_heading] call A_camera_fnc_heading2vectors;
_camera setVectorDirAndUp _vectors;

if UNDEFINED(camera_rabbit) exitWith {};
camera_rabbit attachTo [_camera, [0,0,0]];