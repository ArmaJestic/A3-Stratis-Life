// A_interaction_fnc_unwant_player

#include "header.h"


ARGV(0,_player);
ARGV(1,_victim);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_victim] call A_player_fnc_human)) exitWith {null};

if (_victim == player) exitWith {
	player groupChat format["You cannot set yourself unwanted"];
};

if (!(([_victim] call A_player_fnc_get_wanted))) exitWith {
	player groupChat format["%1-%2 is not wanted", _victim, (name _victim)];
};

private["_message"];
_message = format["%1-%2 has cleared %3-%4's warrants", _player, (name _player), _victim, (name _victim)];
format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
[_victim] call A_player_fnc_reset_warrants;
