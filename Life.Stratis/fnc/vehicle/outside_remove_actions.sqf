// A_vehicle_fnc_outside_remove_actions

#include "..\..\includes\macro.h"


if (count A_vehicle_var_outside_actions == 0) exitWith {};
//player groupChat format["A_vehicle_fnc_outside_remove_actions %1", _this];

ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_vehicle_var_outside_actions;
A_vehicle_var_outside_actions = [];
