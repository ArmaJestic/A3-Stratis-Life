// A_flag_pole_fnc_init_handler_persistent

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_name);

if (undefined(_object)) exitWith {};
if (undefined(_name)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (isNull _object) exitWith {};
if (typeName _name != "STRING") exitWith {};

_object setVehicleVarName _name;
_object allowDamage false;
missionNamespace setVariable [_name, _object];
