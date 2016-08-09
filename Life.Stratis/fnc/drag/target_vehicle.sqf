// A_drag_fnc_target_vehicle

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_vehicle"];
_vehicle = nearCursorTarget;
if ((isNull _vehicle) || {!(_vehicle isKindOf "LandVehicle")}) exitWith {null};
_vehicle
