// A_player_fnc_set_reason

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_reason);

if (undefined(_player)) exitWith {null};
if (undefined(_reason)) exitWith {null};

if (typeName _reason != "ARRAY") exitWith {null};

private["_reason_variable_name", "_reason_variable"];
_reason_variable_name = format["warrants"];

[_player, _reason_variable_name, _reason, true] call A_object_fnc_setVariable;
[_player, _reason_variable_name, _reason] call A_stats_fnc_player_save;
