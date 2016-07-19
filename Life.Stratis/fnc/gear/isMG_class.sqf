// A_gear_fnc_isMG_class

#include "../../includes/macro.h"


ARGV(0,_class);
(([_class] call A_gear_fnc_get_weapon_class_type) == A_gear_var_MG_CLASS_TYPE)
