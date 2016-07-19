// A_camera_fnc_create_setPos_reference

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


camera_setPos_reference = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
camera_setPos_reference setPos [0,0,0];
private["_heading"];
_heading = [0,0,0];
[camera_setPos_reference, _heading] call A_object_fnc_set_heading;
[camera_setPos_reference, "heading", _heading] call A_object_fnc_setVariable;
A_camera_var_export_reference_object = camera_setPos_reference;
