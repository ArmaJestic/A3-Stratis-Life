// A_object_fnc_create_attach_ref

#include "..\..\includes\macro.h"


private["_object"];
_object = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
_object setPos [0,0,0];
[_object, [0,0,0]] call A_object_fnc_set_heading;
_object
