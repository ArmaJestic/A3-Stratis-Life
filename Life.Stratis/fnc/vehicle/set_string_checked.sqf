// A_vehicle_fnc_set_string_checked

#include "..\..\includes\macro.h"


ARGV(3,_checked);
_this set [3, "STRING"];
_this set [4, _checked];
_this call A_vehicle_fnc_set_var_checked;
