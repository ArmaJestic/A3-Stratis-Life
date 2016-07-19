// A_gear_fnc_isThrow_class

#include "..\..\includes\macro.h"


ARGV(0,_class);
(([_class] call A_gear_fnc_get_weapon_class_type) == A_gear_var_THROW_CLASS_TYPE)
