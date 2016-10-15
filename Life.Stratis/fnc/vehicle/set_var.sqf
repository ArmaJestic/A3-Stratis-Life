// A_vehicle_fnc_set_var

#include "header.h"


ARGV(0,_vehicle);
ARGV(1,_variable_name);
ARGV(2,_variable_value);
ARGV(3,_variable_type);

[_vehicle, _variable_name, _variable_value, _variable_type, true] call A_vehicle_fnc_set_var_checked;
