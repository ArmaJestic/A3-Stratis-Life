// A_vehicle_fnc_get_gear

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

private["_weapons_cargo", "_magazines_cargo"];
_weapons_cargo = getWeaponCargo _vehicle;
_magazines_cargo = getMagazineCargo  _vehicle;

private["_gear"];
_gear = [];
_gear set [A_vehicle_var_gear_weapons_cargo, _weapons_cargo];
_gear set [A_vehicle_var_gear_magazines_cargo, _magazines_cargo];
_gear
