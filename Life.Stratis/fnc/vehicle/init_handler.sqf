// A_vehicle_fnc_init_handler

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {};

clearWeaponCargo _vehicle;
clearMagazineCargo _vehicle;
_vehicle lock true;
