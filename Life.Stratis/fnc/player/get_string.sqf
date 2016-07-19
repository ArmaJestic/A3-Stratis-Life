// A_player_fnc_get_string

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_variable_name);

if (undefined(_player)) exitWith {null};
if (undefined(_variable_name)) exitWith {null};

private["_variable_value"];
_variable_value = [_player, _variable_name] call A_object_fnc_getVariable;
_variable_value = if (undefined(_variable_value)) then { "" } else { _variable_value };
_variable_value = if (typeName _variable_value != "STRING") then { "" } else {_variable_value };
_variable_value
