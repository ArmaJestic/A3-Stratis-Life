// A_player_fnc_continuity

#include "header.h"

 
if (isServer) exitWith {};

diag_log 'A_player_fnc_continuity: start';


private["_complete"];
_complete = false;
while {!(_complete)} do {
	_complete = ([player] call A_player_fnc_human);
	if (_complete) exitWith {};
};

private["_player"];
_player = player;
[_player] call A_vehicle_fnc_load;
[_player] call A_player_fnc_reset_clothes;
[_player] call A_player_fnc_reset_gear;

server setVariable[(getPlayerUID _player), _player, true];

if ([_player] call A_player_fnc_get_dead) then {
	diag_log 'A_player_fnc_continuity: dead';
	[] call A_player_fnc_rejoin_suicide;
}else{
	diag_log 'A_player_fnc_continuity: alive';
	_player allowDamage false;
	[_player] call A_player_fnc_load_side_gear;
	[_player] call A_player_fnc_load_side_damage;
	
	if (!([_player] call A_player_fnc_load_side_vehicle)) then {
		diag_log 'A_player_fnc_continuity: not in vehicle';
		if (!([_player] call A_player_fnc_load_side_position)) then {
			diag_log 'A_player_fnc_continuity: no position';
		//	[10] spawn A_player_fnc_rejoin_choice;
			[_player] call A_player_fnc_teleport_respawn_position;
		};
	};
	_player allowDamage true;
};

// cutText["","BLACK IN",5];
5 fadeSound 1;
[_player, false] call A_player_fnc_set_dead;

diag_log 'A_player_fnc_continuity: end';