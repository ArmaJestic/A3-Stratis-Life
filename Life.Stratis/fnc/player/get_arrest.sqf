// A_player_fnc_get_arrest

#include "../../includes/macro.h"


ARGV(0,_player);

if (undefined(_player)) exitWith {null};

private["_arrest_variable_name"];
_arrest_variable_name = format["arrest", _player];

private["_arrest_variable"];
_arrest_variable = [_player, _arrest_variable_name] call A_object_fnc_getVariable;
_arrest_variable = if (undefined(_arrest_variable)) then {false} else {_arrest_variable};
_arrest_variable = if (typeName _arrest_variable != "BOOL") then {false} else {_arrest_variable};
_arrest_variable
