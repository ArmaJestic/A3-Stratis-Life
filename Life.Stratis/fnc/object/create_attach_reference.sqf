// A_object_fnc_create_attach_reference

#include "..\..\includes\macro.h"


object_attach_reference = "Sign_Sphere10cm_F" createVehicle[0,0,0];
object_attach_reference setPosASL [0,0,0];

private _heading = [0,0,0];
[object_attach_reference, _heading] call A_object_fnc_set_heading;
[object_attach_reference, "heading", _heading] call A_object_fnc_setVariable;

//object_attach_reference setVehicleVarName "object_attach_reference";
[[object_attach_reference,"object_attach_reference"],"setVehicleVarName",object_attach_reference,true] call A_jip_fnc_register;