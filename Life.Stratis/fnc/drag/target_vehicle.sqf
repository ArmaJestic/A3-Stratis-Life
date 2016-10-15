// A_drag_fnc_target_vehicle

#include "header.h"


private _vehicle = nearCursorTarget;
if ((isNull _vehicle) || {!(_vehicle isKindOf "LandVehicle")}) exitWith {null};
_vehicle