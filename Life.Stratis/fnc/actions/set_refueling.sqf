// A_actions_fnc_set_refueling

#include "..\..\includes\macro.h"


private["_vehicle", "_state"];

_vehicle = _this select 0;
_state = _this select 1;

if (UNDEFINED(_vehicle)) exitWith {null};
if (UNDEFINED(_state)) exitWith {null};
if (typeName _state != "BOOL") exitWith {null};

[_vehicle, "refueling", _state] call A_object_fnc_setVariable;
