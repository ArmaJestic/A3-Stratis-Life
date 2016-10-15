// A_player_fnc_spawn

#include "header.h"


diag_log format['A_player_fnc_spawn %1: start', _this];


params["_player","_first_time"];

if (!([_player] call A_player_fnc_exists)) exitWith {
	diag_log format['A_player_fnc_spawn %1: exit1', _this]; 
	null
};
if (UNDEFINED(_first_time)) exitWith {
	diag_log format['A_player_fnc_spawn %1: exit2', _this]; 
	null
};
if (typeName _first_time != "BOOL") exitWith {
	diag_log format['A_player_fnc_spawn %1: exit3', _this]; 
	null
};


if (_first_time) then {
	diag_log format['A_player_fnc_spawn %1: first time', _this];
	// temp disabled
//	[_player] call A_player_fnc_intro_text;
}else{
	diag_log format['A_player_fnc_spawn %1: waitUntil alive-%2-%3', _this, _player, player];
	waitUntil {alive _player};
	diag_log format['A_player_fnc_spawn %1: waitUntil alive-%2-%3-passed', _this, _player, player];

	diag_log format['A_player_fnc_spawn %1: not first time', _this];
	
	//only cops get to keep their full gear
	if ([_player] call A_player_fnc_blufor) then {
		[_player] call A_player_fnc_load_side_gear;
	}else{
		[_player] call A_player_fnc_reset_clothes;
		[_player] call A_player_fnc_reset_gear;
	};
};

[_player] call A_object_fnc_attachStorage;
server setVariable[(getPlayerUID _player), _player, true];

[_player] call A_player_fnc_reset_prison;
//call A_retributions_fnc_respawn_retribution;
[_player] call A_player_fnc_init_stats;

//mark the player alive when we are done with the dead camera
[_player, false] call A_player_fnc_set_dead;


diag_log format['A_player_fnc_spawn %1: end', _this];