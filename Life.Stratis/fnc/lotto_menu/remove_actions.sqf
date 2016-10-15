// A_lotto_menu_fnc_remove_actions

#include "header.h"


if (count A_lotto_menu_var_actions == 0) exitWith {};
private["_player"];
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_lotto_menu_var_actions;
A_lotto_menu_var_actions = [];
