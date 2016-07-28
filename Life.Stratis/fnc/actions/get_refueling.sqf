// A_actions_fnc_get_refueling

#include "..\..\includes\macro.h"


private["_vehicle", "_state"];

_vehicle = _this select 0;
if (undefined(_vehicle)) exitWith {null};

_state = [_vehicle, "refueling"] call A_object_fnc_getVariable;
if (undefined(_state)) exitWith { false };
if (typeName _state != "BOOL") exitWith { false };
_state
