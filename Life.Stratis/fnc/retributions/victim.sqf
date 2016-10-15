// A_retributions_fnc_victim

#include "header.h"


private["_killer", "_victim"];
//player groupChat format["In A_retributions_fnc_victim!, _this = %1", _this];

_killer = _this select 0;
_victim = _this select 1;

if (UNDEFINED(_killer)) exitWith {null};
if (UNDEFINED(_victim)) exitWith {null};
if (_victim != player) exitWith {null};

if([_victim] call A_player_fnc_get_dead) exitWith {null};
[_victim, true] call A_player_fnc_set_dead;

if (!([_killer] call A_player_fnc_exists)) then {
	//hmm, do nothing ...
}else{ if (!([_killer] call A_player_fnc_human)) then {
	[_victim] call A_player_fnc_reset_warrants;
	
	private["_message", "_victim_name"];
	_victim_name = (name _victim);
	_message = null;
	
	if([_killer] call A_player_fnc_opfor) exitWith {
		_message = format["%1 was killed by the Liberation Army!", _victim_name];
	};

	if([_killer] call A_player_fnc_blufor) exitWith {
		_message = format["%1 was killed by the UN Peacekeepers!", _victim_name];
	};

	if([_killer] call A_player_fnc_independent) exitWith {
		_message = format["%1 was killed by the Insurgents!", _victim_name];
	};
	
	if (!(UNDEFINED(_message))) then {
		format['server globalChat (toString %1);', (toArray _message)] call A_broadcast_fnc_broadcast;
	};
} 
else { 
	//player killed by human
	
	private ["_dp"];
	_dp = [_killer] call A_retributions_fnc_compute_death_parameters;
	format['["Died", "%1"] call A_misc_fnc_Isse_AddCrimeLogEntry', player] call A_broadcast_fnc_broadcast;
	format['server globalChat "%1";', ([_dp] call A_retributions_fnc_get_death_message)] call A_broadcast_fnc_broadcast;
	
	//[_dp] call A_retributions_fnc_track_retributions;
	//[_dp] call A_retributions_fnc_track_death;
};};
