// A_client_fnc_check_logics

#include "..\..\includes\macro.h"


private _alive = alive player;
if (!_alive) exitWith {null};
{
	private["_entry", "_cdistance", "_logic", "_warn_distance", "_teleport_distance"];
	_entry = _x;
	
	_warn_distance = _entry select A_client_var_logics_check_warn_distance;
	_teleport_distance = _entry select A_client_var_logics_check_teleport_distance;
	_logic = _entry select A_client_var_logics_check_object;
	_distance = player distance _logic;
	
	
	if (_distance <= _teleport_distance) exitWith {
		[player] call A_player_fnc_teleport_spawn;
		player groupChat format["You have been teleported out of a restricted zone"];
	};
	
	if (_distance < _warn_distance) exitWith {
		cutText["You are entering a restricted zone. Turn around!","PLAIN"]
	};
} forEach A_client_var_logics_checks;