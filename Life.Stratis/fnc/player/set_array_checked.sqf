// A_player_fnc_set_array_checked

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_variable_name);
ARGV(2,_variable_value);
ARGV(3,_check_change);

if (undefined(_player)) exitWith {null};
if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
if (undefined(_check_change)) exitWith {null};

if (typeName _variable_name != "STRING") exitWith {null};
if (typeName _variable_value != "ARRAY") exitWith {null};
if (typeName _check_change != "BOOL") exitWith {null};

private["_current_value"];

if (_check_change) then {
	_current_value = [_player, _variable_name] call A_player_fnc_get_array;	
	if (str(_current_value) == str(_variable_value)) exitWith {null};
};

[_player, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
[_player, _variable_name, _variable_value] call A_stats_fnc_player_save;
