// A_vehicle_fnc_outside_add_actions

#include "..\..\includes\macro.h"


if (count A_vehicle_var_outside_actions > 0) exitWith {};
//player groupChat format["A_vehicle_fnc_outside_add_actions %1", _this];
ARGV(0,_player);
ARGV(1,_vehicle);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {};

//Add crew actions
private["_crew"];
_crew = crew _vehicle;
{if (true) then {
	private["_member"];
	_member = _x;
	if (not([_member, "restrained", false] call A_object_fnc_getVariable)) exitWith {};
	player grouPChat format["Adding action for %1",  _member];
	private["_action_id"];
	_action_id = player addaction [format["Pull %1 from vehicle", _member], "action.sqf", [[_player, _vehicle, _member], "A_vehicle_fnc_pull_player"],10,false,false,"",
		format["([%1, %2, %3] call A_vehicle_fnc_pull_player_available)", _player, _vehicle, _member]];
	A_vehicle_var_outside_actions = A_vehicle_var_outside_actions + [_action_id];
	
};} forEach _crew;


//Add unfliping action
_action_id = player addaction ["Unflip this vehicle", "action.sqf", [[_player, _vehicle], "A_interaction_fnc_vehicle_unflip"],10,false,false,"",
	format["([%1] call A_vehicle_fnc_flipped)",_vehicle]];
A_vehicle_var_outside_actions = A_vehicle_var_outside_actions + [_action_id];

//Add impound action
if ([_player] call A_player_fnc_blufor) then {
	_action_id = player addaction ["Vehicle impound", "action.sqf", [[_player, _vehicle], "A_interaction_fnc_impound_vehicle_seize"],10,false,false,"",
		format["([%1, %2] call A_vehicle_fnc_seize_available)", _player, _vehicle]];
	A_vehicle_var_outside_actions = A_vehicle_var_outside_actions + [_action_id];
};

//Add view vehicle information action
_action_id = player addaction ["Vehicle information", "action.sqf", [[_player, _vehicle], "A_vehicle_fnc_interact_vehicle_information"],10,false,false,"",
	format["([%1, %2] call A_vehicle_fnc_seize_available)", _player, _vehicle]];
A_vehicle_var_outside_actions = A_vehicle_var_outside_actions + [_action_id];

//Add view vehicle trunk contents action
_action_id = player addaction ["Vehicle trunk (view)", "action.sqf", [[_player, _vehicle], "A_vehicle_fnc_interact_view_trunk"],10,false,false,"",
	format["([%1, %2] call A_vehicle_fnc_view_trunk_available)", _player, _vehicle]];
A_vehicle_var_outside_actions = A_vehicle_var_outside_actions + [_action_id];

//Add remove illegal items from vehicle action
_action_id = player addaction ["Vehicle trunk (seize)", "action.sqf", [[_player, _vehicle], "A_vehicle_fnc_seize_trunk"],10,false,false,"",
	format["([%1, %2] call A_vehicle_fnc_view_trunk_available)", _player, _vehicle]];
A_vehicle_var_outside_actions = A_vehicle_var_outside_actions + [_action_id];
