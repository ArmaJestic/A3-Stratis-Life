// A_towing_fnc_towed_remove_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (count towed_actions == 0) exitWith {};
private["_player"];
ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach towed_actions;
towed_actions = [];
