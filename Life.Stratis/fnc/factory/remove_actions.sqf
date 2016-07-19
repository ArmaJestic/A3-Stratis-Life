// A_factory_fnc_remove_actions

#include "../../includes/macro.h"
#include "../../includes/constants.h"


if (count A_factory_var_actions == 0) exitWith {null};
private["_player"];
ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_factory_var_actions;
A_factory_var_actions = [];
