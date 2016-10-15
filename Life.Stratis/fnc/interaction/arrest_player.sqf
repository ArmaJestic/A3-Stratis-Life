// A_interaction_fnc_arrest_player

#include "header.h"


diag_log format["A_interaction_fnc_arrest_player: %1", _this];

params[["_player",null,[objNull]],["_victim",null,[objNull]],["_minutes",-1,[0]],["_bail_percent",-1,[0]]];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (!([_victim] call A_player_fnc_human)) exitWith {};

if (_minutes <= 0) exitWith {};
if (_bail_percent <= 0) exitWith {};


if (!([_victim, "restrained"] call A_player_fnc_get_bool)) exitWith {
	systemChat format["%1-%2 is not restrained!", _victim, (name _victim)];
};

if ([_victim] call A_player_fnc_get_arrest) exitWith {
	systemChat format["%1 is already under arrest!", _victim];
};

_minutes = if ([_victim] call A_player_fnc_civilian) then {_minutes} else { (15 max _minutes)};

private _message = format["%1-%2 was arrested by %3-%4", _victim, (name _victim), _player, (name _player)];
format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;


[_player, "arrestsmade", 1] call A_player_fnc_update_scalar;

private _bounty = [_victim] call A_player_fnc_get_bounty;
if (_bounty > 0) then {
	systemChat format["%1-%2 had a bounty of $%3. You got that bounty!", _victim, (name _victim), _bounty];
	[_player, _bounty] call A_bank_fnc_transaction;
	[_victim, 0] call A_player_fnc_set_bounty;
};

closeDialog 0;
[[_victim, _minutes], "A_player_fnc_prison_time", _victim] call BIS_fnc_MP;
[[_victim,_bail_percent], "A_player_fnc_prison_bail", _victim] call BIS_fnc_MP;

//wait until the bail setting is complete to call the convict function
[[_victim],{((_this call A_player_fnc_get_bail) > 0)},{
	_this remoteExecCall["A_player_fnc_prison_convict",(_this select 0),false];
}] call A_frame_fnc_waitUntil;
