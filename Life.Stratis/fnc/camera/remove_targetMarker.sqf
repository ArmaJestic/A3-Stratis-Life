// A_camera_fnc_remove_targetMarker

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


private["_player"];
_player = camera_unit;
private["_target_marker"];
_target_marker = [_player] call A_camera_fnc_get_target_marker;
if (undefined(_target_marker)) exitWith {};
deleteVehicle _target_marker;
