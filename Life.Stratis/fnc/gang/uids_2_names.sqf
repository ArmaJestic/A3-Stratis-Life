// A_gang_fnc_uids_2_names

#include "header.h"


ARGV(0,_uids_list);
if (UNDEFINED(_uids_list)) exitWith {[]};
if (typeName _uids_list != "ARRAY") exitWith {[]};

private["_names", "_players"];
_names = [];
_players = [_uids_list] call A_gang_fnc_uids_2_players;

private["_i"];
_i = 0;
while {_i < (count _players) } do {
	private["_player", "_player_name"];
	_player = _players select _i;
	_name = (name _player);
	_names = _names + [_name];
	_i = _i + 1;
};

_names
