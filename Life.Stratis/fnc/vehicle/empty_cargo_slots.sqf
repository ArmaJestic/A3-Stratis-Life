// A_vehicle_fnc_empty_cargo_slots

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {0};
private["_slots"];
_slots = ((_vehicle emptyPositions "Commander") + (_vehicle emptyPositions "Cargo"));
_slots
