// A_player_fnc_get_scalar

#include "header.h"


ARGV(0,_player);
ARGV(1,_variable_name);
ARGV(2,_default);

if (UNDEFINED(_player)) exitWith {_default};
if (UNDEFINED(_variable_name)) exitWith {_default};

private["_variable_value"];
_variable_value = [_player, _variable_name, _default] call A_object_fnc_getVariable;
_variable_value = if (UNDEFINED(_variable_value)) then { 0 } else { _variable_value };
_variable_value = if (typeName _variable_value != "SCALAR") then { 0 } else {_variable_value };
_variable_value
