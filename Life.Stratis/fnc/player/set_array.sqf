// A_player_fnc_set_array

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_variable_name);
ARGV(2,_variable_value);

[_player, _variable_name, _variable_value, true] call A_player_fnc_set_array_checked;
