// A_drag_fnc_put_vehicle_active

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_object);

private["_vehicle"];
_vehicle = cursorTarget;
if ((isNull _vehicle) || {not(_vehicle isKindOf "LandVehicle")}) exitWith {false};

if ((isPlayer _object) && {(locked _vehicle < 2) && {([_vehicle] call A_vehicle_fnc_empty_cargo_slots) > 0}}) exitWith {true};

	
false
