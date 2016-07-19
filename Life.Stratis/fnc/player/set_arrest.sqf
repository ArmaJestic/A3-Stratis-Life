// A_player_fnc_set_arrest

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_arrest);

if (undefined(_player)) exitWith {null};
if (undefined(_arrest)) exitWith {null};

if (typeName _arrest != "BOOL") exitWith {null};

private["_arrest_variable_name"];
_arrest_variable_name = format["arrest"];

[_player, _arrest_variable_name, _arrest, true] call A_object_fnc_setVariable;
[_player, _arrest_variable_name, _arrest] call A_stats_fnc_player_save;
