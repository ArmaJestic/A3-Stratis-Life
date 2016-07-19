// A_vehicle_fnc_get_var

#include "../../includes/macro.h"


private["_variable_value"];
ARGV(0,_vehicle);
ARGV(1,_variable_name);
ARGV(2,_variable_type);

if (undefined(_vehicle)) exitWith {null};
if (undefined(_variable_name)) exitWith {null};
if (undefined(_variable_type)) exitWith {null};
if ((typeName _variable_name) != "STRING") exitWith {null};
if ((typeName _variable_type) != "STRING") exitWith {null};
_variable_value = [_vehicle, _variable_name] call A_object_fnc_getVariable;
_variable_value = if(undefined(_variable_value)) then { "" } else { _variable_value };
_variable_value = if ((typeName _variable_value) != _variable_type) then { "" } else { _variable_value };
_variable_value
