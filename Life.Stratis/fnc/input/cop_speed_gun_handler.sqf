// A_input_fnc_cop_speed_gun_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if (!INV_shortcuts) exitWith {false};
if (not(isblu)) exitWith {false};
private["_vehicle"];
_vehicle = (vehicle player);
if (not([_vehicle, "speedgun", false] call A_object_fnc_getVariable)) exitWith {};
[] spawn A_speed_gun_fnc_toggle;
true
