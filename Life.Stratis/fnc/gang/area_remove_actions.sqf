// A_gang_fnc_area_remove_actions

#include "header.h"


if (count A_gang_var_area_actions == 0) exitWith {};
params["_player"];
if (!([_player] call A_player_fnc_human)) exitWith {};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_gang_var_area_actions;
A_gang_var_area_actions = [];
