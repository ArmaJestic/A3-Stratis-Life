// A_vehicle_fnc_init_handler

#include "header.h"


params[["_vehicle",objNull,[objNull]]];
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {};

clearWeaponCargo _vehicle;
clearMagazineCargo _vehicle;
_vehicle lock true;