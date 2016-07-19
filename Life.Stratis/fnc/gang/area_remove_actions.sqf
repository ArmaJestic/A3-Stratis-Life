// A_gang_fnc_area_remove_actions

#include "../../includes/macro.h"


if (count A_gang_var_area_actions == 0) exitWith {null};
ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_gang_var_area_actions;
A_gang_var_area_actions = [];
