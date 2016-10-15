// A_vehicle_fnc_set_array_checked

#include "header.h"


private["_checked"];
ARGV(3,_checked);
_this set [3, "ARRAY"];
_this set [4, _checked];
_this call A_vehicle_fnc_set_var_checked;
