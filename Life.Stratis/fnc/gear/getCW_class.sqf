// A_gear_fnc_getCW_class

#include "header.h"


ARGV(0,_unit);
private ["_current"];
_current = currentWeapon _unit;
([_current] call A_gear_fnc_getClass)
