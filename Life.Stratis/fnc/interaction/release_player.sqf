// A_interaction_fnc_release_player

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_victim);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_victim] call A_player_fnc_human)) exitWith {null};

if (_victim == player) exitWith {
	player groupChat format["You cannot release yourself from prison"];
};

if (not([_victim] call A_player_fnc_get_arrest)) exitWith {
	player groupChat format["%1-%2 is not in prison", _victim,  (name _victim)];
};

private["_message"];
_message = format["%1-%2 has been set free by %3-%4", _victim, (name _victim), _player, (name _player)];
format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
[_victim, false] call A_player_fnc_set_arrest;
