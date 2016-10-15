// A_factory_fnc_remove_actions

#include "header.h"


if (count A_factory_var_actions == 0) exitWith {null};
params["_player"];
if (!([_player] call A_player_fnc_human)) exitWith {null};

{
	private _action_id = _x;
	_player removeAction _action_id;
} forEach A_factory_var_actions;
A_factory_var_actions = [];