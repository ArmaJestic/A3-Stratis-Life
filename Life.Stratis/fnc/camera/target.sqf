// A_camera_fnc_target

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


private["_objects"];
_objects = nearestObjects [(screenToWorld [(safezoneX + 0.5 * safezoneW),(safezoneY + 0.5 * safezoneH)]), ["LandVehicle", "Man"], 2];
if (count _objects == 0) exitWith {null};
(_objects select 0)
