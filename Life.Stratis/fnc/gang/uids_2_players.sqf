// A_gang_fnc_uids_2_players

#include "../../includes/macro.h"


ARGV(0,_uids_list);
if (undefined(_uids_list)) exitWith {[]};
if (typeName _uids_list != "ARRAY") exitWith {[]};

private["_players"];
_players = [];

private["_i"];
_i = 0;
while {_i < (count _uids_list)} do { 
	private["_uid"];
	_uid = _uids_list select _i;
	private["_player"];
	_player = [_uid] call A_player_fnc_lookup_gang_uid;
	if (not(undefined(_player))) then {
		_players = _players + [_player];
	};
	_i = _i + 1;
};

_players
