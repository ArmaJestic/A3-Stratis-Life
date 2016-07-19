// A_interaction_fnc_arrest_player

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

 _this spawn {
player groupChat format["A_interaction_fnc_arrest_player %1", _this];
ARGV(0,_player);
ARGV(1,_victim);
ARGV(2,_minutes);
ARGV(3,_bail_percent);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (not([_victim] call A_player_fnc_human)) exitWith {};
if (undefined(_minutes)) exitWith {};
if (undefined(_bail_percent)) exitWith {};


if (typeName _minutes != "SCALAR") exitWith {};
if (_minutes <= 0) exitWith {};

if (typeName _bail_percent != "SCALAR") exitWith {};
if (_bail_percent <= 0) exitWith {};


if (not([_victim, "restrained"] call A_player_fnc_get_bool)) exitWith {
	player groupChat format["%1-%2 is not restrained!", _victim, (name _victim)];
};

if ([_victim] call A_player_fnc_get_arrest) exitWith {
	player groupChat format["%1 is already under arrest!", _victim];
};

private["_seconds", "_victim_side"];
_minutes = if ([_victim] call A_player_fnc_civilian) then { _minutes } else { (15 max _minutes)};

private["_message"];
_message = format["%1-%2 was arrested by %3-%4", _victim, (name _victim), _player, (name _player)];
format['server globalChat toString(%1);', toArray(_message)] call broadcast;


[_player, "arrestsmade", 1] call A_player_fnc_update_scalar;

private["_bounty"];
_bounty = [_victim] call A_player_fnc_get_bounty;
if (_bounty > 0) then {
	player groupChat format["%1-%2 had a bounty of $%3. You got that bounty!", _victim, (name _victim), _bounty];
	[_player, _bounty] call A_bank_fnc_transaction;
	[_victim, 0] call A_player_fnc_set_bounty;
};

closeDialog 0;
[[_victim, _minutes], "A_player_fnc_prison_time", _victim] call BIS_fnc_MP;
[[_victim,_bail_percent], "A_player_fnc_prison_bail", _victim] call BIS_fnc_MP;

//wait until the bail setting is complete to call the convict function
waitUntil {(([_victim] call A_player_fnc_get_bail) > 0)};
[[_victim], "A_player_fnc_prison_convict", _victim] call BIS_fnc_MP;
};
