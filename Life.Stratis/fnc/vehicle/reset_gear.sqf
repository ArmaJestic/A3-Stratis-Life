// A_vehicle_fnc_reset_gear

#include "../../includes/macro.h"


//player groupChat format["A_vehicle_fnc_reset_gear %1", _this];
ARGV(0,_vehicle);
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
