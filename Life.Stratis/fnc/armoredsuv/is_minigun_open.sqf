// A_armoredsuv_fnc_is_minigun_open

#include "../../includes/macro.h"


ARGV(0,_vehicle);
_is_minigun_open = [_vehicle, "minigun_open"] call A_object_fnc_getVariable;
if (undefined(_is_minigun_open)) exitWith { false };
if (typeName _is_minigun_open != "BOOL") exitWith { false };
_is_minigun_open
