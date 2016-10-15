// A_vehicle_fnc_storage_name

#include "header.h"


ARGV(0,_vehicle);
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {""};
private["_vehicle_name"];
_vehicle_name = vehicleVarName _vehicle;
(format["%1_storage", _vehicle_name])
