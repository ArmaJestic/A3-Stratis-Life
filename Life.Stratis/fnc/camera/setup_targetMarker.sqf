// A_camera_fnc_setup_targetMarker

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_player"];
_player = camera_unit;
private["_target_marker"];
_target_marker = "Sign_Sphere10cm_F" createVehicleLocal  (getPos _player); 
[_player, _target_marker] call A_camera_fnc_set_target_marker;
