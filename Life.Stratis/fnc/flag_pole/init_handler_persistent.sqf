// A_flag_pole_fnc_init_handler_persistent

#include "header.h"


ARGV(0,_object);
ARGV(1,_name);

if (UNDEFINED(_object)) exitWith {};
if (UNDEFINED(_name)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (isNull _object) exitWith {};
if (typeName _name != "STRING") exitWith {};

_object setVehicleVarName _name;
_object allowDamage false;
missionNamespace setVariable[_name, _object];
