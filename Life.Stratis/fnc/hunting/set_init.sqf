// A_hunting_fnc_set_init

#include "header.h"


player grouPChat format["A_hunting_fnc_set_init %1", _this];
ARGV(0,_unit);
ARGV(1,_name);
if (UNDEFINED(_unit)) exitWith {null};
if (typeName _unit != "OBJECT") exitWith {null};
if (isNull _unit) exitWith {null};
if (UNDEFINED(_name)) exitWith {null};
if (typeName _name != "STRING") exitWith {null};

_name = [_name] call A_hunting_fnc_generate_name;

missionNamespace setVariable[_name, _unit];
_unit setVehicleVarname _name;
