// A_actions_fnc_get_refuel_action

#include "..\..\includes\macro.h"


private["_vehicle"];
_vehicle = call A_actions_fnc_get_refuel_vehicle;
if (UNDEFINED(_vehicle)) exitWith {-1};
_refuel_action = [_vehicle, "refuel_action"] call A_object_fnc_getVariable;;
_refuel_action = if (UNDEFINED(_refuel_action)) then { -1 } else { _refuel_action };
_refuel_action
