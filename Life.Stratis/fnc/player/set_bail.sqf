// A_player_fnc_set_bail

#include "header.h"


ARGV(0,_player);
ARGV(1,_bail);

if (UNDEFINED(_player)) exitWith {null};
    if (UNDEFINED(_bail)) exitWith {null};

if (typeName _bail != "SCALAR") exitWith {null};
_bail = if (_bail < 0) then {0} else {_bail};
_bail = round(_bail);

private["_bail_variable_name"];
_bail_variable_name = format["bail"];

[_player, _bail_variable_name, _bail, true] call A_object_fnc_setVariable;
[_player, _bail_variable_name, _bail] call A_stats_fnc_player_save;
