// A_drag_fnc_put_vehicle_active

#include "header.h"


params["_player","_object"];

private _vehicle = cursorTarget;
if ((isNull _vehicle) || {!(_vehicle isKindOf "LandVehicle")}) exitWith {false};
if ((isPlayer _object) && {(locked _vehicle < 2) && {([_vehicle] call A_vehicle_fnc_empty_cargo_slots) > 0}}) exitWith {true};

false