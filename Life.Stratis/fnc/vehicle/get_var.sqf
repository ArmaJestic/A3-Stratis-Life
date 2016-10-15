// A_vehicle_fnc_get_var

#include "header.h"


private["_variable_value"];
ARGV(0,_vehicle);
ARGV(1,_variable_name);
ARGV(2,_variable_type);

if (UNDEFINED(_vehicle)) exitWith {null};
if (UNDEFINED(_variable_name)) exitWith {null};
if (UNDEFINED(_variable_type)) exitWith {null};
if ((typeName _variable_name) != "STRING") exitWith {null};
if ((typeName _variable_type) != "STRING") exitWith {null};
_variable_value = [_vehicle, _variable_name] call A_object_fnc_getVariable;
_variable_value = if(UNDEFINED(_variable_value)) then { "" } else { _variable_value };
_variable_value = if ((typeName _variable_value) != _variable_type) then { "" } else { _variable_value };
_variable_value
