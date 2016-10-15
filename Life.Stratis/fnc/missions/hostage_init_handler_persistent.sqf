// A_missions_fnc_hostage_init_handler_persistent

#include "..\..\includes\macro.h"


ARGV(0,_unit);
ARGV(1,_unit_name);

if (UNDEFINED(_unit)) exitWith {};
if (UNDEFINED(_unit_name)) exitWith {};
if (typeName _unit != "OBJECT") exitWith {};
if (isNull _unit ) exitWith {};
if (typeName _unit_name != "STRING") exitWith {};

_unit setVehicleVarName _unit_name;
missionNamespace setVariable[_unit_name, _unit];
