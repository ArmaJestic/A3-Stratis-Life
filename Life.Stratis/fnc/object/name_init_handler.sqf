// A_object_fnc_name_init_handler

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_name);

if (undefined(_object)) exitWith {};
if (undefined(_name)) exitWith {};
if (isNull _object) exitWith {};
if (typeName _name != "STRING") exitWith {};

missionNamespace setVariable [_name, _object];
_object setVehicleVarName _name;
