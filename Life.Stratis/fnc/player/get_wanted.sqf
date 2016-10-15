// A_player_fnc_get_wanted

#include "header.h"


ARGV(0,_player);

if (UNDEFINED(_player)) exitWith {false};

private["_wanted_variable_name"];
_wanted_variable_name = format["wanted", _player];

private["_wanted_variable"];
_wanted_variable = [_player, _wanted_variable_name] call A_object_fnc_getVariable;
_wanted_variable = if (UNDEFINED(_wanted_variable)) then {false} else {_wanted_variable};
_wanted_variable = if (typeName _wanted_variable != "BOOL") then {false} else {_wanted_variable};
_wanted_variable
