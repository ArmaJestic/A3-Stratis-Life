// A_stats_fnc_get_variables_list

#include "header.h"


params[["_player",null,[objNull]]];

if (UNDEFINED(_player)) exitWith {null};

private _variables_list = [_player, VAR_STATS_LIST] call A_object_fnc_getVariable;
_variables_list = if (UNDEFINED(_variables_list)) then {[]} else {_variables_list};
_variables_list = if (typeName _variables_list != "ARRAY") then {[]} else {_variables_list};
_variables_list	