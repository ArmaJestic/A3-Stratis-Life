// A_vehicle_fnc_set_var_checked

#include "../../includes/macro.h"


ARGV(0,_vehicle);
ARGV(1,_variable_name);
ARGV(2,_variable_value);
ARGV(3,_variable_type);
ARGV(4,_checked);


if (undefined(_vehicle)) exitWith {null};
if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
if (undefined(_variable_type)) exitWith {null};
if (undefined(_checked)) exitWith {null};

if (typeName _variable_name != "STRING") exitWith {null};
if (typeName _variable_type != "STRING") exitWith {null};
if (typeName _variable_value != _variable_type) exitWith {null};
if (typeName _checked != "BOOL") exitWith {null};

private["_current_value"];
_current_value = [_vehicle, _variable_name, _variable_type] call A_vehicle_fnc_get_var;
if(_checked && (str(_current_value) == str(_variable_value))) exitWith {null};

[_vehicle, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
[_vehicle, _variable_name, _variable_value] call A_stats_fnc_vehicle_save;
