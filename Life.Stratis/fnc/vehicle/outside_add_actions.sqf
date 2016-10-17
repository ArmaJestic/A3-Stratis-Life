// A_vehicle_fnc_outside_add_actions

#include "header.h"


if (count A_vehicle_var_outside_actions > 0) exitWith {};
params["_player","_vehicle"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {};

private _action_id = null;

//Add crew actions
private _crew = crew _vehicle;
{
	private _member = _x;
	if (!([_member, "restrained", false] call A_object_fnc_getVariable)) exitWith {};
	_action_id = player addAction[format["Pull %1 from vehicle", _member], A_actions_fnc_action, [[_player, _vehicle, _member], "A_vehicle_fnc_pull_player"],10,false,false,"",
		format["([%1, %2, %3] call A_vehicle_fnc_pull_player_available)", _player, _vehicle, _member]];
	A_vehicle_var_outside_actions pushBack _action_id;
} forEach _crew;


//Add unfliping action
_action_id = player addAction["Unflip this vehicle", A_actions_fnc_action, [[_player, _vehicle], "A_interaction_fnc_vehicle_unflip"],10,false,false,"",
	format["([%1] call A_vehicle_fnc_flipped)",_vehicle]];
A_vehicle_var_outside_actions pushBack _action_id;

//Add impound action
if ([_player] call A_player_fnc_blufor) then {
	_action_id = player addAction["Vehicle impound", A_actions_fnc_action, [[_player, _vehicle], "A_interaction_fnc_impound_vehicle_seize"],10,false,false,"",
		format["([%1, %2] call A_vehicle_fnc_seize_available)", _player, _vehicle]];
	A_vehicle_var_outside_actions pushBack _action_id;
};

//Add view vehicle information action
_action_id = player addAction["Vehicle information", A_actions_fnc_action, [[_player, _vehicle], "A_vehicle_fnc_interact_vehicle_information"],10,false,false,"",
	format["([%1, %2] call A_vehicle_fnc_seize_available)", _player, _vehicle]];
A_vehicle_var_outside_actions pushBack _action_id;

//Add view vehicle trunk contents action
_action_id = player addAction["Vehicle trunk (view)", A_actions_fnc_action, [[_player, _vehicle], "A_vehicle_fnc_interact_view_trunk"],10,false,false,"",
	format["([%1, %2] call A_vehicle_fnc_view_trunk_available)", _player, _vehicle]];
A_vehicle_var_outside_actions pushBack _action_id;

//Add remove illegal items from vehicle action
_action_id = player addAction["Vehicle trunk (seize)", A_actions_fnc_action, [[_player, _vehicle], "A_vehicle_fnc_seize_trunk"],10,false,false,"",
	format["([%1, %2] call A_vehicle_fnc_view_trunk_available)", _player, _vehicle]];
A_vehicle_var_outside_actions pushBack _action_id;
