// A_actions_fnc_set_refuel_action

#include "..\..\includes\macro.h"


private["_action"];
_vehicle = _this select 0;
_action = _this select 1;

if (undefined(_vehicle)) exitWith {null};
if (undefined(_action)) exitWith {null};
if (typeName _action != "SCALAR") exitWith {null};

[_vehicle, "refuel_action", _action] call A_object_fnc_setVariable;
[player, "refuel_vehicle", _vehicle] call A_object_fnc_setVariable;
