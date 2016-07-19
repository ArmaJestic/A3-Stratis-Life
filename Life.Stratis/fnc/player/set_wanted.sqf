// A_player_fnc_set_wanted

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_wanted);

if (undefined(_player)) exitWith {null};
if (undefined(_wanted)) exitWith {null};

if (typeName _wanted != "BOOL") exitWith {null};

private["_wanted_variable_name"];
_wanted_variable_name = format["wanted"];

[_player, _wanted_variable_name, _wanted, true] call A_object_fnc_setVariable;
[_player, _wanted_variable_name, _wanted] call A_stats_fnc_player_save;
