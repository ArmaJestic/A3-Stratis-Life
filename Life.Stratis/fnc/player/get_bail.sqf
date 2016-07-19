// A_player_fnc_get_bail

#include "../../includes/macro.h"


ARGV(0,_player);

if (undefined(_player)) exitWith {0};

private["_bail_variable_name"];
_bail_variable_name = format["bail"];

private["_bail_variable"];
_bail_variable = [_player, _bail_variable_name] call A_object_fnc_getVariable;
_bail_variable = if (undefined(_bail_variable)) then { 0 } else { _bail_variable };
_bail_variable = if (typeName _bail_variable != "SCALAR") then { 0 } else {_bail_variable };
_bail_variable
