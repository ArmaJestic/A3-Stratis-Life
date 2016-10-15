// A_actions_fnc_get_refuel_vehicle

#include "..\..\includes\macro.h"


private["_vehicle"];
_vehicle = [player, "refuel_vehicle"] call A_object_fnc_getVariable;
if (UNDEFINED(_vehicle)) exitWith {null};
_vehicle
