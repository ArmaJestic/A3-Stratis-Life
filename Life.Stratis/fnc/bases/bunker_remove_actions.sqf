// A_bases_fnc_bunker_remove_actions

#include "header.h"


if (count A_bases_var_bunker_actions == 0) exitWith {};
params[["_player",objNull,[objNull]]];
if (!([_player] call A_player_fnc_human)) exitWith {};

{
	_player removeAction _x;
} forEach A_bases_var_bunker_actions;
A_bases_var_bunker_actions = [];