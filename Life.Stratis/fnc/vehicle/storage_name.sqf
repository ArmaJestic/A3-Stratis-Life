// A_vehicle_fnc_storage_name

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {""};
private["_vehicle_name"];
_vehicle_name = vehicleVarName _vehicle;
(format["%1_storage", _vehicle_name])
