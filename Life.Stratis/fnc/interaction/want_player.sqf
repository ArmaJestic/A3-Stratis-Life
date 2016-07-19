// A_interaction_fnc_want_player

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_victim);
ARGV(2,_reason);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_victim] call A_player_fnc_human)) exitWith {null};
if (undefined(_reason)) exitWith {null};
if (typeName _reason != "STRING") exitWith {null};

if (_victim == player) exitWith {
	player groupChat format["You cannot set yourself wanted"];
};

if ([_victim] call A_player_fnc_get_arrest) exitWith {
	player groupChat format["%1-%2 is in prison, cannot be set wanted", _victim,  (name _victim)];
};

if (not(alive _victim)) exitWith {
	player groupChat format["%1-%2 is not alive, cannot be set wanted", _victim,  (name _victim)];
};

if (_reason == "Description of crime") exitWith {
	player groupChat "You must enter a description of the crime!"
};

private["_message"];
_message = format["%1-%2 has been set wanted by %3-%4 for %5", _victim, (name _victim), _player, (name _player), _reason];
format['server globalChat toString(%1);', toArray(_message)] call broadcast;
_reason = _reason + format[" by %1-%2", _player, (name _player)];
[_victim, _reason, 0] call A_player_fnc_update_warrants;
