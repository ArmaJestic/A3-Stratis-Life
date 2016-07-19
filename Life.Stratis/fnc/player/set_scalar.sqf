// A_player_fnc_set_scalar

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_variable_name);
ARGV(2,_variable_value);

if (undefined(_player)) exitWith {null};
if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};

if (typeName _variable_name != "STRING") exitWith {null};
if (typeName _variable_value != "SCALAR") exitWith {null};

private["_current_value"];
_current_value = [_player, _variable_name] call A_player_fnc_get_scalar;
if (_current_value == _variable_value) exitWith {null};

[_player, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
[_player, _variable_name, _variable_value] call A_stats_fnc_player_save;
