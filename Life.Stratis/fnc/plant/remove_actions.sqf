// A_plant_fnc_remove_actions

#include "header.h"


if (count A_plant_var_actions == 0) exitWith {};

params["_player"];
if (!([_player] call A_player_fnc_human)) exitWith {};

{
	private _action_id = _x;
	_player removeAction _action_id;
} forEach A_plant_var_actions;

A_plant_var_actions = [];
A_plant_var_actions_netid = "";