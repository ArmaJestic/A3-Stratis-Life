// A_player_fnc_handle_mpkilled
// triggered when unit is killed

#include "header.h"


diag_log format['A_player_fnc_handle_mpkilled %1: start', _this];

params["_unit","_killer"];

if (isServer) exitwith {
	// delete the body
	[_unit, 3] spawn A_player_fnc_despawn;
	diag_log format['A_player_fnc_handle_mpkilled %1: exit0', _this];
};
if (local _unit) then {
	diag_log format['A_player_fnc_handle_mpkilled %1: unit local', _this];
};
if (str(_unit) != str(player)) exitWith {diag_log format['A_player_fnc_handle_mpkilled %1: exit1', _this];};

private _player = player;

// only save for cops
if ([_player] call A_player_fnc_blufor) then {
	[_player] call A_player_fnc_save_side_gear;
	[_player] call A_player_fnc_save_side_inventory;
};

// retributions stuff
[_killer, _player] call A_retributions_fnc_victim;

if (A_player_var_rejoin_choice_active) exitWith {diag_log format['A_player_fnc_handle_mpkilled %1: exit2', _this];};

[_player] call A_player_fnc_reset_gear;
[_player] call A_player_fnc_drop_inventory;
[_player] spawn A_player_fnc_reset_ui;
[_player] call A_player_fnc_reset_stats;
[_player] call A_player_fnc_dead_camera;
[_player] call A_player_fnc_rejoin_camera;


diag_log format['A_player_fnc_handle_mpkilled %1: end', _this];